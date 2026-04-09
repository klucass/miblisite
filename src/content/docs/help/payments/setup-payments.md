---
title: Configurando pagamentos
description: Aprenda como conectar um gateway de pagamento para começar a receber na sua loja Miblify.
sidebar:
  order: 1
---


Para vender produtos pagos na Miblify, você precisa conectar um gateway de pagamento.

Atualmente a Miblify suporta os seguintes gateways:

- **Mercado Pago** (PIX, cartão de crédito)
- **Pague Dev** (PIX)

> **Importante:** Os pagamentos entram **diretamente na sua conta do Gateway** — a Miblify apenas intermedia a autorização e processamento. Em nenhum momento do processo o dinheiro passa pela Miblify.

## Acessando as configurações de pagamento

1. No menu lateral, clique em **Integrações** e selecione a aba **Gateways de Pagamento**.
2. Você verá a lista de gateways disponíveis.

## Conectando o Mercado Pago

1. Na página de **Gateways de Pagamento**, clique em **Conectar com Mercado Pago**.
2. Você será redirecionado para a tela de autorização do Mercado Pago.
3. Clique em **Autorizar** (confirme sua identidade se solicitado).
4. Você retornará automaticamente para a Miblify — a conexão está pronta!

**O que acontece:** As credenciais (`public_key`, `access_token`, `refresh_token`) são salvas de forma segura. Você **não precisará atualizar manualmente** — a Miblify renova o acesso automaticamente.


## Testando a configuração

Após conectar, teste se tudo está funcionando:

1. **Publique um produto** na sua loja (preço > R$ 0,00).
2. **Acesse a vitrine** da sua loja: `sua-loja.miblify.com`.
3. **Clique em um produto** e vá para o checkout.
4. Você deve ver a opção de pagamento por **PIX** e **Cartão de Crédito**.



## Recebendo pagamentos

Cada vez que um cliente compra:

1. **PIX é gerado** na tela do checkout (QR code + cópia e cola).
2. **Cliente paga** via qualquer app de banco ou carteira digital.
3. **Confirmação chega em tempo real** — o pedido é marcado como `pago`.
4. **Acesso ao produto é liberado** automaticamente.
5. **Dinheiro cai em sua conta** do Mercado Pago (você controla saques).

A Miblify apenas intermedia — todos os pagamentos vão para **sua conta Mercado Pago**, não para a nossa.

## Roteamento de pagamentos (múltiplos gateways)

Se você conectar **mais de um gateway**, a Miblify roteia automaticamente cada método de pagamento para o gateway correto.

### Configuração de Pagamento

Você pode definir qual gateway processa cada método de pagamento.

Para cada método (Cartão de crédito e Pix) você pode escolher um gateway diferente, desde que este Gateway esteja devidamente configurado em sua conta.



## Próximo passo

Com o pagamento configurado, sua loja está pronta para vender. Entenda como funciona o [checkout e o fluxo de vendas](/help/sales/checkout-and-sales/).
