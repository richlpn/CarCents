DROP TABLE GASTO cascade;
DROP TABLE TIPO_GASTO cascade;
DROP TABLE MANUTENCAO cascade;
DROP TABLE TIPO_MANUTENCAO cascade;
DROP TABLE CONSUMO_MEDIO cascade;
DROP TABLE TIPO_COMBUSTIVEL cascade;
DROP TABLE TROCA_OLEO cascade;
DROP TABLE VEICULO cascade;
DROP TABLE TIPO_VEICULO cascade;
DROP TABLE VIAGEM cascade;
DROP TABLE USUARIO cascade;

    CREATE TABLE USUARIO (
        id integer PRIMARY KEY,
        nome varchar(80),
        senha varchar(16),
        email varchar(80),
        is_ativo boolean,
        data_criacao date
    );

    CREATE TABLE VIAGEM (
        id integer PRIMARY KEY,
        nome varchar(80),
        data_inicio date,
        data_fim date,
        km_inicial float,
        km_final float,
        fk_USUARIO_id integer,
        FOREIGN KEY(fk_USUARIO_id) 
	  	REFERENCES usuario(id)
        ON DELETE CASCADE
    );

    CREATE TABLE TIPO_VEICULO (
        id integer PRIMARY KEY,
        categoria varchar(80),
        is_ativo boolean
    );

    CREATE TABLE VEICULO (
        id integer PRIMARY KEY,
        nome varchar(80),
        placa varchar(20),
        ano integer,
        km_ultima_troca float,
        is_ativo boolean,
        fk_USUARIO_id integer,
        FOREIGN KEY(fk_USUARIO_id) 
	  	REFERENCES usuario(id) 
	  	ON DELETE CASCADE,
        fk_TIPO_VEICULO_id integer,
	  	FOREIGN KEY(fk_TIPO_VEICULO_id) 
	  	REFERENCES tipo_veiculo(id)
        ON DELETE CASCADE
    );

    CREATE TABLE TROCA_OLEO (
        id integer PRIMARY KEY,
        km float,
        data date,
        is_ativo boolean,
        fk_VEICULO_id integer,
        FOREIGN KEY(fk_VEICULO_id) 
	  	REFERENCES veiculo(id)
        ON DELETE CASCADE
    );

    CREATE TABLE TIPO_COMBUSTIVEL (
        id integer PRIMARY KEY,
        nome varchar(80),
        is_ativo boolean
    );

    CREATE TABLE CONSUMO_MEDIO (
        id integer PRIMARY KEY,
        km_atual float,
        valor_litro float,
        data date,
        qt_litro float,
        fk_VEICULO_id integer,
        FOREIGN KEY(fk_VEICULO_id) 
	  	REFERENCES veiculo(id)
	  	ON DELETE CASCADE,
        fk_TIPO_COMBUSTIVEL_id integer,
        FOREIGN KEY(fk_TIPO_COMBUSTIVEL_id) 
	  	REFERENCES tipo_combustivel(id)
        ON DELETE CASCADE        
    );

    CREATE TABLE TIPO_MANUTENCAO (
        id integer PRIMARY KEY,
        nome varchar(80),
        is_ativo boolean
    );

    CREATE TABLE MANUTENCAO (
        id integer PRIMARY KEY,
        nome varchar(80),
        valor float,
        data date,
        km float,
        fk_VEICULO_id integer,
        FOREIGN KEY(fk_VEICULO_id) 
	  	REFERENCES veiculo(id)
	  	ON DELETE CASCADE,
        fk_TIPO_MANUTENCAO_id integer,
        FOREIGN KEY(fk_TIPO_MANUTENCAO_id) 
	  	REFERENCES tipo_manutencao(id)
        ON DELETE CASCADE
    );

    CREATE TABLE TIPO_GASTO (
        id integer PRIMARY KEY,
        nome varchar(80),
        is_ativo boolean
    );

    CREATE TABLE GASTO (
        id integer PRIMARY KEY,
        nome varchar(80),
        data date,
        valor integer,
        fk_VEICULO_id integer,
        FOREIGN KEY(fk_VEICULO_id) 
	  	REFERENCES veiculo(id)
	  	ON DELETE CASCADE,
        fk_TIPO_GASTO_id integer,
        FOREIGN KEY(fk_TIPO_GASTO_id) 
	  	REFERENCES tipo_gasto(id) ON DELETE CASCADE,
        km integer
    );

-- INSERT's NAS TABELAS

    INSERT INTO USUARIO (id, nome, senha, email, is_ativo, data_criacao)
VALUES
    (1, 'Jonny Deep', 'senha', 'jonyn.deep@email.com', true, '2023-04-25'),
    (2, 'Leonard Nimoy', 'password', 'leonard.nimoy@email.com', true, '2023-04-26'),
    (3, 'Jane Foster', 'newpassword', 'jane.foster@email.com', false, '2023-04-27'),
    (4, 'Luke Johnson', 'L@9uG4$*2P', 'luke.johnson92@gmail.com', true, '2023-05-01'),
    (5, 'Isabella Thompson', 'Bel5#Mv!7q9', 'isabella.thompson87@outlook.com', true, '2023-04-15'),
    (6, 'Peter Reed', 'P$8b6#K!1Pwd', 'peter.reed@email.com', false, '2023-03-23'),
    (7, 'Sophia Foster', '3@1$6Z!7@!234', 'sofia.foster@gmail.com', true, '2023-02-09'),
    (8, 'William Mitchell', 'G*2v!8$H9me', 'guilherme.mitchell@outlook.com', false, '2023-01-27'),
    (9, 'Laura Simmons', '7#uJ4$*55678', 'laura.simmons@email.com', true, '2022-12-14'),
    (10, 'Matthew Jenkins', '6v@1#P*3', 'Matthew.jenkins@gmail.com', false, '2022-11-30');

INSERT INTO VIAGEM (id,	nome, data_inicio, data_fim, km_inicial, km_final, fk_USUARIO_id)
VALUES
    (1, 'Roma', '2023-03-13', '2023-03-18', 10000, 10100, 1),
    (2, 'Venesa',  '2023-02-05', '2023-02-15', 5000, 5080, 2),
    (3, 'Paris',  '2023-03-05', '2023-03-28', 15000, 15200, 3),
    (4, 'Londres', '2023-04-10', '2023-04-15', 8000, 8100, 4),
    (5, 'Nova York', '2023-05-01', '2023-05-10', 12000, 12200, 5),
    (6, 'Tóquio', '2023-06-20', '2023-07-05', 20000, 20100, 6),
    (7, 'Sydney', '2023-03-10', '2023-03-20', 6000, 6050, 7),
    (8, 'Barcelona', '2023-07-15', '2023-07-25', 10000, 10120, 8),
    (9, 'Rio de Janeiro', '2023-08-10', '2023-08-20', 15000, 15250, 9),
    (10, 'Cidade do Cabo', '2023-06-01', '2023-06-10', 9000, 9100, 10);

INSERT INTO TIPO_VEICULO (id, categoria, is_ativo)
VALUES
    (1, 'Carro', true),
    (2, 'Moto', true),
    (3, 'Caminhão', false);

INSERT INTO VEICULO (id, nome, placa, ano, km_ultima_troca, is_ativo, fk_USUARIO_id, fk_TIPO_VEICULO_id)
VALUES
    (1, 'Carro A', 'ABC-1234', 2015, 10000, true, 1, 1),
    (2, 'Moto B', 'DEF-5678', 2018, 5000, true, 2, 2),
    (3, 'Carro C', 'GHI-9012', 2020, 15000, false, 3, 1),
    (4, 'Carro D', 'JKL-3456', 2017, 8000, true, 4, 1),
    (5, 'Moto E', 'MNO-7890', 2019, 12000, true, 5, 2),
    (6, 'Caminhão F', 'PQR-2345', 2016, 20000, true, 6, 3),
    (7, 'Carro G', 'STU-6789', 2021, 6000, true, 7, 1),
    (8, 'Moto H', 'VWX-0123', 2018, 10000, true, 8, 2),
    (9, 'Carro I', 'YZA-4567', 2020, 15000, false, 9, 1),
    (10, 'Caminhão J', 'BCD-8901', 2015, 9000, true, 10, 3);

INSERT INTO TROCA_OLEO (id, km, data, is_ativo, fk_VEICULO_id)
VALUES
    (1, '10000', '2023-03-13', true, 1),
    (2, '5000', '2023-02-05', true, 2),
    (3, '15000', '2023-03-05', true, 3),
    (4, '8000', '2023-04-10', true, 4),
    (5, '12000', '2023-05-01', true, 5),
    (6, '20000', '2023-06-20', true, 6),
    (7, '6000', '2023-03-10', true, 7),
    (8, '10000', '2023-07-15', true, 8),
    (9, '15000', '2023-08-10', true, 9),
    (10, '9000', '2023-06-01', true, 10);

INSERT INTO TIPO_COMBUSTIVEL (id, nome, is_ativo)
VALUES
    (1, 'Gasolina', true),
    (2, 'Etanol', true),
    (3, 'Diesel', true);

INSERT INTO CONSUMO_MEDIO (id, km_atual, valor_litro, data, qt_litro, fk_VEICULO_id, fk_TIPO_COMBUSTIVEL_id)
VALUES
    (1, 1000, 5.578, '2023-03-18', 20, 1, 2),
    (2, 5000, 6.005, '2023-02-15', 15, 2, 1),
    (3, 15000, 4.792, '2023-03-28', 10, 3, 3),
    (4, 8000, 5.950, '2023-04-15', 30, 4, 1),
    (5, 12000, 6.350, '2023-05-10', 25, 5, 2),
    (6, 20000, 4.520, '2023-07-05', 35, 6, 3),
    (7, 6000, 5.870, '2023-03-20', 15, 7, 2),
    (8, 10000, 6.200, '2023-07-25', 20, 8, 1),
    (9, 15000, 4.990, '2023-08-20', 40, 9, 3),
    (10, 9000, 5.750, '2023-06-10', 18, 10, 1);

INSERT INTO TIPO_MANUTENCAO (id, nome, is_ativo)
VALUES
    (1, 'Pneu', true),
    (2, 'Motor', true),
    (3, 'Freio', true),
    (4, 'Eletrico', true);

INSERT INTO MANUTENCAO (id, nome, valor , data , km, fk_VEICULO_id, fk_TIPO_MANUTENCAO_id)
VALUES
    (1, 'Troca de pneus', 5000, '2022-01-05', 50000, 1, 1),
    (2, 'Reparo no motor', 2500, '2022-03-10', 80000, 3, 2),
    (3, 'Troca de freios', 1800, '2022-05-15', 75000, 2, 3),
    (4, 'Troca de pneus', 100, '2022-02-15', 55000, 4, 1),
    (5, 'Revisão completa', 3000, '2022-04-20', 90000, 5, 4),
    (6, 'Alinhamento e balanceamento', 500, '2022-06-25', 65000, 6, 3),
    (7, 'Troca de correia dentada', 800, '2022-08-30', 70000, 7, 1),
    (8, 'Limpeza de bicos injetores', 200, '2022-10-05', 60000, 8, 2),
    (9, 'Substituição de fluido', 50, '2022-12-10', 85000, 9, 3),
    (10, 'Reparo no sistema elétrico', 1500, '2022-11-15', 95000, 10, 4);

INSERT INTO TIPO_GASTO (id, nome, is_ativo)
VALUES
    (1, 'Pedagio', true),
    (2, 'Multa', true),
    (3, 'IPVA', true),
    (4, 'Estacionamento', true),
    (5, 'Seguro', true),
    (6, 'Lava a jato', true);

INSERT INTO GASTO (id, nome, data, valor, fk_VEICULO_id, fk_TIPO_GASTO_id, km)
VALUES
    (1, 'terceira ponte', '2023-01-05', 5, 1, 1, 60000.0),
    (2, 'BR-101', '2023-05-10',150, 2, 2, 90000.0),
    (3, 'Ipva-2022', '2023-01-08', 4800, 3, 3, 45000.0),
    (4, 'Estacionamento', '2023-02-15', 10, 4, 4, 50000.0),
    (5, 'Rodovia de Pedágio', '2023-03-20', 8, 5, 1, 120000.0),
    (6, 'Multa de Trânsito', '2023-04-25', 200, 6, 2, 82000.0),
    (7, 'Taxa de Licenciamento', '2023-06-30', 100, 7, 3, 73000.0),
    (8, 'Lavagem do Veículo', '2023-07-15', 30, 8, 6, 8000.0),
    (9, 'Seguro do Veículo', '2023-08-20', 500, 9, 5, 1000.0),
    (10, 'Excesso de Velocidade', '2023-09-25', 300, 10, 2, 180000.0);