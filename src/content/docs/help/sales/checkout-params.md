---
title: Parâmetros da URL de checkout
description: Saiba como pré-preencher informações do cliente no checkout usando parâmetros na URL.
sidebar:
  order: 3
---


A Miblify permite que você pré-preencha as informações do seu cliente na página de checkout através de parâmetros na URL (Query Strings). 

Isso é extremamente útil para:
- Reduzir a fricção na hora da compra.
- Aumentar a taxa de conversão enviando links personalizados por e-mail ou WhatsApp.
- Aplicar cupons de desconto automaticamente.

## Como utilizar

Para utilizar os parâmetros, você deve adicioná-los ao final do link de checkout do seu produto, começando com um ponto de interrogação `?`. Caso precise de mais de um parâmetro, separe-os com um caractere e-comercial `&`.

Exemplo básico:
`https://sualoja.miblify.com/slug-do-produto?email=cliente@exemplo.com`

## Parâmetros Suportados

Abaixo estão os parâmetros que você pode enviar para o nosso checkout:

| Parâmetro | Descrição | Exemplo |
|-----------|-----------|---------|
| `name`    | Nome completo do cliente | `?name=Joao+Silva` |
| `email`   | E-mail de destino | `?email=joao@email.com` |
| `cpf`     | CPF do cliente (somente números) | `?cpf=12345678901` |
| `coupon`  | Código do cupom de desconto | `?coupon=PROMO10` |

---

## Exemplos Práticos

### 1. Pré-preencher Email e Nome
Útil para links enviados via plataformas de e-mail marketing onde você já conhece o lead.
`https://loja.miblify.com/e-book-vendas?name=Maria+Oliveira&email=maria@gmail.com`

### 2. Aplicar um cupom automaticamente
Se você quer fazer uma promoção onde o cliente já chega com o desconto aplicado sem precisar digitar nada.
`https://loja.miblify.com/curso-completo?coupon=DESCONTOVIRTUAL`

### 3. Preenchimento Total
Ideal para processos de venda consultiva onde o vendedor já coletou todos os dados por chat.
`https://loja.miblify.com/mentoria?name=Carlos+Eduardo&email=carlos@empresa.com&cpf=00011122233&coupon=OFFER50`

---

## Dicas Importantes

- **Espaços**: Devem ser substituídos pelo sinal de mais `+` ou `%20`.
- **Sensibilidade**: O parâmetro `coupon` transformará o texto automaticamente em letras maiúsculas para buscar o cupom na sua loja.
- **Segurança**: Nunca envie dados sensíveis (como senhas) via URL. Os parâmetros suportados pela Miblify são seguros para uso público em campanhas de marketing.
