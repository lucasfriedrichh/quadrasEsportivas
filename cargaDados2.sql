-- Inserção de dados na tabela tipoQuadra
INSERT INTO tipoQuadra (id, tipo) VALUES
(1, 'Futebol'),
(2, 'Tênis'),
(3, 'Vôlei');

-- Inserção de dados na tabela Clientes
INSERT INTO Clientes (id, cpf, nome, telefone) VALUES
(1, 11111111111, 'João', 12345678),
(2, 22222222222, 'Maria', 87654321),
(3, 33333333333, 'Pedro', 98765432);

-- Inserção de dados na tabela quadra
INSERT INTO quadra (id, descricao, idtipoQuadra) VALUES
(1, 'Quadra de Futebol 1', 1),
(2, 'Quadra de Tênis 1', 2),
(3, 'Quadra de Vôlei 1', 3);

-- Inserção de dados na tabela Reserva
INSERT INTO Reserva (id, dataHora, idClientes, idquadra) VALUES
(1, CURRENT_TIMESTAMP, 1, 1),
(2, CURRENT_TIMESTAMP, 2, 2),
(3, CURRENT_TIMESTAMP, 3, 3);

-- Inserção de dados na tabela avaliacaoQuadra
INSERT INTO avaliacaoQuadra (id, comentario, nota, dataHora, idClientes, idquadra) VALUES
(1, 'Comentário 1', 8, CURRENT_TIMESTAMP, 1, 1),
(2, 'Comentário 2', 7, CURRENT_TIMESTAMP, 2, 1),
(3, 'Comentário 3', 9, CURRENT_TIMESTAMP, 3, 2);

-- Inserção de dados na tabela Pagamento
INSERT INTO Pagamento (id, valor, tipo, idReserva) VALUES
(1, 100, 'Boleto', 1),
(2, 50, 'Cartão de crédito', 2),
(3, 75, 'Dinheiro', 3);