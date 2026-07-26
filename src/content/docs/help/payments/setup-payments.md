---
title: Configurando pagamentos
description: Aprenda como conectar um gateway de pagamento para começar a receber na sua loja Miblify.
sidebar:
  order: 1
---

Para vender produtos pagos na Miblify, você precisa conectar um gateway de pagamento.

Hoje a Miblify trabalha com dois:

- Mercado Pago (Pix e cartão de crédito)
- Pague Dev (Pix)

> **Importante:** o dinheiro entra direto na sua conta do gateway. Em nenhum momento ele passa pela Miblify.

## Acessando as configurações de pagamento

No menu lateral, clique em **Integrações** e abra a aba **Gateways de Pagamento**. Você verá a lista de gateways disponíveis.

## Conectando o Mercado Pago

1. Na página de **Gateways de Pagamento**, clique em **Conectar com Mercado Pago**.
2. Você será redirecionado para a tela de autorização do Mercado Pago.
3. Clique em **Autorizar** e confirme sua identidade, se for solicitado.
4. Você volta automaticamente para a Miblify com a conexão pronta.

A autorização fica salva de forma segura e é renovada sozinha. Você não precisa refazer esse processo depois.

## Testando a configuração

Depois de conectar, vale conferir se está tudo certo:

1. Publique um produto com preço acima de R$ 0,00.
2. Acesse a vitrine da sua loja em `sua-loja.miblify.com`.
3. Clique no produto e vá até o checkout.
4. As opções de Pix e cartão de crédito devem aparecer.

## Recebendo pagamentos

A cada compra, o Pix é gerado na tela do checkout, com QR code e código para copiar e colar. O cliente paga pelo app do banco ou por uma carteira digital, e a confirmação chega em seguida: o pedido passa para pago e o acesso ao produto é liberado automaticamente.

O dinheiro cai na sua conta do gateway, e os saques continuam sob seu controle.

## Usando mais de um gateway

Se você conectar mais de um gateway, pode escolher qual deles processa cada método de pagamento. Cartão de crédito e Pix podem ir para gateways diferentes, desde que cada um esteja configurado na sua conta.

## Próximo passo

Com o pagamento configurado, sua loja está pronta para vender. Entenda como funciona o [checkout e o fluxo de vendas](/help/sales/checkout-and-sales/).
