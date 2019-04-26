DROP TABLE animals;
DROP TABLE staff;


CREATE TABlE staff(
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255)
);

CREATE TABLE animals(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
dob VARCHAR(255),
type_of_animal VARCHAR(255),
owner_email VARCHAR(255),
owner_phone_number VARCHAR(255),
treatment_notes TEXT,
vet INT4 REFERENCES staff(id)
);
