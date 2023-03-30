--- Procidure simples para a criação de novos clientes.
--- Para isso, utilizamos os parâmetros cpf_cliente, nome_cliente e telefone_cliente, que são passados na chamada da procedure.
CREATE PROCEDURE cadastrarCliente(
    IN cpf_cliente INT,
    IN nome_cliente VARCHAR(100),
    IN telefone_cliente INT
)
BEGIN
    INSERT INTO clientes (cpf, nome, telefone) VALUES (cpf_cliente, nome_cliente, telefone_cliente);
END;

--- Para chamar a procidure usar:
CALL cadastrarCliente(123456789, 'Exemplo', 12345678);

--- Essa chamada irá cadastrar um novo cliente com CPF 123456789, nome 'Exemplo' e telefone 12345678.