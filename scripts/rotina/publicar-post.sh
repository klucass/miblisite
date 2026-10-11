#!/bin/bash
# Rotina diária do blog (seg a sáb, 9h): o Claude escreve o próximo post da fila
# com a skill blog-post-seo, este script confere o build e sobe o commit pro master.
# Agendado pelo launchd: scripts/rotina/br.miblify.blog-post.plist
# Rodar na mão: scripts/rotina/publicar-post.sh
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO"

HOJE="$(date +%F)"
LOCK="$REPO/.rotina/lock"
mkdir -p "$REPO/.rotina"

# Notificação do macOS com o resultado (sucesso, nada a fazer ou erro).
notificar() {
  osascript - "$1" "$2" "$3" <<'APPLESCRIPT' || true
on run argv
  display notification (item 2 of argv) with title "Blog Miblify" subtitle (item 1 of argv) sound name (item 3 of argv)
end run
APPLESCRIPT
}

RESULTADO=""   # preenchido quando a rotina termina bem
MOTIVO=""      # preenchido nos abortos explícitos
ERRO_CMD=""
finalizar() {
  local codigo=$?
  rmdir "$LOCK" 2>/dev/null || true
  if [ "$codigo" -eq 0 ]; then
    [ -n "$RESULTADO" ] && notificar "Sucesso" "$RESULTADO" "Glass"
  else
    notificar "Erro na publicação" "${MOTIVO:-Falhou em: $ERRO_CMD} (veja .rotina/rotina.log)" "Basso"
  fi
}

echo "=== $(date '+%F %T') rotina blog-post"

# Uma execução por vez (o launchd pode disparar de novo ao acordar o Mac).
if ! mkdir "$LOCK" 2>/dev/null; then
  echo "Outra execução em andamento ($LOCK). Saindo."
  exit 0
fi
trap 'ERRO_CMD=$BASH_COMMAND' ERR
trap finalizar EXIT

if [ -n "$(git status --porcelain)" ]; then
  echo "Working tree sujo antes de começar. Abortando para não misturar alterações:"
  MOTIVO="Há alterações não commitadas no miblisite"
  git status --short
  exit 1
fi

git checkout master
git pull --rebase

# Já saiu post hoje? Não publica dois.
if grep -lq "^pubDate: \"$HOJE\"" src/content/blog/*.md 2>/dev/null; then
  echo "Já existe post com pubDate $HOJE. Nada a fazer."
  RESULTADO="Já existe post de hoje ($HOJE), nada a publicar."
  exit 0
fi

PROMPT="Use a skill blog-post-seo para escrever o post de hoje ($HOJE), como se o scheduler tivesse disparado:
pegue a próxima pauta pendente de .claude/skills/blog-post-seo/pautas.md, escreva o post em src/content/blog/<slug>.md
com pubDate \"$HOJE\", passe pela skill humanizer, marque a pauta como usada (e adicione o slug na tabela 'Já publicados')
e rode pnpm build até passar. Siga o checklist final da skill inteiro.
NÃO faça git commit nem git push: o script que te chamou cuida disso.
Na última linha da resposta escreva exatamente: SLUG=<slug-do-post>"

claude -p "$PROMPT" \
  --model claude-sonnet-5-5 \
  --no-session-persistence \
  --allowedTools "Skill" "Read" "Write" "Edit" "Glob" "Grep" "WebFetch" "WebSearch" \
    "Bash(pnpm build*)" "Bash(pnpm install*)" "Bash(curl *)" "Bash(ls *)" "Bash(cat *)" \
    "Bash(head *)" "Bash(tail *)" "Bash(wc *)" "Bash(grep *)" "Bash(awk *)" "Bash(sed -n *)" \
    "Bash(date*)" "Bash(git status*)" "Bash(git diff*)" "Bash(git log*)" \
  | tee "$REPO/.rotina/ultima-resposta.txt"

# Confere o resultado em vez de confiar na resposta.
NOVOS="$(git status --porcelain -- src/content/blog | awk '$1=="??"{print $2}')"
if [ "$(echo "$NOVOS" | grep -c '\.md$')" -ne 1 ]; then
  echo "Esperava exatamente 1 post novo em src/content/blog, achei: '${NOVOS}'. Abortando sem commit."
  MOTIVO="O Claude não gerou exatamente 1 post novo"
  exit 1
fi
POST="$NOVOS"
if ! grep -q "^pubDate: \"$HOJE\"" "$POST"; then
  echo "$POST não tem pubDate $HOJE. Abortando sem commit."
  MOTIVO="$(basename "$POST") não tem pubDate $HOJE"
  exit 1
fi

pnpm build

TITULO="$(sed -n 's/^title: "\(.*\)"$/\1/p' "$POST" | head -1)"
git add -- "$POST" .claude/skills/blog-post-seo/pautas.md src/lib/tags.ts src/content/blog
git commit -m "Novo post: ${TITULO:-$(basename "$POST" .md)}"
git push origin master

echo "=== $(date '+%F %T') publicado: $POST"
RESULTADO="Publicado: ${TITULO:-$(basename "$POST" .md)}"
