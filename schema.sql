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
ALTER TABLE animals
ADD species char(20);