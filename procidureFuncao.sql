--- Nessa procedure utilizamos a função calcularValorMedioReservas() criada anteriormente.
--- Para isso, utilizamos a instrução SET para atribuir o valor calculado pela função à variável valor_medio.
--- Verificamos se o valor médio é maior que zero, caso seja, exibe uma mensagem informando o valor médio das reservas.


CREATE PROCEDURE calcularValorMedioReservasCliente(
    IN id_cliente INT
)
BEGIN
    DECLARE valor_medio DECIMAL(10,2);
    
    SET valor_medio = calcularValorMedioReservas(id_cliente);
    
    IF valor_medio > 0 THEN
        SELECT CONCAT('O valor médio das reservas realizadas pelo cliente ', nome, ' é de R$', valor_medio) AS resultado FROM clientes WHERE id = id_cliente;
    ELSE
        SELECT CONCAT('O cliente ', nome, ' ainda não realizou nenhuma reserva.') AS resultado FROM clientes WHERE id = id_cliente;
    END IF;
END;

--- Para utilizar essa procedure, basta chamá-la informando o ID do cliente como parâmetro:
CALL calcularValorMedioReservasCliente(1);
