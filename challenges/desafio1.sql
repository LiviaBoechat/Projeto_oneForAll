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
  `id_planos` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(3, 2),
  PRIMARY KEY (`id_planos`)
) ENGINE = InnoDB;

INSERT INTO planos (tipo, valor) VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT AUTO_INCREMENT,
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

INSERT INTO usuarios (planos_id_planos, nome, idade, data_assinatura) VALUES
('1', 'Barbara Liskov', '82', '2019-10-20'),
('1', 'Robert Cecil Martin', '58', '2017-01-06'),
('2', 'Ada Lovelace', '37', '2017-12-30'),
('2', 'Martin Fowler', '46', '2017-01-17'),
('2', 'Sandi Metz', '58', '2018-04-29'),
('3', 'Paulo Freire', '19', '2018-02-14'),
('3', 'Bell Hooks', '26', '2018-01-05'),
('4', 'Christopher Alexander', '85', '2019-06-05'),
('4', 'Judith Butler', '45', '2020-05-13'),
('4', 'Jorge Amado', '58', '2017-02-17');


CREATE TABLE IF NOT EXISTS `historico` (
  `usuarios_id_usuario` INT NOT NULL,
  `cancoes_id_cancao` INT NOT NULL,
  `data_reproducao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`usuarios_id_usuario`, `cancoes_id_cancao`),
--   CONSTRAINT PRIMARY KEY(usuarios_id_usuario, cancoes_id_cancao)
  CONSTRAINT `fk_historico_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `SpotifyClone`.`usuarios` (`id_usuario`),
  CONSTRAINT `fk_historico_cancoes1`
    FOREIGN KEY (`cancoes_id_cancao`)
    REFERENCES `SpotifyClone`.`cancoes` (`id_cancao`)
)
ENGINE = InnoDB;

INSERT INTO historico (usuarios_id_usuario, cancoes_id_cancao, data_reproducao) VALUES 
(1, 2, '2020-05-02 05:30:35'),
(1, 8, '2022-02-28 10:45:55'),  
(1, 10, '2020-03-06 11:22:33'), 
(2, 7, '2020-01-02 07:40:33'), 
(2, 10, '2022-08-05 08:05:17'), 
(3, 2, '2020-12-05 18:38:30'), 
(3, 10, '2020-11-13 16:55:13'), 
(4, 8, '2021-08-15 17:10:10'), 
(5, 5, '2020-08-06 15:23:43'), 
(5, 8, '2022-01-09 01:44:33'), 
(6, 7, '2017-01-24 00:31:17'), 
(6, 1, '2017-10-12 12:35:20'), 
(7, 4, '2011-12-15 22:30:49'), 
(8, 4, '2012-03-17 14:56:41'), 
(9, 9, '2022-02-24 21:14:22'), 
(10, 3, '2015-12-13 08:30:22');

CREATE TABLE IF NOT EXISTS `seguindo` (
  `artista_id_artista` INT NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`artista_id_artista`, `usuarios_id_usuario`),
--   CONSTRAINT PRIMARY KEY(artista_id_artista, usuarios_id_usuario)
CONSTRAINT `fk_seguindo_artista1`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id_artista`),
CONSTRAINT `fk_seguindo_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `SpotifyClone`.`usuarios` (`id_usuario`)  
)
ENGINE = InnoDB;

INSERT INTO seguindo(artista_id_artista, usuarios_id_usuario) VALUES 
(1, 1), 
(1, 2), 
(1, 6), 
(2, 1), 
(2, 3), 
(2, 10),
(3, 1), 
(3, 2), 
(3, 9), 
(4, 4), 
(5, 5), 
(6, 5), 
(6, 6), 
(6, 7);






