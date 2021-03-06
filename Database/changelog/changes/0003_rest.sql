--liquibase formatted sql
--changeset srini:create-multiple-tables splitStatements:true endDelimiter:;
INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.category" (
"id", "name") VALUES (
'1'::bigint, 'Cat'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.category" (
"id", "name") VALUES (
'2'::bigint, 'Cat'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.photoUrls" (
"id", "urls") VALUES (
'1'::bigint, 'https://cdn.vox-cdn.com/thumbor/KyRSPWoF3KfbCMH2xpevf1pshoA=/0x0:2560x1536/1220x813/filters:focal(1076x564:1484x972):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69113629/fake_cats.0.jpg'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.photoUrls" (
"id", "urls") VALUES (
'2'::bigint, 'https://cdn.vox-cdn.com/thumbor/KyRSPWoF3KfbCMH2xpevf1pshoA=/0x0:2560x1536/1220x813/filters:focal(1076x564:1484x972):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69113629/fake_cats.0.jpg'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.photoUrls" (
"id", "urls") VALUES (
'1'::bigint, 'https://cdn.vox-cdn.com/thumbor/KyRSPWoF3KfbCMH2xpevf1pshoA=/0x0:2560x1536/1220x813/filters:focal(1076x564:1484x972):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69113629/fake_cats.0.jpg'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.photoUrls" (
"id", "urls") VALUES (
'2'::bigint, 'https://cdn.vox-cdn.com/thumbor/KyRSPWoF3KfbCMH2xpevf1pshoA=/0x0:2560x1536/1220x813/filters:focal(1076x564:1484x972):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/69113629/fake_cats.0.jpg'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.tags" (
"id", "name") VALUES (
'1'::bigint, 'Ugly'::text);

INSERT INTO "PetShop_EEBoys"."PetShop_EEBoys.tags" (
"id", "name") VALUES (
'2'::bigint, 'Awww'::text);

