---
title: Integrações e Webhooks
description: Saiba como configurar webhooks para receber notificações automáticas de vendas da sua loja Miblify.
sidebar:
  order: 2
---

Com webhooks, cada venda confirmada na sua loja é avisada automaticamente para uma URL que você escolher.

## O que é um webhook?

É uma notificação automática enviada por HTTP. Quando uma venda é paga, a Miblify manda uma requisição POST com os dados do pedido em JSON para o endereço que você cadastrou.

Serve para ligar sua loja a plataformas de e-mail marketing, ferramentas de automação como Zapier e n8n, áreas de membros, ERPs, CRMs e qualquer outro sistema que aceite webhooks.

## Cadastrando um webhook

1. No menu lateral, acesse **Integrações**.
2. Na aba **Webhooks**, clique em **Cadastrar Webhook**.
3. Informe a URL de destino, que precisa ser HTTPS.
4. Marque se o webhook já deve nascer ativo.
5. Clique em **Cadastrar Webhook**.

No cadastro, a Miblify gera um Signing Secret exclusivo para esse webhook. É com ele que cada requisição é assinada, e é assim que você confere se o envio veio mesmo de nós.

## Limite de webhooks

Cada loja pode ter um webhook cadastrado. Ao tentar cadastrar o segundo, você vê um aviso de limite atingido.

## Editando e removendo webhooks

Na aba de Webhooks você troca a URL de destino, ativa ou desativa o envio. Também dá para excluir o webhook, e nesse caso as notificações de venda param na hora.

## Evento disparado

Só existe um evento por enquanto:

| Evento        | Descrição                                        |
|---------------|--------------------------------------------------|
| `order.paid`  | Disparado quando um pedido tem o pagamento confirmado. |

Assim que uma venda é confirmada, o envio é feito para o webhook ativo da loja.

## Assinatura e segurança

Toda requisição chega com estes headers:

| Header                   | Descrição                                              |
|--------------------------|--------------------------------------------------------|
| `Content-Type`           | `application/json`                                     |
| `User-Agent`             | `Miblify-Webhooks/1.0`                                 |
| `X-Miblify-Signature`    | Assinatura HMAC-SHA256 do corpo da requisição, gerada com o Signing Secret do webhook. |

### Como validar a assinatura

No seu servidor, confira o header `X-Miblify-Signature` antes de confiar no conteúdo:

1. Pegue o corpo bruto (raw body) da requisição.
2. Gere um HMAC-SHA256 usando o Signing Secret do webhook como chave e esse corpo como mensagem.
3. Compare o resultado com o valor do header.

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

Se o seu servidor não responder com um status 2xx, a Miblify tenta de novo, até a entrega dar certo ou o limite de tentativas acabar.

Os prazos de conexão são curtos: 5 segundos para conectar e 10 segundos para responder. Passou disso, a tentativa conta como falha.

## Próximo passo

Veja o [formato completo do payload do webhook](/help/integrations/webhook-payload/) para entender a estrutura dos dados que você receberá.
