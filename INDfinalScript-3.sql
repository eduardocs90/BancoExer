-- Tabela Funcionario
CREATE TABLE Funcionario (
    ID_f serial PRIMARY KEY,
    nome_f VARCHAR(255),
    Cargo_f VARCHAR(100),
    Salario_f DECIMAL(10, 2),
    DataContratacao_f DATE
    );

-- Inserir valores na tabela Funcionario
INSERT INTO Funcionario (ID_f, nome_f, Cargo_f, Salario_f, DataContratacao_f)
VALUES
    (1, 'João Silva', 'Gerente', 5000.00, '2022-01-15'),
    (2, 'Maria Santos', 'Analista', 3500.00, '2022-03-10'),
    (3, 'Pedro Costa', 'Desenvolvedor', 2800.00, '2022-02-05');

-- Tabela Departamento
create table Departamento (
    id_dp serial primary key,
    nome_dp varchar (55),
    chefe_dp varchar (55),
    contato_dp int
   );

  -- Inserir valores na tabela Departamento
INSERT INTO Departamento (id_dp, nome_dp, chefe_dp, contato_dp)
VALUES
    (4, 'Vendas', 'Ana Rodrigues', 1234567),
    (5, 'TI', 'Carlos Oliveira', 9876543),
    (6, 'Marketing', 'Sofia Pereira', 5678901);

   --Tabela funcionaroDepartamento
CREATE TABLE FuncionarioDepartamento (
    ID_f serial,
    ID_dp serial,
    FOREIGN KEY (ID_f) REFERENCES Funcionario(ID_f),
    FOREIGN KEY (ID_dp) REFERENCES Departamento(id_dp)
);

-- Inserir valores na tabela FuncionarioDepartamento
INSERT INTO FuncionarioDepartamento (ID_f, ID_dp)
VALUES
    (1, 4),
    (2, 5),
    (3, 6)
   ;
  --tabela trablho 
CREATE TABLE Trabalho (
    ID_t serial PRIMARY KEY,
    ID_f INT,
    ID_dp INT,
    FOREIGN KEY (ID_f) REFERENCES Funcionario(ID_f),
    FOREIGN KEY (ID_dp) REFERENCES Departamento(id_dp)
);

-- Inserir valores na tabela Trabalho
INSERT INTO Trabalho (ID_t, ID_f, ID_dp)
VALUES
    (1, 1, 4), -- João Silva no Departamento de Vendas
    (2, 2, 5), -- Maria Santos no Departamento de TI
    (3, 3, 6); -- Pedro Costa no Departamento de Marketing
    
  
--pesquisa nome de departamento e quantidade de funcionarios 
SELECT d.nome_dp, COUNT(fd.ID_f) AS NumFuncionarios
FROM Departamento d
LEFT JOIN FuncionarioDepartamento fd ON d.id_dp = fd.ID_dp
GROUP BY d.nome_dp
;

--pesquisa nome dos funcionários e seus cargos
SELECT f.nome_f AS NomeFuncionario, f.Cargo_f AS Cargo
FROM Funcionario f

--pesquisa departamentos, seus funcionários e seus cargos 
SELECT D.nome_dp AS Departamento, F.nome_f AS Funcionario, F.Salario_f AS Salario
FROM Funcionario F
JOIN FuncionarioDepartamento FD ON F.ID_f = FD.ID_f
JOIN departamento D ON FD.ID_dp = D.id_dp
ORDER BY D.nome_dp;


