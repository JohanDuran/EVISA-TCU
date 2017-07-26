-- Table: public."EstiloVida"

-- DROP TABLE public."EstiloVida";

CREATE TABLE public."EstiloVida"
(
  nombre character varying(20) NOT NULL,
  apellido1 character varying(20) NOT NULL,
  apellido2 character varying(20) NOT NULL,
  anno integer NOT NULL,
  iniciofin character(1) NOT NULL,
  medicamentos boolean,
  ejercicio boolean,
  constancia character varying(15),
  accesible boolean,
  apetito character varying(10),
  desayuno boolean,
  meriendamanana boolean,
  almuerzo boolean,
  meriendatarde boolean,
  cena boolean,
  meriendanoche boolean,
  frecuenciaembutidos character varying(15),
  frecuenciahuevos character varying(15),
  frecuenciavegetales character varying(15),
  frecuenciaensaladas character varying(15),
  frecuenciafrutas character varying(15),
  frecuenciagaseosas character varying(15),
  frecuenciareposteria character varying(15),
  frecuenciarapidas character varying(15),
  fuma boolean,
  CONSTRAINT "EstiloVida_pkey" PRIMARY KEY (nombre, apellido1, apellido2, anno, iniciofin),
  CONSTRAINT "EstiloVida_nombre_apellido1_apellido2_anno_inicioFin_fkey" FOREIGN KEY (nombre, apellido1, apellido2, anno, iniciofin)
      REFERENCES public."Persona" (nombre, apellido1, apellido2, anno, iniciofin) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."EstiloVida"
  OWNER TO postgres;
