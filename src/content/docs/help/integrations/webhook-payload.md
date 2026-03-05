---
title: Formato do payload do webhook
description: Referência completa do formato JSON enviado pelo webhook da Miblify a cada venda confirmada.
---

Quando uma venda é confirmada na sua loja, a Miblify envia uma requisição POST para a URL do seu webhook com um payload em formato JSON. Este artigo detalha a estrutura completa desse payload.

## Estrutura geral

O payload segue esta estrutura:

```json
{
  "event": "order.paid",
  "created_at": "2026-03-05T14:30:00Z",
  "data": {
    "order": { ... },
    "customer": { ... },
    "store": { ... },
    "items": [ ... ]
  }
}
```

| Campo        | Tipo     | Descrição                                                      |
|--------------|----------|----------------------------------------------------------------|
| `event`      | string   | Tipo do evento. Atualmente, sempre `order.paid`.               |
| `created_at` | string   | Data e hora do disparo do webhook, no formato ISO 8601 (UTC).  |
| `data`       | object   | Objeto contendo os dados do pedido, cliente, loja e itens.     |

## Objeto `data.order`

Contém os dados do pedido.

| Campo                      | Tipo      | Descrição                                                        |
|----------------------------|-----------|------------------------------------------------------------------|
| `id`                       | string    | Identificador único do pedido (formato: `ord_XXXXXXXXXXXX`).    |
| `status`                   | string    | Status do pedido. No evento `order.paid`, será `paid`.           |
| `subtotal_amount_cents`    | integer   | Valor bruto do pedido em centavos, antes de descontos.           |
| `discount_amount_cents`    | integer   | Valor do desconto aplicado, em centavos.                         |
| `total_amount_cents`       | integer   | Valor final cobrado do cliente, em centavos.                     |
| `coupon_code`              | string    | Código do cupom aplicado, se houver. Pode ser `null`.            |
| `is_subscription_renewal`  | boolean   | `true` se o pedido é uma renovação de assinatura.                |
| `subscription_id`          | string    | Identificador da assinatura, se aplicável. Pode ser `null`.      |
| `cart_id`                  | string    | Identificador do carrinho de compras. Pode ser `null`.           |
| `user_id`                  | string    | Identificador do usuário comprador, se autenticado.              |
| `paid_at`                  | string    | Data e hora da confirmação do pagamento (ISO 8601). Pode ser `null`. |
| `created_at`               | string    | Data e hora de criação do pedido (ISO 8601).                     |

## Objeto `data.customer`

Contém os dados do cliente que realizou a compra.

| Campo      | Tipo    | Descrição                                              |
|------------|---------|--------------------------------------------------------|
| `name`     | string  | Nome completo do cliente.                              |
| `email`    | string  | E-mail do cliente.                                     |
| `document` | string  | CPF ou documento do cliente. Pode ser `null`.          |
| `phone`    | string  | Telefone do cliente (formato internacional). Pode ser `null`. |

## Objeto `data.store`

Contém os dados da loja que realizou a venda.

| Campo   | Tipo    | Descrição                                                 |
|---------|---------|-----------------------------------------------------------|
| `id`    | string  | Identificador único da loja (formato: `str_XXXXXXXXXXXX`).|
| `name`  | string  | Nome da loja.                                             |

## Array `data.items`

Lista de itens vendidos no pedido.

| Campo        | Tipo     | Descrição                                               |
|--------------|----------|---------------------------------------------------------|
| `id`         | string   | Identificador único do item.                            |
| `name`       | string   | Nome do produto.                                        |
| `price_cents`| integer  | Preço unitário do item, em centavos.                    |
| `quantity`   | integer  | Quantidade comprada.                                    |

## Exemplo completo

Abaixo está um exemplo fictício completo do payload enviado quando uma venda é confirmada:

```json
{
  "event": "order.paid",
  "created_at": "2026-03-05T14:30:00Z",
  "data": {
    "order": {
      "id": "ord_1a2b3c4d5e8f",
      "status": "paid",
      "subtotal_amount_cents": 14900,
      "discount_amount_cents": 2000,
      "total_amount_cents": 12900,
      "coupon_code": "LANCAMENTO20",
      "is_subscription_renewal": false,
      "subscription_id": null,
      "cart_id": "crt_9f8e7d6c5b4a",
      "user_id": "usr_xyz123abc456",
      "paid_at": "2026-03-05T14:29:45Z",
      "created_at": "2026-03-05T14:20:00Z"
    },
    "customer": {
      "name": "Maria Oliveira",
      "email": "maria.oliveira@exemplo.com",
      "document": "98765432100",
      "phone": "+5521988887777"
    },
    "store": {
      "id": "str_a1b2c3d4e5f6",
      "name": "Escola Digital Pro"
    },
    "items": [
      {
        "id": "itm_z9y8x7w6v5u4",
        "name": "Curso Completo de Marketing Digital",
        "price_cents": 14900,
        "quantity": 1
      }
    ]
  }
}
```

Neste exemplo:

- A cliente **Maria Oliveira** comprou o produto **Curso Completo de Marketing Digital** por R$ 149,00.
- Um cupom **LANCAMENTO20** foi aplicado, concedendo R$ 20,00 de desconto.
- O valor final cobrado foi de **R$ 129,00** (12.900 centavos).
- O pagamento foi confirmado às 14:29:45 UTC.

## Observações sobre valores

Todos os valores monetários são expressos em **centavos** (inteiros). Para converter para reais, divida por 100. Exemplos:

| Centavos | Reais     |
|----------|-----------|
| 9900     | R$ 99,00  |
| 14900    | R$ 149,00 |
| 500      | R$ 5,00   |

## Próximo passo

Veja como configurar [pixels de rastreamento](/help/integrations/pixels/) para otimizar suas campanhas de marketing.
