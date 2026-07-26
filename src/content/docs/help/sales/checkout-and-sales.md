---
title: Checkout e vendas
description: Entenda como funciona o checkout, o pagamento por Pix e o acompanhamento de vendas na Miblify.
sidebar:
  order: 1
---

Este artigo acompanha uma compra na sua loja do começo ao fim, desde a chegada do cliente na vitrine até a confirmação do pagamento.

## Vitrine da loja

Sua loja tem uma vitrine pública no endereço:

```
https://sua-loja.miblify.com
```

Lá o cliente vê todos os produtos publicados, com nome, descrição, imagem e preço. Ao clicar em um deles, vai direto para o checkout.

## Tipos de checkout

O checkout muda conforme o produto:

| Tipo do produto | Checkout exibido |
|-----------------|------------------|
| Pago | Formulário de dados pessoais e pagamento por Pix. |
| Gratuito | Checkout simplificado, sem etapa de pagamento. |
| Em rascunho | Página avisando que o produto ainda não está disponível. |

## Compra paga com Pix

1. O cliente preenche nome, e-mail e CPF.
2. Escolhe pagar com Pix.
3. A Miblify gera o código Pix pelo gateway que você conectou.
4. O cliente vai para a página de finalização e pode copiar o código ou escanear o QR Code.
5. Quando o banco confirma o pagamento, o pedido passa para pago automaticamente.

## Compra de produto gratuito

O cliente preenche nome e e-mail, e o produto é liberado na hora.

## Cancelamento automático de Pix

Um Pix que não for pago em até uma hora é cancelado sozinho. Dentro dessa janela, a Miblify confere o pagamento com o gateway de tempos em tempos, para que nenhuma confirmação se perca no caminho.

## Acompanhando suas vendas

### Painel principal

O dashboard resume o período escolhido em receita, número de vendas, ticket médio e taxa de conversão, cada um comparado com o período anterior. Abaixo vêm o gráfico de receita por dia, o funil de conversão, os produtos que mais faturaram, a origem das vendas e a lista dos dez pedidos mais recentes. Os detalhes de cada painel estão no artigo do [painel administrativo](/help/admin/dashboard/).

### Página de pedidos

No menu lateral, clique em **Pedidos** para ver todos os pedidos da loja. Cada linha traz o identificador do pedido, o nome e e-mail do cliente, o produto, o valor total, a data de criação e o status, que pode ser pago, aguardando ou cancelado.

## Próximo passo

Para conectar sua loja com sistemas externos e receber dados de venda automaticamente, configure as [integrações e webhooks](/help/integrations/webhooks/).
