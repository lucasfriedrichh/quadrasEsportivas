CREATE FUNCTION calcularTotalPagamentoReserva(
    id_reserva INT
) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(valor) INTO total FROM pagamento WHERE idreserva = id_reserva;
    
    RETURN total;
END;

CREATE PROCEDURE realizarPagamento(
    IN id_reserva INT,
    IN valor_pagamento DECIMAL(10,2),
    IN tipo_pagamento INT
)
BEGIN
    DECLARE valor_total DECIMAL(10,2);
    
    SET valor_total = calcularTotalPagamentoReserva(id_reserva);
    
    IF valor_total IS NULL THEN
        SELECT CONCAT('A reserva ', id_reserva, ' não existe ou não possui pagamentos registrados.') AS resultado;
    ELSE
        IF valor_total + valor_pagamento <= 1000 THEN
            INSERT INTO pagamento (tipo, valor, idreserva) VALUES (tipo_pagamento, valor_pagamento, id_reserva);
            
            UPDATE reserva SET hora = '10:00', data = '2023-04-01' WHERE id = id_reserva;
            
            SELECT CONCAT('Pagamento de R$', valor_pagamento, ' realizado com sucesso.') AS resultado;
        ELSE
            SELECT CONCAT('O valor total dos pagamentos da reserva ', id_reserva, ' já ultrapassou R$1000,00.') AS resultado;
        END IF;
    END IF;
END;

CALL realizarPagamento(1, 500.00, 1);
