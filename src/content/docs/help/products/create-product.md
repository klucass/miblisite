---
title: Cadastrando produtos
description: Saiba como criar, editar e gerenciar os produtos da sua loja na Miblify.
sidebar:
  order: 1
---

Os produtos são o coração da sua loja. Na Miblify, você pode cadastrar produtos digitais pagos, gratuitos (freebies) ou por assinatura.

## Criando um novo produto

1. No menu lateral, clique em **Produtos**.
2. Clique no botão **Novo Produto**.
3. Preencha os campos obrigatórios:

| Campo         | Descrição                                                                 |
|---------------|---------------------------------------------------------------------------|
| Nome          | Nome do produto, entre 3 e 100 caracteres.                               |
| Tipo          | Escolha entre Pagamento único, Gratuito ou Assinatura. |
| Slug (URL)    | Endereço do produto na loja. Apenas letras minúsculas, números e hifens.  |
| Preço         | Valor em moeda local, ex: R$ 99,00. Freebies (produtos gratuitos) sempre têm preço zero.  |
| Descrição     | Texto descritivo sobre o produto. Aparece na página de checkout.          |

4. Clique em **Criar produto**.

## Adicionando imagem de capa

Você pode adicionar uma imagem de capa ao produto. Formatos aceitos: **JPEG, PNG ou WebP**. O tamanho máximo é de **5 MB**.

Na tela de edição do produto, use o campo de upload de imagem. Para remover a imagem existente, marque a opção de remoção antes de salvar.

## Adicionando arquivos para entrega

Para produtos digitais, na aba **Conteúdo** você pode anexar arquivos que serão disponibilizados ao comprador após a confirmação do pagamento.

- Organize os entregáveis em módulos. Crie pelo menos um módulo para anexar arquivos nele.
- Cada arquivo pode ter até **100 MB**.
- Tipos proibidos: executáveis (.exe, .sh), HTML e JavaScript.

Para remover um arquivo específico, selecione-o na lista de anexos e confirme a remoção.

## Status do produto

Todo produto começa com o status **Rascunho**. Os status disponíveis são:

| Status     | Significado                                                  |
|------------|--------------------------------------------------------------|
| Rascunho   | O produto não aparece na vitrine e não pode ser comprado.    |
| Publicado  | O produto está visível na vitrine e disponível para compra.  |
| Arquivado  | O produto foi retirado da vitrine e não pode mais ser vendido. |

Para publicar um produto, edite-o e altere o status para **Publicado**.

## Editando e gerenciando produtos

Na listagem de produtos, você pode:

- **Editar**: alterar qualquer informação do produto, incluindo preço, nome e arquivos.
- **Arquivar**: retirar o produto da vitrine sem excluí-lo.
- **Desarquivar**: recolocar um produto arquivado como rascunho ou publicado.

## Próximo passo

Com o produto cadastrado, você precisa [configurar a integração de pagamento](/help/payments/setup-payments/) para começar a receber.
