CREATE DATABASE PriceAutoSales;

USE PriceAutoSales;

CREATE TABLE users (
	id int not null,
    user_name varchar(50),
    email varchar(50),
    pwd varchar(100),
    creation_date datetime,
    user_status char,
    PRIMARY KEY (id)
);

INSERT INTO users VALUES (1, "Braulio Sandi", "brav88@hotmail.com", "Admin$1234", CURDATE(), 1);
INSERT INTO users VALUES (2, "Jason Taylor", "jtaylor@gmail.com", "Admin$1234", CURDATE(), 1);

SELECT * FROM users WHERE email = "brav88@hotmail.com" AND pwd = "Admin$1234" AND user_status = 1;

CREATE TABLE cars (
	id int not null AUTO_INCREMENT,
    brand varchar(50),
    model varchar(50),
    man_year int,
    color varchar(50),
    cc_engine varchar(50),
    fuelType varchar(50),
    mileage int,
    photo varchar(500),
    PRIMARY KEY (id)
);

INSERT INTO cars (brand, model, man_year, color, cc_engine, fuelType, mileage, photo) VALUES ("Hyundai", "Tucson", 2022, "White", "1600 Turbo", "Gasoline", 80000, "Images/1.jpg");

INSERT INTO cars (brand, model, man_year, color, cc_engine, fuelType, mileage, photo) 
	VALUES("Mitsubishi", "Montero", 2024, "Black", "2500", "Diesel", 32000, "Images/2.jpg");

SELECT * FROM cars;

DELETE FROM cars where id in (3,4,5,6,7);		