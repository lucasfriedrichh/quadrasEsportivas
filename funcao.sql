--- Função com finalidade para calcular valor médio das reservas realizadas feitas por um cliente especifico.
CREATE FUNCTION calcularValorMedioReservas(id_cliente INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total_reservas INT;
    DECLARE total_pagamentos DECIMAL(10,2);
    DECLARE valor_medio DECIMAL(10,2);
    
    SELECT COUNT(*) INTO total_reservas FROM Reserva WHERE idClientes = id_cliente;
    SELECT SUM(valor) INTO total_pagamentos FROM Pagamento WHERE idReserva IN (SELECT id FROM Reserva WHERE idClientes = id_cliente);
    
    IF total_reservas > 0 THEN
        SET valor_medio = total_pagamentos / total_reservas;
    ELSE
        SET valor_medio = 0;
    END IF;
    
    RETURN valor_medio;
END;

--- Para que seja chamada, usar:

SELECT calcularValorMedioReservas(1); --- Usando ID do cliente como parâmetro
