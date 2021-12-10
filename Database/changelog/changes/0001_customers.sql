--liquibase formatted sql
--changeset srini:create-multiple-tables splitStatements:true endDelimiter:;
INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Customer" (
"custId", "Name", "Email") VALUES (
'1'::bigint, 'Srini'::text, 'srini@sag.com'::text);
 
 INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Customer" (
"custId", "Name", "Email") VALUES (
'2'::bigint, 'Marc'::text, 'marc@sag.com'::text);
 
 INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Customer" (
"custId", "Name", "Email") VALUES (
'3'::bigint, 'David'::text, 'david@sag.com'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Customer" (
"custId", "Name", "Email") VALUES (
'4'::bigint, 'Thomas'::text, 'thomas@sag.com'::text);
 
 INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.Customer" (
"custId", "Name", "Email") VALUES (
'5'::bigint, 'Michael'::text, 'michael@sag.com'::text);