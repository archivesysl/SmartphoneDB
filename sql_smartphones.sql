CREATE DATABASE IF NOT EXISTS SmartphoneDB;

USE SmartphoneDB;

CREATE TABLE IF NOT EXISTS Marca (
  Codigo INT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Proprietario (
  Codigo INT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Idade TINYINT NOT NULL,
  Localizacao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Smartphone (
  Codigo INT PRIMARY KEY,
  Marca INT,
  SistemaOperacional VARCHAR(50) NOT NULL,
  Tela VARCHAR(50) NOT NULL,
  MemoriaRAM INT NOT NULL,
  ArmazenamentoInterno INT NOT NULL,
  Camera VARCHAR(50) NOT NULL,
  FOREIGN KEY (Marca) REFERENCES Marca(Codigo)
);

CREATE TABLE IF NOT EXISTS SmartphonesDoProprietario (
  CodigoDoProprietario INT,
  CodigoDoSmartphone INT,
  PRIMARY KEY (CodigoDoProprietario, CodigoDoSmartphone),
  FOREIGN KEY (CodigoDoProprietario) REFERENCES Proprietario(Codigo),
  FOREIGN KEY (CodigoDoSmartphone) REFERENCES Smartphone(Codigo)
);

INSERT INTO Marca (Codigo, Nome) VALUES
  (1, 'Motorola'),
  (2, 'Samsung'),
  (3, 'Apple'),
  (4, 'Google'),
  (5, 'Xiaomi'),
  (6, 'Huawei');

INSERT INTO Proprietario (Codigo, Nome, Idade, Localizacao) VALUES
  (1, 'Natan', 22, 'Jardim Figueiras'),
  (2, 'João', 25, 'São Paulo'),
  (3, 'Maria', 30, 'Rio de Janeiro'),
  (4, 'Pedro', 28, 'Belo Horizonte'),
  (5, 'Ana', 24, 'Brasília');

INSERT INTO Smartphone (Codigo, Marca, SistemaOperacional, Tela, MemoriaRAM, ArmazenamentoInterno, Camera) VALUES
  (1, 1, 'Android', 'FHD5000', 16, 256, '50MP'),
  (2, 2, 'Android', 'FHD6000', 8, 128, '40MP'),
  (3, 3, 'iOS', 'FHD7000', 6, 64, '30MP'),
  (4, 4, 'Android', 'FHD8000', 12, 512, '60MP'),
  (5, 5, 'Android', 'FHD9000', 10, 256, '50MP'),
  (6, 6, 'Android', 'FHD10000', 8, 128, '40MP');

INSERT INTO SmartphonesDoProprietario (CodigoDoProprietario, CodigoDoSmartphone) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (1, 6);

SELECT S.Codigo, M.Nome AS Marca, S.SistemaOperacional, S.Tela, S.MemoriaRAM, S.ArmazenamentoInterno, S.Camera 
FROM Smartphone S 
JOIN Marca M ON S.Marca = M.Codigo;

SELECT P.Nome, M.Nome AS Marca, S.SistemaOperacional 
FROM Proprietario P 
JOIN SmartphonesDoProprietario SP ON P.Codigo = SP.CodigoDoProprietario 
JOIN Smartphone S ON SP.CodigoDoSmartphone = S.Codigo 
JOIN Marca M ON S.Marca = M.Codigo;

SELECT M.Nome, COUNT(*) AS Quantidade 
FROM Smartphone S 
JOIN Marca M ON S.Marca = M.Codigo 
GROUP BY M.Nome;

SELECT * FROM Proprietario 
WHERE Idade > 25;

SELECT * FROM Smartphone 
WHERE MemoriaRAM > 10;
