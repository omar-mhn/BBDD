CREATE TABLE client (
    id_client INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE compra (
    id_compra INT PRIMARY KEY,
    id_client INT,
    quantitat float,
    FOREIGN KEY (id_client) REFERENCES client(id_client)
);

INSERT INTO client VALUES
	(1, 'Ana'),
	(2, 'Carlos'),
	(3, 'Beatriz'),
	(4, 'David');

INSERT INTO Compra VALUES
	(101, 1, 30.00),  
	(102, 1, 60.00),  
	(103, 2, 80.00), 
	(104, 2, 20.00),  
	(105, 3, 55.00);  

-- David (id_client = 4) NO ha fet cap compra