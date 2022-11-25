-- Criação do banco de dados para o cenário de Ordem de serviço em uma oficina mecânica-- drop database oficina_mecanica;
create database oficina_mecanica;
use oficina_mecanica;

-- Tabela cliente
create table cliente(
		idCliente int auto_increment primary key,
        idCliente_carro int,
        idCliente_ordem_serv int,
        nome varchar(15),
        sobrenome varchar(50),
        CPF char (11) not null,
        endereco varchar(250),
        constraint unico_cpf_cliente unique (CPF),
        constraint fk_cliente_carro foreign key (idCliente_carro) references carro (idCarro),
        constraint fk_cliente_ordem_serv foreign key (idCliente_ordem_serv) references ordem_servico (idOrdem_servico)
);

desc cliente;

-- Tabela carro
create table carro(
		idCarro int auto_increment primary key,
        placa char(7) not null,
        marca varchar(15),
        constraint placa_carro unique (placa)
);

-- Tabela mecanico
create table mecanico(
		idMecanico int auto_increment primary key,
        codigo char(8) not null,
        nome varchar(60),
        endereco varchar (255),
        especialidade varchar (60),
		constraint n_codigo unique (codigo)
);

-- Tabela peças e serviços
create table pecas_e_servicos(
		idPecas_e_servicos int auto_increment primary key,
        nome_peca varchar(45) default 'Nenhum',
        valor_peca float (2),
        quantidade_peca int default 0,
		nome_servico varchar(45) default 'Nenhum',
        valor_servico float (2),
		quantidade_servico int
);

-- Tabela orçamento
create table orcamento(
		idOrcamento_avaliacao_equipe int,
        idOrcamento_pecas_produtos int,
        constraint fk_orcamento_avaliacao_equip foreign key (idOrcamento_avaliacao_equipe) references avaliacao_equipe (idEquipe),
        constraint fk_orcamento_pecas_servicos foreign key (idOrcamento_pecas_produtos) references pecas_e_servicos (idPecas_e_servicos)
);

-- Tabela avaliação da equipe

create table avaliacao_equipe(
		idEquipe int auto_increment primary key,
        idAvaliacao_equip_carro int,
        idAvaliacao_equip_mecanico int,
        n_equipe varchar(15) not null,
		constraint fk_avaliacao_equip_carro foreign key (idAvaliacao_equip_carro) references carro (idCarro),
        constraint fk_avaliacao_equip_mecanico foreign key (idAvaliacao_equip_mecanico) references mecanico (idMecanico)
);

-- Tabela Ordem de serviço

create table ordem_servico(
		idOrdem_servico int auto_increment primary key,
        idOrdem_servico_aval_equip int,
        numero varchar (15) not null,
        data_emissao datetime not null,
        status_servico varchar (30) default 'Em processamento',
        data_conclusao datetime,
        constraint fk_Ordem_servico_aval_equip foreign key (idOrdem_servico_aval_equip) references avaliacao_equipe (idEquipe)
);



show tables;
