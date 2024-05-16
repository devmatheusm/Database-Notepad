--PARA CRIAR O BANCO DE DADOS 'notepad'
create database notepad
go
--PARA ENTRAR NO BANCO DE DADOS 'notepad'
use notepad
go
--TABELAS DO BANCO DE DADOS--
--OBS: status 1 = ativo; 0 = inativo
create table usuarios
(
	idUsuario	int			not null	identity,
	nome		varchar(50)	not null,
	senha		varchar(24)	not null,
	email		varchar(50)	not null,
	dataCriacao	datetime	not null	default(getdate()),
	status		bit			not null	default(1),
	admin		bit			not null,
	primary key(idUsuario)
)
go

create table anotacoes
(
	idAnotacao		int				not null	identity,
	titulo			varchar(20)		not null,
	conteudo		varchar(200)	not null,
	dataCriacao		datetime		not null	default(getdate()),
	dataModificacao	datetime		not null	default(getdate()),
	status			bit				not null,
	idUsuario		int				not null,
	primary key(idAnotacao),
	foreign key(idUsuario) references usuarios(idUsuario)
)
go

create table tags
(
	idTag	int			not null	identity,
	nome	varchar(10)	not null,
	cor		varchar(7)	null		default('#ffffff'),
	status	bit			not null,
	primary key(idTag)
)
go

create table anotacao_tag
(
	idAnotacao	int	not null,
	idTag		int	not null,
	status		bit	not null,
	foreign key(idAnotacao) references anotacoes(idAnotacao),
	foreign key(idTag)		references tags(idTag)
)
go

create table comentarios
(
	idComentario	int				not null	identity,
	conteudo		varchar(100)	not null,
	dataCriacao		datetime		not null	default(getdate()),
	idUsuario		int				not null,
	idAnotacao		int				not null,
	primary key(idComentario),
	foreign key(idUsuario)	references usuarios(idUsuario),
	foreign key(idAnotacao)	references anotacoes(idAnotacao),
)
go