update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 3000;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 2500;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 2250;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 2000;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 1750;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 1500;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 1000;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 1250;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 600;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_ML" = 500;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 375;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 355;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 350;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 330;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 300;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 250;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 160;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_ML" = 150;

update browser_gtin set "PACKAGING_CD_id" = 3 where "M_FLOZ" = 20;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_FLOZ" = 24;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_FLOZ" = 16.9;
update browser_gtin set "PACKAGING_CD_id" = 3 where "M_FLOZ" = 13.2;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_FLOZ" = 16;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_FLOZ" = 12;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_FLOZ" = 10;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_FLOZ" = 8;
update browser_gtin set "PACKAGING_CD_id" = 1 where "M_FLOZ" = 7.5; 

-- Glass bottle
update browser_gtin set "PACKAGING_CD_id" = 2 where "GTIN_CD" in ('7501055301478','7894900015034','0049000065251','0049000049978','0049000018998','0049000047790','0049000004632','5449000050779','9300675036597');


-- Aluminium bottle
update browser_gtin set "PACKAGING_CD_id" = 4 where "GTIN_CD" in ('7894900013511','0049000049930','7894900703511','0049000050998');


select * from browser_gtin  where "PACKAGING_CD_id" is null

INSERT INTO browser_gs1_gcp VALUES ('5740600','5740600000004','Carlsberg Danmark A/S','Vesterfælledvej 6','','',' 1750','København V','DK','Joan Fischer','33273327','','33274711','','','','9501101020184','5740600510350','5740600','','GEPIR','2013-12-13','0');



