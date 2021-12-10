-- SET check_function_bodies = false;
-- ddl-end --

-- object: PetShop_EEBoys | type: SCHEMA --
-- DROP SCHEMA PetShop_EEBoys CASCADE;
CREATE SCHEMA IF NOT EXISTS "PetShop_EEBoys"
    AUTHORIZATION postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,PetShop_EEBoys;
-- ddl-end --

-- Table: PetShop_EEBoys.PetShop_EEBoys.Customer

-- DROP TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Customer";

CREATE TABLE IF NOT EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Customer"
(
    "custId" bigint NOT NULL,
    "Name" text COLLATE pg_catalog."default",
    "Email" text COLLATE pg_catalog."default",
    CONSTRAINT pk_customer_id PRIMARY KEY ("custId")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Customer"
    OWNER to postgres;
	
-- Table: PetShop_EEBoys.PetShop_EEBoys.Inventory

-- DROP TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Inventory";

CREATE TABLE IF NOT EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Inventory"
(
    id bigint NOT NULL,
    name text COLLATE pg_catalog."default",
    status text COLLATE pg_catalog."default",
    "photoUrls" text[] COLLATE pg_catalog."default",
    CONSTRAINT "PetShop_EEBoys.Inventory_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Inventory"
    OWNER to postgres;
	

-- Table: PetShop_EEBoys.PetShop_EEBoys.category

-- DROP TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.category";

CREATE TABLE IF NOT EXISTS "PetShop_EEBoys"."PetShop_EEBoys.category"
(
    id bigint NOT NULL,
    name text COLLATE pg_catalog."default",
    CONSTRAINT """PetShop_EEBoys.category_pkey""" PRIMARY KEY (id),
    CONSTRAINT "PetShop_EEBoys.category_fk" FOREIGN KEY (id)
        REFERENCES "PetShop_EEBoys"."PetShop_EEBoys.Inventory" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.category"
    OWNER to postgres;
-- ddl-end --




-- Table: PetShop_EEBoys.PetShop_EEBoys.tags

-- DROP TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.tags";

CREATE TABLE IF NOT EXISTS "PetShop_EEBoys"."PetShop_EEBoys.tags"
(
    id bigint NOT NULL,
    name text COLLATE pg_catalog."default",
    CONSTRAINT "PetShop_EEBoys.tags_fk" FOREIGN KEY (id)
        REFERENCES "PetShop_EEBoys"."PetShop_EEBoys.Inventory" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.tags"
    OWNER to postgres;
-- ddl-end --


-- Table: PetShop_EEBoys.PetShop_EEBoys.photoUrls

-- DROP TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.photoUrls";

CREATE TABLE IF NOT EXISTS "PetShop_EEBoys"."PetShop_EEBoys.photoUrls"
(
    id bigint,
    urls text COLLATE pg_catalog."default",
    CONSTRAINT "PetShop_EEBoys.phtotoUrls_fk" FOREIGN KEY (id)
        REFERENCES "PetShop_EEBoys"."PetShop_EEBoys.Inventory" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.photoUrls"
    OWNER to postgres;

-- ddl-end --
