

INSERT INTO browser_Gtin2 ("GTIN_CD", "GCP_CD", "BSIN", "CAT_CD", "PKG_UNIT", "PACKAGING_CD", "METHOD_CD", "SIZE_CD", "GRADE_CD", "COLOR_CD", "FED_CD", "LABEL_CD")
SELECT "GTIN_CD", "GCP_CD", "BSIN", "CAT_CD", "PKG_UNIT", "PACKAGING_CD", "METHOD_CD", "SIZE_CD", "GRADE_CD", "COLOR_CD", "FED_CD", "LABEL_CD"
FROM browser_Gtin

INSERT INTO browser_Gtin2 ("GTIN_CD", "GCP_CD_id", "BSIN_id", "CAT_CD_id", "PKG_UNIT", "PACKAGING_CD_id", "METHOD_CD_id", "SIZE_CD_id", "GRADE_CD_id", "COLOR_CD_id", "FED_CD_id")
SELECT "GTIN_CD", "GCP_CD_id", "BSIN_id", "CAT_CD_id", "PKG_UNIT", "PACKAGING_CD_id", "METHOD_CD_id", "SIZE_CD_id", "GRADE_CD_id", "COLOR_CD_id", "FED_CD_id"
FROM browser_Gtin

select * from browser_Gtin2
delete from browser_Gtin
delete from "browser_gtin_LABEL_CD"

select * from "browser_gtin_LABEL_CD"
select * from "browser_gtin_LABEL_CD2"
ALTER TABLE "browser_gtin_LABEL_CD2" ADD COLUMN gtin_id2 integer;



UPDATE  "browser_gtin_LABEL_CD2"
SET "gtin_id2" = "browser_gtin2"."GTIN_ID"
FROM "browser_gtin2"
WHERE "browser_gtin2"."GTIN_CD" = "browser_gtin_LABEL_CD2"."gtin_id"


select * from browser_Gtin
select * from "browser_gtin_LABEL_CD"

INSERT INTO eggs.browser_Gtin
   (
      SELECT * FROM browser_Gtin
   );