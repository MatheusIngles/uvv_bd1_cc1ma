-- SQL Script realizado para a criação do banco de dados "Lojas UVV", cumprindo o que foi solicitado pelo professor Abrantes em seu primeiro PSET. --
-- Nome do aluno: Matheus Endlich Silveira --
-- Matrícula: 202305392                    --
-- Posto isso, aqui vai começar o script:  --

-- Deletando o Banco de dados uvv se ele existir --

DROP DATABASE IF EXISTS uvv;

-- Feito para deletar o meu usuario caso ele ja exista --

DROP USER IF EXISTS matheus;

-- Criando o usuário com o meu nome, conforme solicitado pelo professor no exercício 3.4.2 do PSET. --

CREATE USER matheus
	    encrypted PASSWORD 'cade@osilksong'        
	    CREATEDB          
	    CREATEROLE        
	    LOGIN
;

-- Após criar o usuário, irei criar o banco de dados "Lojas UVV" conforme solicitado pelo professor no exercício 3.4.3 do PSET. --

CREATE DATABASE uvv 
       OWNER = matheus
       template = template0
       encoding = UTF8
       lc_collate = 'pt_BR.UTF-8'
       lc_ctype = 'pt_BR.UTF-8'
       ALLOW_CONNECTIONS = true
;

-- Conectando ao meu usuario -- 	

SET role matheus;

-- Conectando no banco de dados "uvv" --

\c "host=localhost dbname=uvv user=matheus password=cade@osilksong"

-- Criando o esquema (SCHEMA), conforme solicitado pelo professor na parte 3.4.4 do PSET. --

CREATE SCHEMA lojas
AUTHORIZATION matheus
;

-- Alterando o SEARCH_PATH padrão do Postgres para incluir o esquema "lojas" na frente em prioridade de "user" e "public", conforme solicitado pelo professor na parte 3.4.5 do PSET. --

ALTER USER matheus
SET SEARCH_PATH TO lojas, "$user", public;

-- Criando a tabela "clientes" --

CREATE TABLE clientes (
                client_id NUMERIC(38) 	NOT NULL,
                email     VARCHAR(255) 	NOT NULL,
                nome      VARCHAR(255) 	NOT NULL,
                telefone1 VARCHAR(20)		,
                telefone2 VARCHAR(20)		,	
                telefone3 VARCHAR(20)		,
                CONSTRAINT clientes_pk PRIMARY KEY (client_id)
);

-- Comentando nos atributos e na tabela "clientes" --

COMMENT ON TABLE clientes 
IS 'Tabela que representa os clientes e suas informações.';
COMMENT ON COLUMN clientes.client_id
IS 'Chave principal da tabela cliente que representa o id dos clientes.';
COMMENT ON COLUMN clientes.email     
IS 'Representa o email dos clientes.';
COMMENT ON COLUMN clientes.nome
IS 'Representa o nome do cliente.';
COMMENT ON COLUMN clientes.telefone1 
IS 'Representa o 1º telefone dos clientes.';
COMMENT ON COLUMN clientes.telefone2 
IS 'Representa o 2º Telefone dos clientes.';
COMMENT ON COLUMN clientes.telefone3 
IS 'Representa o 3º telefone do cliente.';

-- Criando a tabela produtos --

CREATE TABLE produtos (
                produto_id       NUMERIC(38)	NOT NULL,
                nome 		 VARCHAR(255) 	NOT NULL,
                preco_unitario 	 NUMERIC(10,2)		,
                detalhes         BYTEA			,
                imagem 		 BYTEA			,
                imagem_mime_type VARCHAR(512)		,
                imagem_arquivo 	 VARCHAR(512)		,
                imagem_charset 	 VARCHAR(512)		,
                imagem_ultima_atualizacao DATE,
                CONSTRAINT produto_pk PRIMARY KEY (produto_id)
);

-- Comentando nos atributos e na tabela "produtos" --

COMMENT ON TABLE produtos 	           	     
IS 'Tabela que representa os produtos que serão vedidos nas lojas.';
COMMENT ON COLUMN produtos.produto_id               
IS 'Chave Primaria da tabela produtos que representa os ids dos produtos.';
COMMENT ON COLUMN produtos.nome                     
IS 'É o atributo da tabela que representa o nome dos produtos.';
COMMENT ON COLUMN produtos.preco_unitario            
IS 'Atributo que representa o preço dos produtos.';
COMMENT ON COLUMN produtos.detalhes 	             
IS 'Atributo que representa os detalhes de cada produto na tabela produtos.';
COMMENT ON COLUMN produtos.imagem                    
IS 'Atributo constituinte de imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_mime_type          
IS 'Atributo que representa o tipo de arquivo que sera usado como imagem do produto na tabela.';
COMMENT ON COLUMN produtos.imagem_arquivo            
IS 'É o atributo que representa o caminho até a imagem dos produto.';
COMMENT ON COLUMN produtos.imagem_charset            
IS 'É o atributo constituinte dos conjuntos de caracteres que representam a imagem do produto.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao 
IS 'Representa a data da ultima atualização na imagem do produto.';


-- Criando uma checagem que não permite que o preço dos produtos seja negativo, assim evitando possiveis erros na incersao de valores --

ALTER TABLE produtos 
ADD CONSTRAINT preco_check 
CHECK (preco_unitario > 0)
;

-- Criando a tabela "lojas" --

CREATE TABLE lojas (
                loja_id 		NUMERIC(38) 	NOT NULL,
                nome 			VARCHAR(255) 	NOT NULL,
                endereco_web 		VARCHAR(100)		,
                endereco_fisico 	VARCHAR(512)		,
                latitude 		NUMERIC			,
                longitude 		NUMERIC			,
                logo 			BYTEA			,
                logo_mine_type 		VARCHAR(512)		,
                logo_arquivo 		VARCHAR(512)		,
                logo_charset 		VARCHAR(512)		,
                logo_ultima_atualizacao DATE	,
                CONSTRAINT loja_pk PRIMARY KEY (loja_id)
);

-- Comentando nos atributos na tabela lojas --
 
COMMENT ON TABLE lojas 				
IS 'Tabela que representa as lojas na uvv';
COMMENT ON COLUMN lojas.loja_id 		
IS 'Chave primaria da tabela loja, representando o id das lojas.';
COMMENT ON COLUMN lojas.nome 			
IS 'É o atributo que representa o nome das lojas presentes na tabela.';
COMMENT ON COLUMN lojas.endereco_web 		
IS 'É o atributo da tabela loja que representa o endereço web de uma loja.';
COMMENT ON COLUMN lojas.endereco_fisico 	
IS 'O atributo presente na tabela que representa o endereço fisico da loja.';
COMMENT ON COLUMN lojas.latitude 		
IS 'É o atributo na tabela que representa a latitude da loja.';
COMMENT ON COLUMN lojas.longitude 		
IS 'Atributo da tabela logica que representa a longitude da loja.';
COMMENT ON COLUMN lojas.logo 			
IS 'Atributo que representa a imagem do ''logo da loja.';
COMMENT ON COLUMN lojas.logo_mine_type 		
IS 'Atributo que representa o tipo de arquivo que sera usado no logo da loja presente na tabela.';
COMMENT ON COLUMN lojas.logo_arquivo 		
IS 'É o atributo que representa o caminho até o logo da loja.';
COMMENT ON COLUMN lojas.logo_charset 		
IS 'É o atributo que representa a conjunto de caracteres usado para representar o logo da loja.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao 
IS 'Atributo que representa a ultima atualização no logo da loja.';

-- Criando a verificação para o endereço, exigindo que a loja tenha pelo menos um endereço associado a ela. --

ALTER TABLE lojas 
ADD CONSTRAINT endereco_check 
CHECK ((endereco_web IS NULL OR endereco_fisico IS NOT NULL) OR
       (endereco_web IS NOT NULL OR endereco_fisico IS NULL)
)
;

-- Criando a tabela "envios" --

CREATE TABLE envios (
                envio_id 		NUMERIC(38)  NOT NULL,
                loja_id 		NUMERIC(38)  NOT NULL,
                client_id 		NUMERIC(38)  NOT NULL,
                endereco_entrega 	VARCHAR(512) NOT NULL,
                status 			VARCHAR(15)  NOT NULL,
                CONSTRAINT envios_pk PRIMARY KEY (envio_id)
);

-- Comentando a nos atributos e na tabela que eu acabei de criar --  

COMMENT ON TABLE envios 			
IS 'É a tabela que representa os produtos enviados.';
COMMENT ON COLUMN envios.envio_id 		
IS 'A chave primaria da tabela envios que representa o id dos envios.';
COMMENT ON COLUMN envios.loja_id 		
IS 'Chave primaria da tabela loja, representando o id das lojas.';
COMMENT ON COLUMN envios.client_id 		
IS 'Chave principal da tabela cliente que representa o id dos clientes.';
COMMENT ON COLUMN envios.endereco_entrega 	
IS 'Atributo que representa o endereço que o produto deve ser entregue.';
COMMENT ON COLUMN envios.status 		
IS 'Representa o status do produto ate o endereço do cliente.';

-- Criando a constante de verificação que permite que o atributo "status" da tabela "envios" receba apenas os seguintes valores: CRIADO, ENVIADO, TRANSITO e ENTREGUE. --

ALTER TABLE envios 
ADD CONSTRAINT status_envios_check 
CHECK  (status = 'CRIADO'    OR 
	status = 'ENVIADO'   OR
	status = 'TRANSITO'  OR
	status = 'ENTREGUE'
)
;

-- Criando a tabela "pedidos" --

CREATE TABLE pedidos (
                pedido_id 	NUMERIC(38) NOT NULL,
                data_hora 	TIMESTAMP   NOT NULL,
                client_id 	NUMERIC(38) NOT NULL,
                status 		VARCHAR(15) NOT NULL,
                loja_id 	NUMERIC(38) NOT NULL,
                CONSTRAINT pedidos_pk PRIMARY KEY (pedido_id)
);

-- Comentando nos atributos e na tabela "pedidos" --

COMMENT ON TABLE pedidos 		
IS 'Tabela que representa os pedidos';
COMMENT ON COLUMN pedidos.pedido_id 	
IS 'É a chave principal da tabela produto que representa o id dos pedidos.';
COMMENT ON COLUMN pedidos.data_hora 	
IS 'Hora que o pedido foi solicitado.';
COMMENT ON COLUMN pedidos.client_id 	
IS 'Chave principal da tabela cliente que representa o id dos clientes.';
COMMENT ON COLUMN pedidos.status 	
IS 'Representa o status do pedido em questão.';
COMMENT ON COLUMN pedidos.loja_id 	
IS 'Chave primaria da tabela loja, representando o id das lojas.';

-- Criando a constante de verificação que permite que o atributo "status" aceite e receba apenas os seguintes valores: CANCELADO, COMPLETO, ABERTO, PAGO, REEMBOLSADO e ENVIADO. --

ALTER TABLE pedidos 
ADD CONSTRAINT status_check 
CHECK  (status = 'CANCELADO'    OR 
	status = 'COMPLETO'     OR
	status = 'ABERTO'       OR
	status = 'PAGO'	        OR
	status = 'REEMBOLSADO'	OR
	status = 'ENVIADO'
)
;

-- Criando a tabela "pedido_itens". --

CREATE TABLE pedido_itens (
                produto_id 	NUMERIC(38) 	NOT NULL,
                pedido_id 	NUMERIC(38) 	NOT NULL,
                numero_da_linha NUMERIC(38) 	NOT NULL,
                preco_unitario 	NUMERIC(10,2) 	NOT NULL,
                quantidade 	NUMERIC(38) 	NOT NULL,
                envio_id 	NUMERIC(38)		,
                CONSTRAINT pedido_itens_pk PRIMARY KEY (produto_id, pedido_id)
);

-- Comentando sobre os atributos e a tabela "pedido_itens" --

COMMENT ON TABLE pedido_itens 			
IS 'Tabela representando os produtos que foram solicitados por um cliente.';
COMMENT ON COLUMN pedido_itens.produto_id 	
IS 'Chave Primaria da tabela produtos que representa os ids dos produtos.';
COMMENT ON COLUMN pedido_itens.pedido_id 	
IS 'É a chave principal da tabela produto que representa o id dos pedidos.';
COMMENT ON COLUMN pedido_itens.numero_da_linha 	
IS 'Atributo que representa o numero de ordem ou posição de do produto na fila de entrega.';
COMMENT ON COLUMN pedido_itens.preco_unitario 	
IS 'Representa o preço dos produtos que foram escolhidos no carrinho';
COMMENT ON COLUMN pedido_itens.quantidade 	
IS 'Atributo que representa a quantidade de produtos selecionada pelo cliente.';
COMMENT ON COLUMN pedido_itens.envio_id 	
IS 'A chave primaria da tabela envios que representa o id dos envios.';

-- Criando uma verificação que garante que o "preco_unitario" não seja menor que zero. --

ALTER TABLE pedidos 
ADD CONSTRAINT preco_itens_check 
CHECK (preco_unitario > 0)
;

-- Criando a tabela "estoque". --

CREATE TABLE estoques (
                estoque_id 	NUMERIC(38) NOT NULL,
                loja_id 	NUMERIC(38) NOT NULL,
                produto_id 	NUMERIC(38) NOT NULL,
                quantidade 	NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_pk PRIMARY KEY (estoque_id)
);

-- Comentando sobre os atributos e a tabela "estoque". --

COMMENT ON TABLE estoques 		
IS 'Tabela que representa o estoque e recebe como fk: loja_id e produto_id';
COMMENT ON COLUMN estoques.estoque_id 	
IS 'É Chave Principal da tabela e representa o id';
COMMENT ON COLUMN estoques.loja_id 	
IS 'Chave primaria da tabela loja, representando o id das lojas.';
COMMENT ON COLUMN estoques.produto_id 	
IS 'Chave Primaria da tabela produtos que representa os ids dos produtos.';
COMMENT ON COLUMN estoques.quantidade 	
IS 'Representa a quantidade de determinado produto no estoque.';

-- Criando a constante de verificação que impede que a quantidade de itens seja menor que zero. --

ALTER TABLE estoque  
ADD CONSTRAINT quantidade_check 
CHECK (quantidade >= 0)
;

-- Alterando os as tabelas para o criador seja meu usuario --

ALTER TABLE clientes 	 OWNER TO matheus;
ALTER TABLE produtos 	 OWNER TO matheus;
ALTER TABLE lojas    	 OWNER TO matheus;
ALTER TABLE envios    	 OWNER TO matheus;
ALTER TABLE pedidos  	 OWNER TO matheus;
ALTER TABLE pedido_itens OWNER TO matheus;
ALTER TABLE estoque      OWNER TO matheus;

-- Alterando o atributo "client_id" da tabela "pedidos" para que seja uma chave estrangeira (FK) da chave primária (PK) "client_id" da tabela "clientes". --
 
ALTER TABLE pedidos 
ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (client_id)produtos
REFERENCES clientes (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Alterando tambem o atributo "client_id" da tabela "envios" para que seja uma foreign key (FK) da chave primária (PK) "client_id" da tabela "clientes". --

ALTER TABLE envios 
ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (client_id)
REFERENCES clientes (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Mudando o atributo "produto_id" da tabela "estoques" para que ele seja uma foreign key(FK) da chave primária(PK) "produto_id" da tabela "produtos". --                          

ALTER TABLE estoques 
ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Mudando tambem o atributo "loja_id" da tabela "estoques" para que ele seja uma foreign key(FK) da chave primária(PK) "loja_id" da tabela "lojas". --                           

ALTER TABLE estoques 
ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Alterando o atributo "produto_id" da tabela "pedido_itens", tornando ela uma foreign key(FK) da chave primária(PK) "produto_id" da tabela "produtos". --  

ALTER TABLE pedido_itens 
ADD CONSTRAINT produtos_pedido_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Alterando também o atributo "pedido_id" da tabela "pedido_itens", tornando-o uma foreign key (FK) da chave primária (PK) "pedido_id" da tabela "pedidos". --

ALTER TABLE pedido_itens 
ADD CONSTRAINT pedidos_pedido_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Mexendo o atributo "loja_id" da tabela "pedidos", fazendo ela virar uma foreign key (FK) da chave primária (PK) "loja_id" da tabela "lojas". --

ALTER TABLE pedidos 
ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Mudando o "loja_id" da tabela "envios", para que ela vire uma foreign key (FK) da chave primária (PK) "loja_id" da tabela "lojas". --

ALTER TABLE envios 
ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Alterando o atributo "envio_id" da tabela "pedido_itens", para que ela se transforme na foreign key (FK) da chave primária (PK) "envio_id" da tabela "envios". --

ALTER TABLE pedido_itens 
ADD CONSTRAINT envios_pedido_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


