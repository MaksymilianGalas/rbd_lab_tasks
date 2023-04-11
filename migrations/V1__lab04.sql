
CREATE DATABASE taxidb;
CREATE SCHEMA data;

CREATE TABLE data.user (
  user_name varchar(100),
  user_surname varchar(100),
  email varchar(100),
  phone_number varchar(100),
);

CREATE TABLE data.passenger (
  user_id int NOT NULL,
  preferred_payment_type int,
);

CREATE TABLE data.passenger_rating (
  behavior int NOT NULL,
  punctuality int NOT NULL,
  passanger_id NOT NULL,
  ride_id int UNIQUE NOT NULL
);

CREATE TABLE data.driver_rating (
  skills int NOT NULL,
  car_condition int NOT NULL,
  complying_with_regulations int NOT NULL,
  driver_id int UNIQUE NOT NULL,
  ride_id int UNIQUE NOT NULL
);

CREATE TABLE data.driver (
  photo bytea,
  user_id int UNIQUE NOT NULL
);

CREATE TABLE data.driver_car (
  registration_number varchar(25),
  colour varchar(25),
  car_id int NOT NULL,
  driver_id int NOT NULL
);

CREATE TABLE data.car (
  brand varchar(100),
  model varchar(100),
  car_id int NOT NULL,
  vehicle_type int NOT NULL
);
CREATE TABLE data.vehicle_type (
  name varchar(50) NOT NULL
);

CREATE TABLE data.car (
  brand varchar(100),
  model varchar(100),
  car_id int NOT NULL,
  vehicle_type int NOT NULL
);

CREATE TABLE data.ride (
  distance decimal NOT NULL,
  driver_id int NOT NULL,
  passanger_id int NOT NULL,
  payment_it int NOT NULL,
  driver_car int NOT NULL,
  Pickup_Address int NOT NULL,
  destination_address int NOT NULL
);

CREATE TABLE data.adress (
  street_name varchar(100) NOT NULL,
  house_number varchar(25),
  apartment_number int NOT NULL,
  zip_code varchar(25) NOT NULL,
  city varchar(25) NOT NULL,
  country varchar(25) NOT NULL,
  area_id int UNIQUE NOT NULL
);

CREATE TABLE data.payment(
    value1 money NOT NULL,
    payment_type_id int NOT NULL
);
CREATE TABLE data.payment_type(
    name1 varchar(50) NOT NULL
);
CREATE TABLE data.area(
    name1 varchar(255) NOT NULL
);



INSERT INTO data.user (user_name, user_surname, email, phone_number)
VALUES
  ('Jan', 'Kowalski', 'JanKowalski@gmail.com', '555-1234'),
  ('Włodzimierz', 'Biały', 'Heisenberg@yahoo.com', '555-5678'),
  ('Jan', 'Różowy', 'pinkman@wp.pl', '555-9012'),
  ('Hank', 'Shrader', 'DEA@usa.com', '555-3456'),
  ('Saul', 'Goodman', 'bettercall@saul.com', '555-7890');


INSERT INTO data.driver (photo, user_id)
VALUES
  ('photo1', 1),
  ('photo2', 2),
  ('photo3', 3),
  ('photo4', 4),
  ('photo5', 5);

INSERT INTO data.driver_car (registration_number, colour, car_id, driver_id)
VALUES
  ('G4 LAS', 'blue', 1, 1),
  ('GND 6785', 'black', 2, 2),
  ('GHI 789', 'green', 3, 3),
  ('JKL 012', 'black', 4, 4),
  ('MNO 345', 'white', 5, 5);


INSERT INTO data.car (brand, model, car_id, vehicle_type)
VALUES 
('BMW', 'series 1', 1, 1),
('Toyota', 'Corolla', 2, 1),
('BMW', 'X5', 3, 2),
('Audi', 'A4', 4, 2),
('Tesla', 'Model S', 5, 3);


INSERT INTO data.adress (street_name, house_number, apartment_number, zip_code, city, country, area_id)
VALUES
('ul. Kolorowa', '10A', 5, '12-345', 'Warszawa', 'Polska', 1),
('ul. Czerwona', '15B', 3, '34-567', 'Kraków', 'Polska', 2),
('ul. Zielona', '20C', 2, '56-789', 'Wrocław', 'Polska', 3),
('ul. Żółta', '5', 4, '12-345', 'Gdańsk', 'Polska', 4),
('ul. Fioletowa', '8', 1, '34-567', 'Poznań', 'Polska', 5);

INSERT INTO data.payment (value1, payment_type_id)
VALUES
(50.00, 1),
(25.50, 1),
(100.00, 2),
(12.00, 2),
(75.00, 3);

INSERT INTO data.payment_type (name1)
VALUES
('Gotówka'),
('Karta kredytowa'),
('Przelew');

INSERT INTO data.area (name1)
VALUES
('Centrum'),
('Bemowo'),
('Ursynów'),
('Praga'),
('Śródmieście');

SELECT * FROM data.car;
SELECT * FROM data.ride;
SELECT * FROM data.address;
SELECT * FROM data.payment;
SELECT * FROM data.payment_type;
SELECT * FROM data.area;
SELECT * FROM data.driver;
SELECT * FROM data.driver_car;
SELECT * FROM data.passenger_rating;
SELECT * FROM data.driver_rating;
SELECT * FROM data.passenger;
SELECT * FROM data.user;
