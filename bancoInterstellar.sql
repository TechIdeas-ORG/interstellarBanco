DROP DATABASE if exists interstellar;
CREATE DATABASE if not exists interstellar;
USE interstellar;

CREATE TABLE personagens (
	idPersonagem int primary key,
    nome VARCHAR(90),
    fkPai int,
    foreign key (fkPai) REFERENCES personagens(idPersonagem), 
    idade int,
    periodoMorte varchar(100)
);
CREATE TABLE protagonistas(
	idProtagonista int,
    fkPersonagem int,
    PRIMARY KEY(idProtagonista, fkPersonagem)
);
CREATE TABLE tripulacao(
	idTripulacao INT,
    fkPersonagem INT,
    fkLider INT,
    fkLiderPersonagem INT,
    foreign key (fkPersonagem) REFERENCES personagens(idPersonagem),
    foreign key (fkLider) REFERENCES tripulacao(idTripulacao),
    foreign key (fkLiderPersonagem) REFERENCES tripulacao(fkPersonagem),
    PRIMARY KEY (idTripulacao, fkPersonagem)
);
CREATE TABLE galaxia(
	idGalaxia int primary key auto_increment,
    nome varchar(45)
);
CREATE TABLE sistema (
	idSistema int auto_increment primary key,
    fkGalaxia int,
    nome varchar(80),
    FOREIGN KEY (fkGalaxia) REFERENCES galaxia(idGalaxia)
);

CREATE TABLE tempoPlanetas(
	idTempo int primary key,
    tempoRelativoTerra decimal(10,2)
);
CREATE TABLE orbita(
	idOrbita int primary key auto_increment,
    nomeCorpo varchar(45)
);
CREATE TABLE planetas(
	idPlaneta int,
    fkSistema int,
    fkComparacao int,
    nome varchar(45),
    fkOrbita int,
    FOREIGN KEY (fkSistema) REFERENCES sistema(idSistema),
    FOREIGN KEY (fkComparacao) REFERENCES tempoPlanetas(idTempo),
    PRIMARY KEY (idPlaneta, fkSistema)
);
CREATE TABLE aterrissagem(
	idAterrisagem int,
    fkPlaneta int,
    dataAterrisagem datetime,
    problema char(1),
    fkTripulacao int,
    foreign key (fkTripulacao) references tripulacao(idTripulacao),
    foreign key (fkPlaneta) references planetas(idPlaneta),
    primary key (idAterrisagem)
);

select * from personagens;

INSERT INTO personagens VALUES 
(1, 'Donald Cooper', null, 68, 'durante a missão no primeiro planeta')
,(2, 'Joseph Cooper', 1, 41, null) -- tripulante2ªviagem
,(3, 'Murph Criança', 2, 10, null)
,(4, 'Murph Adulta', 2, 33, null)
,(5, 'Murph Velha', 2, 70, 'após o retorno do pai')
,(6, 'Tom Jovem', 2, 15, null)
,(7, 'Tom Adulto', 2, 38, 'antes do pai')
,(8, 'Robot TARS', null, null, null) -- tripulante2ªviagem
,(9, 'Dr. Doyle', null, 36, 'durante missão no primeiro planeta') -- tripulante2ªviagem
,(10, 'Professor John Brand', null, 68, 'após finalização da missão no primeiro planeta')
,(11, 'Amelia Brand', null, 35, null) -- tripulante2ªviagem
,(12, 'Astronauta Romilly', null, 39, 'início da missão no segundo planeta') -- tripulante2ªviagem
,(13, 'Robot CASE', null, null, 'durante a segunda missão') -- tripulante1ªviagem
,(14, 'Dr. Mann', null, 42, 'fim da segunda missão'); -- tripulante1ªviagem

INSERT INTO protagonistas VALUES ( 1, 2)
,(2, 4)
,(3, 10)
,(4, 11)
,(5, 12)
,(6, 9);

INSERT INTO tripulacao VALUES
(1, 14, null, null)
,(1, 13, 1, 14)
,(2, 2, null, null)
,(2, 8, 2, 2)
,(2, 9, 2, 2)
,(2, 11, 2, 2)
,(2, 12, 2, 2);

INSERT INTO galaxia VALUES 
(1, 'Via Láctea')
,(2, 'Desconhecida1')
,(3, 'Desconhecida2');

INSERT INTO sistema VALUES
(1, 1 ,'Sistema Solar')
,(2, 2, 'DesconhecidoX')
,(3, 3, 'DesconhecidoY');

INSERT INTO tempoPlanetas VALUES 
(1, 61320.00)
,(2, 0) -- em dúvida
,(3, 0); -- em dúvida

INSERT INTO orbita VALUES 
(1, 'Sol')
,(2, 'Gargantua')
,(3, 'Desconhecida');

INSERT INTO planetas VALUES 
(0, 1, null, 'Terra', 1)
,(2, 2, 1, 'Miller', 2)
,(3, 2, null, 'Mann', 2) -- em dúvida
,(4, 3, null, 'Edmunds', 3); -- em dúvida

INSERT INTO aterrissagem VALUES
()
,();