DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `artista` (
  `id_artista` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_artista`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE
) ENGINE = InnoDB;

INSERT INTO artista (id_artista, nome) VALUES
('1', 'Beyoncé'),
('2', 'Queen'),
('3', 'Elis Regina'),
('4', 'Baco Exu do Blues'),
('5', 'Blind Guardian'),
('6', 'Nina Simone');


CREATE TABLE IF NOT EXISTS `album` (
  `id_album` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `ano_de_lancamento` VARCHAR(45) NULL,
  `artista_id_artista` INT,
  PRIMARY KEY (`id_album`),
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO album (id_album, nome, ano_de_lancamento) VALUES
('1', 'Renaissance', '2022'),
('2', 'Jazz', '1978'),
('3', 'Hot Space', '1982'),
('4', 'Falso Brilhante', '1998'),
('5', 'Vento de Maio', '2001'),
('6', 'QVVJFA?', '2003'),
('7', 'Somewhere Far Beyond', '2007'),
('8', 'I Put A Spell On You', '2012');

CREATE TABLE IF NOT EXISTS `cancoes` (
  `id_cancao` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `duracao` VARCHAR(45),
  `id_album` INT,
  PRIMARY KEY (`id_cancao`),
  CONSTRAINT `fk_cancoes_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO cancoes (id_cancao, nome, duracao) VALUES
('1', 'BREAK MY SOUL', '279'),
('2', "VIRGO'S GROOVE", '369'),
('3', 'ALIEN SUPERSTAR', '116'),
('4', "Don't Stop Me Now", '203'),
('5', 'Under Pressure', '152'),
('6', 'Como Nossos Pais', '105'),
('7', 'O Medo de Amar é o Medo de Ser Livre', '207'),
('8', 'Samba em Paris', '267'),
('9', "The Bard's Song", '244'),
('10', 'Feeling Good', '100');

CREATE TABLE IF NOT EXISTS `planos` (
  `id_planos` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_planos`)
) ENGINE = InnoDB;

INSERT INTO planos (id_planos, tipo, valor) VALUES
('1', 'gratuito', '0'),
('2', 'familiar', '7,99'),
('3', 'universitário', '5,99'),
('4', 'pessoal', '6,99');

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT,
  `nome` VARCHAR(45),
  `idade` VARCHAR(45),
  `data_assinatura` VARCHAR(45),
  `planos_id_planos` INT,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuarios_planos1_idx` (`planos_id_planos` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_planos1`
    FOREIGN KEY (`planos_id_planos`)
    REFERENCES `planos` (`id_planos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO usuarios (id_usuario, nome, idade, data_assinatura) VALUES
('1', 'Barbara Liskov', '82', '2019-10-20'),
('2', 'Robert Cecil Martin', '58', '2017-01-06'),
('3', 'Ada Lovelace', '37', '2017-12-30'),
('4', 'Martin Fowler', '46', '2017-01-17'),
('5', 'Sandi Metz', '58', '2018-04-29'),
('6', 'Paulo Freire', '19', '2018-02-14'),
('7', 'Bell Hooks', '26', '2018-01-05'),
('8', 'Christopher Alexander', '85', '2019-06-05'),
('9', 'Judith Butler', '45', '2020-05-13'),
('10', 'Jorge Amado', '58', '2017-02-17');


CREATE TABLE IF NOT EXISTS `historico` (
  `usuarios_id_usuario` INT NOT NULL,
  `cancoes_id_cancao` INT NOT NULL,
  CONSTRAINT PRIMARY KEY(usuarios_id_usuario, cancoes_id_cancao)
)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `seguindo` (
  `artista_id_artista` INT NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  CONSTRAINT PRIMARY KEY(artista_id_artista, usuarios_id_usuario)
)
ENGINE = InnoDB;



