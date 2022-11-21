-- Criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table Clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit varchar(3),
        Lname varchar(20),
        CPF char (11) not null,
        Address varchar(250),
        constraint unique_cpf_cliente unique (CPF)
);

alter table Clients auto_increment=1;
alter table Clients modify Address varchar(250);
desc Clients;


-- criar tabela produto
-- size = dimensão do produto
create table Product(
		idProduct int auto_increment primary key,
        Pname varchar(10),
        classification_kids bool default false,
        category enum ('Eletrônico', 'Vestuário', 'Brinquedos', 'Mesa e banho'),
        avaliation float default 0,
        size varchar(10)
	);	
 alter table Product auto_increment=1;   
 alter table Product modify Pname varchar(30);
 
-- criar tabela pedido
create table orders(
		idOrders int auto_increment primary key,
        idOrdersClients int,
        ordersStatus enum('Cancelado', 'Confirmado','Em processamento') default 'Em processamento',
        OrdersDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        -- como fazer os links dos cartões??? criar constrains 
        constraint fk_orders_client foreign key (idOrdersClients) references Clients (idClient)
);

alter table orders auto_increment=1;

-- Criar tabela de Estoque
create table productStorage(
		idproductStorage int auto_increment primary key,
        storageLocation varchar(255),
        quantity int default 0
);        
        
        
alter table productStorage auto_increment=1;
        
-- Criar tabela de Fornecedor
create table supplier(
		idsupplier int auto_increment primary key,
        socialName varchar(255) not null,
        CNPJ char(15) not null,
        contact varchar(11) not null,
        constraint unique_supplier unique(CNPJ)
);


alter table supplier auto_increment=1;

-- Criar tabela de Vendedor
create table seller(
		idseller int auto_increment primary key,
        socialName varchar(255) not null,
        abstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        location varchar(255),
        contact varchar(11) not null,
        constraint unique_cnpj_supplier unique(CNPJ),
        constraint unique_cpf_supplier unique(CPF)
);
alter table seller auto_increment=1;

-- Criar tabela de relacionamento n pra m produto vendedor
create table productSeller(
		idPseller int,
        idPproduct int,
        prodQuantity int default 1,
        primary key (idPseller, idPproduct),
        constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
        constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

-- Criar tabela de relacionamento n pra m produto e pedido
--  drop table productOrder;
create table productOrder(
		idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_product foreign key (idPOproduct) references Product(idProduct),
        constraint fk_productorder_order foreign key (idPOorder) references orders(idOrders)
);

-- Criar tabela de relacionamento n pra m estoque e produto
create table storageLocation(
		idLproduct int,
        idLstorage int,
        location varchar(255) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idLproduct) references Product(idProduct),
        constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idproductStorage)
);

create table productSupplier (
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier), 
constraint fk_product_supplier_product foreign key (idPsProduct) references product (idProduct)
);


