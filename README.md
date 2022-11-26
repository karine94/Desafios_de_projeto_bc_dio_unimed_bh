# ANÁLISE EXPLORATÓRIA UTILIZANDO PYTHON E PANDAS

Instrutora: Fernanda Santos.

Este script realiza uma análise exploratória com a base de dados 'AdventureWorks', a qual apresenta registros de vendas fictícias de produtos eletrônicos.



# PRIMEIRO PROJETO DE MODELAGEM DE DADOS


Projeto faz parte do Desafio do Bootcamp DIO - Geração tech Unimed - BH (Ciência de dados)

Instrutora: Juliana Mascarenhas.

Desafio consiste em fazer uma modelagem para um projeto de ecommerce, utilizando conceitos relacionados a EER.

O diagrama foi desenvolvido no MySQL WORKBENCH.


# SISTEMA DE CONTROLE E GERENCIAMENTO DE EXECUÇÃO DE ORDENS DE SERVIÇO EM UMA OFICINA MECÂNICA

Narrativa:
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
- O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços
- A mesma equipe avalia e executa os serviços
- Os mecânicos possuem código, nome, endereço e especialidade
- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

# Explorando SQL – Structured Query Language 

- Refinamento do esquema de modelagem do projeto de Ecommerce;
- Esquema lógico, queries e inserção de dados

# Projeto de Transfer Learning em Python 

O projeto consiste em aplicar o método de Transfer Learning em uma rede de Deep Learning na linguagem Python no ambiente COLAB.  

Todo código-fonte desenvolvido durante o curso foi versionado no GitHub, no seguinte endereço:
github.com/diegobrunoDIO/diegobrunoDIO/projects


# Amazon DynamoDB 

código do instrutor Cassiano Ricardo Peres

Serviço utilizado: Amazon DynamoDB
Amazon CLI para execução em linha de comando
Comandos para execução do experimento:
Criar uma tabela
aws dynamodb create-table \
    --table-name Music \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=SongTitle,AttributeType=S \
    --key-schema \
        AttributeName=Artist,KeyType=HASH \
        AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5
Inserir um item
aws dynamodb put-item \
    --table-name Music \
    --item file://itemmusic.json \
Inserir múltiplos itens
aws dynamodb batch-write-item \
    --request-items file://batchmusic.json
Criar um index global secundário baeado no título do álbum
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"AlbumTitle-index\",\"KeySchema\":[{\"AttributeName\":\"AlbumTitle\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
Criar um index global secundário baseado no nome do artista e no título do álbum
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions\
        AttributeName=Artist,AttributeType=S \
        AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"ArtistAlbumTitle-index\",\"KeySchema\":[{\"AttributeName\":\"Artist\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"AlbumTitle\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
Criar um index global secundário baseado no título da música e no ano
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions\
        AttributeName=SongTitle,AttributeType=S \
        AttributeName=SongYear,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"SongTitleYear-index\",\"KeySchema\":[{\"AttributeName\":\"SongTitle\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"SongYear\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
Pesquisar item por artista
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist" \
    --expression-attribute-values  '{":artist":{"S":"Iron Maiden"}}'
Pesquisar item por artista e título da música
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist and SongTitle = :title" \
    --expression-attribute-values file://keyconditions.json
Pesquisa pelo index secundário baseado no título do álbum
aws dynamodb query \
    --table-name Music \
    --index-name AlbumTitle-index \
    --key-condition-expression "AlbumTitle = :name" \
    --expression-attribute-values  '{":name":{"S":"Fear of the Dark"}}'
Pesquisa pelo index secundário baseado no nome do artista e no título do álbum
aws dynamodb query \
    --table-name Music \
    --index-name ArtistAlbumTitle-index \
    --key-condition-expression "Artist = :v_artist and AlbumTitle = :v_title" \
    --expression-attribute-values  '{":v_artist":{"S":"Iron Maiden"},":v_title":{"S":"Fear of the Dark"} }'
Pesquisa pelo index secundário baseado no título da música e no ano
aws dynamodb query \
    --table-name Music \
    --index-name SongTitleYear-index \
    --key-condition-expression "SongTitle = :v_song and SongYear = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Wasting Love"},":v_year":{"S":"1992"} }'

# Projeto: Pacote de Processamento de Imagens
Autora do Projeto: Karina Kato

Descrição
O pacote "image_processing-test" é usado para:

Módulo "Processing":

    Correspondência de histograma;
    Similaridade estrutural;
    Redimensionar imagem;
    
Módulo "Utils":

    Ler imagem;
    Salvar imagem;
    Plotar imagem;
    Resultado do gráfico;
    Plotar histograma;
