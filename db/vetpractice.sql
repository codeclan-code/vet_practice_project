DROP TABLE pets;
DROP TABLE vets;
DROP TABLE pettypes;

CREATE TABLE vets (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE pettypes (
  id SERIAL8 primary key,
  pet_type VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 primary key,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  owner_name VARCHAR(255),
  owner_mobile VARCHAR(255),
  treatment_notes TEXT,
  vet_id INT8 REFERENCES vets(id) ON DELETE CASCADE,
  pet_type_id INT8 REFERENCES pettypes(id) ON DELETE CASCADE
);
