PostgreSQL DBA Lab

📌 Sobre o projeto

Este projeto é um laboratório prático de administração de banco de dados PostgreSQL em Linux.

Ele foi criado para demonstrar, de forma simples e objetiva, algumas atividades que fazem parte da rotina de profissionais de Infraestrutura, Suporte, Banco de Dados e DBA.

Mesmo para quem não possui conhecimento técnico em banco de dados, a ideia principal é fácil de entender:

O projeto demonstra como criar informações em um banco de dados, verificar quem está conectado, gerar uma cópia de segurança e restaurar os dados em caso de necessidade.

Em outras palavras, o objetivo é provar na prática que os dados podem ser armazenados, monitorados, protegidos e recuperados.

🎯 Objetivo

O principal objetivo deste laboratório é demonstrar conhecimentos práticos em:

Administração básica de PostgreSQL;

Linux;

SQL;

Monitoramento de conexões;

Criação de banco de dados;

Criação de tabelas;

Inserção e consulta de informações;

Backup de banco de dados;

Restauração de banco de dados;

Validação da integridade dos dados;

Documentação técnica.

💡 Explicando de forma simples

Imagine que uma empresa possui um sistema com informações importantes de clientes, funcionários, produtos ou vendas.

Essas informações ficam armazenadas em um banco de dados.

Neste laboratório foi simulada uma pequena empresa com uma tabela de funcionários.

Foram cadastrados registros como:

Nome

Cargo

Salário

João Silva

DBA Jr

R$ 3.500,00

Maria Souza

Analista Banco

R$ 4.500,00

Carlos Lima

Dev Backend

R$ 5.000,00

Depois disso, foi realizada uma sequência semelhante ao que pode acontecer em um ambiente corporativo:

Criar o banco
      ↓
Criar a tabela
      ↓
Inserir informações
      ↓
Consultar os dados
      ↓
Monitorar o PostgreSQL
      ↓
Gerar um backup
      ↓
Restaurar o backup
      ↓
Validar se os dados continuam corretos

O resultado foi uma restauração bem-sucedida, preservando os registros existentes no banco original.

🗄️ O que é PostgreSQL?

O PostgreSQL é um sistema de gerenciamento de banco de dados.

Ele é responsável por armazenar e organizar informações utilizadas por aplicações, sistemas internos, sites e diversos outros serviços.

Um administrador de banco de dados precisa garantir, entre outras coisas, que:

os dados estejam disponíveis;

os acessos possam ser acompanhados;

existam cópias de segurança;

os dados possam ser recuperados em caso de falha.

Este laboratório demonstra exatamente alguns desses conceitos.

🔎 Etapas realizadas

1. Validação do ambiente

Primeiramente foi validada a instalação do PostgreSQL no servidor Linux.

postgres --version

Também foi acessado o usuário administrativo do PostgreSQL.

su - postgres

2. Acesso ao PostgreSQL

O acesso ao console do banco foi realizado utilizando:

psql

Depois, foi validado qual usuário estava conectado.

SELECT current_user;

Resultado:

postgres

Isso confirma que os comandos administrativos estavam sendo executados com o usuário correto.

3. Monitoramento das conexões

Também foi utilizado o recurso interno do PostgreSQL chamado:

pg_stat_activity

Ele permite visualizar informações sobre as conexões existentes no banco.

Em um ambiente empresarial isso pode ajudar a identificar:

usuários conectados;

aplicações conectadas;

consultas em execução;

conexões paradas;

tempo de execução de determinadas operações.

🏢 Criação do banco de dados

Foi criado um banco chamado:

empresa

Com o comando:

CREATE DATABASE empresa;

Depois foi criada a tabela:

funcionarios

Estrutura utilizada:

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario NUMERIC(10,2)
);

👨‍💼 Inserção de dados

Foram cadastrados funcionários fictícios para simular um pequeno ambiente empresarial.

INSERT INTO funcionarios (nome, cargo, salario)
VALUES
('Joao Silva','DBA Jr',3500),
('Maria Souza','Analista Banco',4500),
('Carlos Lima','Dev Backend',5000);

Depois os dados foram consultados:

SELECT * FROM funcionarios;

Isso permitiu confirmar que as informações haviam sido armazenadas corretamente.

💾 Backup

Uma das partes mais importantes do laboratório foi a criação do backup.

O backup funciona como uma cópia de segurança do banco de dados.

Foi utilizado o utilitário oficial do PostgreSQL:

pg_dump

Exemplo:

pg_dump empresa > /backup/empresa_backup.sql

Depois foi verificado se o arquivo havia sido realmente criado.

ls -lh /backup

Essa etapa é importante porque apenas executar um comando de backup não é suficiente: também é necessário validar se o arquivo foi produzido.

♻️ Restauração

Ter um backup é importante, mas um backup só possui valor real quando é possível utilizá-lo para recuperar os dados.

Por isso, o laboratório também incluiu uma restauração.

Foi criado outro banco para receber os dados do backup.

Depois da restauração, foram realizadas duas validações.

Validação da tabela

\d

Foi possível confirmar a existência da tabela:

funcionarios

Validação dos registros

SELECT * FROM funcionarios;

Os três registros apareceram novamente após a restauração.

Isso comprovou que o processo:

BACKUP → RESTAURAÇÃO → VALIDAÇÃO

foi concluído com sucesso.

📸 Evidências práticas

O projeto inclui capturas de tela das atividades realizadas no servidor.

Essas evidências demonstram que os procedimentos não foram apenas descritos teoricamente: eles foram executados e validados na prática.

Entre as evidências estão:

versão do PostgreSQL;

acesso ao usuário administrativo;

acesso ao psql;

validação do usuário conectado;

consulta de conexões;

criação do banco;

criação da tabela;

inserção dos dados;

consulta dos registros;

criação do backup;

restauração;

confirmação dos dados restaurados.

As imagens estão disponíveis em:

docs/evidencias/

🧰 Tecnologias utilizadas

Tecnologia

Utilização

Linux

Sistema operacional do laboratório

PostgreSQL

Banco de dados

SQL

Criação e manipulação dos dados

psql

Administração do PostgreSQL pelo terminal

pg_dump

Geração de backup

Bash

Automação e comandos no servidor

PuTTY

Acesso remoto ao servidor

Git

Controle de versão

GitHub

Documentação e apresentação do projeto

📂 Estrutura do projeto

postgresql-dba-lab/
│
├── README.md
├── docs/
│   └── evidencias/
│
├── sql/
│   ├── create_database.sql
│   ├── create_table.sql
│   ├── insert_data.sql
│   └── monitoring.sql
│
├── scripts/
│   ├── backup.sh
│   └── restore.sh
│
├── LICENSE
├── SECURITY.md
└── CHANGELOG.md

A organização foi pensada para separar:

documentação;

evidências;

comandos SQL;

scripts de administração.

🧠 Competências demonstradas

Este projeto demonstra conhecimentos relacionados a:

Banco de Dados

PostgreSQL;

SQL;

criação de bancos;

criação de tabelas;

consultas;

administração básica;

monitoramento.

Backup e recuperação

pg_dump;

geração de backup;

armazenamento do arquivo;

restauração;

validação pós-restore.

Linux

terminal;

usuários;

diretórios;

permissões;

execução de comandos administrativos.

Documentação

Além da execução técnica, todo o procedimento foi documentado de maneira que outra pessoa possa entender o objetivo e reproduzir o laboratório.

🛡️ Segurança

Este repositório foi preparado para publicação pública.

Informações sensíveis de ambientes reais, como:

senhas;

credenciais;

dados reais de clientes;

informações confidenciais;

não devem ser adicionadas ao projeto.

Os dados utilizados no laboratório são exemplos destinados exclusivamente para estudo.

⚠️ Observação sobre a versão

As evidências originais deste laboratório foram produzidas em um ambiente com PostgreSQL 9.6.11.

Essa versão é antiga e não deve ser utilizada como referência para uma nova implantação em produção.

Ela permanece nas evidências porque representa o ambiente em que o laboratório foi executado.

Os conceitos demonstrados — SQL, monitoramento, backup, restore e validação — continuam relevantes, e uma evolução planejada do projeto é reproduzir o laboratório utilizando uma versão atual e suportada do PostgreSQL.

🚀 Possíveis evoluções

O laboratório pode ser expandido futuramente com:

PostgreSQL em versão atual;

Docker;

Docker Compose;

backup automático;

agendamento com Cron;

logs de backup;

política de retenção;

monitoramento com Prometheus;

dashboards no Grafana;

GitHub Actions;

testes automáticos;

replicação PostgreSQL;

recuperação Point-in-Time Recovery (PITR).

👔 Por que este projeto está no meu portfólio?

Mais do que demonstrar comandos, este projeto busca demonstrar minha forma de trabalhar:

Entender o ambiente
        ↓
Executar
        ↓
Validar
        ↓
Documentar
        ↓
Proteger os dados
        ↓
Testar a recuperação

Acredito que uma atividade de infraestrutura ou banco de dados não termina quando um comando retorna sucesso.

É necessário validar o resultado, documentar o procedimento e garantir que exista uma forma segura de recuperação.

📚 Aprendizados

Durante este laboratório foram trabalhados conceitos importantes da rotina de administração de bancos de dados:

importância do backup;

diferença entre gerar um backup e testar uma restauração;

validação dos dados após recuperação;

monitoramento de sessões;

organização de documentação técnica;

utilização do Linux para administração;

importância de registrar evidências de uma atividade.

👨‍💻 Autor

Matheus Barcelli

Projeto desenvolvido para estudo, prática técnica e composição de portfólio profissional nas áreas de:

Infraestrutura | Linux | Banco de Dados | PostgreSQL | DBA | DevOps

⭐ Sobre este repositório

Se você é recrutador ou profissional da área e chegou até aqui, este repositório representa um dos meus laboratórios práticos.

Meu objetivo é continuar evoluindo o projeto e adicionando cenários cada vez mais próximos de ambientes corporativos reais.
