DROP TABLE pets;
DROP TABLE vets;

CREATE TABLE vets (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 primary key,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  type_of_pet VARCHAR(255),
  owner_name VARCHAR(255),
  owner_mobile VARCHAR(255)
  vet_id INT8 REFERENCES vets(id)
);
