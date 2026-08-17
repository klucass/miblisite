---
title: "Taxa de aprovação de cartão baixa: por que recusam sua venda"
description: "Taxa de aprovação de cartão baixa derruba seu faturamento em silêncio. Veja por que o cartão é recusado no checkout e como recuperar a venda perdida."
pubDate: "2026-08-17"
tags:
  - "pagamentos"
  - "taxas"
  - "plataformas"
heroImage: "https://images.unsplash.com/photo-1509023464722-18d996393ca8?w=1600&q=80"
---

O anúncio está rodando bem. Cliques bons, custo por lead estável, 40 pessoas abriram o checkout hoje.

E 22 compraram.

As outras 18 preencheram os dados, clicaram em pagar e viram uma mensagem genérica de "não foi possível processar". Você não recebeu e-mail sobre nenhuma delas. No painel, elas simplesmente não existem. Foi dinheiro que entrou no funil, pagou tráfego e evaporou entre o último clique e a confirmação.

Essa é a conta mais cara que quase ninguém acompanha: a taxa de aprovação de cartão.

## O que é taxa de aprovação de cartão

É o percentual de tentativas de pagamento no cartão que terminam aprovadas. Se 100 pessoas tentaram pagar e 84 conseguiram, sua aprovação é 84%.

Parece um detalhe técnico do gateway. Não é. É o único número do seu funil que corta faturamento depois de você já ter pagado por tudo: o anúncio, a página, a copy, a confiança que fez a pessoa digitar o cartão.

No mercado digital brasileiro, o que se comenta como faixa saudável para venda de infoproduto gira em torno de 85% a 90% no cartão de crédito. Trate isso como estimativa de mercado, não como número auditado, porque quase nenhuma plataforma publica o dado. O que importa é o seu: se você está em 70%, cada 1.000 tentativas viram 300 vendas perdidas, e boa parte delas era recuperável.

Faça a conta com seu ticket. Ticket de R$ 297, 300 recusas no mês, quase R$ 90 mil que passaram pela porta e voltaram.

## Recusa não é uma coisa só

O erro mais comum de quem tenta resolver isso é tratar toda recusa igual. Existem três origens diferentes, com soluções diferentes.

### Recusa do banco emissor

O banco do cliente disse não. É a maior fatia das recusas, algo entre metade e dois terços do total na maioria das operações.

Motivos que aparecem sempre: limite insuficiente, cartão vencido, compra fora do padrão de consumo do cliente, cartão de débito sendo usado como crédito, ou uma regra interna de risco do banco que ninguém de fora consegue ler.

Aqui você tem pouco controle direto, mas tem influência. Falo disso mais abaixo.

### Recusa do antifraude

Antes de chegar no banco, sua venda passa por um sistema de análise de risco. Ele olha valor, dispositivo, geolocalização, histórico do e-mail, velocidade de tentativas, e decide se aquilo parece fraude.

Infoproduto é um cenário desconfortável para esse sistema. Entrega instantânea, sem endereço físico, sem rastreio, ticket que às vezes salta de R$ 47 para R$ 1.997 no mesmo dia. Quem calibrou o antifraude pensando em e-commerce de tênis olha para isso e aperta o freio.

E o antifraude não é seu. É da plataforma ou do gateway, com régua definida por eles, aplicada igual para todo mundo que vende ali.

### Erro no preenchimento

A recusa mais boba e a mais fácil de resolver. Número digitado errado, CVV trocado, nome fora do padrão do cartão, CPF do titular diferente do CPF de quem compra.

Num checkout longo, com muitos campos e sem validação em tempo real, essa fatia cresce. Se seu checkout ainda não foi revisado com esse olhar, vale ler [como criar um checkout para produto digital](/blog/como-criar-checkout-produto-digital/) antes de mexer em qualquer outra coisa.

## O que derruba sua aprovação sem você perceber

| Fator | Como aparece na prática |
|---|---|
| Ticket alto sem histórico | Sua loja vendia R$ 97 e começou a vender R$ 1.997. O antifraude lê o salto como suspeita. |
| Pico de lançamento | 300 tentativas em duas horas num domínio que fazia 10 por dia. Isso liga alerta de teste de cartão. |
| Histórico de chargeback | Contestação alta faz adquirente e antifraude ficarem mais rígidos com você. É o efeito colateral do [chargeback em infoproduto](/blog/chargeback-em-infoproduto/). |
| Uma adquirente só | Se o processamento passa por um único caminho, uma recusa é definitiva. Com mais de um, ela pode ser retentada. |
| Parcelamento longo | Parcela em 12x exige limite alto e disponível. Muita recusa por limite nasce aí, não no cartão em si. |
| Dados incompletos | Checkout que não coleta CPF, telefone ou e-mail consistente entrega menos informação para a análise de risco aprovar com segurança. |
| Descritor irreconhecível | O nome que aparece na fatura não lembra o que a pessoa comprou, então ela contesta, e a contestação volta como recusa futura. |

Repare que quase nada dessa lista está no cartão do cliente. Está na sua estrutura de cobrança.

## Como recuperar a venda que já foi recusada

Recusa não é fim de venda. É uma venda que precisa de um segundo caminho, rápido, nos minutos seguintes.

**Ofereça Pix na mesma tela.** A pessoa já decidiu comprar. Se a tela de erro oferece "pagar por Pix agora" em vez de um beco sem saída, boa parte converte na hora. Como bônus, Pix custa bem menos que cartão, e essa diferença aparece quando você abre a [taxa de gateway de pagamento](/blog/taxa-de-gateway-de-pagamento/) por método.

**Tente de novo, com critério.** Retentativa funciona quando é espaçada e com um caminho diferente. Repetir a mesma cobrança na mesma adquirente cinco vezes em dois minutos só aumenta a suspeita e pode marcar seu domínio.

**Fale com quem foi recusado.** Isso quase ninguém faz. Se seu checkout captura e-mail e telefone antes do pagamento, você tem uma lista de gente com intenção máxima de compra que não conseguiu pagar. Uma mensagem simples resolve muita coisa: "seu pagamento não passou, aqui está o link para tentar por Pix ou outro cartão".

**Peça para o cliente ligar no banco.** Quando a recusa é regra de risco do emissor, uma ligação de dois minutos libera. Vale sugerir isso na própria mensagem de erro, com essas palavras, sem termo técnico.

**Reduza o parcelamento na segunda tentativa.** Se caiu por limite em 12x, a mesma compra em 6x pode passar.

## Como subir a aprovação no médio prazo

- Ofereça Pix com peso igual ao cartão, não escondido embaixo. No digital brasileiro, Pix costuma responder por metade ou mais das vendas quando o checkout dá a ele o mesmo destaque.
- Peça os dados que o antifraude precisa (nome completo, CPF, e-mail, telefone) e nada além disso. Campo a mais derruba conversão, campo de menos derruba aprovação.
- Mantenha um descritor de fatura reconhecível, com o nome que o cliente vai lembrar.
- Cuide da taxa de chargeback como se fosse métrica de vendas, porque ela virou uma.
- Avise seu gateway antes de um lançamento grande. Volume anunciado é volume analisado com menos susto.
- Acompanhe a aprovação semanalmente, separada por método e por faixa de ticket. Média mensal esconde exatamente o dia em que o problema apareceu.

Se seus números caíram e você não sabe dizer se foi tráfego, oferta ou pagamento, o diagnóstico completo está em [por que suas vendas de infoproduto pararam](/blog/vendas-infoproduto-pararam/).

## O número que a plataforma não te mostra

Na maioria das plataformas tradicionais, você não tem acesso à sua taxa de aprovação, não sabe quantas tentativas foram recusadas, não sabe o motivo de cada uma e não fala com a adquirente. A régua de antifraude é da plataforma, o relacionamento com o processador é da plataforma, e o prejuízo da recusa é seu.

Você descobre que existe um problema quando o faturamento cai sem explicação e o suporte responde que "está tudo normal por aqui".

É por isso que a [Miblify](https://www.miblify.com) trabalha com o seu gateway conectado direto na sua conta. O pagamento passa pelo seu Mercado Pago, o dinheiro cai na sua conta, e as tentativas, recusas e motivos aparecem no painel do gateway, que é seu. Quando a aprovação cai, você vê o motivo e liga para quem processa, em vez de abrir ticket e esperar.

Isso não faz banco nenhum aprovar tudo. Só te devolve a informação para agir.

## Perguntas frequentes

**Qual é uma boa taxa de aprovação de cartão para infoproduto?**
Como referência de mercado, algo entre 85% e 90% costuma ser tratado como saudável no cartão de crédito. Abaixo de 80% existe problema estrutural para investigar. Mais importante que a média do mercado é a sua série histórica: uma queda de 8 pontos numa semana diz muito mais do que o número absoluto.

**Recusa no cartão prejudica minha conta na plataforma?**
Pode. Volume alto de recusa, especialmente muitas tentativas seguidas do mesmo cartão ou do mesmo IP, é lido como teste de cartão roubado. Isso liga alerta de risco e, em alguns casos, leva a análise ou bloqueio. Se já aconteceu com você, o caminho está em [conta bloqueada em plataforma de infoproduto](/blog/conta-bloqueada-plataforma-infoproduto/).

**Por que meu cliente diz que tem limite e o cartão foi recusado?**
Na maioria dos casos é regra de risco do banco emissor, não falta de limite. Compra digital, valor fora do padrão de consumo ou primeira compra naquele estabelecimento entram nesse filtro. Uma ligação do cliente para o banco costuma liberar na segunda tentativa.

**Vale a pena vender só no Pix para fugir da recusa?**
Não. Pix aprova quase tudo e custa menos, mas cartão parcelado é o que sustenta ticket alto, e cortar o cartão corta faturamento. O caminho é oferecer os dois com destaque igual e usar o Pix como resgate imediato de quem foi recusado.

## Conclusão

Taxa de aprovação de cartão baixa não aparece como problema. Aparece como um mês fraco, uma campanha que "não performou", uma sensação de que o mercado esfriou. Enquanto isso, dezenas de pessoas que já decidiram comprar de você bateram numa porta fechada e foram embora sem que ninguém registrasse.

Comece medindo. Depois ofereça uma saída para quem for recusado, e cobre da sua estrutura de pagamento a informação que te falta para agir.

**[Crie sua conta grátis na Miblify](https://app.miblify.com/?utm_source=blog&utm_medium=post&utm_campaign=taxa-de-aprovacao-de-cartao-baixa) e venda com o pagamento na sua mão.**
