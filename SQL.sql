CREATE DATABASE WEB2;

USE WEB2;

create table tb_usuario (
id_usuario serial primary key,
login_usuario varchar(50),
senha_usuario varchar(50),
nome_usuario varchar(100)
);

insert into tb_usuario (login_usuario, senha_usuario, nome_usuario) values ('tiago', 'senha', 'Tiago');
insert into tb_usuario (login_usuario, senha_usuario, nome_usuario) values ('itay', 'senha', 'Itay');
insert into tb_usuario (login_usuario, senha_usuario, nome_usuario) values ('admin', 'admin', 'Administrador');

create table tb_cliente (
id_cliente serial primary key,
cpf_cliente varchar(100),
nome_cliente varchar(100),
email_cliente varchar(100),
data_cliente date,
rua_cliente varchar(100),
nr_cliente integer,
cep_cliente char(8),
cidade_cliente varchar(100),
uf_cliente char(2)
);

insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Kaique Augusto Moraes', '48086916804', 'kaiqueam@gmail.com', '1996-12-01', '72225055', 'Quadra QNN 5 Conjunto E', 745, 'Brasília', 'DF');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Débora Antonella Larissa da Silva', '41398900028', 'deb-ant@gmail.com', '1982-12-02', '75135820', 'Rua Rafael Braga Tibúrcio', 183, 'Anápolis', 'GO');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Bento Vitor da Costa', '52104983878', 'bento_vitorc@hotmail.com', '23/11/1991', '72861015', 'Quadra Quadra 2', 977, 'Novo Gama', 'GO');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Nathan Samuel Alexandre Castro', '41828887153', 'nathansamuelac@gmail.com', '22/11/1993', '69915276', 'Rua Mário Maia', 905, 'Rio Branco', 'AC');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Roberto Sérgio Jorge dos Santos', '27883846299', 'roberto_sjs@outlook.com.br', '27/01/1985', '81925410', 'Rua Jussara', 22, 'Curitiba', 'PR');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Pietra Renata Emanuelly da Conceição', '29127186946', 'p-renata-ec@gmail.com', '16/04/1992', '81490470', 'Rua Adolpho Bertoldi', 575, 'Curitiba', 'PR');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Augusto Thomas Moraes', '54570451969', 'augusto_tm@gmail.com', '01/02/1985', '81480149', 'Rua João Job de Souza', 202, 'Curitiba', 'PR');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Aline Alana da Silva', '30957449941', 'alinealanas@gmail.com', '06/04/1992', '81720192', 'Rua Mônica Grochowski', 299, 'Curitiba', 'PR');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Nicole Maria Laís Ramos', '76404694905', 'nicole_mlr@gmail.com', '20/07/1992', '82015290', 'Rua Luiz Braille', 773, 'Curitiba', 'PR');
insert into tb_cliente (nome_cliente, cpf_cliente, email_cliente, data_cliente, cep_cliente, rua_cliente, nr_cliente, cidade_cliente, uf_cliente) values (
'Tereza Sandra Fernandes', '99824119930', 'tereza_sandraf@gmail.com', '06/03/1984', '82220560', 'Rua João Baptista Mayer', 437, 'Curitiba', 'PR');