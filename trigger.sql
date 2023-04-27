-- A trigger será acionada antes da exclusão de uma quadra;
-- For Each row faz com que a trigger seja executada para cada inha afetada pela exclusão.
-- v_count armazena a quantidade de reservas agendadadas para a quadra que está sendo excluida.
-- É feito a consulta na tabela reserva para verificar se existem reservas agendadas para a quadra que está sendo excluida. O resultado da consulta é armazenado na variável 'v_count'
-- Caso existam reserva para quando houver a exclusão da quadra. A trigger dispara uma exceção usando a função 'RAISE_APPLICATION_ERROR'. O código de erro '-20001' é usado para indicar um erro na aplicação(e não um erro de banco). E uma mensagem adequada.
-- Caso não tenha nenhuma reserva, a exclusão será feita sem problemas.

CREATE TRIGGER trg_quadra_exclusao
BEFORE DELETE ON quadra
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Reserva
    WHERE idquadra = OLD.id;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não é possível excluir uma quadra que possui reservas agendadas.');
    END IF;
END;

