--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: browser_gs1_gcp_rc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('0', 'No error', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('1', 'Missing or invalid parameters', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('10', 'Prefix no longer subscribed', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('100', 'Return code 0, no GLN, GLN name = Spain', 'POD');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('101', 'Return code 0 but GCP assigned to GS1', 'POD');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('11', 'Country not on the GEPIR network', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('13', 'Illegal Number', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('14', 'Daily request limit exceeded', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('2', 'No record found', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('3', 'No exact match on GLN', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('4', 'Too many hits, max. 20 entries are displayed', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('5', 'Unknown country code', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('55', 'temp', 'POD');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('7', 'Request timed out', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('8', 'No catalogue exists', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('88', 'temp', 'POD');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('9', 'Company information withheld', 'GS1');
INSERT INTO browser_gs1_gcp_rc ("RETURN_CODE", "RETURN_NAME", "ORIGIN") VALUES ('99', 'Server error', 'GS1');


--
-- PostgreSQL database dump complete
--

