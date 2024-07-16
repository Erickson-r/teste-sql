###### DB UTILIZADA PARA REALIZAR OS COMANDOS E VERIFICAR SE ESTAVAM CORRETOS SE ENCONTRA NO REPOSITÓRIO

    Apache/2.4.6 (CentOS) PHP/5.4.16
    Versão do cliente de banco de dados: libmysql - 5.5.65-MariaDB
    Extensão do PHP: mysqli Documentação
    Versão do PHP: 5.4.16

# TESTE SQL

###### Dado a seguinte estrutura de banco de dados, considerando:
* Colunas de Nomes como VARCHAR(255)
* Colunas de Ids como INTEGER
* Colunas de datas como DATE

##### TABLE: AUTOR
```
+-------+---------------+
|   ID  |   NOME        |
+-------+---------------+
|   1   | JOAO          |
+-------+---------------+
|   2   | PEDRO         |
+-------+---------------+
|   3   | PAULO         |
+-------+---------------+
```

##### TABLE: LIVRO
```
+-------+---------------+----------+------------+
|   ID  |   NOME        | AUTOR_ID | LANCAMENTO |
+-------+---------------+----------+------------+
|   1   | CÓDIGO LIMPO  |    1     | 2021-01-01 |
+-------+---------------+----------+------------+
|   2   | TDD           |    1     | 2019-10-01 |
+-------+---------------+----------+------------+
|   3   | ADS           |    2     | 2021-12-08 |
+-------+---------------+----------+------------+
|   4   | SQL           |    2     | 2020-10-10 |
+-------+---------------+----------+------------+
```


###### RESPONDA AS PERGUNTAS ABAIXO:

1) Monte o comando SQL responsável pela criação da tabela de LIVRO:


    resposta:
     
        CREATE TABLE LIVRO (
                 ID INTEGER PRIMARY KEY,
                 NOME VARCHAR(255),
                 AUTOR_ID INTEGER,
                 LANCAMENTO DATE,
                 FOREIGN KEY (AUTOR_ID) REFERENCES AUTOR(Ids)
            );


2) Monte o comando SQL para selecionar todos os livros do autor JOAO.
Retorno esperado:
```
+-------+---------------+----------+------------+
|  ID   |   NOME        | AUTOR_ID | LANCAMENTO |
+-------+---------------+----------+------------+
|   1   | CÓDIGO LIMPO  |    1     | 2021-01-01 |
+-------+---------------+----------+------------+
|   2   | TDD           |    1     | 2019-10-01 |
+-------+---------------+----------+------------+
```


    resposta:
        SELECT * FROM `LIVRO` WHERE AUTOR_ID = 1


3) Monte o comando SQL que traga a quantidade de livros por AUTOR, que foram lançados no ano de 2019.
Retorno esperado:
```
+---------------+---------+
|   NOME        | LIVROS  |
+---------------+---------+
| JOAO          |   1     |
+---------------+---------+
| PEDRO         |   0     |
+---------------+---------+
| PAULO         |   0     |
+---------------+---------+
```

    resposta:
    
        SELECT a.Nomes, COUNT(l.ID) AS Livros FROM AUTOR a LEFT JOIN LIVRO l ON a.Ids = l.AUTOR_ID AND YEAR(l.LANCAMENTO) = 2019 GROUP BY a.Nomes ORDER BY `a`.`Nomes` ASC

        
4) Monte o comando SQL que traga todos os autores que não possuem livros.
Retorno esperado:
```
+-------+---------------+
|   ID  |   NOME        |
+-------+---------------+
|   3   | PAULO         |
+-------+---------------+
```


    resposta:

        SELECT `Ids`, a.Nomes FROM AUTOR a LEFT JOIN LIVRO l ON a.Ids = l.AUTOR_ID WHERE l.ID IS NULL;

        
5) Monte o comando SQL que traga todos os livros com os nomes e IDs de seus respectivos autores.
Retorno esperado:
```
+-------+---------------+----------+------------+----------+
|   ID  |   NOME        | AUTOR_ID | LANCAMENTO | AUTOR    |
+-------+---------------+----------+------------+----------+
|   1   | CÓDIGO LIMPO  |    1     | 2021-01-01 | JOAO     |
+-------+---------------+----------+------------+----------+
|   2   | TDD           |    1     | 2019-10-01 | JOAO     |
+-------+---------------+----------+------------+----------+
|   3   | ADS           |    2     | 2021-12-08 | PEDRO    |
+-------+---------------+----------+------------+----------+
|   4   | SQL           |    2     | 2020-10-10 | PEDRO    |
+-------+---------------+----------+------------+----------+
```


    resposta:

        SELECT `ID`, `NOME`, a.Ids, `LANCAMENTO`, a.Nomes FROM LIVRO l INNER JOIN AUTOR a ON l.AUTOR_ID = a.Ids

