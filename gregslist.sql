-- from the terminal run:
-- psql < gregslist.sql

DROP DATABASE IF EXISTS gregslist;

CREATE DATABASE gregslist;

\c gregslist

CREATE TABLE regions (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "regions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE users (
	"id" serial NOT NULL,
	"preferred_region" serial NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE posts (
	"id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"region_id" serial NOT NULL,
	"item_name" TEXT NOT NULL,
	"price" money NOT NULL,
	"location" TEXT NOT NULL,
	"time_posted" TIMESTAMP NOT NULL,
	CONSTRAINT "posts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE sale_categories (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"items" serial NOT NULL,
	CONSTRAINT "sale_categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("preferred_region") REFERENCES "regions"("id");

ALTER TABLE "posts" ADD CONSTRAINT "posts_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");
ALTER TABLE "posts" ADD CONSTRAINT "posts_fk1" FOREIGN KEY ("region_id") REFERENCES "regions"("id");

ALTER TABLE "sale_categories" ADD CONSTRAINT "sale_categories_fk0" FOREIGN KEY ("items") REFERENCES "posts"("id");




