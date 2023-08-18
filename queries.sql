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

-- How many animals are there?
SELECT COUNT(id) AS animal_count FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(animals.id) AS amount_of_animals_never_escaped
    FROM animals
    WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) AS avg_weigth_kg FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) AS max_esc_attempts
    FROM animals
    GROUP BY neutered
    ORDER BY max_esc_attempts DESC;

-- What is the minimum and maximum weight of each type of animal?
SELECT 
    species,
    MIN(weight_kg) AS min_weight,
    MAX(weight_kg) AS max_weight
    FROM animals
    GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT 
    species,
    AVG(escape_attempts) AS avg_esc_attempts
    FROM animals
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
    GROUP BY species;

/* MILESTONE 3 - Query multiple tables */
-- What animals belong to Melody Pond?
SELECT 
    owners.full_name AS owner, 
	STRING_AGG(animals.name, ', ') AS pokemons
    FROM owners
    JOIN animals ON owners_id = owners.id
    WHERE full_name = 'Melody Pond'
	GROUP BY owner;

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name AS pokemons
    FROM animals
    JOIN species ON species_id = species.id
    WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT 
    full_name AS owner, 
    STRING_AGG(animals.name, ', ') AS pokemons
    FROM owners
    LEFT JOIN animals ON owners.id = owners_id
    GROUP BY owners.full_name;

-- How many animals are there per species?
SELECT 
    species.name AS animal_type,
    COUNT(animals.species_id) AS amount
    FROM species
    JOIN animals ON species.id = species_id
    GROUP BY animal_type;

-- List all Digimon owned by Jennifer Orwell.
SELECT 
    owners.full_name AS owner,
    animals.name AS digimons
    FROM owners
    JOIN animals ON owners.id = owners_id
    JOIN species ON species.id = species_id
    WHERE owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT 
    animals.name AS Mr_Winchester_pets,
    animals.escape_attempts
    FROM animals
    JOIN owners ON owners_id = owners.id
    WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT 
    owners.full_name AS owners,
    COUNT(animals.owners_id) AS pets_amount
    FROM owners
    LEFT JOIN animals ON owners.id = owners_id
    GROUP BY owners
    ORDER BY pets_amount DESC;

/* MILESTONE 3 - Query multiple tables */
-- Who was the last animal seen by William Tatcher?
SELECT 
    vets.name AS veterinarian, 
    animals.name AS patient, 
    visits.visit_date 
	FROM visits
	JOIN animals ON animals.id = animals_id
	JOIN vets ON vets.id = vets_id 
	WHERE vets.name = 'William Tatcher'
	GROUP BY vets.name, animals.name, visits.visit_date
	ORDER BY visit_date DESC
	LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT 
    vets.name AS veterinarian, 
    COUNT(animals.name) AS patient_amount
	FROM visits
	JOIN vets ON vets.id = vets_id
	JOIN animals ON animals.id = animals_id
	WHERE vets.name = 'Stephanie Mendez'
	GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT 
    vets.name AS veterinarian,
	STRING_AGG(species.name, ', ') AS speciality
	FROM specializations
	RIGHT JOIN vets ON vets_id = vets.id
	LEFT JOIN species ON species.id = species_id
	GROUP BY vets.name
	ORDER BY vets.name;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT 
    vets.name AS veterinarian, 
	animals.name AS patient,
	visits.visit_date
	FROM visits
	JOIN vets ON vets_id = vets.id
	JOIN animals ON animals_id = animals.id
	WHERE vets.name = 'Stephanie Mendez'
		AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT 
    animals.name AS patient,
	COUNT(visit_date) AS visit_amount 
	FROM visits
	JOIN animals ON animals_id = animals.id
	GROUP BY animals.name
	ORDER BY visit_amount DESC
	LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT 
    vets.name AS veterinarian,
	animals.name AS patient,
	visits.visit_date
	FROM visits
	JOIN vets ON vets_id = vets.id
	JOIN animals ON animals_id = animals.id
	WHERE vets.name = 'Maisy Smith'
	ORDER BY visit_date
	LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT 
	animals.name AS patient_name,
	animals.date_of_birth AS patient_birthdate,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg,
	species.name AS species,
	owners.full_name AS patient_owner,
	vets.name AS vet_name,
	vets.age AS vet_age,
	vets.date_of_graduation AS vet_grad_date,
	visits.visit_date
	FROM visits
	JOIN animals ON animals_id = animals.id
	JOIN species ON species_id = species.id
	JOIN owners ON owners_id = owners.id
	JOIN vets ON vets_id = vets.id
	ORDER BY visits.visit_date DESC
	LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT 
	vets.name AS veterinarian,
	species.name AS speciality,
	COUNT(visits.visit_date) AS visit_amount
	FROM visits, specializations
	RIGHT JOIN vets ON vets_id = vets.id
	LEFT JOIN species ON specializations.species_id = species.id
	WHERE vets.id NOT IN (
		SELECT specializations.vets_id FROM specializations
	)
		AND vets.id = visits.vets_id
	GROUP BY vets.name, species.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT 	
	vets.name AS veterinarian,
	COUNT(CASE WHEN species.name = 'Pokemon' THEN 1 ELSE NULL END) AS pokemon_visit_amount,
	COUNT(CASE WHEN species.name = 'Digimon' THEN 1 ELSE NULL END) AS digimon_visit_amount
	FROM visits
	
-- Allows me to filter 'visits' by vets.name
	JOIN vets ON vets_id = vets.id
	
-- Allows me to get the species_id from the animals_id provided by 'visits'
	JOIN animals ON animals_id = animals.id

-- Allows me to name the species_id provided by 'animals'
	JOIN species ON species_id = species.id

	WHERE vets.name = 'Maisy Smith'
	GROUP BY vets.name;