
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






