-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"specialties" TEXT NOT NULL,
	"patients" int NOT NULL,
	CONSTRAINT "doctors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE patients (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"dob" DATE NOT NULL,
	"doctors" int NOT NULL,
	"diseases" int NOT NULL,
	CONSTRAINT "patients_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE diseases (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"symptoms" TEXT NOT NULL,
	CONSTRAINT "diseases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE visits (
	"id" serial NOT NULL,
	"doctor_id" int NOT NULL,
	"patient_id" int NOT NULL,
	"diagnoses" int,
	CONSTRAINT "visits_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "doctors" ADD CONSTRAINT "doctors_fk0" FOREIGN KEY ("patients") REFERENCES "patients"("id");

ALTER TABLE "patients" ADD CONSTRAINT "patients_fk0" FOREIGN KEY ("doctors") REFERENCES "doctors"("id");
ALTER TABLE "patients" ADD CONSTRAINT "patients_fk1" FOREIGN KEY ("diseases") REFERENCES "diseases"("id");


ALTER TABLE "visits" ADD CONSTRAINT "visits_fk0" FOREIGN KEY ("doctor_id") REFERENCES "doctors"("id");
ALTER TABLE "visits" ADD CONSTRAINT "visits_fk1" FOREIGN KEY ("patient_id") REFERENCES "patients"("id");
ALTER TABLE "visits" ADD CONSTRAINT "visits_fk2" FOREIGN KEY ("diagnoses") REFERENCES "diseases"("id");




