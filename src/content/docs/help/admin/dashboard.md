---
title: Painel administrativo
description: Conheça o painel da Miblify e saiba como acompanhar receita, conversão, funil e origem das suas vendas.
sidebar:
  order: 1
---

O painel é onde você acompanha as vendas, mexe nos produtos e ajusta as configurações da loja.

## Dashboard

Ao fazer login você cai direto no dashboard, que mostra o desempenho da loja no período selecionado.

### Escolhendo o período

No canto superior direito fica o seletor de período, com quatro opções: hoje, 7 dias, 30 dias e este mês. Ele vale para o dashboard inteiro. Trocar o período recalcula os indicadores, o gráfico, o funil e os dois rankings de uma vez.

A opção padrão é 30 dias.

### Indicadores principais

Quatro cartões no topo resumem o período:

| Indicador | O que mede |
|-----------|------------|
| Receita | Soma das vendas pagas no período. |
| Vendas | Quantidade de pedidos pagos. |
| Ticket médio | Receita dividida pelo número de vendas. |
| Conversão | Percentual de visitantes do checkout que viraram pedido. |

Cada cartão traz também a variação em relação ao período anterior. Nos períodos fixos, a comparação é com a janela imediatamente anterior de mesmo tamanho: 7 dias contra os 7 dias antes deles. Em "Este mês", a comparação é com o mesmo recorte do mês passado, ou seja, dia 1 até hoje contra dia 1 até a mesma data no mês anterior.

Quando não existe base de comparação, porque o período anterior não teve movimento, a variação aparece vazia em vez de mostrar um número inflado.

O cartão de conversão mostra ainda quantas visitas o checkout recebeu no período. É esse o denominador da conta.

### Pedidos não finalizados

Logo abaixo dos indicadores há uma faixa com o total parado em pedidos que não fecharam: Pix ainda aguardando pagamento e Pix que expirou sem ser pago. Clicando nela você vai direto para a lista de pedidos.

É o número que mais rende, na prática. Um Pix gerado e não pago é alguém que chegou até o fim e travou no último passo, e às vezes um lembrete no WhatsApp resolve.

Do lado direito da mesma faixa aparece a receita histórica da loja, somando tudo que você já vendeu desde o começo, sem filtro de período.

### Receita por dia

Um gráfico de barras com a receita de cada dia do período. Serve para enxergar padrão: em que dia da semana você vende mais, se um lançamento realmente movimentou a agulha, se as vendas caíram depois que uma campanha acabou.

### Funil de conversão

O funil tem três etapas e mostra onde as pessoas desistem:

1. **Abriu o checkout**: visitantes distintos que chegaram na página do produto.
2. **Tentou pagar**: quem preencheu os dados e iniciou o pagamento.
3. **Pagou**: pedidos confirmados.

Entre uma etapa e outra aparece a taxa de passagem, e no fim a conversão geral. Uma queda grande do primeiro para o segundo passo costuma ser preço ou página pouco convincente. Do segundo para o terceiro, costuma ser problema no pagamento.

As contagens usam visitantes distintos, então três tentativas de cartão recusado da mesma pessoa não viram três checkouts. Ainda assim, uma etapa pode aparecer maior que a anterior quando o cliente entra direto na URL do checkout ou bloqueia cookies.

### Produtos mais vendidos

Ranking dos cinco produtos que mais faturaram no período, com a receita e o número de unidades de cada um. A barra ao lado compara cada produto com o primeiro colocado.

O nome exibido é o que estava valendo no momento da venda, então renomear ou arquivar um produto não bagunça o histórico.

### Origem das vendas

Mostra de onde vieram as vendas pagas, agrupadas pelo link que trouxe o cliente.

Para separar as origens, marque seus links com o parâmetro `utm_source`. Por exemplo:

```
https://sua-loja.miblify.com/meu-produto?utm_source=instagram
```

Cada valor diferente vira uma linha no ranking. Sem essa marcação, a venda entra como "direto", que é onde cai todo mundo que chegou por link sem marcação, por acesso manual ou por brinde.

Vale usar um `utm_source` por canal: `instagram`, `youtube`, `newsletter`, `whatsapp`. Maiúsculas e espaços não fazem diferença, então `Instagram` e `instagram` contam junto.

### Últimas vendas

A lista dos dez pedidos mais recentes, com cliente, produto, valor, status e data. Um ícone ao lado do valor indica se foi Pix, cartão ou produto gratuito. Clique em qualquer linha para abrir os detalhes completos do pedido.

### Checklist de onboarding

Enquanto a loja é nova, o dashboard mostra um checklist com os primeiros passos:

1. Criar a loja
2. Completar o cadastro com logo e descrição
3. Criar o primeiro produto
4. Fazer a primeira venda

Cada item é marcado sozinho conforme você avança, e o checklist some quando todos estão concluídos.

## Menu lateral

| Área | Função |
|------|--------|
| Dashboard | Visão geral de métricas e vendas recentes. |
| Produtos | Criar, editar, publicar e gerenciar produtos. |
| Pedidos | Listar e acompanhar todos os pedidos da loja. |
| Configurações da Loja | Editar nome, URL, logo e descrição da loja. |
| Integrações de Pagamento | Conectar gateways de pagamento. |
| Integrações | Configurar webhooks e pixels de rastreamento. |

## Vitrine pública

A vitrine da sua loja fica no endereço:

```
https://sua-loja.miblify.com
```

Ela exibe todos os produtos publicados. O cliente navega e vai direto para o checkout.

## Dicas para o dia a dia

Comece pelo funil quando as vendas caírem. Ele diz se o problema é falta de gente chegando, gente chegando e não gostando da oferta, ou gente tentando pagar e não conseguindo. São três problemas diferentes e a solução de um não serve para o outro.

Marque seus links com `utm_source` desde o primeiro dia. Sem isso o ranking de origem não tem como te ajudar depois, e não dá para recuperar essa informação de vendas antigas.

Manter logo e descrição preenchidos também ajuda, porque uma loja com cadastro pela metade passa menos confiança. E se você já vende com alguma regularidade, os webhooks resolvem boa parte do pós-venda e os pixels de rastreamento mostram quanto cada anúncio está rendendo.
