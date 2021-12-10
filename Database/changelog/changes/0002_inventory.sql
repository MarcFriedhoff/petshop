--liquibase formatted sql
--changeset srini:create-multiple-tables splitStatements:true endDelimiter:;
INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Inventory" (
"id", name,status) VALUES (
'1'::bigint, 'UglyOne'::text, 'available'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Inventory" (
"id", name,status) VALUES (
'2'::bigint, 'Awww One'::text, 'available'::text);