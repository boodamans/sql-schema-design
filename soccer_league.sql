-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"city/region" TEXT NOT NULL,
	"current_standing" int NOT NULL,
	CONSTRAINT "teams_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE players (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"player_number" int NOT NULL UNIQUE,
	"team_id" int NOT NULL,
	"goals_scored" int NOT NULL,
	CONSTRAINT "players_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE matches (
	"id" serial NOT NULL,
	"date_and_time" timestamp with time zone NOT NULL,
	"team_1" int NOT NULL,
	"team_2" int NOT NULL,
	"score" TEXT NOT NULL,
	"referee_id" int NOT NULL,
	CONSTRAINT "matches_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE referees (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	CONSTRAINT "referees_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE seasons (
	"id" serial NOT NULL,
	"start_date" DATE NOT NULL,
	"end_date" DATE NOT NULL,
	CONSTRAINT "seasons_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "players" ADD CONSTRAINT "players_fk0" FOREIGN KEY ("team_id") REFERENCES "teams"("id");

ALTER TABLE "matches" ADD CONSTRAINT "matches_fk0" FOREIGN KEY ("team_1") REFERENCES "teams"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk1" FOREIGN KEY ("team_2") REFERENCES "teams"("id");
ALTER TABLE "matches" ADD CONSTRAINT "matches_fk2" FOREIGN KEY ("referee_id") REFERENCES "referees"("id");







