---
title: Pixels de rastreamento
description: Aprenda como configurar pixels do Meta Ads, Google Ads e TikTok Ads para rastrear conversões na sua loja Miblify.
---

Os pixels de rastreamento permitem que você conecte sua loja Miblify com plataformas de anúncios para rastrear conversões (vendas) de forma automática. Com isso, você consegue medir o retorno das suas campanhas e otimizar seus anúncios.

## Plataformas suportadas

| Plataforma  | Identificador |
|-------------|---------------|
| Meta Ads    | `meta`        |
| Google Ads  | `google`      |
| TikTok Ads  | `tiktok`      |

## Cadastrando um pixel

1. No menu lateral, acesse **Integrações**.
2. Clique na aba **Tracking Pixel**.
3. Clique em **Cadastrar Pixel**.
4. Selecione a **plataforma** desejada (Meta, Google ou TikTok).
5. Informe o **Pixel ID** (ou Track ID) fornecido pela plataforma de anúncios.
6. Configure as opções adicionais, se disponíveis.
7. Clique em **Ativar Integração**.

## Configurações por plataforma

### Meta Ads

Além do Pixel ID, o Meta Ads permite configurar a **Conversion API (CAPI)** para melhorar a precisão do rastreamento:

- **Access Token**: token de acesso do Meta, necessário para enviar eventos pelo servidor (CAPI). Você encontra esse token no **Gerenciador de Eventos** do Meta Business Suite.

A CAPI complementa o pixel do navegador, enviando eventos também pelo servidor. Isso melhora a precisão principalmente para usuários que usam bloqueadores de anúncios.

### Google Ads

Para o Google Ads, você pode configurar:

- **Conversion Label**: o rótulo de conversão do Google Ads, no formato `AW-123456/ABCD123`. Você encontra esse valor ao criar uma ação de conversão no Google Ads.

### TikTok Ads

Para o TikTok Ads, basta informar o Pixel ID. Você encontra o Pixel ID no TikTok Ads Manager, na seção de **Eventos**.

## Escolhendo os produtos

Para cada pixel, você pode definir em quais produtos o rastreamento será disparado:

- **Todos os produtos**: o pixel é ativado para qualquer venda da loja.
- **Produtos específicos**: você seleciona manualmente quais produtos devem disparar o pixel.

Isso é útil quando você tem campanhas diferentes para produtos diferentes e quer rastrear cada um com o pixel correto.

## Ativando e desativando

Cada pixel possui um controle de **status** (ativo/inativo). Você pode desativar um pixel temporariamente sem precisar excluí-lo.

## Editando e removendo pixels

Na aba de Tracking Pixels, você pode:

- **Editar**: alterar o Pixel ID, configurações avançadas ou os produtos vinculados.
- **Remover**: excluir o pixel permanentemente.

## Próximo passo

Com pixels configurados, suas campanhas de anúncios serão alimentadas automaticamente com os dados de conversão. Veja também como funciona o [painel administrativo](/help/admin/dashboard/) para acompanhar tudo em um só lugar.
