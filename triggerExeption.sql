-- A trigger será acionada antes da exclusão de uma quadra;
-- For Each row faz com que a trigger seja executada para cada inha afetada pela exclusão.
-- v_count armazena a quantidade de reservas agendadadas para a quadra que está sendo excluida.
-- É feito a consulta na tabela reserva para verificar se existem reservas agendadas para a quadra que está sendo excluida. O resultado da consulta é armazenado na variável 'v_count'
-- Caso existam reserva para quando houver a exclusão da quadra. A trigger dispara uma exceção criada "quadra_com_reserva". Na qual deixa uma mensagem adequada.
-- Caso não tenha nenhuma reserva, a exclusão será feita sem problemas.

CREATE OR REPLACE EXCEPTION quadra_com_reserva
  FORBIDDEN_DELETE OF NUMBER MESSAGE 'Não é possível excluir uma quadra que possui reservas agendadas';

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
        RAISE quadra_com_reserva;
    END IF;
END;
