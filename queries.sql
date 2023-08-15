/*Queries that provide answers to the questions from all projects.*/

/* MILESTONE 1 - Create animals table */
SELECT * FROM animals WHERE name LIKE '%___mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE (name = 'Agumon' OR name = 'Pikachu');
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND  weight_kg <= 17.3;

/* MILESTONE 2 - Query and update animals table */
BEGIN;
UPDATE animals
    SET species = 'unespecified';
ROLLBACK;

BEGIN;
UPDATE animals
    SET species = 'digimon'
    WHERE name LIKE '%___mon';
UPDATE animals
    SET species = 'pokemon'
    WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
    WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
    SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
    SET weight_kg = weight_kg * -1
    WHERE weight_kg < 0;
COMMIT;

/* How many animals are there? */
SELECT COUNT(id) AS animal_count FROM animals;

/* How many animals have never tried to escape? */
SELECT COUNT(id) AS neutered_count FROM animals
    WHERE neutered = false;

/* What is the average weight of animals? */
SELECT AVG(weight_kg) AS avg_weigth_kg FROM animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT neutered, MAX(escape_attempts) AS max_esc_attempts
    FROM animals
    GROUP BY neutered
    ORDER BY max_esc_attempts DESC;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species,
    MIN(weight_kg) AS min_weight,
    MAX(weight_kg) AS max_weight
    FROM animals
    GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species,
    AVG(escape_attempts) AS avg_esc_attempts
    FROM animals
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
    GROUP BY species;