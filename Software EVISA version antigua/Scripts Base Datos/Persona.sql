-- Table: public."Persona"

-- DROP TABLE public."Persona";

CREATE TABLE public."Persona"
(
  nombre character varying(20) NOT NULL,
  apellido1 character varying(20) NOT NULL,
  apellido2 character varying(20) NOT NULL,
  anno integer NOT NULL,
  iniciofin character(1) NOT NULL,
  correo character varying(30),
  ocupacion character varying(20),
  residencia character varying(50),
  edad integer,
  niveleducacion character varying(30),
  telefono integer,
  cantpersonasvive integer,
  talla real,
  peso real,
  imc real,
  clasificacion character varying(20),
  cc real,
  porcmasagrasa real,
  porcagua real,
  masamuscular real,
  masaosea real,
  grasavisceral integer,
  edadmetabolica integer,
  CONSTRAINT "Persona_pkey" PRIMARY KEY (nombre, apellido1, apellido2, anno, iniciofin)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."Persona"
  OWNER TO postgres;
