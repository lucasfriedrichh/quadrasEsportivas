---Consulta com Junção entre as tabelas clientes, reserva e quadra, para listar as reservas realizadas pelo cliente "João"
SELECT c.nome AS nome_cliente, r.hora, r.data, q.descricao
FROM clientes c
JOIN reserva r ON r.idclientes = c.id
JOIN quadra q ON q.id = r.idquadra
WHERE c.nome = 'João';

--- listar as quadras mais rentáveis em um período específico
SELECT q.descricao, SUM(p.valor) AS total_pago
FROM reserva r
JOIN pagamento p ON r.id = p.idreserva
JOIN quadra q ON r.idquadra = q.id
WHERE r.data BETWEEN '2022-01-01' AND '2022-03-31'
GROUP BY q.descricao
HAVING SUM(p.valor) > 1000;
