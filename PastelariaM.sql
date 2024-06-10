CREATE DATABASE PASTELARIA2;
USE PASTELARIA2;

CREATE TABLE clientes (	
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);


CREATE TABLE cargos (
	id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    	nome_cargo VARCHAR(20) NOT NULL,
	salario FLOAT
    );

CREATE TABLE funcionarios (	
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cargo INT NOT NULL,
	FOREIGN KEY (cargo) REFERENCES cargos(id_cargo)
);


CREATE TABLE produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
	categoria VARCHAR(25) NOT NULL,
    tamanho CHAR(2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE recheios (
	id_recheio INT PRIMARY KEY AUTO_INCREMENT,
    nome_recheio VARCHAR(20) NOT NULL,
    descricao VARCHAR(30) NOT NULL
);

CREATE TABLE produtos_recheios (
	id_produto INT NOT NULL,
	id_recheio INT NOT NULL,
	quantidade INT NOT NULL,
    
    FOREIGN KEY (id_produto) references produtos(id_produto),
    FOREIGN KEY (id_recheio) references recheios(id_recheio),
    PRIMARY KEY (id_produto, id_recheio)	
);

CREATE TABLE pagamentos (
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    	forma VARCHAR(10) NOT NULL, 
    	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
	datapedido DATETIME,
    forma_pagamento INT NOT NULL,
    valor_total FLOAT NOT NULL,
    sts ENUM('PROCESSANDO','FINALIZADO'),
    obs VARCHAR(50) ,
    FOREIGN KEY (forma_pagamento) references pagamentos(id_pagamento)
	
);

CREATE TABLE itens_pedidos (
	id_pedido INT NOT NULL,
    id_produto INT NOT NULL, 
    quantidade INT NOT NULL,
    valor_unitario FLOAT NOT NULL, 

	FOREIGN KEY (id_pedido) references pedidos(id_pedido),
	FOREIGN KEY (id_produto) references produtos(id_produto),
	PRIMARY KEY (id_pedido, id_produto)
);


-- Insert  clientes
INSERT INTO clientes (nome_cliente, cpf, data_nascimento, telefone, email, endereco) 
VALUES 
('João Silva', '12345678901', '1994-05-15', '11987654321', 'joao.silva@gmail.com', 'Rua da Penha, 123'),
('Maria Oliveira', '98765432109', '2006-10-20', '11901234567', 'maria.oliveira@outlook.com', 'Av. Champs Elyées, 456'),
('Pedro Santos', '45678901234', '1989-07-05', '11976543210', 'pedro.santos@hotmail.com', 'Rua Las Ramblas, 789');

-- Insert  cargos
INSERT INTO cargos (nome_cargo, salario)
VALUES 
('Atendente', 1500.00),
('Cozinheiro', 2000.00),
('Gerente', 3000.00);

-- Insert  funcionarios
INSERT INTO funcionarios (nome_funcionario, cpf, data_nascimento, telefone, email, endereco, cargo) 
VALUES 
('Carlos Pereira', '23456789012', '1996-03-25', '11987654322', 'carlos.pereira@outlook.com', 'Rua A, 789', '1'),
('Ana Souza', '34567890123', '1984-11-12', '11901234568', 'ana.souza@gmail.com', 'Av. B, 456', '2'),
('Luiza Lima','56789012345', '1992-08-30', '11976543211', 'luiza.lima@hotmail.com', 'Rua C, 123', '3');

-- Insert  produtos
INSERT INTO produtos (nome_produto, descricao, preco, categoria, tamanho,estoque) 
VALUES 
('Pastel de Carne', 'Pastel recheado com carne moída', 3.50, 'Salgado', 'P',10),
('Pastel de Carne', 'Pastel recheado com carne moída', 4.50, 'Salgado', 'M',15),
('Pastel de Carne', 'Pastel recheado com carne moída', 5.50, 'Salgado', 'G',20),
('Pastel de Queijo', 'Pastel recheado com queijo', 3.00, 'Salgado', 'P',10),
('Pastel de Queijo', 'Pastel recheado com queijo', 4.00, 'Salgado', 'M',15),
('Pastel de Queijo', 'Pastel recheado com queijo', 5.00, 'Salgado', 'G',20),
('Pastel de Bacon', 'Pastel recheado com Bacon', 3.00, 'Salgado', 'P',10),
('Pastel de Bacon', 'Pastel recheado com Bacon', 4.00, 'Salgado', 'M',15),
('Pastel de Bacon', 'Pastel recheado com Bacon', 5.00, 'Salgado', 'G',20),
('Pastel de Frango', 'Pastel recheado com frango desfiado', 3.50, 'Salgado', 'P',10),
('Pastel de Frango', 'Pastel recheado com frango desfiado', 4.50, 'Salgado', 'M',15),
('Pastel de Frango', 'Pastel recheado com frango desfiado', 5.50, 'Salgado', 'G',20),
('Pastel de Palmito', 'Pastel recheado com palmito', 4.50, 'Vegano', 'P',10),
('Pastel de Palmito', 'Pastel recheado com palmito', 5.50, 'Vegano', 'M',20),
('Pastel de Palmito', 'Pastel recheado com palmito', 6.50, 'Vegano', 'G',15),
('Pastel de cogumelos','Pastel recheado com cogumelos',5.00,'Vegano','P',10), 
('Pastel de cogumelos','Pastel recheado com cogumelos',6.00,'Vegano','M',20), 
('Pastel de cogumelos','Pastel recheado com cogumelos',7.00,'Vegano','G',30),
('Pastel de Nutella', 'Pastel doce recheado com Nutella', 4.00, 'Doce', 'P',10),
('Pastel de Nutella', 'Pastel doce recheado com Nutella', 5.00, 'Doce', 'M',20),
('Pastel de Nutella', 'Pastel doce recheado com Nutella', 6.00, 'Doce', 'G',30),
('Pastel de Banana com Canela', 'Pastel doce recheado com Nutella', 4.00, 'Doce', 'P',10),
('Pastel de Banana com Canela', 'Pastel doce recheado com Nutella', 5.00, 'Doce', 'M',20),
('Pastel de Banana com Canela', 'Pastel doce recheado com Nutella', 6.00, 'Doce', 'G',30),24
('Coca-Cola', 'Refrigerante', 2.00, 'Bebida', 'P',10),
('Coca-Cola', 'Refrigerante', 3.00, 'Bebida', 'M',20),
('Coca-Cola', 'Refrigerante', 4.00, 'Bebida', 'G',30),
('Pepsi', 'Refrigerante', 2.00, 'Bebida', 'P',10),
('Pepsi', 'Refrigerante', 2.50, 'Bebida', 'M',20),
('Pepsi', 'Refrigerante', 3.00, 'Bebida', 'G',30),
('Suco de Laranja', 'Suco natural de laranja', 2.00, 'Bebida', 'P',10),
('Suco de Laranja', 'Suco natural de laranja', 3.00, 'Bebida', 'M',10),
('Suco de Laranja', 'Suco natural de laranja', 4.00, 'Bebida', 'G',10),
('Suco de Caju', 'Suco natural de Caju', 2.00, 'Bebida', 'P',10),
('Suco de Caju', 'Suco natural de Caju', 3.00, 'Bebida', 'M',10),
('Suco de Caju', 'Suco natural de Caju', 4.00, 'Bebida', 'G',10),
('Suco de Goiaba', 'Suco natural de Goiaba', 2.00, 'Bebida', 'P',10),
('Suco de Goiaba', 'Suco natural de Goiaba', 3.00, 'Bebida', 'M',10),
('Suco de Goiaba', 'Suco natural de Goiaba', 4.00, 'Bebida', 'G',10),
('Café', 'Café expresso', 1.50, 'Bebida', 'P',15),
('Água Mineral', 'Água sem gás', 1.50, 'Bebida', 'G',15),
('Batata Frita', 'Porção de batatas fritas crocantes', 5.00, 'Acompanhamento', 'P',10),
('Batata Frita', 'Porção de batatas fritas crocantes', 7.00, 'Acompanhamento', 'M',10),
('Batata Frita', 'Porção de batatas fritas crocantes', 9.00, 'Acompanhamento', 'G',10);

-- Insert  recheios
INSERT INTO recheios (nome_recheio, descricao)
VALUES 
('Carne', 'Carne moída temperada'),
('Bacon', 'Bacon'),
('Queijo', 'Queijo derretido'),
('Frango', 'Frango desfiado e temperado'),
('Palmito', 'Palmito refogado'),
('Nutella', 'Creme de avelã'),
('Banana com Canela', 'Banana com Canela'),
('Cogumelos', 'Cogumelos refogado');

-- Insert  produtos_recheios
INSERT INTO produtos_recheios (id_produto, id_recheio, quantidade) VALUES
(1, 1, 100), 
(2, 3, 120), 
(1, 3, 80),  
(5, 2, 50),
(5, 3, 100);

-- Insert  pagamentos
INSERT INTO pagamentos (forma, descricao)
VALUES 
('Dinheiro', 'Pagamento em dinheiro na entrega'),
('Cartão ', 'Pagamento com cartão de crédito ou débito'),
('Pix ', 'Pagamento via Pix na entrega');

-- Insert  pedidos
INSERT INTO pedidos (id_cliente, datapedido, forma_pagamento, valor_total, sts)
VALUES 
(1, '2023-09-09 10:00:00', 1, 11.50, 'FINALIZADO'),
(2, '2023-11-12 12:30:00', 2, 9.00, 'PROCESSANDO'),
(2, '2024-02-29 15:45:00', 3, 16.00, 'FINALIZADO'),
(1, '2024-02-01 10:00:00', 1, 14.50, 'FINALIZADO'),
(2, '2024-04-14 12:30:00', 2, 16.50, 'PROCESSANDO'),
(3, '2024-03-27 15:45:00', 3, 18.50, 'FINALIZADO'),
(2, '2024-02-13 10:00:00', 1, 9.00, 'PROCESSANDO'),
(3, '2024-01-09 12:30:00', 2, 12.00, 'FINALIZADO'),
(1, '2024-05-06 15:45:00', 3, 16.00, 'PROCESSANDO'),
(1, '2024-06-04 16:00:00', 1, 19.50, 'PROCESSANDO'),
(2, '2024-06-04 16:15:00', 2, 19.50, 'PROCESSANDO'),
(3, '2024-05-04 16:30:00', 3, 13.00, 'PROCESSANDO'), 
(1, '2024-06-04 16:45:00', 1, 11.00, 'PROCESSANDO'),
(1, '2023-03-04 16:30:00', 3, 13.00, 'PROCESSANDO'),
(1, '2024-06-05 17:00:00', 2, 13.00, 'PROCESSANDO'),
(2, '2024-06-05 17:30:00', 3, 11.00, 'PROCESSANDO'),
(3, '2024-05-05 18:00:00', 1, 23.00, 'PROCESSANDO'),
(1, '2024-03-05 18:30:00', 2, 13.00, 'PROCESSANDO'),
(2, '2024-03-06 13:30:00', 2, 11.00, 'PROCESSANDO'),

-- Insert  itens_pedidos
INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, valor_unitario)
VALUES 
(1, 1, 2, 3.50),
(1, 2, 1, 4.50),
(2, 4, 3, 3.00),
(3, 5, 4, 4.00),
(4, 1, 1, 3.50),
(4, 3, 2, 5.50),
(5, 2, 3, 4.50),
(5, 4, 1, 3.00),
(6, 5, 2, 4.00),
(6, 1, 3, 3.50),
(7, 13, 2, 4.50),
(8, 19, 3, 4.00),
(9, 21, 2, 6.00),
(9, 19, 1, 4.00),
(10, 13, 3, 4.50),
(10, 26, 2, 3.00),
(11, 13, 3, 4.50),
(11, 26, 2, 3.00), 
(12, 15, 2, 6.50),
(12, 1, 2, 3.50),
(12, 34, 3, 2.00),
(13, 5, 2, 4.00),
(13, 32, 1, 3.00);
(14, 15, 2, 6.50),
(15, 1, 2, 3.50),
(15, 34, 3, 2.00),
(16, 5, 2, 4.00),
(16, 32, 1, 3.00),
(17, 9, 3, 5.00),
(17,27, 2, 4.00),
(18, 13, 2, 4.50),-
(18, 36, 1, 4.00),	
(19, 1, 2, 3.50), 
(19, 33, 1, 4.00); 



#1. Liste os nomes de todos os pastéis veganos vendidos para pessoas com mais de 18 anos.
SELECT
	c.nome_cliente,
	FLOOR(DATEDIFF(NOW(), c.data_nascimento)/365.25) AS idade,
    P.*,
    ip.id_produto 
FROM itens_pedidos ip
JOIN pedidos pe ON ip.id_pedido = pe.id_pedido
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN produtos p ON ip.id_produto = p.id_produto
WHERE FLOOR(DATEDIFF(NOW(), c.data_nascimento)/365.25) >= 18 
AND p.categoria = 'Vegano';

#2. Liste os clientes com maior número de pedidos realizados em 1 ano agrupados por mês
#não aparece so o cliente com maior numero de pedidos
SELECT 
  c.nome_cliente, COUNT(p.id_pedido) AS pedidos, MONTH(p.datapedido) AS mes, YEAR(p.datapedido) as ano
FROM pedidos p 
JOIN clientes c ON c.id_cliente = p.id_cliente
WHERE p.datapedido BETWEEN date_sub(now(), INTERVAL 1 YEAR) AND NOW()
GROUP BY c.nome_cliente, ano, mes 
ORDER BY  ano ,mes ,pedidos DESC ;


#3. Liste todos os pastéis que possuem bacon e/ou queijo em seu recheio.

SELECT *
FROM produtos p
JOIN  produtos_recheios pr ON pr.id_produto = p.id_produto
JOIN recheios r ON pr.id_recheio = r.id_recheio
WHERE r.nome_recheio IN('Bacon','Queijo') 
ORDER BY p.id_produto;


#4. Mostre o valor de venda total de todos os pastéis cadastrados no sistema.

SELECT  SUM(ip.quantidade * ip.valor_unitario) as vendaTotalPasteis
FROM itens_pedidos ip
JOIN  produtos p ON ip.id_produto = p.id_produto
WHERE p.categoria IN('Salgado','Doce','Vegano');

#5. Liste todos os pedidos onde há pelo menos um pastel e uma bebida.


SELECT pe.id_pedido ,p.*
FROM pedidos pe
JOIN itens_pedidos ip on ip.id_pedido = pe.id_pedido 
JOIN produtos p ON p.id_produto = ip.id_produto
WHERE EXISTS (
  SELECT * FROM itens_pedidos it JOIN produtos p ON it.id_produto = p.id_produto
  WHERE pe.id_pedido = it.id_pedido AND p.categoria IN ('Salgado', 'Doce', 'Vegano')
) AND EXISTS (
  SELECT * FROM itens_pedidos it JOIN produtos p ON it.id_produto = p.id_produto
  WHERE pe.id_pedido = it.id_pedido AND p.categoria = 'Bebida'
)
ORDER BY pe.id_pedido;


#6. Liste quais são os pastéis mais vendidos, incluindo a quantidade de vendas em ordem decrescente.

SELECT ip.id_produto ,SUM(ip.quantidade) as QTD_Vendas,SUM(ip.quantidade * ip.valor_unitario) as Valor_Total, p.nome_produto as nome,p.preco as valorUnitario,p.tamanho,p.categoria
FROM itens_pedidos ip
JOIN  produtos p ON ip.id_produto = p.id_produto
WHERE p.categoria IN('Salgado','Doce','Vegano')
GROUP BY id_produto 
ORDER BY QTD_Vendas DESC;


#TRIGGER
#1
# data_modificação não existe
DELIMITER //
CREATE TRIGGER cliente_modificado
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
    SET NEW.data_modificacao = NOW();
END //
DELIMITER ;

#2
DELIMITER //
CREATE TRIGGER atualizar_status_pedido
AFTER INSERT ON itens_pedidos
FOR EACH ROW
BEGIN
    DECLARE total_itens INT;
    DECLARE itens_entregues INT;
    
    SELECT COUNT(*) INTO total_itens FROM itens_pedidos WHERE id_pedido = NEW.id_pedido;
    SELECT COUNT(*) INTO itens_entregues FROM itens_pedidos WHERE id_pedido = NEW.id_pedido AND status_entrega = 'ENTREGUE';
    
    IF total_itens = itens_entregues THEN
        UPDATE pedidos SET sts = 'FINALIZADO' WHERE id_pedido = NEW.id_pedido;
    END IF;
END //
DELIMITER ;

#3
DELIMITER //
CREATE TRIGGER impedir_exclusao_produto
BEFORE DELETE ON produtos
FOR EACH ROW
BEGIN
    DECLARE pedido_ativo INT;
    
    SELECT COUNT(*) INTO pedido_ativo
    FROM itens_pedidos
    WHERE id_produto = OLD.id_produto AND (SELECT sts FROM pedidos WHERE id_pedido = id_pedido) = 'PROCESSANDO';
    
    IF pedido_ativo > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este produto está associado a pedidos ativos e não pode ser excluído.';
    END IF;
END //
DELIMITER ;

#4
DELIMITER //
CREATE TRIGGER atualizar_estoque_produto
AFTER INSERT ON itens_pedidos
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id_produto = NEW.id_produto;
END //
DELIMITER ;

#5
#tabela historico_funcionario não existe
DELIMITER //
CREATE TRIGGER registrar_adicao_funcionario
AFTER INSERT ON funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO historico_funcionarios (acao, descricao, data)
    VALUES ('Adição', CONCAT('Novo funcionário adicionado: ', NEW.nome_funcionario), NOW());
END //
DELIMITER ;


#VIEW
#1
-- View para listar todos os pedidos de um cliente pelo seu ID:
CREATE VIEW pedidos_cliente AS
SELECT p.*, c.nome_cliente
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente;

#2
-- View para listar todos os produtos com seu respectivo estoque disponível:
CREATE VIEW estoque_produtos AS
SELECT id_produto, nome_produto, descricao, categoria, tamanho, estoque
FROM produtos;

#3
-- View para listar todos os pedidos processados no mês atual:
CREATE VIEW pedidos_mes AS
SELECT *
FROM pedidos
WHERE MONTH(datapedido) = MONTH(CURRENT_DATE());

#4
-- View para listar todos os funcionários com seus respectivos cargos e salários:
CREATE VIEW funcionarios_cargos AS
SELECT f.*, c.nome_cargo, c.salario
FROM funcionarios f
JOIN cargos c ON f.cargo = c.nome_cargo;

#5
-- View para listar todos os pedidos que ainda estão em processamento:
CREATE VIEW pedidos_em_processamento AS
SELECT *
FROM pedidos
WHERE sts = 'PROCESSANDO';

#6
-- View para listar todos os produtos que têm bacon e/ou queijo em seu recheio: **igual a função acima
CREATE VIEW produtos_com_bacon_queijo AS
SELECT DISTINCT p.*
FROM produtos p
JOIN produtos_recheios pr ON p.id_produto = pr.id_produto
JOIN recheios r ON pr.id_recheio = r.id_recheio
WHERE r.nome_recheio IN ('Bacon', 'Queijo');

#7
-- View para listar todos os clientes que fizeram pedidos este ano:  **igual a função acima
CREATE VIEW clientes_pedidos_ano AS
SELECT DISTINCT c.*
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE YEAR(p.datapedido) = YEAR(CURRENT_DATE());

#8
-- View para listar todos os produtos do categoria Pasteis 'Salgado' com preços acima de $4:
CREATE VIEW salgados_preco_alto AS
SELECT *
FROM produtos
WHERE categoria = 'Salgado' AND preco > 4.00;

#9
-- View para listar todos os pedidos com seus respectivos clientes e forma de pagamento:
CREATE VIEW pedidos_clientes_pagamentos AS
SELECT p.*, c.nome_cliente, pg.forma
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN pagamentos pg ON p.forma_pagamento = pg.id_pagamento;

#10
-- View para listar todos os produtos vendidos em cada pedido, incluindo sua quantidade e valor unitário:  
CREATE VIEW detalhes_pedido AS
SELECT p.*, ip.quantidade, ip.valor_unitario
FROM itens_pedidos ip
JOIN produtos p ON ip.id_produto = p.id_produto;


