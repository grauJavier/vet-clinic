/* Database schema to keep the structure of entire database. */
/* MILESTONE 1 - Create animals table */
CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100) DEFAULT 'Unknown',
    date_of_birth date,
    escape_attempts int DEFAULT 0,
    neutered BOOLEAN,
    weight_kg decimal(5, 2)
);

/* MILESTONE 2 - Query and update animals table */
ALTER TABLE
    animals
ADD
    species char(20);

/* MILESTONE 3 - Query multiple tables */
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name varchar(25) DEFAULT 'Unknown',
    age int
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name varchar(20)
);

ALTER TABLE animals
    ADD PRIMARY KEY (id);

ALTER TABLE animals
    DROP COLUMN species;

ALTER TABLE animals
    ADD species_id int;

ALTER TABLE animals
    ADD CONSTRAINT fk_animals_species
    FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
    ADD owners_id int;

ALTER TABLE animals
    ADD CONSTRAINT fk_animals_owners
    FOREIGN KEY (owners_id) REFERENCES owners(id);
