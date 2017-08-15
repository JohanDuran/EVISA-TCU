use evisadb;


CREATE TABLE locations(
	id INT AUTO_INCREMENT PRIMARY KEY,
	country VARCHAR(30) NOT NULL DEFAULT 'Costa Rica',
	province VARCHAR(30) NOT NULL ,
	canton VARCHAR(30) NOT NULL ,
	district VARCHAR(30) NOT NULL ,
    UNIQUE KEY  (province, canton, district)
);



CREATE TABLE people(
	id INT AUTO_INCREMENT PRIMARY KEY,
	location_id INT NOT NULL ,
	identification VARCHAR(15) NOT NULL  UNIQUE,
	last_name VARCHAR(30) NOT NULL ,
	second_last_name VARCHAR(30),
	name VARCHAR(30) NOT NULL ,
	birth date NOT NULL ,
	cellphone VARCHAR(15),
	phone VARCHAR(15),
	whatsapp BOOLEAN,
	email VARCHAR(40),	
	facebook VARCHAR(100),	
	address VARCHAR(150),
	ebais VARCHAR(30),
	FOREIGN KEY location_id_fk (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE datasets(
	id INT AUTO_INCREMENT PRIMARY KEY,
	person_id INT NOT NULL ,
	year INT NOT NULL,
	social_security BOOLEAN,
	pregnant BOOLEAN,
	diabetes BOOLEAN,
	reported_weight DOUBLE,
	reported_height DOUBLE,
	screening_weight DOUBLE,
	screening_height DOUBLE,
	bmi	DOUBLE,
	bmi_sort VARCHAR(30),
	ia_score INT,
	sort BOOLEAN,
	screening_date date,
	observation VARCHAR(150),
	prefered_schedule VARCHAR(100),
	elegible BOOLEAN,
    UNIQUE KEY  (person_id, year),
	FOREIGN KEY person_id_fk (person_id) REFERENCES people(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE groups(
	id INT  AUTO_INCREMENT PRIMARY KEY,
	location_id INT NOT NULL ,
	name VARCHAR(30) NOT NULL ,
	year INT NOT NULL ,
	schedule VARCHAR(100),
	space INT,
    UNIQUE KEY  (location_id, name, year),
	FOREIGN KEY location_id_fk (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE people_groups(
	id INT AUTO_INCREMENT PRIMARY KEY,
	location_id INT NOT NULL ,
	group_id INT NOT NULL ,
    UNIQUE KEY  (location_id, group_id),
	FOREIGN KEY location_id_fk (location_id) REFERENCES locations(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY group_id_fk (group_id) REFERENCES groups(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE people_datasets(
	id INT AUTO_INCREMENT PRIMARY KEY,
	dataset_id INT NOT NULL ,
	person_id INT NOT NULL ,
    UNIQUE KEY  (dataset_id, person_id),
	FOREIGN KEY dataset_id_fk (dataset_id) REFERENCES datasets(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY person_id_fk (person_id) REFERENCES people(id) ON DELETE CASCADE ON UPDATE CASCADE

);