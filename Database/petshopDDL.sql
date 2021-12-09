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
-- ddl-end --
-- Table: PetShop_EEBoys.PetShop_EEBoys.Inventory

-- DROP TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Inventory";

CREATE TABLE IF NOT EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Inventory"
(
    "petId" bigint NOT NULL,
    inventory bigint,
    CONSTRAINT "PetShop_EEBoys.Inventory_pkey" PRIMARY KEY ("petId")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS "PetShop_EEBoys"."PetShop_EEBoys.Inventory"
    OWNER to postgres;
-- ddl-end --


