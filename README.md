PostgreSQL DBA Lab

Sobre o projeto

O PostgreSQL DBA Lab é um projeto criado para demonstrar, de forma prática, algumas atividades básicas de administração de banco de dados PostgreSQL em servidores Linux.

A ideia do projeto é mostrar como um banco de dados pode ser criado, monitorado, protegido através de backup e recuperado através de uma restauração.

O laboratório foi executado na prática e documentado com evidências das principais etapas realizadas.

O projeto foi desenvolvido e documentado por Matheus Barcelli.

O que esse projeto faz?

De forma simples, o projeto demonstra algumas tarefas importantes relacionadas à administração de banco de dados:

Acessa e valida o ambiente PostgreSQL.

Cria um banco de dados para testes.

Cria uma tabela e adiciona informações fictícias.

Consulta os dados cadastrados.

Monitora as conexões do banco.

Gera uma cópia de segurança.

Restaura o banco através do backup.

Valida se os dados foram recuperados corretamente.

O objetivo é mostrar um processo completo, desde a criação das informações até a recuperação dos dados.

Por que esse projeto é importante?

Empresas armazenam informações importantes em bancos de dados.

Essas informações podem incluir:

dados de clientes;

funcionários;

produtos;

vendas;

sistemas internos;

informações operacionais.

Caso aconteça alguma falha no servidor, perda de arquivos ou corrupção de dados, é importante que exista uma cópia de segurança.

Porém, apenas criar um backup não é suficiente.

Também é importante testar se esse backup realmente consegue recuperar as informações.

Este projeto demonstra justamente esse processo.

Exemplo simples

Imagine uma empresa que possui informações de funcionários armazenadas em um banco de dados.

Neste laboratório foi criada uma tabela com dados fictícios como:

Nome

Cargo

Salário

João Silva

DBA Jr

R$ 3.500,00

Maria Souza

Analista de Banco

R$ 4.500,00

Carlos Lima

Desenvolvedor Backend

R$ 5.000,00

Depois que essas informações foram cadastradas, o ambiente passou pelo seguinte processo:

Banco de Dados
      |
      v
Cadastro de Informações
      |
      v
Consulta e Validação
      |
      v
Monitoramento
      |
      v
Geração do Backup
      |
      v
Restauração
      |
      v
Validação dos Dados

Ao final, os registros foram recuperados corretamente através do backup.

Tecnologias utilizadas

Linux

O laboratório foi realizado em ambiente Linux, sistema operacional muito utilizado em servidores e infraestrutura corporativa.

PostgreSQL

O PostgreSQL é o banco de dados utilizado neste laboratório.

Ele é responsável por armazenar e organizar as informações utilizadas durante os testes.

SQL

SQL é a linguagem utilizada para trabalhar com os dados dentro do banco.

Neste projeto ela foi utilizada para:

criar o banco;

criar tabelas;

inserir informações;

consultar registros;

validar os dados.

psql

O psql é a ferramenta de terminal do PostgreSQL.

Ela permite acessar e administrar o banco de dados diretamente pelo servidor Linux.

pg_dump

O pg_dump é uma ferramenta do próprio PostgreSQL utilizada para gerar cópias de segurança dos bancos.

Neste projeto, ele foi utilizado durante o processo de backup.

Bash

O Bash é utilizado para executar comandos e scripts em ambientes Linux.

Git e GitHub

Utilizados para organizar, versionar, documentar e publicar o projeto como parte do portfólio profissional.

Monitoramento

O projeto também demonstra uma atividade importante na administração de banco de dados: o monitoramento de conexões.

Foi utilizada uma visão interna do PostgreSQL chamada:

pg_stat_activity

De forma simples, ela permite verificar informações sobre quem está utilizando o banco naquele momento.

Entre as informações que podem ser analisadas estão:

usuários conectados;

aplicações conectadas;

conexões ativas;

consultas em execução;

estado das conexões.

Esse tipo de monitoramento pode ajudar na identificação de problemas e no troubleshooting do ambiente.

Backup

Uma das principais atividades realizadas no laboratório foi a criação de uma cópia de segurança do banco de dados.

O processo funciona aproximadamente assim:

Banco de Dados
      |
      v
pg_dump
      |
      v
Arquivo de Backup

Após gerar o backup, o arquivo foi validado para confirmar que havia sido criado corretamente.

Restauração

Gerar um backup é apenas uma parte do processo.

Também é importante testar se ele pode ser utilizado para recuperar os dados.

Por isso, neste laboratório foi criado outro banco e o backup foi restaurado nele.

O fluxo foi:

Arquivo de Backup
      |
      v
Restauração
      |
      v
Novo Banco de Dados
      |
      v
Validação das Tabelas
      |
      v
Validação dos Registros

Após a restauração, os registros cadastrados originalmente foram consultados novamente.

Os dados estavam disponíveis, confirmando que o backup poderia ser utilizado para recuperação.

Resultado do laboratório

Ao final do projeto foi possível validar todo o processo:

✅ PostgreSQL acessado
✅ Banco de dados criado
✅ Tabela criada
✅ Dados cadastrados
✅ Dados consultados
✅ Conexões monitoradas
✅ Backup criado
✅ Arquivo de backup validado
✅ Banco restaurado
✅ Dados recuperados
✅ Restauração validada

Evidências

Todas as principais etapas do laboratório foram registradas através de capturas de tela.

As evidências demonstram que as atividades foram executadas na prática.

Entre elas estão:

validação da versão do PostgreSQL;

acesso ao servidor;

acesso ao PostgreSQL;

identificação do usuário conectado;

monitoramento das conexões;

criação do banco;

criação da tabela;

inserção dos registros;

consulta das informações;

criação do backup;

restauração;

validação dos registros recuperados.

As imagens estão organizadas no diretório:

docs/evidencias/

Estrutura do projeto

postgresql-dba-lab/
│
├── README.md
├── LICENSE
├── SECURITY.md
├── CHANGELOG.md
│
├── docs/
│   └── evidencias/
│
├── sql/
│   ├── create_database.sql
│   ├── create_table.sql
│   ├── insert_data.sql
│   └── monitoring.sql
│
└── scripts/
    ├── backup.sh
    └── restore.sh

A organização por diretórios facilita a leitura do projeto e permite localizar rapidamente os scripts, comandos SQL e evidências.

Segurança

Por se tratar de um projeto público de portfólio, nenhuma informação sensível de ambientes reais deve ser publicada.

O repositório não utiliza:

senhas reais;

credenciais de produção;

dados reais de clientes;

chaves privadas;

tokens;

informações confidenciais de empresas.

Os nomes e informações utilizados no laboratório são fictícios.

Observação sobre a versão utilizada

O laboratório original foi executado utilizando:

PostgreSQL 9.6.11

Essa é uma versão antiga do PostgreSQL e atualmente não é recomendada para novas implementações em produção.

Ela foi mantida nas evidências porque representa o ambiente em que o laboratório original foi realizado.

Uma evolução futura deste projeto será reproduzir o cenário utilizando uma versão atual e suportada do PostgreSQL.

O que este projeto demonstra

Este projeto foi criado para demonstrar conhecimentos práticos relacionados à administração de banco de dados e infraestrutura.

Entre as competências aplicadas estão:

Administração Linux

PostgreSQL

SQL

Banco de Dados

Monitoramento

Backup

Restauração

Recuperação de dados

Bash

Troubleshooting

Documentação técnica

Git

GitHub

Organização de projetos

Cenário de uso

Um exemplo de aplicação desse conhecimento em uma empresa seria:

Sistema da Empresa
        |
        v
Banco PostgreSQL
        |
        | armazena informações
        v
Dados da Empresa
        |
        | backup
        v
Arquivo de Segurança
        |
        | restauração em caso de necessidade
        v
Recuperação dos Dados

Caso aconteça algum problema com o banco original, o backup pode fazer parte do processo de recuperação das informações.

Motivação

Este projeto foi desenvolvido a partir de atividades práticas realizadas em um ambiente PostgreSQL.

A documentação dessas atividades foi posteriormente organizada e transformada em um projeto de portfólio.

O objetivo foi reunir em um único repositório conceitos relacionados a:

administração;

monitoramento;

backup;

restauração;

validação;

segurança;

documentação.

Objetivo profissional

O objetivo deste repositório é demonstrar experiência prática com atividades comuns nas áreas de infraestrutura e administração de banco de dados.

O projeto procura mostrar não apenas a execução de comandos, mas também a capacidade de:

entender uma atividade técnica;

executar o procedimento;

validar o resultado;

registrar evidências;

organizar a documentação;

pensar na recuperação dos dados.

Próximas melhorias

O projeto poderá evoluir futuramente com:

PostgreSQL em versão atual;

Docker;

Docker Compose;

backup automatizado;

agendamento com Cron;

logs automáticos;

política de retenção;

monitoramento com Prometheus;

dashboards com Grafana;

GitHub Actions;

replicação PostgreSQL;

recuperação Point-in-Time Recovery (PITR).

Autor

Matheus Barcelli

Projeto, documentação e laboratório desenvolvidos como parte de portfólio profissional nas áreas de tecnologia, infraestrutura e banco de dados.

Copyright © 2026 Matheus Barcelli.
