---
title: Configurando pagamentos
description: Aprenda como conectar um gateway de pagamento para começar a receber na sua loja Miblify.
---

Para vender produtos pagos na Miblify, você precisa conectar um gateway de pagamento. Atualmente, a Miblify suporta o **Mercado Pago** como gateway, com pagamento via **Pix**.

## Acessando as configurações de pagamento

1. No menu lateral, clique em **Pagamentos** ou **Integrações de Pagamento**.
2. Você verá a lista de gateways disponíveis.

## Conectando o Mercado Pago

Para configurar o Mercado Pago, você precisará de duas credenciais da sua conta:

| Credencial     | Onde encontrar                                                        |
|----------------|-----------------------------------------------------------------------|
| Public Key     | Painel do Mercado Pago, em Credenciais de produção.                  |
| Access Token   | Painel do Mercado Pago, em Credenciais de produção.                  |

### Passo a passo

1. Acesse [mercadopago.com.br/developers](https://www.mercadopago.com.br/developers) e faça login.
2. Navegue até **Suas integrações** e crie uma nova aplicação (ou use uma existente).
3. Copie a **Public Key** e o **Access Token** de produção.
4. Na Miblify, cole as credenciais nos campos correspondentes.
5. Marque o gateway como **Ativo** e, se desejar, como **Padrão**.
6. Clique em **Salvar configurações**.

## Gateway padrão

Se você tiver mais de um gateway configurado no futuro, apenas um pode ser o **padrão**. O padrão é usado automaticamente nos checkouts. Um gateway só pode ser marcado como padrão se estiver ativo.

## Verificando a configuração

Após salvar, faça um teste:

1. Publique um produto na sua loja.
2. Acesse a vitrine da sua loja (`sua-loja.miblify.com`).
3. Clique em um produto e vá para o checkout.
4. Se o checkout exibir a opção de pagamento por Pix, a configuração está correta.

Se o checkout não exibir opções de pagamento, verifique se o gateway está ativo e se as credenciais estão corretas.

## Próximo passo

Com o pagamento configurado, sua loja está pronta para vender. Entenda como funciona o [checkout e o fluxo de vendas](/help/sales/checkout-and-sales/).
