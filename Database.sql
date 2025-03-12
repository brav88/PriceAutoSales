CREATE DATABASE PriceAutoSales;

USE PriceAutoSales;

CREATE TABLE users (
	id int not null,
    user_name varchar(50),
    email varchar(50),
    phone varchar(50),
    pwd varchar(100),
    creation_date datetime,
    user_status char,
    PRIMARY KEY (id)
);

INSERT INTO users VALUES (1, "Braulio Sandi", "brav88@hotmail.com", "+50660026016", "Admin$1234", CURDATE(), 1);
INSERT INTO users VALUES (2, "Jason Taylor", "jtaylor@gmail.com", "+1 765 882634","Admin$1234", CURDATE(), 1);

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
    owner_id int,
    PRIMARY KEY (id)
);

INSERT INTO cars (brand, model, man_year, color, cc_engine, fuelType, mileage, photo, owner_id) 
	VALUES ("Hyundai", "Tucson", 2022, "White", "1600 Turbo", "Gasoline", 80000, "Images/1.jpg", 1);

INSERT INTO cars (brand, model, man_year, color, cc_engine, fuelType, mileage, photo, owner_id) 
	VALUES("Mitsubishi", "Montero", 2024, "Black", "2500", "Diesel", 32000, "Images/2.jpg", 2);


SELECT * FROM brands;
SELECT * FROM cars;
SELECT * FROM users;

DELETE FROM cars where id in (3,4,5,6,7);		

CREATE TABLE brands (
	id int not null AUTO_INCREMENT,
    name varchar(50),    
    status char,
    PRIMARY KEY (id)
);

INSERT INTO brands (name, status) VALUES("Mitsubishi", 1);
INSERT INTO brands (name, status) VALUES("Honda", 1);
INSERT INTO brands (name, status) VALUES("Toyota", 1);
INSERT INTO brands (name, status) VALUES("Suzuki", 1);
INSERT INTO brands (name, status) VALUES("Nissan", 1);
INSERT INTO brands (name, status) VALUES("BMW", 1);
INSERT INTO brands (name, status) VALUES("Jeep", 1);
INSERT INTO brands (name, status) VALUES("Audi", 1);
INSERT INTO brands (name, status) VALUES("Citroen", 1);
INSERT INTO brands (name, status) VALUES("Ford", 1);
INSERT INTO brands (name, status) VALUES("Tesla", 1);
INSERT INTO brands (name, status) VALUES("Lamborghini", 1);
INSERT INTO brands (name, status) VALUES("Porsche", 1);
INSERT INTO brands (name, status) VALUES("Hyundai", 1);

CREATE TABLE models (
	id int not null AUTO_INCREMENT,
    name varchar(50),    
    status char,
    PRIMARY KEY (id)
);

INSERT INTO models (name, status) VALUES("Montero Sport", 1);
INSERT INTO models (name, status) VALUES("Civic Type R", 1);
INSERT INTO models (name, status) VALUES("Supra", 1);
INSERT INTO models (name, status) VALUES("Grand Vitara", 1);
INSERT INTO models (name, status) VALUES("GTR Skyline", 1);
INSERT INTO models (name, status) VALUES("M3", 1);
INSERT INTO models (name, status) VALUES("Gladiator", 1);
INSERT INTO models (name, status) VALUES("R8", 1);
INSERT INTO models (name, status) VALUES("Citroen", 1);
INSERT INTO models (name, status) VALUES("Raptor", 1);
INSERT INTO models (name, status) VALUES("Cybertruck", 1);
INSERT INTO models (name, status) VALUES("Huracan", 1);
INSERT INTO models (name, status) VALUES("911", 1);
INSERT INTO models (name, status) VALUES("Tucson", 1);

CREATE TABLE fuelType (
	id int not null AUTO_INCREMENT,
    name varchar(50),    
    status char,
    PRIMARY KEY (id)
);

INSERT INTO fuelType (name, status) VALUES("Gasoline", 1);
INSERT INTO fuelType (name, status) VALUES("Diesel", 1);
INSERT INTO fuelType (name, status) VALUES("Electric", 1);
INSERT INTO fuelType (name, status) VALUES("Hybrid", 1);
INSERT INTO fuelType (name, status) VALUES("Hydrogen", 1);

SELECT * FROM cars INNER JOIN users ON cars.owner_id = users.id WHERE cars.id = 1;

UPDATE cars SET man_year = 2023, color = 'Black', cc_engine = 2000, fuelType = 'Diesel', mileage = 24000 WHERE id = 1;


