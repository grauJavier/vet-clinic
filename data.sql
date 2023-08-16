/* Populate database with sample data. */

/* MILESTONE 1 - Create animals table */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, true, 10.23),
       ('Gabumon', '2018-11-15', 2, true, 8),
       ('Pikachu', '2021-01-7', 1, false, 15.04),
       ('Devimon', '2017-05-12', 5, false, 11);

/* MILESTONE 2 - Query and update animals table */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '2020-02-08', 0, false, -11),
       ('Plantmon', '2021-11-15', 2, true, -5.7),
       ('Squirtle', '1993-04-02', 3, false, -12.13),
       ('Angemon', '2005-06-12', 1, true, -45),
       ('Boarmon', '2005-06-07', 7, true, 20.4),
       ('Blossom', '1998-10-13', 3, true, 17),
       ('Ditto', '2022-05-14', 4, true, 22);

/* MILESTONE 3 - Query multiple tables */
INSERT INTO owners (full_name, age)
       VALUES ('Sam Smith', 34),
              ('Jennifer Orwell', 19),
              ('Bob', 45),
              ('Melody Pond', 77),
              ('Dean Winchester', 14),
              ('Jodie Whittaker', 38);

INSERT INTO species (name)
       VALUES ('Pokemon'),
              ('Digimon');

BEGIN;
UPDATE animals
    SET species_id = 2
    WHERE name LIKE '%___mon';
UPDATE animals
    SET species_id = 1
    WHERE species_id IS NULL;
COMMIT;

BEGIN;
UPDATE animals
    SET owners_id = 1
    WHERE animals.name = 'Agumon';
SAVEPOINT sp1;
UPDATE animals
    SET owners_id = 2
    WHERE animals.name = 'Gabumon'
	OR animals.name = 'Pikachu';
SAVEPOINT sp2;
UPDATE animals
    SET owners_id = 3
    WHERE animals.name = 'Devimon'
	OR animals.name = 'Plantmon'
SAVEPOINT sp3;
UPDATE animals
    SET owners_id = 4
    WHERE animals.name = 'Charmander'
	OR animals.name = 'Squirtle'
	OR animals.name = 'Blossom';
SAVEPOINT sp4;
UPDATE animals
    SET owners_id = 5
    WHERE animals.name = 'Angemon'
	OR animals.name = 'Boarmon';
COMMIT;