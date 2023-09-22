-- comentarios
-- a linha abaixo cria um banco de dados
create database dbinfox;

-- a linha abaixo usa um banco de dados
use dbinfox;

-- o bloco abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- adiciona um campo na tabela
alter table tbusuarios add column perfil varchar(20) not null;

-- adiciona dados
update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;

-- o comando abaixo descreve a tabela
describe tbusuarios;

-- as linhas baixo insete dados na tabela (CRUD) 
-- CREAT
insert into tbusuarios (iduser, usuario, fone, login, senha, perfil )
values(1, 'Dinah Martins', "11-991745323", 'dinahdoria', '1234','admin' );

insert into tbusuarios (iduser,usuario, fone, login, senha, perfil )
values(2, 'Dinah Martins', "11-991745323", 'dinahmartins', '1234','admin');

insert into tbusuarios (iduser, usuario, fone, login, senha, perfil )
values(3,'Dinah Martins', "11-991745323", 'martinsdinah', '1234','admin');

-- a linha baixo exibe dados na tabela (CRUD) 
-- read -> select
select * from tbusuarios;

-- a linha abaixo modifica dados na tabela (CRUD) 
-- update
update tbusuarios set fone='15-991745323' where iduser=2;

-- a linha abaixo deleta dados na tabela (CRUD) 
-- delete

delete from tbusuarios where iduser=3;

-- 

-- CRIAR TABELAS CLIENTES
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
value('Linux Torvalds', 'Rua avenida', '11991745323','dinahdoria@gmail.com');

select * from tbclientes;



-- CRIAR TABELA OS

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp not null,
equipamento varchar(150) not null,
defeito varchar(150) not null, 
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos ( equipamento, defeito, servico, tecnico,valor, idcli)
value ('Notebook', 'Não liga', 'Troca de fonte', 'Dinah Martins', '87.50',1);
 
 -- adicionar colunas

alter table tbos add tipo varchar(50) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;
 
select * from tbos;

-- JUNÇÃO DE DUAS TABELAS
-- JUNÇÃO DE DUAS TABELAS
-- JUNÇÃO DE DUAS TABELAS

select
O.os, equipamento, defeito, servico, valor,
C.nomecli, fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);


-- BUSCAR USUARIO PARA LOGIN

select * from tbusuarios where login='dinahdoria' and senha =1234;