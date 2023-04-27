CREATE TABLE tipoQuadra 
( 
 id INT PRIMARY KEY,
 tipo INT NOT NULL,
 UNIQUE(tipo)
); 

CREATE TABLE Clientes 
( 
 id INT PRIMARY KEY,
 cpf INT NOT NULL,  
 nome VARCHAR(30) NOT NULL,  
 telefone INT,
 UNIQUE (cpf)
); 

CREATE TABLE Reserva 
(
 id INT PRIMARY KEY,  
 dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 idClientes INT NOT NULL,  
 idquadra INT NOT NULL
); 

CREATE TABLE quadra 
( 
 id INT PRIMARY KEY,
 descricao VARCHAR(30) NOT NULL,
 idtipoQuadra INT NOT NULL
); 

CREATE TABLE avaliacaoQuadra
( 
 id INT PRIMARY KEY,  
 comentario VARCHAR2(200),
 nota INT NOT NULL,  
 dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 idClientes INT NOT NULL,  
 idquadra INT NOT NULL
); 

CREATE TABLE Pagamento 
( 
 id INT PRIMARY KEY,
 valor INT NOT NULL,
 tipo VARCHAR(30) NOT NULL,  
 idReserva INT NOT NULL
); 

ALTER TABLE avaliacaoQuadra ADD FOREIGN KEY(idClientes) REFERENCES Clientes (id);
ALTER TABLE avaliacaoQuadra ADD FOREIGN KEY(idquadra) REFERENCES quadra (id);
ALTER TABLE quadra ADD FOREIGN KEY(idtipoQuadra) REFERENCES tipoQuadra (id);
ALTER TABLE Reserva ADD FOREIGN KEY(idClientes) REFERENCES Clientes (id);
ALTER TABLE Reserva ADD FOREIGN KEY(idquadra) REFERENCES quadra (id);
ALTER TABLE Pagamento ADD FOREIGN KEY(idReserva) REFERENCES Reserva (id);