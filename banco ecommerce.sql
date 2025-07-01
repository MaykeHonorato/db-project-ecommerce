-- crianção do banco de dados para o cenario de E-commerce
Create database ecommerce;

use ecommerce;

--  criar tabela cliente 
drop table cliente;

create table client(
idclient int auto_increment primary key,
fname varchar(10),
Minit char(3),
Lname varchar (20),
cpf char (11) not null,
Address varchar (30),
constraint unique_cpf_Client unique (cpf)
);
 alter table client auto_increment=1;
desc orders;

--  criar tabela produto
--  size = dimensão do produto

create table product(
idproduct int auto_increment primary key,
Pname varchar(10)not null,
classification_kids bool default  false,
category enum ('Eletronico','Vestimenta') not null,
avaliação float default 0,
size varchar (10)
);

--  criar tabela pedido
create table orders(
idOrder int auto_increment primary key,
idOrderclient int,
ordersstatus enum('Cancelado','Confirmado','Em processamento') default'Em processamento',
orderdescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
constraint fk_orders_client foreign key(idOrderclient) references client(idclient)
);

create table payments(
idclient int,
idpayment int,
typepayment enum('cartão', 'dois cartóes'),
limitavailable float,
primary key(idclient, idpayment)

);

-- criando table estoque

create table productStorage(
idProdStorage int auto_increment primary key,
storageLocation varchar(255),
quantity int default 0 
);

-- criando tabela de Fornecedor
drop table suplier;
create table supplier(
idSupplier int auto_increment primary key,
SocailName varchar(255) not null,
CNPJ char(15)  not null,
contact char(11) not null,
constraint unique_supplier unique(CNPJ)
);

-- Criando tabela vendedor
create table seller (
idSeller int auto_increment primary key,
SocialName varchar(255) not null,
AbstName varchar(255),
CPNJ char(15),
CPF char(9),
location varchar(255),
contact char(11) not null,
constraint unique_cnpj_seller unique(CPNJ),
constraint unique_cpf_seller unique(CPF)
);

create table productSeller(
idPseller int,
idpProduct int,
prodQuantity int default 1,
primary key(idPseller, idPproduct),
constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
constraint fk_product_Product foreign key(idPproduct) references product(idProduct)
);

create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponivel','Sem estoque') default 'Disponivel' ,
primary key(idPOproduct, idPOorder),
constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);


create table storageLocation(
idLproduct int,
idLstorage int ,
location varchar (255) not null,
primary key(idLproduct, idLstorage),
constraint fk_storage_location_product foreign key(idLproduct) references product(idProduct),
constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)
);

show tables ;
drop table storageLocation;
describe storagelocation;


create table productSupplier(
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);

describe suplier;

show databases;