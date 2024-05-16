use notepad

--PROCEDURES: INSERT
create procedure criarUsuario
(
	@nome	varchar(50),
	@senha	varchar(24),
	@email	varchar(50)
)
as begin
	insert into usuarios
	(
		nome, 
		senha, 
		email
	) 
	values
	(
		@nome, 
		@senha, 
		@email
	)
end
go

create procedure criarAnotacao
(
	@titulo		varchar(20),
	@conteudo	varchar(200),
	@usuario	int
)
as begin
	insert into anotacoes
	(
		titulo, 
		conteudo, 
		idUsuario
	)
	values
	(
		@titulo,
		@conteudo,
		@usuario
	)
end
go

create procedure criarTag
(
	@nome	varchar(10),
	@cor	varchar(7)
)
as begin
	insert into tags
	(
		nome, 
		cor
	)
	values
	(
		@nome,
		@cor
	)
end
go

create procedure criarComentario
(
	@conteudo	varchar(100),
	@idUsuario	int,
	@idAnotacao	int
)
as begin
	insert into comentarios
	(
		conteudo,
		idUsuario,
		idAnotacao
	)
	values
	(
		@conteudo,
		@idUsuario,
		@idAnotacao
	)
end
go

create procedure atribuirTag
(
	@idAnotacao int,
	@idTag int,
	@status bit
)
as begin
	insert into anotacao_tag
	(
		idAnotacao,
		idTag,
		status
	)
	values
	(
		@idAnotacao,
		@idTag,
		@status
	)
end
go

--PROCEDURES: UPDATES PARA DESATIVAÇÃO
create procedure inativaUsuario
(
	@idUsuario	int,
	@status		bit
)
as begin
	update 
		usuarios
	set
		status = @status
	where
		idUsuario = @idUsuario
end
go

create procedure inativaTag
(
	@idTag	int,
	@status		bit
)
as begin
	update 
		tags
	set
		status = @status
	where
		idTag = @idTag
end
go

create procedure inativaAnotacao
(
	@idAnotacao	int,
	@status		bit
)
as begin
	update 
		anotacoes
	set
		status = @status
	where
		idAnotacao = @idAnotacao
end
go

create procedure alteraAtribuicaoTag
(
	@idTag	int,
	@idAnotacao	int,
	@status		bit
)
as begin
	update
		anotacao_tag
	set
		status = @status
	where
		idAnotacao = @idAnotacao and idTag = @idTag
end
go

--PROCEDURES: UPDATES
create procedure atualizaSenha
(
	@idUsuario int,
	@novaSenha varchar(24)
)
as begin
	update 
		usuarios
	set
		senha = @novaSenha
	where
		idUsuario = @idUsuario
end
go

create procedure atualizaNome
(
	@idUsuario int,
	@novoNome varchar(50)
)
as begin
	update 
		usuarios
	set
		nome = @novoNome
	where
		idUsuario = @idUsuario
end
go

create procedure atualizaEmail
(
	@idUsuario int,
	@novoEmail varchar(50)
)
as begin
	update 
		usuarios
	set
		email = @novoEmail
	where
		idUsuario = @idUsuario
end
go

create procedure atualizaTituloAnotacao
(
	@idAnotacao int,
	@novoTitulo varchar(24)
)
as begin
	update 
		anotacoes
	set
		titulo = @novoTitulo
	where
		idUsuario = @idAnotacao
end
go

create procedure atualizaConteudoAnotacao
(
	@idAnotacao		int,
	@novoConteudo	varchar(200)
)
as begin
	update
		anotacoes
	set
		conteudo = @novoConteudo
	where
		idAnotacao = @idAnotacao
end
go

--PROCEDURES: VIEW
create view vwUsuario as
select u.nome Nome, u.email Email, u.dataCriacao 'Criação da conta'
from usuarios u
go

create view vwAnotacao
as
select u.nome 'Criador da Anotacao', a.titulo Titulo, a.conteudo Conteudo, a.dataCriacao 'Criacao da anotacao', a.dataModificacao 'Ultima Modificacao'
from anotacoes a inner join usuarios u on a.idUsuario = u.idUsuario
go

create view vwTags
as
select t.nome NomeTag, t.cor Cor
from tags t
go

create view vwAnotacaoComTag
as
select t.nome 'Nome Tag', t.cor 'Cor Tag', a.titulo Titulo, a.conteudo Conteudo, a.dataCriacao Criacao, a.dataModificacao 'Ultima Modificacao'
from anotacao_tag at inner join anotacoes a on at.idAnotacao = a.idAnotacao
					 inner join tags t on at.idTag = t.idTag
go

create view vwComentario
as
select u.nome 'Dono comentario', c.conteudo ConteudoComentario, a.titulo TituloAnotacao, a.conteudo ConteudoAnotacao
from comentarios c inner join anotacoes a on c.idAnotacao = a.idAnotacao
				   inner join usuarios u on a.idUsuario = u.idUsuario