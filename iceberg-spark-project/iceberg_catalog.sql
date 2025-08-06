--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-1.pgdg110+1)
-- Dumped by pg_dump version 15.8 (Debian 15.8-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: iceberg_namespace; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.iceberg_namespace (
    namespace text NOT NULL,
    properties jsonb
);


ALTER TABLE public.iceberg_namespace OWNER TO admin;

--
-- Name: iceberg_namespace_properties; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.iceberg_namespace_properties (
    catalog_name character varying(255) NOT NULL,
    namespace character varying(255) NOT NULL,
    property_key character varying(255) NOT NULL,
    property_value character varying(1000)
);


ALTER TABLE public.iceberg_namespace_properties OWNER TO root;

--
-- Name: iceberg_table; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.iceberg_table (
    namespace text NOT NULL,
    name text NOT NULL,
    metadata_location text,
    previous_metadata_location text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.iceberg_table OWNER TO admin;

--
-- Name: iceberg_tables; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.iceberg_tables (
    catalog_name character varying(255) NOT NULL,
    table_namespace character varying(255) NOT NULL,
    table_name character varying(255) NOT NULL,
    metadata_location character varying(1000),
    previous_metadata_location character varying(1000)
);


ALTER TABLE public.iceberg_tables OWNER TO root;

--
-- Data for Name: iceberg_namespace; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.iceberg_namespace (namespace, properties) FROM stdin;
\.


--
-- Data for Name: iceberg_namespace_properties; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.iceberg_namespace_properties (catalog_name, namespace, property_key, property_value) FROM stdin;
\.


--
-- Data for Name: iceberg_table; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.iceberg_table (namespace, name, metadata_location, previous_metadata_location, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: iceberg_tables; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.iceberg_tables (catalog_name, table_namespace, table_name, metadata_location, previous_metadata_location) FROM stdin;
iceberg	nsdp	property_data_new	/tmp/iceberg_warehouse/nsdp/property_data_new/metadata/00000-31fcd02e-0a96-4354-8e5a-6664dabd180e.metadata.json	\N
iceberg	default	sample_table	s3a://iceberg-data/iceberg_warehouse/default/sample_table/metadata/00001-faa43daf-bfc0-4b11-9230-33bf99019da4.metadata.json	s3a://iceberg-data/iceberg_warehouse/default/sample_table/metadata/00000-b72501f8-8d73-4690-8853-5c7c9892ce0c.metadata.json
iceberg	nsdp	property_data	/tmp/iceberg_warehouse/nsdp/property_data/metadata/00005-882064c9-7a3d-41eb-b87e-27533baaa5db.metadata.json	/tmp/iceberg_warehouse/nsdp/property_data/metadata/00004-f7ab0e13-2cd6-43ef-ac77-f1bc7a508fb8.metadata.json
iceberg	nsdp	property_data_test	s3a://iceberg-data/iceberg_warehouse/nsdp/property_data_test/metadata/00001-7117260d-f7ed-4fd5-9e5f-1a79b9a18f09.metadata.json	s3a://iceberg-data/iceberg_warehouse/nsdp/property_data_test/metadata/00000-f48b657a-6f75-4b9f-ae61-302daf9f14fc.metadata.json
\.


--
-- Name: iceberg_namespace iceberg_namespace_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.iceberg_namespace
    ADD CONSTRAINT iceberg_namespace_pkey PRIMARY KEY (namespace);


--
-- Name: iceberg_namespace_properties iceberg_namespace_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iceberg_namespace_properties
    ADD CONSTRAINT iceberg_namespace_properties_pkey PRIMARY KEY (catalog_name, namespace, property_key);


--
-- Name: iceberg_table iceberg_table_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.iceberg_table
    ADD CONSTRAINT iceberg_table_pkey PRIMARY KEY (namespace, name);


--
-- Name: iceberg_tables iceberg_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.iceberg_tables
    ADD CONSTRAINT iceberg_tables_pkey PRIMARY KEY (catalog_name, table_namespace, table_name);


--
-- PostgreSQL database dump complete
--

