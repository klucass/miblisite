---
title: Parâmetros da URL de checkout
description: Saiba como pré-preencher informações do cliente no checkout usando parâmetros na URL.
sidebar:
  order: 3
---

Você pode chegar no checkout com os campos do cliente já preenchidos, passando as informações na própria URL. Quanto menos o cliente tem que digitar, menos gente desiste no meio do caminho. Também dá para aplicar um cupom sozinho, sem pedir que ninguém decore um código.

## Como utilizar

Adicione os parâmetros no fim do link de checkout do produto, começando com um ponto de interrogação. Se precisar de mais de um, separe com o e-comercial `&`.

Exemplo básico:
`https://sualoja.miblify.com/slug-do-produto?email=cliente@exemplo.com`

## Parâmetros suportados

| Parâmetro | Descrição | Exemplo |
|-----------|-----------|---------|
| `name`    | Nome completo do cliente | `?name=Joao+Silva` |
| `email`   | E-mail de destino | `?email=joao@email.com` |
| `cpf`     | CPF do cliente (somente números) | `?cpf=12345678901` |
| `coupon`  | Código do cupom de desconto | `?coupon=PROMO10` |

---

## Exemplos práticos

### 1. Preencher e-mail e nome
Útil em disparos de e-mail marketing, onde você já conhece o lead.
`https://loja.miblify.com/e-book-vendas?name=Maria+Oliveira&email=maria@gmail.com`

### 2. Aplicar um cupom automaticamente
Para promoções em que o cliente já chega com o desconto na tela.
`https://loja.miblify.com/curso-completo?coupon=DESCONTOVIRTUAL`

### 3. Preencher tudo
Bom para venda consultiva, quando o vendedor já coletou os dados por chat.
`https://loja.miblify.com/mentoria?name=Carlos+Eduardo&email=carlos@empresa.com&cpf=00011122233&coupon=OFFER50`

---

## Detalhes que evitam dor de cabeça

Espaços precisam virar `+` ou `%20`. O valor de `coupon` é convertido para maiúsculas antes da busca, então não se preocupe com a caixa das letras.

E nunca coloque dados sensíveis, como senhas, em uma URL. Os quatro parâmetros acima são seguros para usar em campanhas públicas.
