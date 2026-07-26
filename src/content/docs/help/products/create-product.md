---
title: Cadastrando produtos
description: Saiba como criar, editar e gerenciar os produtos da sua loja na Miblify.
sidebar:
  order: 1
---

Na Miblify você pode cadastrar produtos digitais pagos, gratuitos ou por assinatura.

## Criando um novo produto

1. No menu lateral, clique em **Produtos**.
2. Clique no botão **Novo Produto**.
3. Preencha os campos obrigatórios:

| Campo         | Descrição                                                                 |
|---------------|---------------------------------------------------------------------------|
| Nome          | Nome do produto, entre 3 e 100 caracteres.                               |
| Tipo          | Escolha entre Pagamento único, Gratuito ou Assinatura. |
| Slug (URL)    | Endereço do produto na loja. Apenas letras minúsculas, números e hifens.  |
| Preço         | Valor em reais, por exemplo R$ 99,00. Produtos gratuitos sempre têm preço zero.  |
| Descrição     | Texto descritivo sobre o produto. Aparece na página de checkout.          |

4. Clique em **Criar produto**.

## Adicionando imagem de capa

Na tela de edição do produto, use o campo de upload de imagem. São aceitos arquivos JPEG, PNG ou WebP de até 5 MB. Para tirar a capa atual, marque a opção de remoção antes de salvar.

## Adicionando arquivos para entrega

Para produtos digitais, na aba **Conteúdo** você pode anexar arquivos que serão disponibilizados ao comprador após a confirmação do pagamento.

Os entregáveis ficam organizados em módulos, então crie pelo menos um módulo antes de anexar qualquer coisa. Cada arquivo pode ter até 100 MB. Executáveis (.exe, .sh), HTML e JavaScript não são aceitos.

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

Pela listagem de produtos você edita qualquer informação, inclusive nome, preço e arquivos. Também pode arquivar um produto para tirá-lo da vitrine sem excluir, e desarquivar depois, voltando com ele como rascunho ou publicado.

## Próximo passo

Com o produto cadastrado, você precisa [configurar a integração de pagamento](/help/payments/setup-payments/) para começar a receber.
