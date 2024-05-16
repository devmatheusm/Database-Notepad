# Sistema de Bloco de Notas

Este é um projeto de banco de dados para um Sistema de Bloco de Notas, desenvolvido como parte de um portfólio pessoal. O sistema permite aos usuários criar anotações, receber comentários sobre essas anotações e associar tags a cada anotação.

## Estrutura do Banco de Dados

O banco de dados é composto por quatro entidades principais:

- **Usuário:** Armazena informações sobre os usuários do sistema.
- **Anotação:** Contém as anotações criadas pelos usuários.
- **Comentário:** Permite que os usuários deixem comentários sobre as anotações.
- **Tag:** Utilizado para associar tags às anotações.

## Relacionamentos

O sistema possui os seguintes relacionamentos entre as entidades:

- **Usuário -> Anotação:** Relacionamento um para muitos, onde um usuário pode criar várias anotações.
- **Usuário -> Comentário:** Relacionamento um para muitos, onde um usuário pode deixar vários comentários.
- **Anotação -> Comentário:** Relacionamento um para muitos, onde uma anotação pode ter vários comentários.
- **Anotação -> Tag:** Relacionamento muitos para muitos, onde uma anotação pode ter várias tags e uma tag pode estar associada a várias anotações.

## Configuração do Banco de Dados

Este projeto utiliza o SQL Server como sistema de gerenciamento de banco de dados. Você pode criar as tabelas e inserir dados de exemplo utilizando os scripts fornecidos na pasta `scripts`.

## Requisitos

- SQL Server
- SQL Server Management Studio (opcional)

## Como Contribuir

Sinta-se à vontade para contribuir para este projeto abrindo problemas ou enviando solicitações de pull. Todas as contribuições são bem-vindas!

## Autor

Este projeto foi desenvolvido por Matehus M. e está disponível sob a MIT(LICENSE).