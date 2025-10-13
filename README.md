# Consulta FIPE - Aplicação Full-Stack

Uma aplicação web full-stack para a consulta de preços de veículos baseada na Tabela FIPE. 

A aplicação é totalmente containerizada com Docker, permitindo que todo o ambiente (API, Frontend e Banco de Dados) seja configurado e executado com um único comando.

## Funcionalidades

* Consulta de preços de mercado para Carros, Motos e Caminhões.
* Interface com filtros dinâmicos e encadeados: o usuário seleciona o Tipo de Veículo, depois a Marca, o Modelo e o Ano para obter o valor.
* Interface de usuário limpa, simples e responsiva.
* Ambiente de desenvolvimento e produção 100% containerizado.

## Tecnologias Utilizadas

* **Backend:**
    * C# e .NET 8
    * ASP.NET Core para a API RESTful
    * Entity Framework Core 8 como ORM para acesso ao banco de dados

* **Frontend:**
    * HTML5
    * CSS3
    * JavaScript para manipulação do DOM e chamadas à API

* **Banco de Dados:**
    * Microsoft SQL Server

* **Infraestrutura e DevOps:**
    * Docker
    * Docker Compose para orquestração dos containers

## Arquitetura

A aplicação segue uma arquitetura de microsserviços simples, orquestrada pelo Docker Compose:

1.  **Frontend:** Uma aplicação estática (HTML, CSS, JS) servida por um container **Nginx**. É a camada de apresentação com a qual o usuário interage.
2.  **Backend (FipeApi):** Uma API RESTful desenvolvida em ASP.NET Core. Ela é responsável por toda a lógica de negócio e pela comunicação com o banco de dados.
3.  **Banco de Dados:** Um container **Microsoft SQL Server** que é inicializado com um script para criar o schema e popular as tabelas com dados de exemplo de veículos.

## Como Executar o Projeto

Para executar este projeto em sua máquina local, você precisará ter o Git e o Docker (com Docker Compose) instalados.

**Pré-requisitos:**
* [Git](https://git-scm.com/downloads)
* [Docker Engine e Docker Compose](https://docs.docker.com/engine/install/)

**Passo a Passo:**

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/gustavo1902/ConsultaFipe.git]
    ```

2.  **Navegue até a pasta do projeto:**
    ```bash
    cd seu-repositorio
    ```

3.  **Inicie os containers:**
    Na raiz do projeto, execute o seguinte comando. Ele irá construir as imagens necessárias, criar e iniciar os containers.
    ```bash
    docker-compose up --build
    ```

4.  **Acesse a aplicação:**
    Após a inicialização dos containers, a aplicação estará disponível no seu navegador no seguinte endereço:
    * **URL:** `http://localhost:8080`

Para parar todos os containers, execute o comando `docker-compose down` na raiz do projeto.

## Endpoints da API

A API do backend expõe os seguintes endpoints para o consumo do frontend:

* `GET /api/fipe/marcas/{tipoVeiculo}`
    * Retorna a lista de marcas para um determinado tipo de veículo (`carros`, `motos`).

* `GET /api/fipe/modelos/{tipoVeiculo}/{marcaId}`
    * Retorna a lista de modelos para uma marca específica.

* `GET /api/fipe/anos/{tipoVeiculo}/{marcaId}/{modeloId}`
    * Retorna a lista de anos/modelo disponíveis.

* `GET /api/fipe/valor/{tipoVeiculo}/{codigoFipe}`
    * Retorna os detalhes e o valor do veículo selecionado.

## Autor

* **GitHub:** [gustavo1902](https://github.com/gustavo1902)
* **LinkedIn:** [GustavoMorais](https://www.linkedin.com/in/gustavo-morais-costa/)