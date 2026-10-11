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

# Alterações locais que já existiam ficam onde estão: só a nova publicação entra no commit.
sujos() { git status --porcelain --untracked-files=all | cut -c4- | sort; }
ANTES="$(sujos)"
if [ -n "$ANTES" ]; then
  echo "Alterações locais pré-existentes (ficam fora do commit):"
  echo "$ANTES"
fi
# Se a fila ou as tags já estão alteradas, o commit levaria essa mudança junto.
for f in .claude/skills/blog-post-seo/pautas.md src/lib/tags.ts; do
  if echo "$ANTES" | grep -qxF "$f"; then
    MOTIVO="$f tem alterações locais não commitadas"
    exit 1
  fi
done
if [ "$(git branch --show-current)" != "master" ]; then
  MOTIVO="O miblisite não está no branch master"
  exit 1
fi

git pull --rebase --autostash

# Já saiu post hoje? Não publica dois. (Só olha posts commitados, não rascunhos locais.)
if git grep -q "^pubDate: \"$HOJE\"" HEAD -- src/content/blog; then
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
# O que a rotina mudou = sujo agora e limpo antes, restrito aos arquivos do blog.
MUDOU="$(comm -13 <(echo "$ANTES") <(sujos) \
  | grep -E '^(src/content/blog/|src/lib/tags\.ts$|\.claude/skills/blog-post-seo/pautas\.md$)' || true)"
NOVOS="$(echo "$MUDOU" | while read -r f; do
  if [ -n "$f" ] && ! git ls-files --error-unmatch -- "$f" >/dev/null 2>&1; then echo "$f"; fi
done | grep '\.md$' || true)"
if [ "$(echo "$NOVOS" | grep -c .)" -ne 1 ]; then
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
echo "Arquivos no commit:"
echo "$MUDOU"
# --only: commita só esses caminhos, mesmo que haja outras coisas no stage.
echo "$MUDOU" | xargs git add --
echo "$MUDOU" | xargs git commit -m "Novo post: ${TITULO:-$(basename "$POST" .md)}" --only --
git push origin master

echo "=== $(date '+%F %T') publicado: $POST"
RESULTADO="Publicado: ${TITULO:-$(basename "$POST" .md)}"
