--- Carga de dados.

INSERT INTO clientes (cpf, nome, id, telefone)
VALUES (11111111111, 'João', 1, 99999999),
       (22222222222, 'Maria', 2, 88888888),
       (33333333333, 'Pedro', 3, 77777777);

INSERT INTO tipoQuadra (tipo, id)
VALUES ('Futebol', 1),
       ('Basquete', 2),
       ('Vôlei', 3);

INSERT INTO quadra (id, idtipoQuadra, descricao)
VALUES (1, 1, 'Quadra de Futebol Society'),
       (2, 2, 'Quadra de Basquete'),
       (3, 3, 'Quadra de Vôlei de Praia');

INSERT INTO reserva (hora, data, id, idclientes, idquadra)
VALUES (10, '2022-04-01', 1, 1, 1),
       (15, '2022-04-01', 2, 2, 2),
       (20, '2022-04-02', 3, 3, 3);

INSERT INTO avaliacao (id, nota, Comentario, idclientes)
VALUES (1, 8, 'Quadra muito boa!', 1),
       (2, 6, 'Poderia estar melhor conservada', 2),
       (3, 9, 'Adorei jogar aqui', 3);

INSERT INTO pagamento (tipo, valor, id, idreserva)
VALUES ('Cartão de Crédito', 50, 1, 1),
       ('Dinheiro', 30, 2, 2),
       ('Pix', 70, 3, 3);

INSERT INTO avaliacaoQuadra (idquadra, idavaliacao)
VALUES (1, 1),
       (2, 2),
       (3, 3);
