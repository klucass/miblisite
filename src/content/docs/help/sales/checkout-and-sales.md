---
title: Checkout e vendas
description: Entenda como funciona o checkout, o pagamento por Pix e o acompanhamento de vendas na Miblify.
---

Este artigo explica como funciona o fluxo de compra na sua loja Miblify, desde o acesso do cliente até a confirmação do pagamento.

## Vitrine da loja

Sua loja possui uma vitrine pública acessível pelo endereço:

```
https://sua-loja.miblify.com
```

Na vitrine, o cliente vê todos os produtos com status **Publicado**, incluindo nome, descrição, imagem e preço. Ao clicar em um produto, ele é levado para a página de checkout.

## Tipos de checkout

O tipo de checkout depende do produto:

| Tipo do produto    | Checkout exibido                                                  |
|--------------------|-------------------------------------------------------------------|
| Pago (one_time)    | Checkout com formulário de dados pessoais e pagamento por Pix.    |
| Gratuito (freebie) | Checkout simplificado, sem etapa de pagamento.                    |
| Produto em rascunho| Página informando que o produto ainda não está disponível.        |

## Fluxo de checkout pago (Pix)

1. O cliente preenche seus dados: **nome**, **e-mail** e **CPF**.
2. Escolhe o método de pagamento **Pix**.
3. A Miblify gera o código Pix através do Mercado Pago.
4. O cliente é levado para a página de finalização, onde pode copiar o código Pix ou escanear o QR Code.
5. Após o pagamento ser confirmado pelo banco, o status do pedido muda automaticamente para **pago**.

## Fluxo de checkout gratuito (freebie)

1. O cliente preenche nome e e-mail.
2. O produto é liberado imediatamente sem necessidade de pagamento.

## Cancelamento automático de Pix

Pagamentos Pix que não forem confirmados em até **1 hora** são cancelados automaticamente. Pagamentos recentes (com menos de 1 hora) têm seus status sincronizados periodicamente com o gateway para garantir que nenhuma confirmação seja perdida.

## Acompanhando suas vendas

### Painel principal (Dashboard)

No dashboard, você encontra:

- **Receita total**: soma de todas as vendas pagas.
- **Número de vendas**: quantidade de pedidos confirmados.
- **Vendas recentes**: lista das últimas 10 vendas com nome do cliente, produto, valor e status.

### Página de Pedidos

No menu lateral, clique em **Pedidos** para ver todos os pedidos da sua loja. Cada pedido exibe:

- Identificador do pedido
- Nome e e-mail do cliente
- Nome do produto
- Valor total
- Status: `completed` (pago), `pending` (aguardando) ou `cancelled` (cancelado)
- Data de criação

## Próximo passo

Para conectar sua loja com sistemas externos e receber dados de venda automaticamente, configure as [integrações e webhooks](/help/integrations/webhooks/).
