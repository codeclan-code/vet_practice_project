DROP TABLE pets;
DROP TABLE vets;
DROP TABLE pettypes;
DROP TABLE owners;

CREATE TABLE vets (
  id SERIAL8 primary key,
  name VARCHAR(255),
  mobile VARCHAR(255)
);

CREATE TABLE pettypes (
  id SERIAL8 primary key,
  pet_type VARCHAR(255),
  pet_image VARCHAR(255)
);

CREATE TABLE owners (
  id SERIAL8 primary key,
  name VARCHAR(255),
  mobile VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 primary key,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  treatment_notes TEXT,
  vet_id INT8 REFERENCES vets(id),
  pet_type_id INT8 REFERENCES pettypes(id),
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE
);
