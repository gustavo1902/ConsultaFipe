DROP TABLE IF EXISTS Veiculos;
DROP TABLE IF EXISTS Modelos;
DROP TABLE IF EXISTS Marcas;

CREATE TABLE Marcas (
    Id INT PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    TipoVeiculo NVARCHAR(20) NOT NULL
);

CREATE TABLE Modelos (
    Id INT PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    MarcaId INT NOT NULL,
    FOREIGN KEY (MarcaId) REFERENCES Marcas(Id)
);

CREATE TABLE Veiculos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CodigoFipe NVARCHAR(20) NOT NULL,
    AnoModelo NVARCHAR(100) NOT NULL,
    Valor NVARCHAR(50) NOT NULL,
    ModeloId INT NOT NULL,
    FOREIGN KEY (ModeloId) REFERENCES Modelos(Id)
);

INSERT INTO Marcas (Id, Nome, TipoVeiculo) VALUES
(21, 'Fiat', 'carros'),
(22, 'Ford', 'carros'),
(59, 'Volkswagen', 'carros'),
(13, 'Chevrolet', 'carros'),
(26, 'Hyundai', 'carros'),
(56, 'Toyota', 'carros'),
(48, 'Renault', 'carros'),
(31, 'Jeep', 'carros');

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(4828, 'Palio 1.0 ECONOMY Fire Flex 8V 4p', 21),
(5052, 'Strada Adventure 1.8 16V Locker Flex CE', 21),
(7132, 'Mobi Like 1.0 Fire Flex 5p.', 21),
(7180, 'Toro Freedom 1.8 16V Flex Aut.', 21);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('001267-0', '2014 Flex', 'R$ 33.468,00', 4828),
('001267-0', '2013 Flex', 'R$ 31.123,00', 4828),
('001328-5', '2015 Flex', 'R$ 50.150,00', 5052),
('001328-5', '2014 Flex', 'R$ 48.990,00', 5052),
('001461-3', '2023 Flex', 'R$ 69.990,00', 7132),
('001461-3', '2022 Flex', 'R$ 65.340,00', 7132),
('001460-5', '2021 Flex', 'R$ 130.554,00', 7180),
('001460-5', '2020 Flex', 'R$ 121.815,00', 7180);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(5926, 'Ka 1.0 SE/SE Plus TiVCT Flex 5p', 22),
(5930, 'Ranger XLS 2.5 16V 4x2 CD Flex', 22),
(8329, 'Territory Titanium 1.5 GTDi EcoBoost Aut.', 22);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('003418-3', '2018 Flex', 'R$ 45.032,00', 5926),
('003418-3', '2017 Flex', 'R$ 42.111,00', 5926),
('003423-0', '2019 Flex', 'R$ 105.750,00', 5930),
('003423-0', '2018 Flex', 'R$ 98.430,00', 5930),
('003479-5', '2023 Gasolina', 'R$ 205.890,00', 8329),
('003479-5', '2022 Gasolina', 'R$ 191.450,00', 8329);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(7066, 'GOL Trendline 1.0 T.Flex 12V 5p', 59),
(6896, 'VOYAGE Comfortline 1.6 T.Flex 8V 4p', 59),
(8185, 'T-Cross Comfortline 1.0 TSI Flex 5p Aut.', 59),
(8593, 'Nivus Highline 1.0 200 TSI Flex 5p Aut.', 59);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('005457-7', '2018 Flex', 'R$ 44.572,00', 7066),
('005341-4', '2017 Flex', 'R$ 49.332,00', 6896),
('005510-7', '2024 Flex', 'R$ 154.100,00', 8185),
('005510-7', '2023 Flex', 'R$ 143.950,00', 8185),
('005520-4', '2024 Flex', 'R$ 147.890,00', 8593),
('005520-4', '2023 Flex', 'R$ 138.500,00', 8593);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(7177, 'Onix Hatch LT 1.0 12V Flex 5p Mec.', 13),
(8426, 'Tracker 1.0 Turbo 12V Flex Aut.', 13),
(5722, 'S10 Pick-Up LS 2.8 TDI 4x4 CD Dies.', 13),
(7164, 'Cruze Sedan LT 1.4 16V Turbo Flex 4p Aut.', 13);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('004503-7', '2023 Flex', 'R$ 82.400,00', 7177),
('004503-7', '2022 Flex', 'R$ 78.990,00', 7177),
('004523-1', '2024 Flex', 'R$ 132.890,00', 8426),
('004523-1', '2023 Flex', 'R$ 125.150,00', 8426),
('004412-0', '2021 Diesel', 'R$ 175.430,00', 5722),
('004412-0', '2020 Diesel', 'R$ 168.910,00', 5722),
('004482-7', '2022 Flex', 'R$ 138.600,00', 7164),
('004482-7', '2021 Flex', 'R$ 131.220,00', 7164);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(6334, 'HB20 Comfort 1.0 Flex 12V Mec.', 26),
(7349, 'CRETA Comfort 1.0 TB 12V Flex Aut.', 26);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('015091-6', '2022 Flex', 'R$ 75.120,00', 6334),
('015091-6', '2021 Flex', 'R$ 71.840,00', 6334),
('015187-4', '2024 Flex', 'R$ 135.890,00', 7349),
('015187-4', '2023 Flex', 'R$ 128.390,00', 7349);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(8200, 'Corolla GLi 2.0 Flex 16V Aut.', 56),
(6520, 'Hilux CD SRV 2.7 16V 4x2 Flex Aut.', 56),
(7923, 'Yaris Hatch XL 1.3 16V Flex 5p Aut.', 56);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('002181-4', '2023 Flex', 'R$ 146.890,00', 8200),
('002181-4', '2022 Flex', 'R$ 140.250,00', 8200),
('002194-6', '2021 Flex', 'R$ 148.900,00', 6520),
('002172-5', '2022 Flex', 'R$ 94.500,00', 7923);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(7736, 'KWID Zen 1.0 Flex 12V 5p Mec.', 48),
(6472, 'DUSTER Dynamique 2.0 Flex 16V Aut.', 48);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('025266-9', '2023 Flex', 'R$ 68.190,00', 7736),
('025266-9', '2022 Flex', 'R$ 62.740,00', 7736),
('025240-5', '2020 Flex', 'R$ 81.320,00', 6472),
('025240-5', '2019 Flex', 'R$ 77.980,00', 6472);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(7018, 'Renegade Longitude 1.8 16V Flex Aut.', 31),
(7243, 'Compass Longitude 2.0 16V Flex Aut.', 31);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('017042-9', '2021 Flex', 'R$ 115.600,00', 7018),
('017042-9', '2020 Flex', 'R$ 108.900,00', 7018),
('017053-4', '2021 Flex', 'R$ 140.210,00', 7243),
('017053-4', '2020 Flex', 'R$ 132.880,00', 7243);

INSERT INTO Marcas (Id, Nome, TipoVeiculo) VALUES
(101, 'Honda', 'motos'),
(104, 'YAMAHA', 'motos'),
(103, 'SUZUKI', 'motos');

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(8490, 'CG 160 FAN/Flex', 101),
(8652, 'NXR 160 BROS ESDD FlexOne', 101),
(8980, 'PCX 150/DLX', 101),
(8360, 'BIZ 125', 101);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('811130-9', '2023 Flex', 'R$ 15.849,00', 8490),
('811130-9', '2022 Flex', 'R$ 15.180,00', 8490),
('811124-4', '2024 Flex', 'R$ 21.652,00', 8652),
('811124-4', '2023 Flex', 'R$ 20.990,00', 8652),
('811153-8', '2021 Gasolina', 'R$ 16.500,00', 8980),
('811105-8', '2024 Flex', 'R$ 14.810,00', 8360);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(8881, 'FAZER 250 FZ25 ABS', 104),
(9100, 'NMAX 160 ABS', 104),
(8950, 'XTZ 250 LANDER', 104);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('827083-0', '2025 Gasolina', 'R$ 23.418,00', 8881),
('827083-0', '2024 Gasolina', 'R$ 22.990,00', 8881),
('827093-7', '2023 Gasolina', 'R$ 19.990,00', 9100),
('827092-9', '2024 Gasolina', 'R$ 24.390,00', 8950);

INSERT INTO Modelos (Id, Nome, MarcaId) VALUES
(9200, 'V-STROM 650 XT ABS', 103),
(9300, 'GSX-S 750 A', 103);

INSERT INTO Veiculos (CodigoFipe, AnoModelo, Valor, ModeloId) VALUES
('825048-5', '2022 Gasolina', 'R$ 54.900,00', 9200),
('825046-9', '2021 Gasolina', 'R$ 51.200,00', 9300);