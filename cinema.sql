USE cinema;
-- DROP DATABASE cinema;

-- CREATE DATABASE cinema;
DROP TABLE IF EXISTS `seat_reserved`;
DROP TABLE IF EXISTS `Seat`;
DROP TABLE IF EXISTS `Reservation`;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `Screening`;
DROP TABLE IF EXISTS `theatre`;
DROP TABLE IF EXISTS `Movie`;


CREATE TABLE `User` (
    user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(256) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `theatre` (
    theatre_id INT NOT NULL AUTO_INCREMENT,
    theatre_name VARCHAR(50) NOT NULL,
    no_seats INT NOT NULL,
    PRIMARY KEY (theatre_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Seat` (
    seat_id INT NOT NULL AUTO_INCREMENT,
    row_numb CHAR(1) NOT NULL,
    seat_numb INT(1) NOT NULL,
    theatre_id INT,
    PRIMARY KEY (seat_id),
    FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id) ON DELETE SET NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Movie` (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(256) NOT NULL,
    director VARCHAR(60) NOT NULL,
    duration INT NOT NULL,
    PRIMARY KEY (movie_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Screening` (
    screening_id INT NOT NULL AUTO_INCREMENT,
    screening_date DATE NOT NULL,
    movie_id INT,
    theatre_id INT,
    PRIMARY KEY (screening_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE SET NULL,
    FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id) ON DELETE SET NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Reservation` (
    reservation_id INT NOT NULL AUTO_INCREMENT,
    reserved VARCHAR(25) NOT NULL,
    user_id INT,
    screening_id INT,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE SET NULL,
    FOREIGN KEY (screening_id) REFERENCES Screening(screening_id) ON DELETE SET NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seat_reserved` (
    seatRes_id INT NOT NULL AUTO_INCREMENT,
    seat_id INT,
    screening_id INT,
    reservation_id INT,
    PRIMARY KEY (seatRes_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id) ON DELETE SET NULL,
    FOREIGN KEY (screening_id) REFERENCES Screening(screening_id) ON DELETE SET NULL,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Movie VALUES
(1,'Top Gun', 'Tom Cruise', '120'),
(2,'Mobius', 'Someone','118');

INSERT INTO theatre VALUES
('1','Wallis 1','8'),
('2','Wallis 2','8');

INSERT INTO Seat VALUES
(1,'A', '1', '1'),
(2,'A', '2', '1'),
(3,'A', '3', '1'),
(4,'A', '4', '1'),
(5,'B', '1', '1'),
(6,'B', '2', '1'),
(7,'B', '3', '1'),
(8,'B', '4', '1'),

(9,'A', '1', '2'),
(10,'A', '2', '2'),
(11,'A', '3', '2'),
(12,'A', '4', '2'),
(13,'B', '1', '2'),
(14,'B', '2', '2'),
(15,'B', '3', '2'),
(16,'B', '4', '2');

INSERT INTO User VALUES
(1,'Tim', 'Fel', 'timfel@gmail.com', 'password'),
(2,'Tom', 'Fel', 'tomfel@gmail.com', 'passwor');

INSERT INTO Screening VALUES
(1,'2022-06-18', 1, 1),
(2,'2022-06-20', 1, 1);

INSERT INTO Reservation VALUES
(1, 'Yes', 1, 2),
(2, 'Yes', 2, 1);


INSERT INTO seat_reserved VALUES
(null, 1, 2, 1),
(null, 2, 2, 1),
(null, 5, 2, 1),
(null, 6, 2, 1),
(null, 3, 1, 2),
(null, 4, 1, 2),
(null, 1, 1, 2),
(null, 8, 1, 2);
