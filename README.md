# DESAFIO - SISTEMA LOCAÇÃO DE AUTOMÓVEL

## Requisitos: 

1. Postgres 9.5
2. Ruby 2.5.1
3. Rails 5.2.3
4. Redis
6. Docker

## Instalação

Se for executar fora do container, precisa ajustar as configurações para o Postgres e atentar aos requisitos

#### Docker

Crie as imagens
`docker-compose build

Instale as gems  
`docker-compose run --rm app bundle install`

Crie o banco e rode as migrações 
`docker-compose run --rm app bundle exec rails db:create db:migrate db:seed`

Para executar os testes
`docker-compose run --rm app bundle exec rspec spec`

Iniciar o server
`docker-compose up`

#### Deploy 

https://libercareer.herokuapp.com/

## DESCRIÇÃO DO DESAFIO 

O objetivo deste exercício é analisar sua familiaridade com desenvolvimento
backend e, em especial, a plataforma Ruby on Rails, atendendo um caso de uso
com os recursos que o framework oferece. Use as melhores práticas seguindo o
padrão MVC. Como Ruby é uma linguagem de alto nível, pedimos que o projeto
seja feito em Ruby on Rails mesmo que você não tenha experiência prévia com
a linguagem Ruby ou com o framework Rails.

O foco do projeto não é medir sua capacidade em escrever código em Ruby on
Rails, mas sim analisar o seu entendimento e resolução do problema, além da
forma que você estrutura seu projeto e a completude dos objetivos descritos
abaixo.

#### Cenário: Sistema de aluguel de automóveis

* Pessoa: tem nome, sobrenome, documento, e-mail, data de nascimento
* Telefone: tem número, ddd, tipo e preferencial (Sim ou Não)
* Automóvel: tem modelo, cor, ano, placa, tipo e custo diário
* Habilitação: tem pessoa, número, modalidades e validade
* Locação: tem pessoa, automóvel, valor, data de início, data de término, data de retirada e data de entrega

#### Regras do sistema

* Pessoas não podem ter mais de uma locação em andamento
* Pessoas devem ter mais de 21 anos para alugar um automóvel
* Pessoas devem ter mais de 40 anos e habilitação correspondente para alugar um Ônibus
* Pessoas devem ter mais de 60 anos e habilitação correspondente para alugar um Caminhão
* Pessoas que já tenham mais de 2 locações sem atrasos podem alugar automóveis por mais de 4 dias
* Automóveis que possuam placa que termina em '4' não podem ser alugados às quartas feiras
* Pessoas com habilitação vencida não podem alugar carros
* Pessoas podem ter um ou mais telefones, mas apenas uma preferência
* Defina uma regra de atrasos (qual a tolerância para o sistema identificar um atraso)

#### Questões

As questões devem ser respondidas com queries do ActiveRecord. Inclua os trechos de código que respondem às perguntas abaixo:

* Qual é o custo total de todas as locações de carros?
* Qual o nome completo das pessoas que possuem atrasos em suas locações e o quanto (dias; horas; minutos)
* Qual o nome completo das pessoas que podem alugar caminhões?
* Qual o nome completo das pessoas com locações em andamento?
* Qual o nome completo das pessoas que podem alugar automóveis por mais de 4 dias?
* Quais automóveis não podem ser alugados às quartas-feiras?
* Qual será o custo de uma locação de moto por 3 dias?
* Liste as pessoas ordenando pelo custo de locações (maior para menor)
* Liste as pessoas para as quais a habilitação possui menos de 1 mês para seu vencimento
