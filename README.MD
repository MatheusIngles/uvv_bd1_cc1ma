# **PSET**
## Nome e matricula, respectivamente: Matheus Endlich Silveira 202305392 
## Professor: Abrantes Araujo Silva Filho
## Monitor: 

### Sobre o Pset:
PSET (Problem Set) é um conjunto de questões desafiadoras propostas pelo professor Abrantes, com o objetivo de incentivar os alunos a aprenderem o conteúdo e desenvolverem suas habilidades emocionais e práticas. Durante esses exercícios exclusivos, tivemos que seguir uma série de passos e resolver questões difíceis que, em geral, nos levaram a reproduzir um [BD¹](https://github.com/MatheusIngles/uvv_bd1_cc1ma/assets/126157948/afd6a837-1728-425b-82bd-8a2411ef44cf) em um script totalmente funcional no PostgreSQL. Isso só foi possível com um bom entendimento do PostgreSQL, além de termos que diferenciá-lo de outros bancos de dados.

### Programas Utilizados:
- Oracle VM VirtualBox (dbserver2)
- Terminal Linux
- Github Desktop
- SQL Power Architect
- PosgresSQL **Comand Line**
- DBeaver

<details>
    <summary><h3>Pasta Pset1 <h3></summary>

Basicamente, o contém todo que foi solicitado do Professor Abrantes, que é um architect, assim como o mesmo architect, porém em formato de PDF. Em seguida, o script SQL que foi desenvolvido abaixo, conforme as instruções.

```
cc1ma_202305392_postgresql.architect
```
Este é um arquivo que contém o código-fonte do Architect, podendo ser baixado e executado no SQL Power Architect. Isso permite visualizar os comentários, tabelas e editar conforme desejado, juntamente com o esqueleto completa do script que editei.

```
cc1ma_202305392_postgresql.architect.pdf
```

Este é um arquivo no formato PDF que apresenta o Architect do banco de dados "lojas uvv". É facilmente visualizável no formato PDF, mas não é possível editar os comentários, tabelas e a estrutura contida no arquivo original.

```
cc1ma_202305392_postgresql.sql
```
Este é o arquivo SQL que contém o script completo. Ao baixar e executá-lo no PostgreSQL, ele criará o banco de dados "lojas uvv", bem como o usuário, as constantes e os checks, conforme solicitado pelo professor.

</details>

<details>
    <summary><h3>Questões<h3></summary>

Criei esta seção para você, caso não queira baixar o PDF, onde é possível visualizar as perguntas e questões presentes no PSET. 
       <h4>Perguntas</h4>

        ```
        1. O que são sistemas de controles de versões? Por que são importantes?

        2. Qual a diferença entre o Git e o GitHub? Como eles estão relacionados? É possível usar um sem o outro?

        3. O Git é um sistema distribuído de controle de versões. O que significa isso?

        4. Faça um esquema do fluxo de trabalho do Git, explicando em detalhes o que é o diretório de trabalho, a área de staging e o repositório. Como os arquivos se movem entre essas áreas? Como os três estados principais dos arquivos (commited, modified e staged) se relacionam com essas áreas?

        5. Quais erros você consegue encontrar nesse projeto? Erros nas colunas? Erros nas cardinalidades? Erros na identificação dos relacionamentos? Se você encontrar erros no projeto, identifique quais são os erros e explique o que está errado (atenção: não altere o projeto).

        6. Quais tabelas do projeto representam relacionamentos do tipo N:N? Identifique as tabelas e explique porque é um relacionamento N:N; Se não houver relacionamentos N:N, explique se isso seria um erro.

        7. Na tabela "pedidos_itens" a coluna identificada com o nome de "numero_da_linha" não faz parte da PK composta. Isso está certo ou errado? Ocorreria alguma limitação à funcionalidade do banco de dados ao manter essa coluna fora da PK?

        8. Por que a tabela "pedidos_itens" faz relacionamentos identificados com as tabelas pedidos e produtos, e um relacionamento não identificado com a tabela envios?

        9. Qual é o único tipo de relacionamento que pode guardar dados? Por quê? Existe algum relacionamento assim nesse projeto? Se não existir, você sugeriria trocar alguns dos relacionamentos existentes para melhorar o projeto?

        10. Algumas colunas estão utilizando o tipo de dados "BLOB". Que tipo de dado é esse? Quando sua utilização é adequada? O uso desse tipo de dados no projeto é correto? Explique.

        11. Qual a diferença entre banco de dados, usuário e esquema no PostgreSQL?

        12. Por que um esquema é importante?

        13. Se você não definir um esquema específico, onde os objetos do banco de dados (tabelas, relacionamentos, dados, etc.) serão gravados? Isso é bom ou ruim? Por quê?

        14. Agora que você já implementou o projeto no PostgreSQL, tem alguma sugestão de melhoria a fazer para o projeto? Como ele poderia ser melhorado?

        15. Faça uma comparação dos SGBD que você utilizou (Oracle, MariaDB e PostgreSQL). Quais as vantagens e desvantagens de cada um? Quem tem a melhor documentação?
        ```

        
</details>

<details>
  <summary><h3>O que eu achei?</h3></summary>

  Pessoalmente, essa foi uma experiência nova para mim. Foi o primeiro projeto que me fez virar a noite para concluir uma questão que ocupou duas folhas. Apesar de ter sido difícil mexer no PostgreSQL no começo, depois foi basicamente uma busca detalhada na [Documentação do PostgreSQL](https://www.postgresql.org/files/documentation/pdf/15/postgresql-15-A4.pdf), tornando-me um verdadeiro detetive para descobrir que a resposta sempre esteve lá e eu estava cego e incapaz de perceber. Agradeço ao professor Abrantes pelo desafio, mas infelizmente isso acabou me atrasando em outras matérias, então vou encerrar o texto por aqui...

  <h4>NOTA:</h4>
    - <h5> Discursivas: 9,5/10 </h5>
    - <h5> Script: 10/10 </h5>
    - <h5> Organização do Script e Github: 10/10 </h5>

</details>


[Imagem do do Banco de dados: lojas uvv](https://github.com/MatheusIngles/uvv_bd1_cc1ma/assets/126157948/afd6a837-1728-425b-82bd-8a2411ef44cf)

![Imagem do do Banco de dados: lojas uvv](https://github.com/MatheusIngles/uvv_bd1_cc1ma/assets/126157948/afd6a837-1728-425b-82bd-8a2411ef44cf)

[PDF contendo todas as perguntas e instruções do PSET.](https://github.com/MatheusIngles/uvv_bd1_cc1ma/files/11562117/pset1.pdf)

[![Texto alternativo](https://cdn-icons-png.flaticon.com/512/337/337946.png)](https://github.com/MatheusIngles/uvv_bd1_cc1ma/files/11562117/pset1.pdf)



