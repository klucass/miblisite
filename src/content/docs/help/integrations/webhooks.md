---
title: Integrações e Webhooks
description: Saiba como configurar webhooks para receber notificações automáticas de vendas da sua loja Miblify.
---

A Miblify permite que você conecte sua loja a sistemas externos usando **webhooks de saída**. Com isso, toda vez que uma venda for confirmada, os dados do pedido são enviados automaticamente para uma URL que você definir.

## O que é um webhook?

Um webhook é uma notificação automática enviada por HTTP. Quando um evento acontece na sua loja (por exemplo, uma venda é paga), a Miblify envia uma requisição **POST** com os dados do pedido em formato **JSON** para a URL que você cadastrou.

Isso permite integrar sua loja com:

- Plataformas de e-mail marketing
- Sistemas de automação (como Zapier e n8n)
- Áreas de membros
- ERPs e CRMs
- Qualquer sistema que aceite webhooks

## Cadastrando um webhook

1. No menu lateral, acesse **Integrações**.
2. Na aba **Webhooks**, clique em **Cadastrar Webhook**.
3. Informe a **URL de destino**. A URL deve usar obrigatoriamente **HTTPS**.
4. Marque se deseja que o webhook esteja **Ativo** desde já.
5. Clique em **Cadastrar Webhook**.

Ao cadastrar, a Miblify gera automaticamente um **Signing Secret** único para o seu webhook. Esse segredo é usado para assinar cada requisição, permitindo que você valide a autenticidade do envio.

## Limite de webhooks

No plano atual, cada loja pode ter no máximo **1 webhook** cadastrado. Se você tentar cadastrar mais, verá uma mensagem de limite atingido.

## Editando e removendo webhooks

Na aba de Webhooks, você pode:

- **Editar**: alterar a URL de destino ou ativar/desativar o webhook.
- **Remover**: excluir o webhook. As notificações de venda pararão de ser enviadas.

## Evento disparado

Atualmente, o webhook é disparado para o evento:

| Evento        | Descrição                                        |
|---------------|--------------------------------------------------|
| `order.paid`  | Disparado quando um pedido tem o pagamento confirmado. |

Quando uma venda é confirmada, a Miblify verifica todos os webhooks ativos da loja, monta o payload com os dados do pedido e agenda o envio em segundo plano.

## Assinatura e segurança

Cada requisição enviada inclui os seguintes headers:

| Header                   | Descrição                                              |
|--------------------------|--------------------------------------------------------|
| `Content-Type`           | `application/json`                                     |
| `User-Agent`             | `Miblify-Webhooks/1.0`                                 |
| `X-Miblify-Signature`    | Assinatura HMAC-SHA256 do corpo da requisição, gerada com o Signing Secret do webhook. |

### Como validar a assinatura

Para garantir que a requisição foi realmente enviada pela Miblify, você deve verificar o header `X-Miblify-Signature` no seu servidor. O processo é:

1. Receba o corpo bruto (raw body) da requisição.
2. Gere um HMAC-SHA256 usando o **Signing Secret** do webhook como chave e o corpo da requisição como mensagem.
3. Compare o resultado com o valor do header `X-Miblify-Signature`.

Exemplo em Python:

```python
import hmac
import hashlib

def validar_assinatura(corpo_raw, signing_secret, assinatura_recebida):
    assinatura_calculada = hmac.new(
        signing_secret.encode(),
        corpo_raw.encode(),
        hashlib.sha256
    ).hexdigest()
    return hmac.compare_digest(assinatura_calculada, assinatura_recebida)
```

Exemplo em Node.js:

```javascript
const crypto = require('crypto');

function validarAssinatura(corpoRaw, signingSecret, assinaturaRecebida) {
  const assinaturaCalculada = crypto
    .createHmac('sha256', signingSecret)
    .update(corpoRaw)
    .digest('hex');
  return crypto.timingSafeEqual(
    Buffer.from(assinaturaCalculada),
    Buffer.from(assinaturaRecebida)
  );
}
```

## Retentativas

Se o servidor de destino não responder com sucesso (status HTTP 2xx), a Miblify fará **retentativas automáticas** do envio. As tentativas são feitas em segundo plano até que a entrega seja bem-sucedida ou o limite de tentativas seja atingido.

A Miblify respeita os seguintes limites de conexão:

- Timeout de conexão: **5 segundos**
- Timeout de resposta: **10 segundos**

Se o seu servidor não responder dentro desses prazos, a tentativa será considerada falha.

## Próximo passo

Veja o [formato completo do payload do webhook](/help/integrations/webhook-payload/) para entender a estrutura dos dados que você receberá.
