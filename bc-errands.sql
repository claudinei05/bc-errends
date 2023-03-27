create extension if not exists "uuid-ossp";
--CRIAR TABELA DE USUARIO
create table if not exists errands.users(
id uuid primary key default uuid_generate_v4(),
nome char(50) not null,
usuario varchar not null,
senha varchar(10) not null,
dthr_criacao timestamp not null default now(),
dthr_atualizacao timestamp not null default now()
);

--ADICIONAR USUARIO
insert into errands.users 
(nome,usuario,senha)
values
('claudinei','claudinei05','123456'),
('ana','ana05','1234567'),
('paulo','paulo05','12345678');

--CRIA TABELA DE RECADOS
create table if not exists errands.message(
id_message uuid primary key default uuid_generate_v4(),
description char(50) not null,
detailing char(50) not null,
dthr_criacao timestamp not null default now(), 
dthr_atualizacao timestamp not null default now(),
id_user uuid not null references errands.users(id) 

);

 --ADICIONAR RECADOS A UM USUARIO  
insert into errands.message 
(id_user,description,detailing)
values
('a63738b1-9d2d-4cb1-a0e7-ad02016d31ff','TRABALHO','MATEMATICA'),
('d8b6eff8-6f7a-42e4-a992-4e513385caed','TRABALHO','HISTORIA'),
('0d06de5f-634f-415e-bcd7-04885a8ed66c','TRABALHO','PORTUGUES'),
('a63738b1-9d2d-4cb1-a0e7-ad02016d31ff','TRABALHO','GEOGRAFIA')
;

--SELECT DE TODOS OS USUARIOS
select * from errands.users;

--SELECT DE TODOS OS RECADOS
select * from errands.message;

--FAZER PESQUISA PELO USUARIO E SENHA
select u.usuario ,u.senha  from errands.users u 
where usuario ='claudinei05' and senha='123456';


--DELETA TODA A TABELA DE USUARIO
drop table if exists errands.users cascade;

--DELETA TODA A TABELA DE RECADOS
drop table if exists errands.message;

--SELECT DOS RECADOS DE UM USUARIOS 
select *from errands.message   
where id_user ='a63738b1-9d2d-4cb1-a0e7-ad02016d31ff';

--ATUALIZAR USUARIO
update errands.users 
set usuario ='ana123',dthr_atualizacao =current_timestamp 
where id = 'a63738b1-9d2d-4cb1-a0e7-ad02016d31ff';

--ATUALIZAR RECADOS
update errands.message  
set description ='AVALIAÇÃO',dthr_atualizacao =current_timestamp 
where id_message = '2b6a1ef1-5cde-4f94-a0a1-910e32337a28';

--DELETA UM RECADO ATRAVES DO ID
delete from errands.message 
where id_message ='2b6a1ef1-5cde-4f94-a0a1-910e32337a28';



