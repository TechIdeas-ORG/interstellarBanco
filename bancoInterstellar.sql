CREATE DATABASE interstellar;
USE interstellar;

CREATE TABLE personagens (
	idPersonagem int primary key,
    nome VARCHAR(90),
    fkPai int,
    foreign key (fkPai) REFERENCES personagens(idPersonagem)
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