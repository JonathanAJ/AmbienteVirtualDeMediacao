Ambiente Virtual de Mediação e Conciliação
===================

Bem vindo ao Projeto **AVMC**. Uma rede social para mediadores de todo o país, que podem compartilhar seus casos uns com os outros e gerar gráficos de geomapeamentos de suas cidades.

----------
Instalação
-------------

Para utilizar o projeto em seu ambiente de desenvolvimento você irá precisar dos seguintes itens:

- Eclipse IDE for Java EE
    - Porque é o melhor IDE <3
<br>

- RESTful Plugin for Eclipse
    - Plugin utilizado para criar o serviço rest
<br>

- Postgresql 9.4
    - Banco de dados relacional livre
<br>

> **Nota:**

> - O projeto pode ser importado facilmente para Netbeans siga o tutorial [aqui](https://netbeans.org/kb/74/java/import-eclipse.html).

#### <i class="icon-hdd"></i> Banco de dados

Você pode pegar o banco de dados inicial apenas fazendo o ***restore*** no arquivo SQL da pasta [sql/](sql/) no postgres. Não se preocupe as outras tabelas são geradas pelo Hibernate <3.


 - ***Nome do banco: SEU_BANCO***
 - ***Usuário: SEU_USUARIO***
 - ***Senha: SUA_SENHA***

*Obs¹: Essas configurações podem ser modificadas em:*

	/src/hibernate.cfg.xml
	
#### Dê fork e bons estudos!
