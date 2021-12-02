--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE thefooturelab;




--
-- Drop roles
--

DROP ROLE danieletwopointzero;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE danieletwopointzero;
ALTER ROLE danieletwopointzero WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'password';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE thefooturelab WITH TEMPLATE = template0 OWNER = mario;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect thefooturelab

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ContractMonitoring; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."ContractMonitoring" (
    contract_ptr_id integer NOT NULL
);


ALTER TABLE public."ContractMonitoring" OWNER TO danieletwopointzero;

--
-- Name: TagCombinationSet; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."TagCombinationSet" (
    id integer NOT NULL,
    created_on timestamp with time zone,
    name character varying(255) NOT NULL,
    value double precision,
    created_by_id integer
);


ALTER TABLE public."TagCombinationSet" OWNER TO danieletwopointzero;

--
-- Name: TagCombinationSet_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."TagCombinationSet_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TagCombinationSet_id_seq" OWNER TO danieletwopointzero;

--
-- Name: TagCombinationSet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."TagCombinationSet_id_seq" OWNED BY public."TagCombinationSet".id;


--
-- Name: TagCombinationSet_tagCombinations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."TagCombinationSet_tagCombinations" (
    id integer NOT NULL,
    tagcombinationset_id integer NOT NULL,
    tagcombinationtoversion_id integer NOT NULL
);


ALTER TABLE public."TagCombinationSet_tagCombinations" OWNER TO danieletwopointzero;

--
-- Name: TagCombinationSet_tagCombinations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."TagCombinationSet_tagCombinations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TagCombinationSet_tagCombinations_id_seq" OWNER TO danieletwopointzero;

--
-- Name: TagCombinationSet_tagCombinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."TagCombinationSet_tagCombinations_id_seq" OWNED BY public."TagCombinationSet_tagCombinations".id;


--
-- Name: TagCombinations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."TagCombinations" (
    id integer NOT NULL,
    created_on timestamp with time zone,
    name character varying(255) NOT NULL,
    description text,
    created_by_id integer
);


ALTER TABLE public."TagCombinations" OWNER TO danieletwopointzero;

--
-- Name: TagCombinations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."TagCombinations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TagCombinations_id_seq" OWNER TO danieletwopointzero;

--
-- Name: TagCombinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."TagCombinations_id_seq" OWNED BY public."TagCombinations".id;


--
-- Name: TagCombinations_tags; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."TagCombinations_tags" (
    id integer NOT NULL,
    tagcombination_id integer NOT NULL,
    tag_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public."TagCombinations_tags" OWNER TO danieletwopointzero;

--
-- Name: TagCombinations_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."TagCombinations_tags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TagCombinations_tags_id_seq" OWNER TO danieletwopointzero;

--
-- Name: TagCombinations_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."TagCombinations_tags_id_seq" OWNED BY public."TagCombinations_tags".id;


--
-- Name: Versions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."Versions" (
    id integer NOT NULL,
    created_on timestamp with time zone,
    name character varying(255) NOT NULL,
    "isBlocked" boolean NOT NULL,
    add_version boolean NOT NULL,
    update_version boolean NOT NULL,
    delete_version boolean NOT NULL,
    created_by_id integer
);


ALTER TABLE public."Versions" OWNER TO danieletwopointzero;

--
-- Name: Versions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."Versions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Versions_id_seq" OWNER TO danieletwopointzero;

--
-- Name: Versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."Versions_id_seq" OWNED BY public."Versions".id;


--
-- Name: agencies; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.agencies (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    phone character varying(255),
    email character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.agencies OWNER TO danieletwopointzero;

--
-- Name: agencies_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.agencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agencies_id_seq OWNER TO danieletwopointzero;

--
-- Name: agencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.agencies_id_seq OWNED BY public.agencies.id;


--
-- Name: agents; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.agents (
    id integer NOT NULL,
    last_name character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    profile_image character varying(200),
    date_of_birth date,
    phone character varying(255),
    email character varying(255) NOT NULL,
    company_id integer,
    created_by_id integer,
    place_of_birth_id integer
);


ALTER TABLE public.agents OWNER TO danieletwopointzero;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.agents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO danieletwopointzero;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;


--
-- Name: agents_nationalities; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.agents_nationalities (
    id integer NOT NULL,
    agent_id integer NOT NULL,
    nation_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public.agents_nationalities OWNER TO danieletwopointzero;

--
-- Name: agents_nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.agents_nationalities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_nationalities_id_seq OWNER TO danieletwopointzero;

--
-- Name: agents_nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.agents_nationalities_id_seq OWNED BY public.agents_nationalities.id;


--
-- Name: analysis; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.analysis (
    id integer NOT NULL,
    description character varying(255),
    title character varying(255),
    subtitle character varying(255),
    user_id integer
);


ALTER TABLE public.analysis OWNER TO danieletwopointzero;

--
-- Name: analysis_graphs; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.analysis_graphs (
    id integer NOT NULL,
    analysis_id integer NOT NULL,
    graph_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public.analysis_graphs OWNER TO danieletwopointzero;

--
-- Name: analysis_graphs_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.analysis_graphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analysis_graphs_id_seq OWNER TO danieletwopointzero;

--
-- Name: analysis_graphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.analysis_graphs_id_seq OWNED BY public.analysis_graphs.id;


--
-- Name: analysis_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analysis_id_seq OWNER TO danieletwopointzero;

--
-- Name: analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.analysis_id_seq OWNED BY public.analysis.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO danieletwopointzero;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO danieletwopointzero;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO danieletwopointzero;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO danieletwopointzero;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO danieletwopointzero;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO danieletwopointzero;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO danieletwopointzero;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO danieletwopointzero;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO danieletwopointzero;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO danieletwopointzero;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO danieletwopointzero;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO danieletwopointzero;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    region character varying(255),
    created_by_id integer,
    nation_id integer
);


ALTER TABLE public.cities OWNER TO danieletwopointzero;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO danieletwopointzero;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: coaches; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.coaches (
    id integer NOT NULL,
    last_name character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    profile_image character varying(200),
    date_of_birth date,
    agency_id integer,
    created_by_id integer,
    place_of_birth_id integer
);


ALTER TABLE public.coaches OWNER TO danieletwopointzero;

--
-- Name: coaches_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.coaches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coaches_id_seq OWNER TO danieletwopointzero;

--
-- Name: coaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.coaches_id_seq OWNED BY public.coaches.id;


--
-- Name: coaches_nationalities; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.coaches_nationalities (
    id integer NOT NULL,
    coach_id integer NOT NULL,
    nation_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public.coaches_nationalities OWNER TO danieletwopointzero;

--
-- Name: coaches_nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.coaches_nationalities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coaches_nationalities_id_seq OWNER TO danieletwopointzero;

--
-- Name: coaches_nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.coaches_nationalities_id_seq OWNED BY public.coaches_nationalities.id;


--
-- Name: competitionTypes; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."competitionTypes" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public."competitionTypes" OWNER TO danieletwopointzero;

--
-- Name: competitionTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."competitionTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."competitionTypes_id_seq" OWNER TO danieletwopointzero;

--
-- Name: competitionTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."competitionTypes_id_seq" OWNED BY public."competitionTypes".id;


--
-- Name: competitions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.competitions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    start date NOT NULL,
    "end" date NOT NULL,
    "competitionType_id" integer NOT NULL,
    federation_id integer
);


ALTER TABLE public.competitions OWNER TO danieletwopointzero;

--
-- Name: competitions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.competitions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competitions_id_seq OWNER TO danieletwopointzero;

--
-- Name: competitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.competitions_id_seq OWNED BY public.competitions.id;


--
-- Name: constitutions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.constitutions (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.constitutions OWNER TO danieletwopointzero;

--
-- Name: constitutions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.constitutions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constitutions_id_seq OWNER TO danieletwopointzero;

--
-- Name: constitutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.constitutions_id_seq OWNED BY public.constitutions.id;


--
-- Name: continents; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.continents (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.continents OWNER TO danieletwopointzero;

--
-- Name: continents_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.continents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continents_id_seq OWNER TO danieletwopointzero;

--
-- Name: continents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.continents_id_seq OWNED BY public.continents.id;


--
-- Name: contractScouting; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."contractScouting" (
    contract_ptr_id integer NOT NULL
);


ALTER TABLE public."contractScouting" OWNER TO danieletwopointzero;

--
-- Name: contracts; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    start date NOT NULL,
    "end" date NOT NULL,
    created_by_id integer,
    customer_id integer NOT NULL
);


ALTER TABLE public.contracts OWNER TO danieletwopointzero;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO danieletwopointzero;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: tagCombinationControTags; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."tagCombinationControTags" (
    id integer NOT NULL,
    created_on timestamp with time zone,
    contro_tag_id integer NOT NULL,
    created_by_id integer,
    tag_combination_id integer NOT NULL
);


ALTER TABLE public."tagCombinationControTags" OWNER TO danieletwopointzero;

--
-- Name: tagCombinationToVersions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."tagCombinationToVersions" (
    id integer NOT NULL,
    created_on timestamp with time zone,
    value double precision,
    created_by_id integer,
    "tagCombination_id" integer NOT NULL,
    version_id integer NOT NULL
);


ALTER TABLE public."tagCombinationToVersions" OWNER TO danieletwopointzero;

--
-- Name: controtag; Type: VIEW; Schema: public; Owner: danieletwopointzero
--

CREATE VIEW public.controtag AS
 SELECT version1.id AS version1_id,
    version1.value AS version1_value,
    version1.version_id AS version,
    tagcomb1.id AS tagcomb1_id,
    tagcomb1.name AS tagcomb1_name,
    version2.id AS version2_id,
    version2.value AS version2_value,
    tagcomb2.id AS tagcomb2_id,
    tagcomb2.name AS tagcomb2_name
   FROM ((((public."tagCombinationControTags" contro
     LEFT JOIN public."tagCombinationToVersions" version1 ON ((contro.contro_tag_id = version1.id)))
     LEFT JOIN public."tagCombinationToVersions" version2 ON ((contro.tag_combination_id = version2.id)))
     LEFT JOIN public."TagCombinations" tagcomb1 ON ((version1."tagCombination_id" = tagcomb1.id)))
     LEFT JOIN public."TagCombinations" tagcomb2 ON ((version2."tagCombination_id" = tagcomb2.id)));


ALTER TABLE public.controtag OWNER TO danieletwopointzero;

--
-- Name: customerToUser; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."customerToUser" (
    id integer NOT NULL,
    created_by_id integer,
    customer_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."customerToUser" OWNER TO danieletwopointzero;

--
-- Name: customerToUser_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."customerToUser_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."customerToUser_id_seq" OWNER TO danieletwopointzero;

--
-- Name: customerToUser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."customerToUser_id_seq" OWNED BY public."customerToUser".id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255),
    email character varying(255) NOT NULL,
    created_by_id integer,
    user_reference_id integer
);


ALTER TABLE public.customers OWNER TO danieletwopointzero;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO danieletwopointzero;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: dashboard_userdashboardmodule; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.dashboard_userdashboardmodule (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    module character varying(255) NOT NULL,
    app_label character varying(255),
    "user" integer NOT NULL,
    "column" integer NOT NULL,
    "order" integer NOT NULL,
    settings text NOT NULL,
    children text NOT NULL,
    collapsed boolean NOT NULL,
    CONSTRAINT dashboard_userdashboardmodule_column_check CHECK (("column" >= 0)),
    CONSTRAINT dashboard_userdashboardmodule_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.dashboard_userdashboardmodule OWNER TO danieletwopointzero;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.dashboard_userdashboardmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_userdashboardmodule_id_seq OWNER TO danieletwopointzero;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.dashboard_userdashboardmodule_id_seq OWNED BY public.dashboard_userdashboardmodule.id;


--
-- Name: data; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.data (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    data_inheritance_id integer,
    user_id integer
);


ALTER TABLE public.data OWNER TO danieletwopointzero;

--
-- Name: data_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_id_seq OWNER TO danieletwopointzero;

--
-- Name: data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.data_id_seq OWNED BY public.data.id;


--
-- Name: data_tag_combinations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.data_tag_combinations (
    id integer NOT NULL,
    data_id integer NOT NULL,
    tagcombination_id integer NOT NULL
);


ALTER TABLE public.data_tag_combinations OWNER TO danieletwopointzero;

--
-- Name: data_tag_combinations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.data_tag_combinations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_tag_combinations_id_seq OWNER TO danieletwopointzero;

--
-- Name: data_tag_combinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.data_tag_combinations_id_seq OWNED BY public.data_tag_combinations.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO danieletwopointzero;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO danieletwopointzero;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO danieletwopointzero;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO danieletwopointzero;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO danieletwopointzero;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO danieletwopointzero;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO danieletwopointzero;

--
-- Name: events; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.events (
    id integer NOT NULL,
    start_event integer NOT NULL,
    end_event integer NOT NULL,
    note text,
    created_by_id integer,
    match_id integer NOT NULL,
    period_id integer NOT NULL,
    player_id integer,
    team_id integer NOT NULL,
    CONSTRAINT events_end_event_check CHECK ((end_event >= 0)),
    CONSTRAINT events_start_event_check CHECK ((start_event >= 0))
);


ALTER TABLE public.events OWNER TO danieletwopointzero;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO danieletwopointzero;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: events_tagCombinations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."events_tagCombinations" (
    id integer NOT NULL,
    event_id integer NOT NULL,
    tagcombinationtoversion_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public."events_tagCombinations" OWNER TO danieletwopointzero;

--
-- Name: events_tagCombinations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."events_tagCombinations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."events_tagCombinations_id_seq" OWNER TO danieletwopointzero;

--
-- Name: events_tagCombinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."events_tagCombinations_id_seq" OWNED BY public."events_tagCombinations".id;


--
-- Name: federations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.federations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    object_id integer,
    content_type_id integer,
    created_by_id integer,
    CONSTRAINT federations_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.federations OWNER TO danieletwopointzero;

--
-- Name: federations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.federations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.federations_id_seq OWNER TO danieletwopointzero;

--
-- Name: federations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.federations_id_seq OWNED BY public.federations.id;


--
-- Name: footedness; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.footedness (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.footedness OWNER TO danieletwopointzero;

--
-- Name: footedness_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.footedness_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footedness_id_seq OWNER TO danieletwopointzero;

--
-- Name: footedness_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.footedness_id_seq OWNED BY public.footedness.id;


--
-- Name: formationToRoles; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."formationToRoles" (
    id integer NOT NULL,
    url_image character varying(200),
    created_by_id integer,
    formation_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public."formationToRoles" OWNER TO danieletwopointzero;

--
-- Name: formationToRoles_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."formationToRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."formationToRoles_id_seq" OWNER TO danieletwopointzero;

--
-- Name: formationToRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."formationToRoles_id_seq" OWNED BY public."formationToRoles".id;


--
-- Name: formations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.formations (
    id integer NOT NULL,
    system_of_play character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.formations OWNER TO danieletwopointzero;

--
-- Name: formations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.formations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formations_id_seq OWNER TO danieletwopointzero;

--
-- Name: formations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.formations_id_seq OWNED BY public.formations.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.matches (
    id integer NOT NULL,
    match_week character varying(255) NOT NULL,
    result character varying(255),
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    away_team_id integer NOT NULL,
    competition_id integer NOT NULL,
    created_by_id integer,
    home_team_id integer NOT NULL
);


ALTER TABLE public.matches OWNER TO danieletwopointzero;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "isNationalTeam" boolean NOT NULL,
    city_id integer,
    created_by_id integer,
    nation_id integer,
    "referenceTeam_id" integer,
    type_id integer
);


ALTER TABLE public.teams OWNER TO danieletwopointzero;

--
-- Name: get_matches; Type: VIEW; Schema: public; Owner: danieletwopointzero
--

CREATE VIEW public.get_matches AS
 SELECT m.id,
    m.match_week,
    m.result,
    m.date,
    m."time",
    m.away_team_id,
    m.competition_id,
    m.created_by_id,
    m.home_team_id,
    t.name AS home_team_name,
    t2.name AS away_team_name
   FROM (((public.matches m
     LEFT JOIN public.competitions c ON ((m.competition_id = c.id)))
     LEFT JOIN public.teams t ON ((m.home_team_id = t.id)))
     LEFT JOIN public.teams t2 ON ((m.away_team_id = t2.id)));


ALTER TABLE public.get_matches OWNER TO danieletwopointzero;

--
-- Name: players; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.players (
    id integer NOT NULL,
    last_name character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    profile_image character varying(200),
    height smallint,
    weight smallint,
    agency_id integer,
    constitution_id integer,
    created_by_id integer,
    footedness_id integer,
    physique_id integer,
    place_of_birth_id integer,
    position_id integer,
    CONSTRAINT players_height_check CHECK ((height >= 0)),
    CONSTRAINT players_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.players OWNER TO danieletwopointzero;

--
-- Name: teams_teamtoplayer; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.teams_teamtoplayer (
    id integer NOT NULL,
    start date,
    "end" date,
    "isCaptain" boolean NOT NULL,
    tshirt_number smallint,
    created_by_id integer,
    player_id integer NOT NULL,
    team_id integer NOT NULL,
    CONSTRAINT teams_teamtoplayer_tshirt_number_check CHECK ((tshirt_number >= 0))
);


ALTER TABLE public.teams_teamtoplayer OWNER TO danieletwopointzero;

--
-- Name: get_players; Type: VIEW; Schema: public; Owner: danieletwopointzero
--

CREATE VIEW public.get_players AS
 SELECT t2.id,
    t2.last_name,
    t2.first_name,
    t2.date_of_birth,
    t1.team_id,
    t3.name,
    t3.nation_id
   FROM ((public.teams_teamtoplayer t1
     LEFT JOIN public.players t2 ON ((t1.player_id = t2.id)))
     LEFT JOIN public.teams t3 ON ((t1.team_id = t3.id)));


ALTER TABLE public.get_players OWNER TO danieletwopointzero;

--
-- Name: get_tagcombinationfrommatch; Type: VIEW; Schema: public; Owner: danieletwopointzero
--

CREATE VIEW public.get_tagcombinationfrommatch AS
 SELECT t2.id,
    t6.last_name AS "user",
    t2.created_by_id,
    t1.sort_value,
    t2.match_id,
    t2.start_event AS "time",
    t2.end_event,
    t2.note,
    t2.period_id,
    t4.name AS tagcombination,
    t4.description,
    t5.last_name AS players,
    true AS uploaded
   FROM (((((public."events_tagCombinations" t1
     LEFT JOIN public.events t2 ON ((t1.event_id = t2.id)))
     LEFT JOIN public."tagCombinationToVersions" t3 ON ((t3.id = t1.tagcombinationtoversion_id)))
     LEFT JOIN public."TagCombinations" t4 ON ((t4.id = t3."tagCombination_id")))
     LEFT JOIN public.auth_user t6 ON ((t6.id = t2.created_by_id)))
     LEFT JOIN public.get_players t5 ON ((t5.id = t2.player_id)))
  ORDER BY t2.id DESC;


ALTER TABLE public.get_tagcombinationfrommatch OWNER TO danieletwopointzero;

--
-- Name: graphs; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.graphs (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    chart character varying(15) NOT NULL,
    "isElaborated" boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.graphs OWNER TO danieletwopointzero;

--
-- Name: graphs_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.graphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graphs_id_seq OWNER TO danieletwopointzero;

--
-- Name: graphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.graphs_id_seq OWNED BY public.graphs.id;


--
-- Name: graphs_input_data; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.graphs_input_data (
    id integer NOT NULL,
    graph_id integer NOT NULL,
    data_id integer NOT NULL
);


ALTER TABLE public.graphs_input_data OWNER TO danieletwopointzero;

--
-- Name: graphs_input_data_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.graphs_input_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graphs_input_data_id_seq OWNER TO danieletwopointzero;

--
-- Name: graphs_input_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.graphs_input_data_id_seq OWNED BY public.graphs_input_data.id;


--
-- Name: graphs_tagComboSet; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."graphs_tagComboSet" (
    id integer NOT NULL,
    graph_id integer NOT NULL,
    tagcombinationset_id integer NOT NULL
);


ALTER TABLE public."graphs_tagComboSet" OWNER TO danieletwopointzero;

--
-- Name: graphs_tagComboSet_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."graphs_tagComboSet_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."graphs_tagComboSet_id_seq" OWNER TO danieletwopointzero;

--
-- Name: graphs_tagComboSet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."graphs_tagComboSet_id_seq" OWNED BY public."graphs_tagComboSet".id;


--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_bookmark OWNER TO danieletwopointzero;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.jet_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_bookmark_id_seq OWNER TO danieletwopointzero;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_pinnedapplication OWNER TO danieletwopointzero;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_pinnedapplication_id_seq OWNER TO danieletwopointzero;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;


--
-- Name: match_buffermatchupload; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.match_buffermatchupload (
    id integer NOT NULL,
    filename character varying(255) NOT NULL,
    "gameDate" character varying(255) NOT NULL,
    competition character varying(255) NOT NULL,
    episode character varying(255),
    match character varying(255),
    team character varying(255),
    episode_start character varying(255),
    episode_end character varying(255),
    period character varying(255),
    description character varying(255),
    tags character varying(255),
    player character varying(255),
    notes character varying(255),
    error_notes character varying(255),
    date_import timestamp with time zone,
    created_by_id integer,
    status_id integer
);


ALTER TABLE public.match_buffermatchupload OWNER TO danieletwopointzero;

--
-- Name: match_buffermatchupload_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.match_buffermatchupload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_buffermatchupload_id_seq OWNER TO danieletwopointzero;

--
-- Name: match_buffermatchupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.match_buffermatchupload_id_seq OWNED BY public.match_buffermatchupload.id;


--
-- Name: match_matchstatus; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.match_matchstatus (
    status_ptr_id integer NOT NULL,
    "defaultIs" boolean NOT NULL
);


ALTER TABLE public.match_matchstatus OWNER TO danieletwopointzero;

--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matches_id_seq OWNER TO danieletwopointzero;

--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;


--
-- Name: monitoringTeam; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."monitoringTeam" (
    id integer NOT NULL,
    created_by_id integer,
    team_id integer NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public."monitoringTeam" OWNER TO danieletwopointzero;

--
-- Name: monitoringTeamToUser; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."monitoringTeamToUser" (
    id integer NOT NULL,
    start date NOT NULL,
    "end" date,
    created_by_id integer,
    "monitoringTeam_id" integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."monitoringTeamToUser" OWNER TO danieletwopointzero;

--
-- Name: monitoringTeamToUser_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."monitoringTeamToUser_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."monitoringTeamToUser_id_seq" OWNER TO danieletwopointzero;

--
-- Name: monitoringTeamToUser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."monitoringTeamToUser_id_seq" OWNED BY public."monitoringTeamToUser".id;


--
-- Name: monitoringTeam_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."monitoringTeam_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."monitoringTeam_id_seq" OWNER TO danieletwopointzero;

--
-- Name: monitoringTeam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."monitoringTeam_id_seq" OWNED BY public."monitoringTeam".id;


--
-- Name: nations; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.nations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "alpha2Code" character varying(2) NOT NULL,
    continent_id integer,
    created_by_id integer
);


ALTER TABLE public.nations OWNER TO danieletwopointzero;

--
-- Name: nations_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.nations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nations_id_seq OWNER TO danieletwopointzero;

--
-- Name: nations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.nations_id_seq OWNED BY public.nations.id;


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO danieletwopointzero;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO danieletwopointzero;

--
-- Name: period; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.period (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.period OWNER TO danieletwopointzero;

--
-- Name: period_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.period_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.period_id_seq OWNER TO danieletwopointzero;

--
-- Name: period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.period_id_seq OWNED BY public.period.id;


--
-- Name: physiques; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.physiques (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.physiques OWNER TO danieletwopointzero;

--
-- Name: physiques_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.physiques_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.physiques_id_seq OWNER TO danieletwopointzero;

--
-- Name: physiques_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.physiques_id_seq OWNED BY public.physiques.id;


--
-- Name: playerRoles; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."playerRoles" (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    short_name character varying(255) NOT NULL,
    description character varying(255),
    created_by_id integer,
    position_id integer
);


ALTER TABLE public."playerRoles" OWNER TO danieletwopointzero;

--
-- Name: playerRoles_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."playerRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."playerRoles_id_seq" OWNER TO danieletwopointzero;

--
-- Name: playerRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."playerRoles_id_seq" OWNED BY public."playerRoles".id;


--
-- Name: player_report; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.player_report (
    id integer NOT NULL,
    created_on timestamp with time zone,
    name character varying(255) NOT NULL,
    "isConfirmed" boolean NOT NULL,
    created_by_id integer,
    player_id integer NOT NULL,
    report_template_id integer
);


ALTER TABLE public.player_report OWNER TO danieletwopointzero;

--
-- Name: player_report_contracts; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.player_report_contracts (
    id integer NOT NULL,
    playerreport_id integer NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.player_report_contracts OWNER TO danieletwopointzero;

--
-- Name: player_report_contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.player_report_contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_report_contracts_id_seq OWNER TO danieletwopointzero;

--
-- Name: player_report_contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.player_report_contracts_id_seq OWNED BY public.player_report_contracts.id;


--
-- Name: player_report_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.player_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_report_id_seq OWNER TO danieletwopointzero;

--
-- Name: player_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.player_report_id_seq OWNED BY public.player_report.id;


--
-- Name: player_report_matches; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.player_report_matches (
    id integer NOT NULL,
    playerreport_id integer NOT NULL,
    match_id integer NOT NULL
);


ALTER TABLE public.player_report_matches OWNER TO danieletwopointzero;

--
-- Name: player_report_matches_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.player_report_matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_report_matches_id_seq OWNER TO danieletwopointzero;

--
-- Name: player_report_matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.player_report_matches_id_seq OWNED BY public.player_report_matches.id;


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO danieletwopointzero;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: players_nationalities; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.players_nationalities (
    id integer NOT NULL,
    player_id integer NOT NULL,
    nation_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public.players_nationalities OWNER TO danieletwopointzero;

--
-- Name: players_nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.players_nationalities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_nationalities_id_seq OWNER TO danieletwopointzero;

--
-- Name: players_nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.players_nationalities_id_seq OWNED BY public.players_nationalities.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.positions OWNER TO danieletwopointzero;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO danieletwopointzero;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- Name: report_templates; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.report_templates (
    id integer NOT NULL,
    description character varying(255),
    user_id integer
);


ALTER TABLE public.report_templates OWNER TO danieletwopointzero;

--
-- Name: report_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.report_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_templates_id_seq OWNER TO danieletwopointzero;

--
-- Name: report_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.report_templates_id_seq OWNED BY public.report_templates.id;


--
-- Name: report_templates_sections; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.report_templates_sections (
    id integer NOT NULL,
    reporttemplate_id integer NOT NULL,
    section_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public.report_templates_sections OWNER TO danieletwopointzero;

--
-- Name: report_templates_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.report_templates_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_templates_sections_id_seq OWNER TO danieletwopointzero;

--
-- Name: report_templates_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.report_templates_sections_id_seq OWNED BY public.report_templates_sections.id;


--
-- Name: scoutingToUser; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."scoutingToUser" (
    id integer NOT NULL,
    start date NOT NULL,
    "end" date,
    created_by_id integer,
    user_id integer NOT NULL,
    scouting_id integer NOT NULL
);


ALTER TABLE public."scoutingToUser" OWNER TO danieletwopointzero;

--
-- Name: scoutingToUser_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."scoutingToUser_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."scoutingToUser_id_seq" OWNER TO danieletwopointzero;

--
-- Name: scoutingToUser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."scoutingToUser_id_seq" OWNED BY public."scoutingToUser".id;


--
-- Name: scouting_box_scoutingbox; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.scouting_box_scoutingbox (
    id integer NOT NULL,
    date_of_match date NOT NULL,
    match_week character varying(255) NOT NULL,
    minutes smallint NOT NULL,
    goal smallint NOT NULL,
    first_string boolean NOT NULL,
    competition_id integer NOT NULL,
    created_by_id integer,
    formation_id integer NOT NULL,
    player_id integer NOT NULL,
    role_id integer NOT NULL,
    team_id integer NOT NULL,
    CONSTRAINT scouting_box_scoutingbox_goal_check CHECK ((goal >= 0)),
    CONSTRAINT scouting_box_scoutingbox_minutes_check CHECK ((minutes >= 0))
);


ALTER TABLE public.scouting_box_scoutingbox OWNER TO danieletwopointzero;

--
-- Name: scouting_box_scoutingbox_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.scouting_box_scoutingbox_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scouting_box_scoutingbox_id_seq OWNER TO danieletwopointzero;

--
-- Name: scouting_box_scoutingbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.scouting_box_scoutingbox_id_seq OWNED BY public.scouting_box_scoutingbox.id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    title character varying(255),
    subtitle character varying(255),
    img_section character varying(100) NOT NULL,
    user_id integer
);


ALTER TABLE public.sections OWNER TO danieletwopointzero;

--
-- Name: sections_analysis; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.sections_analysis (
    id integer NOT NULL,
    section_id integer NOT NULL,
    analysis_id integer NOT NULL,
    sort_value integer NOT NULL
);


ALTER TABLE public.sections_analysis OWNER TO danieletwopointzero;

--
-- Name: sections_analysis_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.sections_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_analysis_id_seq OWNER TO danieletwopointzero;

--
-- Name: sections_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.sections_analysis_id_seq OWNED BY public.sections_analysis.id;


--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO danieletwopointzero;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO danieletwopointzero;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO danieletwopointzero;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO danieletwopointzero;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO danieletwopointzero;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO danieletwopointzero;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO danieletwopointzero;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data jsonb NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO danieletwopointzero;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO danieletwopointzero;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO danieletwopointzero;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO danieletwopointzero;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: tagCombinationControTags_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."tagCombinationControTags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tagCombinationControTags_id_seq" OWNER TO danieletwopointzero;

--
-- Name: tagCombinationControTags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."tagCombinationControTags_id_seq" OWNED BY public."tagCombinationControTags".id;


--
-- Name: tagCombinationToVersions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."tagCombinationToVersions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tagCombinationToVersions_id_seq" OWNER TO danieletwopointzero;

--
-- Name: tagCombinationToVersions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."tagCombinationToVersions_id_seq" OWNED BY public."tagCombinationToVersions".id;


--
-- Name: tag_buffertagsupload; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.tag_buffertagsupload (
    id integer NOT NULL,
    filename character varying(255),
    name_set character varying(255),
    value_tot character varying(255),
    value character varying(255),
    notes character varying(255),
    tag_combination character varying(255),
    contro_tag character varying(255),
    error_notes character varying(255),
    date_import timestamp with time zone,
    created_by_id integer,
    status_id integer
);


ALTER TABLE public.tag_buffertagsupload OWNER TO danieletwopointzero;

--
-- Name: tag_buffertagsupload_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.tag_buffertagsupload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_buffertagsupload_id_seq OWNER TO danieletwopointzero;

--
-- Name: tag_buffertagsupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.tag_buffertagsupload_id_seq OWNED BY public.tag_buffertagsupload.id;


--
-- Name: tag_tagstatus; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.tag_tagstatus (
    status_ptr_id integer NOT NULL,
    "defaultIs" boolean NOT NULL
);


ALTER TABLE public.tag_tagstatus OWNER TO danieletwopointzero;

--
-- Name: tag_taguploadoption; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.tag_taguploadoption (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text,
    created_by_id integer
);


ALTER TABLE public.tag_taguploadoption OWNER TO danieletwopointzero;

--
-- Name: tag_taguploadoption_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.tag_taguploadoption_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_taguploadoption_id_seq OWNER TO danieletwopointzero;

--
-- Name: tag_taguploadoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.tag_taguploadoption_id_seq OWNED BY public.tag_taguploadoption.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    created_on timestamp with time zone,
    name character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.tags OWNER TO danieletwopointzero;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO danieletwopointzero;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: teamToCoach; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."teamToCoach" (
    id integer NOT NULL,
    start date,
    "end" date,
    coach_id integer NOT NULL,
    created_by_id integer,
    team_id integer NOT NULL
);


ALTER TABLE public."teamToCoach" OWNER TO danieletwopointzero;

--
-- Name: teamToCoach_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."teamToCoach_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."teamToCoach_id_seq" OWNER TO danieletwopointzero;

--
-- Name: teamToCoach_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."teamToCoach_id_seq" OWNED BY public."teamToCoach".id;


--
-- Name: teamToCompetitions; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."teamToCompetitions" (
    id integer NOT NULL,
    current_position smallint,
    competition_id integer NOT NULL,
    created_by_id integer,
    team_id integer NOT NULL,
    CONSTRAINT "teamToCompetitions_current_position_check" CHECK ((current_position >= 0))
);


ALTER TABLE public."teamToCompetitions" OWNER TO danieletwopointzero;

--
-- Name: teamToCompetitions_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."teamToCompetitions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."teamToCompetitions_id_seq" OWNER TO danieletwopointzero;

--
-- Name: teamToCompetitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."teamToCompetitions_id_seq" OWNED BY public."teamToCompetitions".id;


--
-- Name: teamTypes; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public."teamTypes" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer
);


ALTER TABLE public."teamTypes" OWNER TO danieletwopointzero;

--
-- Name: teamTypes_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public."teamTypes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."teamTypes_id_seq" OWNER TO danieletwopointzero;

--
-- Name: teamTypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public."teamTypes_id_seq" OWNED BY public."teamTypes".id;


--
-- Name: team_report; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.team_report (
    id integer NOT NULL,
    created_on timestamp with time zone,
    name character varying(255) NOT NULL,
    "isConfirmed" boolean NOT NULL,
    created_by_id integer,
    report_template_id integer,
    team_id integer NOT NULL
);


ALTER TABLE public.team_report OWNER TO danieletwopointzero;

--
-- Name: team_report_contracts; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.team_report_contracts (
    id integer NOT NULL,
    teamreport_id integer NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.team_report_contracts OWNER TO danieletwopointzero;

--
-- Name: team_report_contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.team_report_contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_report_contracts_id_seq OWNER TO danieletwopointzero;

--
-- Name: team_report_contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.team_report_contracts_id_seq OWNED BY public.team_report_contracts.id;


--
-- Name: team_report_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.team_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_report_id_seq OWNER TO danieletwopointzero;

--
-- Name: team_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.team_report_id_seq OWNED BY public.team_report.id;


--
-- Name: team_report_matches; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.team_report_matches (
    id integer NOT NULL,
    teamreport_id integer NOT NULL,
    match_id integer NOT NULL
);


ALTER TABLE public.team_report_matches OWNER TO danieletwopointzero;

--
-- Name: team_report_matches_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.team_report_matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_report_matches_id_seq OWNER TO danieletwopointzero;

--
-- Name: team_report_matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.team_report_matches_id_seq OWNED BY public.team_report_matches.id;


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO danieletwopointzero;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: teams_teamtoplayer_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.teams_teamtoplayer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_teamtoplayer_id_seq OWNER TO danieletwopointzero;

--
-- Name: teams_teamtoplayer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.teams_teamtoplayer_id_seq OWNED BY public.teams_teamtoplayer.id;


--
-- Name: tools_status; Type: TABLE; Schema: public; Owner: danieletwopointzero
--

CREATE TABLE public.tools_status (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text,
    read boolean NOT NULL,
    write boolean NOT NULL,
    update boolean NOT NULL,
    delete boolean NOT NULL,
    color character varying(18) NOT NULL,
    created_by_id integer
);


ALTER TABLE public.tools_status OWNER TO danieletwopointzero;

--
-- Name: tools_status_id_seq; Type: SEQUENCE; Schema: public; Owner: danieletwopointzero
--

CREATE SEQUENCE public.tools_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tools_status_id_seq OWNER TO danieletwopointzero;

--
-- Name: tools_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: danieletwopointzero
--

ALTER SEQUENCE public.tools_status_id_seq OWNED BY public.tools_status.id;


--
-- Name: TagCombinationSet id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet" ALTER COLUMN id SET DEFAULT nextval('public."TagCombinationSet_id_seq"'::regclass);


--
-- Name: TagCombinationSet_tagCombinations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet_tagCombinations" ALTER COLUMN id SET DEFAULT nextval('public."TagCombinationSet_tagCombinations_id_seq"'::regclass);


--
-- Name: TagCombinations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations" ALTER COLUMN id SET DEFAULT nextval('public."TagCombinations_id_seq"'::regclass);


--
-- Name: TagCombinations_tags id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations_tags" ALTER COLUMN id SET DEFAULT nextval('public."TagCombinations_tags_id_seq"'::regclass);


--
-- Name: Versions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."Versions" ALTER COLUMN id SET DEFAULT nextval('public."Versions_id_seq"'::regclass);


--
-- Name: agencies id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agencies ALTER COLUMN id SET DEFAULT nextval('public.agencies_id_seq'::regclass);


--
-- Name: agents id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);


--
-- Name: agents_nationalities id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents_nationalities ALTER COLUMN id SET DEFAULT nextval('public.agents_nationalities_id_seq'::regclass);


--
-- Name: analysis id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis ALTER COLUMN id SET DEFAULT nextval('public.analysis_id_seq'::regclass);


--
-- Name: analysis_graphs id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis_graphs ALTER COLUMN id SET DEFAULT nextval('public.analysis_graphs_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: coaches id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches ALTER COLUMN id SET DEFAULT nextval('public.coaches_id_seq'::regclass);


--
-- Name: coaches_nationalities id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches_nationalities ALTER COLUMN id SET DEFAULT nextval('public.coaches_nationalities_id_seq'::regclass);


--
-- Name: competitionTypes id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."competitionTypes" ALTER COLUMN id SET DEFAULT nextval('public."competitionTypes_id_seq"'::regclass);


--
-- Name: competitions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.competitions ALTER COLUMN id SET DEFAULT nextval('public.competitions_id_seq'::regclass);


--
-- Name: constitutions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.constitutions ALTER COLUMN id SET DEFAULT nextval('public.constitutions_id_seq'::regclass);


--
-- Name: continents id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.continents ALTER COLUMN id SET DEFAULT nextval('public.continents_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: customerToUser id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."customerToUser" ALTER COLUMN id SET DEFAULT nextval('public."customerToUser_id_seq"'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: dashboard_userdashboardmodule id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule ALTER COLUMN id SET DEFAULT nextval('public.dashboard_userdashboardmodule_id_seq'::regclass);


--
-- Name: data id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data ALTER COLUMN id SET DEFAULT nextval('public.data_id_seq'::regclass);


--
-- Name: data_tag_combinations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data_tag_combinations ALTER COLUMN id SET DEFAULT nextval('public.data_tag_combinations_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: events_tagCombinations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."events_tagCombinations" ALTER COLUMN id SET DEFAULT nextval('public."events_tagCombinations_id_seq"'::regclass);


--
-- Name: federations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.federations ALTER COLUMN id SET DEFAULT nextval('public.federations_id_seq'::regclass);


--
-- Name: footedness id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.footedness ALTER COLUMN id SET DEFAULT nextval('public.footedness_id_seq'::regclass);


--
-- Name: formationToRoles id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."formationToRoles" ALTER COLUMN id SET DEFAULT nextval('public."formationToRoles_id_seq"'::regclass);


--
-- Name: formations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.formations ALTER COLUMN id SET DEFAULT nextval('public.formations_id_seq'::regclass);


--
-- Name: graphs id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs ALTER COLUMN id SET DEFAULT nextval('public.graphs_id_seq'::regclass);


--
-- Name: graphs_input_data id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs_input_data ALTER COLUMN id SET DEFAULT nextval('public.graphs_input_data_id_seq'::regclass);


--
-- Name: graphs_tagComboSet id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."graphs_tagComboSet" ALTER COLUMN id SET DEFAULT nextval('public."graphs_tagComboSet_id_seq"'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);


--
-- Name: match_buffermatchupload id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.match_buffermatchupload ALTER COLUMN id SET DEFAULT nextval('public.match_buffermatchupload_id_seq'::regclass);


--
-- Name: matches id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);


--
-- Name: monitoringTeam id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeam" ALTER COLUMN id SET DEFAULT nextval('public."monitoringTeam_id_seq"'::regclass);


--
-- Name: monitoringTeamToUser id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeamToUser" ALTER COLUMN id SET DEFAULT nextval('public."monitoringTeamToUser_id_seq"'::regclass);


--
-- Name: nations id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.nations ALTER COLUMN id SET DEFAULT nextval('public.nations_id_seq'::regclass);


--
-- Name: period id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.period ALTER COLUMN id SET DEFAULT nextval('public.period_id_seq'::regclass);


--
-- Name: physiques id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.physiques ALTER COLUMN id SET DEFAULT nextval('public.physiques_id_seq'::regclass);


--
-- Name: playerRoles id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."playerRoles" ALTER COLUMN id SET DEFAULT nextval('public."playerRoles_id_seq"'::regclass);


--
-- Name: player_report id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report ALTER COLUMN id SET DEFAULT nextval('public.player_report_id_seq'::regclass);


--
-- Name: player_report_contracts id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_contracts ALTER COLUMN id SET DEFAULT nextval('public.player_report_contracts_id_seq'::regclass);


--
-- Name: player_report_matches id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_matches ALTER COLUMN id SET DEFAULT nextval('public.player_report_matches_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: players_nationalities id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players_nationalities ALTER COLUMN id SET DEFAULT nextval('public.players_nationalities_id_seq'::regclass);


--
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- Name: report_templates id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates ALTER COLUMN id SET DEFAULT nextval('public.report_templates_id_seq'::regclass);


--
-- Name: report_templates_sections id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates_sections ALTER COLUMN id SET DEFAULT nextval('public.report_templates_sections_id_seq'::regclass);


--
-- Name: scoutingToUser id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."scoutingToUser" ALTER COLUMN id SET DEFAULT nextval('public."scoutingToUser_id_seq"'::regclass);


--
-- Name: scouting_box_scoutingbox id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox ALTER COLUMN id SET DEFAULT nextval('public.scouting_box_scoutingbox_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: sections_analysis id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections_analysis ALTER COLUMN id SET DEFAULT nextval('public.sections_analysis_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: tagCombinationControTags id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationControTags" ALTER COLUMN id SET DEFAULT nextval('public."tagCombinationControTags_id_seq"'::regclass);


--
-- Name: tagCombinationToVersions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationToVersions" ALTER COLUMN id SET DEFAULT nextval('public."tagCombinationToVersions_id_seq"'::regclass);


--
-- Name: tag_buffertagsupload id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_buffertagsupload ALTER COLUMN id SET DEFAULT nextval('public.tag_buffertagsupload_id_seq'::regclass);


--
-- Name: tag_taguploadoption id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_taguploadoption ALTER COLUMN id SET DEFAULT nextval('public.tag_taguploadoption_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: teamToCoach id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCoach" ALTER COLUMN id SET DEFAULT nextval('public."teamToCoach_id_seq"'::regclass);


--
-- Name: teamToCompetitions id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCompetitions" ALTER COLUMN id SET DEFAULT nextval('public."teamToCompetitions_id_seq"'::regclass);


--
-- Name: teamTypes id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamTypes" ALTER COLUMN id SET DEFAULT nextval('public."teamTypes_id_seq"'::regclass);


--
-- Name: team_report id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report ALTER COLUMN id SET DEFAULT nextval('public.team_report_id_seq'::regclass);


--
-- Name: team_report_contracts id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_contracts ALTER COLUMN id SET DEFAULT nextval('public.team_report_contracts_id_seq'::regclass);


--
-- Name: team_report_matches id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_matches ALTER COLUMN id SET DEFAULT nextval('public.team_report_matches_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: teams_teamtoplayer id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams_teamtoplayer ALTER COLUMN id SET DEFAULT nextval('public.teams_teamtoplayer_id_seq'::regclass);


--
-- Name: tools_status id; Type: DEFAULT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tools_status ALTER COLUMN id SET DEFAULT nextval('public.tools_status_id_seq'::regclass);


--
-- Data for Name: ContractMonitoring; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."ContractMonitoring" (contract_ptr_id) FROM stdin;
\.


--
-- Data for Name: TagCombinationSet; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."TagCombinationSet" (id, created_on, name, value, created_by_id) FROM stdin;
4	2020-02-09 09:27:50.180102+00	PASSAGGI	0	119
5	2020-02-09 09:27:53.672029+00	DUELLO OFFENSIVO	0	119
6	2020-02-09 09:27:58.00032+00	DUELLO DIFENSIVO	0	119
\.


--
-- Data for Name: TagCombinationSet_tagCombinations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."TagCombinationSet_tagCombinations" (id, tagcombinationset_id, tagcombinationtoversion_id) FROM stdin;
108	4	108
109	4	109
110	4	110
111	4	111
112	4	112
113	4	113
114	4	114
115	4	115
116	4	116
117	4	117
118	4	118
119	4	119
120	4	120
121	4	121
122	4	122
123	4	123
124	4	124
125	4	125
126	4	126
127	4	127
128	4	128
129	4	129
130	4	130
131	4	131
132	4	132
133	4	133
134	4	134
135	5	135
136	5	137
137	5	139
138	5	141
139	5	143
140	5	145
141	5	147
142	5	149
143	5	151
144	5	153
145	5	155
146	5	157
147	5	159
148	5	161
149	5	163
150	5	165
151	5	167
152	5	169
153	5	171
154	5	173
155	5	175
156	5	177
157	5	179
158	5	181
159	5	183
160	5	185
161	5	187
162	5	189
163	5	191
164	5	193
165	5	195
166	5	197
167	5	199
168	5	201
169	5	203
170	5	205
171	5	207
172	5	209
173	5	211
174	5	213
175	6	166
176	6	164
177	6	162
178	6	160
179	6	158
180	6	156
181	6	154
182	6	152
183	6	182
184	6	180
185	6	178
186	6	176
187	6	174
188	6	172
189	6	170
190	6	168
191	6	198
192	6	196
193	6	194
194	6	192
195	6	190
196	6	188
197	6	186
198	6	184
199	6	214
200	6	212
201	6	210
202	6	208
203	6	206
204	6	204
205	6	202
206	6	200
207	6	150
208	6	142
209	6	148
210	6	140
211	6	146
212	6	138
213	6	144
214	6	136
\.


--
-- Data for Name: TagCombinations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."TagCombinations" (id, created_on, name, description, created_by_id) FROM stdin;
108	2020-02-09 09:27:50.137676+00	PASSAGGIO, INCROCIATO, POSITIVO	\N	119
109	2020-02-09 09:27:50.274289+00	PASSAGGIO INTERCETTATO, DIFENSIVA	\N	119
110	2020-02-09 09:27:50.357128+00	PASSAGGIO, INCROCIATO, NEGATIVO	\N	119
111	2020-02-09 09:27:50.4505+00	PASSAGGIO, ATTACCO DIRETTO, POSITIVO	\N	119
112	2020-02-09 09:27:50.537232+00	PASSAGGIO, ATTACCO DIRETTO, NEGATIVO	\N	119
113	2020-02-09 09:27:50.627652+00	PASSAGGIO, SPAZZATA	\N	119
114	2020-02-09 09:27:50.717525+00	PASSAGGIO, SPAZZATA, POSITIVO	\N	119
115	2020-02-09 09:27:51.357273+00	PASSAGGIO, SPAZZATA, NEGATIVO	\N	119
116	2020-02-09 09:27:51.468963+00	PASSAGGIO, VERTICALE LUNGO	\N	119
117	2020-02-09 09:27:51.509532+00	PASSAGGIO, VERTICALE LUNGO, POSITIVO	\N	119
118	2020-02-09 09:27:51.552047+00	PASSAGGIO, VERTICALE LUNGO, NEGATIVO	\N	119
119	2020-02-09 09:27:51.618637+00	PASSAGGIO, ORIZZONTALE	\N	119
120	2020-02-09 09:27:51.770578+00	PASSAGGIO, ORIZZONTALE, POSITIVO	\N	119
121	2020-02-09 09:27:51.942469+00	PASSAGGIO, ORIZZONTALE, NEGATIVO	\N	119
122	2020-02-09 09:27:52.103514+00	PASSAGGIO, CORTO	\N	119
123	2020-02-09 09:27:52.254358+00	PASSAGGIO, CORTO, POSITIVO	\N	119
124	2020-02-09 09:27:52.417723+00	PASSAGGIO, CORTO, NEGATIVO	\N	119
125	2020-02-09 09:27:52.561362+00	PASSAGGIO, INDIETRO	\N	119
126	2020-02-09 09:27:52.61244+00	PASSAGGIO, INDIETRO, POSITIVO	\N	119
127	2020-02-09 09:27:52.684979+00	PASSAGGIO, INDIETRO, NEGATIVO	\N	119
128	2020-02-09 09:27:52.788709+00	PASSAGGIO, PASSAGGIO CHIAVE	\N	119
129	2020-02-09 09:27:52.899694+00	PASSAGGIO, PASSAGGIO CHIAVE, POSITIVO	\N	119
130	2020-02-09 09:27:53.007375+00	PASSAGGIO, PASSAGGIO CHIAVE, NEGATIVO	\N	119
131	2020-02-09 09:27:53.112805+00	PASSAGGIO, SPONDA, POSITIVO	\N	119
132	2020-02-09 09:27:53.216562+00	PASSAGGIO, SPONDA, NEGATIVO	\N	119
133	2020-02-09 09:27:53.328983+00	PASSAGGIO, SPIZZATA AEREA, POSITIVO	\N	119
134	2020-02-09 09:27:53.436494+00	PASSAGGIO, SPIZZATA AEREA, NEGATIVO	\N	119
147	2020-02-09 09:27:54.112212+00	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	\N	119
158	2020-02-09 09:27:54.816419+00	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	119
157	2020-02-09 09:27:54.77785+00	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	119
156	2020-02-09 09:27:54.678296+00	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	\N	119
155	2020-02-09 09:27:54.641238+00	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	\N	119
154	2020-02-09 09:27:54.55031+00	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	\N	119
153	2020-02-09 09:27:54.514046+00	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	\N	119
152	2020-02-09 09:27:54.422942+00	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	119
151	2020-02-09 09:27:54.38527+00	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	119
166	2020-02-09 09:27:55.079384+00	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	119
165	2020-02-09 09:27:55.062027+00	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	119
164	2020-02-09 09:27:55.01042+00	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	\N	119
163	2020-02-09 09:27:54.992032+00	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	\N	119
162	2020-02-09 09:27:54.937914+00	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	\N	119
161	2020-02-09 09:27:54.92102+00	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	\N	119
160	2020-02-09 09:27:54.877782+00	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	119
159	2020-02-09 09:27:54.859998+00	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	119
174	2020-02-09 09:27:55.429056+00	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	119
173	2020-02-09 09:27:55.390148+00	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	119
172	2020-02-09 09:27:55.30548+00	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	\N	119
171	2020-02-09 09:27:55.280248+00	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	\N	119
170	2020-02-09 09:27:55.225035+00	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	\N	119
169	2020-02-09 09:27:55.205071+00	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	\N	119
168	2020-02-09 09:27:55.150072+00	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	119
167	2020-02-09 09:27:55.127197+00	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	119
182	2020-02-09 09:27:55.94754+00	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	119
181	2020-02-09 09:27:55.928298+00	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	119
180	2020-02-09 09:27:55.824822+00	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	\N	119
179	2020-02-09 09:27:55.788016+00	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	\N	119
178	2020-02-09 09:27:55.696363+00	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	\N	119
177	2020-02-09 09:27:55.659717+00	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	\N	119
176	2020-02-09 09:27:55.561995+00	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	119
175	2020-02-09 09:27:55.525119+00	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	119
190	2020-02-09 09:27:56.297835+00	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	119
189	2020-02-09 09:27:56.255071+00	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	119
188	2020-02-09 09:27:56.162536+00	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	\N	119
187	2020-02-09 09:27:56.136048+00	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	\N	119
186	2020-02-09 09:27:56.069754+00	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	\N	119
185	2020-02-09 09:27:56.048893+00	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	\N	119
184	2020-02-09 09:27:56.002663+00	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	119
183	2020-02-09 09:27:55.987753+00	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	119
198	2020-02-09 09:27:56.902088+00	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	119
197	2020-02-09 09:27:56.858265+00	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	119
196	2020-02-09 09:27:56.747799+00	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	\N	119
195	2020-02-09 09:27:56.705575+00	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	\N	119
194	2020-02-09 09:27:56.59461+00	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	\N	119
193	2020-02-09 09:27:56.551924+00	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	\N	119
192	2020-02-09 09:27:56.441859+00	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	119
191	2020-02-09 09:27:56.401949+00	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	119
206	2020-02-09 09:27:57.23449+00	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	119
205	2020-02-09 09:27:57.21339+00	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	119
204	2020-02-09 09:27:57.167811+00	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	\N	119
203	2020-02-09 09:27:57.149232+00	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	\N	119
202	2020-02-09 09:27:57.10717+00	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	\N	119
201	2020-02-09 09:27:57.092027+00	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	\N	119
200	2020-02-09 09:27:57.046974+00	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	119
199	2020-02-09 09:27:57.01483+00	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	119
214	2020-02-09 09:27:57.814951+00	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	119
213	2020-02-09 09:27:57.773158+00	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	119
212	2020-02-09 09:27:57.665813+00	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	\N	119
211	2020-02-09 09:27:57.622069+00	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	\N	119
210	2020-02-09 09:27:57.512047+00	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	\N	119
209	2020-02-09 09:27:57.470604+00	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	\N	119
208	2020-02-09 09:27:57.354591+00	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	119
207	2020-02-09 09:27:57.312017+00	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	119
150	2020-02-09 09:27:54.285923+00	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	\N	119
149	2020-02-09 09:27:54.247598+00	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	\N	119
142	2020-02-09 09:27:53.846812+00	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	\N	119
141	2020-02-09 09:27:53.827659+00	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	\N	119
148	2020-02-09 09:27:54.153323+00	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	\N	119
140	2020-02-09 09:27:53.781501+00	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	\N	119
139	2020-02-09 09:27:53.765495+00	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	\N	119
146	2020-02-09 09:27:54.016549+00	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	\N	119
145	2020-02-09 09:27:53.979964+00	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	\N	119
138	2020-02-09 09:27:53.721339+00	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	\N	119
137	2020-02-09 09:27:53.702529+00	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	\N	119
144	2020-02-09 09:27:53.906373+00	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	\N	119
143	2020-02-09 09:27:53.888536+00	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	\N	119
136	2020-02-09 09:27:53.610917+00	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	\N	119
135	2020-02-09 09:27:53.558728+00	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	\N	119
\.


--
-- Data for Name: TagCombinations_tags; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."TagCombinations_tags" (id, tagcombination_id, tag_id, sort_value) FROM stdin;
395	108	26	1
396	108	27	2
397	108	28	3
398	109	29	1
399	109	30	2
400	110	26	1
401	110	27	2
402	110	31	3
403	111	26	1
404	111	32	2
405	111	28	3
406	112	26	1
407	112	32	2
408	112	31	3
409	113	26	1
410	113	33	2
411	114	26	1
412	114	33	2
413	114	28	3
414	115	26	1
415	115	33	2
416	115	31	3
417	116	26	1
418	116	34	2
419	117	26	1
420	117	34	2
421	117	28	3
422	118	26	1
423	118	34	2
424	118	31	3
425	119	26	1
426	119	35	2
427	120	26	1
428	120	35	2
429	120	28	3
430	121	26	1
431	121	35	2
432	121	31	3
433	122	26	1
434	122	36	2
435	123	26	1
436	123	36	2
437	123	28	3
438	124	26	1
439	124	36	2
440	124	31	3
441	125	26	1
442	125	37	2
443	126	26	1
444	126	37	2
445	126	28	3
446	127	26	1
447	127	37	2
448	127	31	3
449	128	26	1
450	128	38	2
451	129	26	1
452	129	38	2
453	129	28	3
454	130	26	1
455	130	38	2
456	130	31	3
457	131	26	1
458	131	39	2
459	131	28	3
460	132	26	1
461	132	39	2
462	132	31	3
463	133	26	1
464	133	40	2
465	133	28	3
466	134	26	1
467	134	40	2
468	134	31	3
469	135	41	1
470	135	42	2
471	135	28	3
472	135	43	4
473	136	44	1
474	136	42	2
475	136	31	3
476	136	45	4
477	137	41	1
478	137	42	2
479	137	28	3
480	137	30	4
481	138	44	1
482	138	42	2
483	138	31	3
484	138	46	4
485	139	41	1
486	139	42	2
487	139	28	3
488	139	46	4
489	140	44	1
490	140	42	2
491	140	31	3
492	140	30	4
493	141	41	1
494	141	42	2
495	141	28	3
496	141	45	4
497	142	44	1
498	142	42	2
499	142	31	3
500	142	43	4
501	143	41	1
502	143	42	2
503	143	31	3
504	143	43	4
505	144	44	1
506	144	42	2
507	144	28	3
508	144	45	4
509	145	41	1
510	145	42	2
511	145	31	3
512	145	30	4
513	146	44	1
514	146	42	2
515	146	28	3
516	146	46	4
517	147	41	1
518	147	42	2
519	147	31	3
520	147	46	4
521	148	44	1
522	148	42	2
523	148	28	3
524	148	30	4
525	149	41	1
526	149	42	2
527	149	31	3
528	149	45	4
529	150	44	1
530	150	42	2
531	150	28	3
532	150	43	4
533	151	41	1
534	151	47	2
535	151	28	3
536	151	43	4
537	152	44	1
538	152	47	2
539	152	31	3
540	152	45	4
541	153	41	1
542	153	47	2
543	153	28	3
544	153	30	4
545	154	44	1
546	154	47	2
547	154	31	3
548	154	46	4
549	155	41	1
550	155	47	2
551	155	28	3
552	155	46	4
553	156	44	1
554	156	47	2
555	156	31	3
556	156	30	4
557	157	41	1
558	157	47	2
559	157	28	3
560	157	45	4
561	158	44	1
562	158	47	2
563	158	31	3
564	158	43	4
565	159	41	1
566	159	47	2
567	159	31	3
568	159	43	4
569	160	44	1
570	160	47	2
571	160	28	3
572	160	45	4
573	161	41	1
574	161	47	2
575	161	31	3
576	161	30	4
577	162	44	1
578	162	47	2
579	162	28	3
580	162	46	4
581	163	41	1
582	163	47	2
583	163	31	3
584	163	46	4
585	164	44	1
586	164	47	2
587	164	28	3
588	164	30	4
589	165	41	1
590	165	47	2
591	165	31	3
592	165	45	4
593	166	44	1
594	166	47	2
595	166	28	3
596	166	43	4
597	167	41	1
598	167	48	2
599	167	28	3
600	167	43	4
601	168	44	1
602	168	48	2
603	168	31	3
604	168	45	4
605	169	41	1
606	169	48	2
607	169	28	3
608	169	30	4
609	170	44	1
610	170	48	2
611	170	31	3
612	170	46	4
613	171	41	1
614	171	48	2
615	171	28	3
616	171	46	4
617	172	44	1
618	172	48	2
619	172	31	3
620	172	30	4
621	173	41	1
622	173	48	2
623	173	28	3
624	173	45	4
625	174	44	1
626	174	48	2
627	174	31	3
628	174	43	4
629	175	41	1
630	175	48	2
631	175	31	3
632	175	43	4
633	176	44	1
634	176	48	2
635	176	28	3
636	176	45	4
637	177	41	1
638	177	48	2
639	177	31	3
640	177	30	4
641	178	44	1
642	178	48	2
643	178	28	3
644	178	46	4
645	179	41	1
646	179	48	2
647	179	31	3
648	179	46	4
649	180	44	1
650	180	48	2
651	180	28	3
652	180	30	4
653	181	41	1
654	181	48	2
655	181	31	3
656	181	45	4
657	182	44	1
658	182	48	2
659	182	28	3
660	182	43	4
661	183	41	1
662	183	49	2
663	183	28	3
664	183	43	4
665	184	44	1
666	184	49	2
667	184	31	3
668	184	45	4
669	185	41	1
670	185	49	2
671	185	28	3
672	185	30	4
673	186	44	1
674	186	49	2
675	186	31	3
676	186	46	4
677	187	41	1
678	187	49	2
679	187	28	3
680	187	46	4
681	188	44	1
682	188	49	2
683	188	31	3
684	188	30	4
685	189	41	1
686	189	49	2
687	189	28	3
688	189	45	4
689	190	44	1
690	190	49	2
691	190	31	3
692	190	43	4
693	191	41	1
694	191	49	2
695	191	31	3
696	191	43	4
697	192	44	1
698	192	49	2
699	192	28	3
700	192	45	4
701	193	41	1
702	193	49	2
703	193	31	3
704	193	30	4
705	194	44	1
706	194	49	2
707	194	28	3
708	194	46	4
709	195	41	1
710	195	49	2
711	195	31	3
712	195	46	4
713	196	44	1
714	196	49	2
715	196	28	3
716	196	30	4
717	197	41	1
718	197	49	2
719	197	31	3
720	197	45	4
721	198	44	1
722	198	49	2
723	198	28	3
724	198	43	4
725	199	41	1
726	199	50	2
727	199	28	3
728	199	43	4
729	200	44	1
730	200	50	2
731	200	31	3
732	200	45	4
733	201	41	1
734	201	50	2
735	201	28	3
736	201	30	4
737	202	44	1
738	202	50	2
739	202	31	3
740	202	46	4
741	203	41	1
742	203	50	2
743	203	28	3
744	203	46	4
745	204	44	1
746	204	50	2
747	204	31	3
748	204	30	4
749	205	41	1
750	205	50	2
751	205	28	3
752	205	45	4
753	206	44	1
754	206	50	2
755	206	31	3
756	206	43	4
757	207	41	1
758	207	50	2
759	207	31	3
760	207	43	4
761	208	44	1
762	208	50	2
763	208	28	3
764	208	45	4
765	209	41	1
766	209	50	2
767	209	31	3
768	209	30	4
769	210	44	1
770	210	50	2
771	210	28	3
772	210	46	4
773	211	41	1
774	211	50	2
775	211	31	3
776	211	46	4
777	212	44	1
778	212	50	2
779	212	28	3
780	212	30	4
781	213	41	1
782	213	50	2
783	213	31	3
784	213	45	4
785	214	44	1
786	214	50	2
787	214	28	3
788	214	43	4
\.


--
-- Data for Name: Versions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."Versions" (id, created_on, name, "isBlocked", add_version, update_version, delete_version, created_by_id) FROM stdin;
2	2020-02-09 09:27:50.03634+00	V1	f	t	t	f	\N
\.


--
-- Data for Name: agencies; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.agencies (id, company_name, phone, email, created_by_id) FROM stdin;
\.


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.agents (id, last_name, first_name, profile_image, date_of_birth, phone, email, company_id, created_by_id, place_of_birth_id) FROM stdin;
\.


--
-- Data for Name: agents_nationalities; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.agents_nationalities (id, agent_id, nation_id, sort_value) FROM stdin;
\.


--
-- Data for Name: analysis; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.analysis (id, description, title, subtitle, user_id) FROM stdin;
\.


--
-- Data for Name: analysis_graphs; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.analysis_graphs (id, analysis_id, graph_id, sort_value) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.auth_group (id, name) FROM stdin;
5	CustomerTechnicalStaff
6	CustomerScoutingStaff
1	General and Relations
2	Operator
3	Stat
4	FootureLab Staff
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
27	1	40
28	1	41
29	1	43
30	1	44
31	1	45
32	1	46
33	1	47
34	1	48
35	1	49
36	1	50
37	1	51
38	1	52
39	1	53
40	1	54
41	1	70
42	1	71
43	1	72
44	1	73
45	1	74
46	1	75
47	1	76
48	1	77
49	1	78
50	2	29
51	3	65
52	3	62
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user dashboard module	1	add_userdashboardmodule
2	Can change user dashboard module	1	change_userdashboardmodule
3	Can delete user dashboard module	1	delete_userdashboardmodule
4	Can add bookmark	2	add_bookmark
5	Can change bookmark	2	change_bookmark
6	Can delete bookmark	2	delete_bookmark
7	Can add pinned application	3	add_pinnedapplication
8	Can change pinned application	3	change_pinnedapplication
9	Can delete pinned application	3	delete_pinnedapplication
10	Can add log entry	4	add_logentry
11	Can change log entry	4	change_logentry
12	Can delete log entry	4	delete_logentry
13	Can add permission	5	add_permission
14	Can change permission	5	change_permission
15	Can delete permission	5	delete_permission
16	Can add group	6	add_group
17	Can change group	6	change_group
18	Can delete group	6	delete_group
19	Can add user	7	add_user
20	Can change user	7	change_user
21	Can delete user	7	delete_user
22	Can add content type	8	add_contenttype
23	Can change content type	8	change_contenttype
24	Can delete content type	8	delete_contenttype
25	Can add session	9	add_session
26	Can change session	9	change_session
27	Can delete session	9	delete_session
28	Can add Upload Match	10	add_buffermatchupload
29	Can change Upload Match	10	change_buffermatchupload
30	Can delete Upload Match	10	delete_buffermatchupload
31	Can add Match Status	11	add_matchstatus
32	Can change Match Status	11	change_matchstatus
33	Can delete Match Status	11	delete_matchstatus
34	Can add Upload Tags	12	add_buffertagsupload
35	Can change Upload Tags	12	change_buffertagsupload
36	Can delete Upload Tags	12	delete_buffertagsupload
37	Can add Tag Status	13	add_tagstatus
38	Can change Tag Status	13	change_tagstatus
39	Can delete Tag Status	13	delete_tagstatus
40	Can add club	14	add_club
41	Can change club	14	change_club
42	Can delete club	14	delete_club
43	Can add club to coach	15	add_clubtocoach
44	Can change club to coach	15	change_clubtocoach
45	Can delete club to coach	15	delete_clubtocoach
46	Can add club to player	16	add_clubtoplayer
47	Can change club to player	16	change_clubtoplayer
48	Can delete club to player	16	delete_clubtoplayer
49	Can add Technical Player Information	17	add_infotechplayer
50	Can change Technical Player Information	17	change_infotechplayer
51	Can delete Technical Player Information	17	delete_infotechplayer
52	Can add Player	18	add_player
53	Can change Player	18	change_player
54	Can delete Player	18	delete_player
55	Can add Tag	19	add_tag
56	Can change Tag	19	change_tag
57	Can delete Tag	19	delete_tag
58	Can add Tag Combination	20	add_tagcombination
59	Can change Tag Combination	20	change_tagcombination
60	Can delete Tag Combination	20	delete_tagcombination
61	Can add Match	21	add_match
62	Can change Match	21	change_match
63	Can delete Match	21	delete_match
64	Can add Episode	22	add_episode
65	Can change Episode	22	change_episode
66	Can delete Episode	22	delete_episode
67	Can add status	23	add_status
68	Can change status	23	change_status
69	Can delete status	23	delete_status
70	Can add Coach	24	add_coach
71	Can change Coach	24	change_coach
72	Can delete Coach	24	delete_coach
73	Can add Technical Coach Information	25	add_infotechcoach
74	Can change Technical Coach Information	25	change_infotechcoach
75	Can delete Technical Coach Information	25	delete_infotechcoach
76	Can add League	26	add_league
85	Can add Analysis	29	add_analysis
86	Can change Analysis	29	change_analysis
87	Can delete Analysis	29	delete_analysis
88	Can add Player Report	30	add_playerreport
89	Can change Player Report	30	change_playerreport
90	Can delete Player Report	30	delete_playerreport
91	Can add Report Template	31	add_reporttemplate
92	Can change Report Template	31	change_reporttemplate
93	Can delete Report Template	31	delete_reporttemplate
94	Can add Report Section	32	add_section
95	Can change Report Section	32	change_section
96	Can delete Report Section	32	delete_section
97	Can add Team Report	33	add_teamreport
98	Can change Team Report	33	change_teamreport
99	Can delete Team Report	33	delete_teamreport
100	Can add City	34	add_city
101	Can change City	34	change_city
102	Can delete City	34	delete_city
103	Can add continent	35	add_continent
104	Can change continent	35	change_continent
105	Can delete continent	35	delete_continent
106	Can add Federation	36	add_federation
107	Can change Federation	36	change_federation
108	Can delete Federation	36	delete_federation
109	Can add Nation	37	add_nation
110	Can change Nation	37	change_nation
111	Can delete Nation	37	delete_nation
112	Can add Competition	38	add_competition
113	Can change Competition	38	change_competition
114	Can delete Competition	38	delete_competition
115	Can add competition type	39	add_competitiontype
116	Can change competition type	39	change_competitiontype
117	Can delete competition type	39	delete_competitiontype
118	Can add Formation	40	add_formation
119	Can change Formation	40	change_formation
120	Can delete Formation	40	delete_formation
121	Can add FormationToRole	41	add_formationtorole
122	Can change FormationToRole	41	change_formationtorole
123	Can delete FormationToRole	41	delete_formationtorole
124	Can add Player Role	42	add_playerrole
125	Can change Player Role	42	change_playerrole
126	Can delete Player Role	42	delete_playerrole
127	Can add Position	43	add_position
128	Can change Position	43	change_position
129	Can delete Position	43	delete_position
130	Can add Agency	44	add_agency
131	Can change Agency	44	change_agency
132	Can delete Agency	44	delete_agency
133	Can add get_ tag combination from match	45	add_get_tagcombinationfrommatch
134	Can change get_ tag combination from match	45	change_get_tagcombinationfrommatch
135	Can delete get_ tag combination from match	45	delete_get_tagcombinationfrommatch
136	Can add player view	46	add_playerview
137	Can change player view	46	change_playerview
138	Can delete player view	46	delete_playerview
139	Can add Agent	47	add_agent
140	Can change Agent	47	change_agent
141	Can delete Agent	47	delete_agent
142	Can add Coach	48	add_coach
143	Can change Coach	48	change_coach
144	Can delete Coach	48	delete_coach
145	Can add constitution	49	add_constitution
146	Can change constitution	49	change_constitution
147	Can delete constitution	49	delete_constitution
148	Can add footedness	50	add_footedness
149	Can change footedness	50	change_footedness
150	Can delete footedness	50	delete_footedness
151	Can add physique	51	add_physique
152	Can change physique	51	change_physique
153	Can delete physique	51	delete_physique
154	Can add Player	52	add_player
155	Can change Player	52	change_player
156	Can delete Player	52	delete_player
157	Can add Team	53	add_team
158	Can change Team	53	change_team
159	Can delete Team	53	delete_team
160	Can add Team-Coach	54	add_teamtocoach
161	Can change Team-Coach	54	change_teamtocoach
162	Can delete Team-Coach	54	delete_teamtocoach
163	Can add Team-Competition	55	add_teamtocompetition
164	Can change Team-Competition	55	change_teamtocompetition
165	Can delete Team-Competition	55	delete_teamtocompetition
166	Can add Team-Player	56	add_teamtoplayer
167	Can change Team-Player	56	change_teamtoplayer
168	Can delete Team-Player	56	delete_teamtoplayer
169	Can add Team Type	57	add_teamtype
170	Can change Team Type	57	change_teamtype
171	Can delete Team Type	57	delete_teamtype
172	Can add Contract	58	add_contract
173	Can change Contract	58	change_contract
174	Can delete Contract	58	delete_contract
175	Can add Customer	59	add_customer
176	Can change Customer	59	change_customer
177	Can delete Customer	59	delete_customer
178	Can add Customer To User	60	add_customertouser
179	Can change Customer To User	60	change_customertouser
180	Can delete Customer To User	60	delete_customertouser
181	Can add Monitoring Team	61	add_monitoringteam
182	Can change Monitoring Team	61	change_monitoringteam
183	Can delete Monitoring Team	61	delete_monitoringteam
184	Can add Monitoring Team To User	62	add_monitoringteamtouser
185	Can change Monitoring Team To User	62	change_monitoringteamtouser
186	Can delete Monitoring Team To User	62	delete_monitoringteamtouser
187	Can add Scouting To User	63	add_scoutingtouser
188	Can change Scouting To User	63	change_scoutingtouser
189	Can delete Scouting To User	63	delete_scoutingtouser
190	Can add Contract Monitoring	64	add_monitoring
191	Can change Contract Monitoring	64	change_monitoring
192	Can delete Contract Monitoring	64	delete_monitoring
193	Can add Contract Scouting	65	add_scouting
194	Can change Contract Scouting	65	change_scouting
195	Can delete Contract Scouting	65	delete_scouting
196	Can add Scouting Box	66	add_scoutingbox
197	Can change Scouting Box	66	change_scoutingbox
198	Can delete Scouting Box	66	delete_scoutingbox
199	Can add association	67	add_association
200	Can change association	67	change_association
201	Can delete association	67	delete_association
202	Can add code	68	add_code
203	Can change code	68	change_code
204	Can delete code	68	delete_code
205	Can add nonce	69	add_nonce
206	Can change nonce	69	change_nonce
207	Can delete nonce	69	delete_nonce
208	Can add user social auth	70	add_usersocialauth
209	Can change user social auth	70	change_usersocialauth
210	Can delete user social auth	70	delete_usersocialauth
211	Can add partial	71	add_partial
212	Can change partial	71	change_partial
213	Can delete partial	71	delete_partial
214	Can add application	72	add_application
215	Can change application	72	change_application
216	Can delete application	72	delete_application
217	Can add access token	73	add_accesstoken
218	Can change access token	73	change_accesstoken
219	Can delete access token	73	delete_accesstoken
220	Can add grant	74	add_grant
221	Can change grant	74	change_grant
222	Can delete grant	74	delete_grant
223	Can add refresh token	75	add_refreshtoken
224	Can change refresh token	75	change_refreshtoken
225	Can delete refresh token	75	delete_refreshtoken
77	Can change League	26	change_league
78	Can delete League	26	delete_league
79	Can add Registry	27	add_registry
80	Can change Registry	27	change_registry
81	Can delete Registry	27	delete_registry
82	Can add role	28	add_role
83	Can change role	28	change_role
84	Can delete role	28	delete_role
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	1111	2019-02-11 16:42:43.107+00	t	username1	Nome1	Cognome1	email@email.com	t	t	2018-01-01 12:08:37+00
3	1111	\N	t	username2	nome2	cognome2	email.email@email.com	t	t	2018-12-18 12:09:16+00
5	password2	2019-02-11 16:41:44.837+00	f	username3				t	t	2018-12-18 12:09:16+00
9	password8	2019-02-11 16:28:46+00	t	username4	mario	rossi	email2@email.com	t	t	2019-02-11 16:28:12+00
10	password29	2019-02-11 16:42:35.944+00	f	username5				t	t	2019-02-11 16:29:38+00
119	password210	2019-06-18 13:16:41+00	t	username6			email3@email.com	t	t	2019-06-18 13:16:21+00
120	password28888	2019-06-18 13:16:41+00	t	username7			email4@email.com	t	t	2019-06-18 13:16:21+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	5	1
2	5	2
3	5	3
4	10	1
5	10	2
6	10	3
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	5	19
2	5	20
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.cities (id, name, region, created_by_id, nation_id) FROM stdin;
1	VALLETTA	\N	\N	\N
2	CARPI	\N	\N	\N
3	COSENZA	\N	\N	\N
4	TORINO	\N	\N	\N
5	VIENNA	\N	\N	\N
\.


--
-- Data for Name: coaches; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.coaches (id, last_name, first_name, profile_image, date_of_birth, agency_id, created_by_id, place_of_birth_id) FROM stdin;
\.


--
-- Data for Name: coaches_nationalities; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.coaches_nationalities (id, coach_id, nation_id, sort_value) FROM stdin;
\.


--
-- Data for Name: competitionTypes; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."competitionTypes" (id, type, created_by_id) FROM stdin;
0	League	\N
1	Cup	\N
2	Tournament	\N
\.


--
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.competitions (id, name, start, "end", "competitionType_id", federation_id) FROM stdin;
1	Primavera 1	2019-07-01	2020-06-30	0	\N
\.


--
-- Data for Name: constitutions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.constitutions (id, type, created_by_id) FROM stdin;
1	Brevilineo	\N
2	Normolineo	\N
3	Longilineo	\N
\.


--
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.continents (id, name, created_by_id) FROM stdin;
0	Africa	\N
1	Asia	\N
2	Europe	\N
3	Americas	\N
4	Oceania	\N
\.


--
-- Data for Name: contractScouting; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."contractScouting" (contract_ptr_id) FROM stdin;
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.contracts (id, start, "end", created_by_id, customer_id) FROM stdin;
\.


--
-- Data for Name: customerToUser; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."customerToUser" (id, created_by_id, customer_id, user_id) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.customers (id, name, phone, email, created_by_id, user_reference_id) FROM stdin;
\.


--
-- Data for Name: dashboard_userdashboardmodule; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.dashboard_userdashboardmodule (id, title, module, app_label, "user", "column", "order", settings, children, collapsed) FROM stdin;
1	Quick links	jet.dashboard.modules.LinkList	\N	119	0	0	{"draggable": false, "deletable": false, "collapsible": false, "layout": "inline"}	[{"title": "Return to site", "url": "/"}, {"title": "Change password", "url": "/admin/password_change/"}, {"title": "Log out", "url": "/admin/logout/"}]	f
2	Applications	jet.dashboard.modules.AppList	\N	119	1	0	{"models": null, "exclude": ["auth.*"]}		f
\.


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.data (id, description, label, data_inheritance_id, user_id) FROM stdin;
\.


--
-- Data for Name: data_tag_combinations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.data_tag_combinations (id, data_id, tagcombination_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-02-09 09:28:03.727984+00	128	BufferTagsUpload object (128)	1	new through import_export	12	119
2	2020-02-09 09:28:03.733735+00	129	BufferTagsUpload object (129)	1	new through import_export	12	119
3	2020-02-09 09:28:03.737261+00	130	BufferTagsUpload object (130)	1	new through import_export	12	119
4	2020-02-09 09:28:03.740818+00	131	BufferTagsUpload object (131)	1	new through import_export	12	119
5	2020-02-09 09:28:03.744475+00	132	BufferTagsUpload object (132)	1	new through import_export	12	119
6	2020-02-09 09:28:03.748325+00	133	BufferTagsUpload object (133)	1	new through import_export	12	119
7	2020-02-09 09:28:03.75218+00	134	BufferTagsUpload object (134)	1	new through import_export	12	119
8	2020-02-09 09:28:03.755856+00	135	BufferTagsUpload object (135)	1	new through import_export	12	119
9	2020-02-09 09:28:03.759706+00	136	BufferTagsUpload object (136)	1	new through import_export	12	119
10	2020-02-09 09:28:03.763858+00	137	BufferTagsUpload object (137)	1	new through import_export	12	119
11	2020-02-09 09:28:03.767424+00	138	BufferTagsUpload object (138)	1	new through import_export	12	119
12	2020-02-09 09:28:03.770872+00	139	BufferTagsUpload object (139)	1	new through import_export	12	119
13	2020-02-09 09:28:03.774776+00	140	BufferTagsUpload object (140)	1	new through import_export	12	119
14	2020-02-09 09:28:03.778233+00	141	BufferTagsUpload object (141)	1	new through import_export	12	119
15	2020-02-09 09:28:03.781603+00	142	BufferTagsUpload object (142)	1	new through import_export	12	119
16	2020-02-09 09:28:03.785538+00	143	BufferTagsUpload object (143)	1	new through import_export	12	119
17	2020-02-09 09:28:03.789515+00	144	BufferTagsUpload object (144)	1	new through import_export	12	119
18	2020-02-09 09:28:03.793634+00	145	BufferTagsUpload object (145)	1	new through import_export	12	119
19	2020-02-09 09:28:03.798048+00	146	BufferTagsUpload object (146)	1	new through import_export	12	119
20	2020-02-09 09:28:03.802466+00	147	BufferTagsUpload object (147)	1	new through import_export	12	119
21	2020-02-09 09:28:03.80735+00	148	BufferTagsUpload object (148)	1	new through import_export	12	119
22	2020-02-09 09:28:03.812199+00	149	BufferTagsUpload object (149)	1	new through import_export	12	119
23	2020-02-09 09:28:03.817089+00	150	BufferTagsUpload object (150)	1	new through import_export	12	119
24	2020-02-09 09:28:03.822754+00	151	BufferTagsUpload object (151)	1	new through import_export	12	119
25	2020-02-09 09:28:03.829077+00	152	BufferTagsUpload object (152)	1	new through import_export	12	119
26	2020-02-09 09:28:03.837028+00	153	BufferTagsUpload object (153)	1	new through import_export	12	119
27	2020-02-09 09:28:03.844072+00	154	BufferTagsUpload object (154)	1	new through import_export	12	119
28	2020-02-09 09:28:03.851129+00	155	BufferTagsUpload object (155)	1	new through import_export	12	119
29	2020-02-09 09:28:03.857392+00	156	BufferTagsUpload object (156)	1	new through import_export	12	119
30	2020-02-09 09:28:03.863671+00	157	BufferTagsUpload object (157)	1	new through import_export	12	119
31	2020-02-09 09:28:03.870238+00	158	BufferTagsUpload object (158)	1	new through import_export	12	119
32	2020-02-09 09:28:03.878624+00	159	BufferTagsUpload object (159)	1	new through import_export	12	119
33	2020-02-09 09:28:03.883691+00	160	BufferTagsUpload object (160)	1	new through import_export	12	119
34	2020-02-09 09:28:03.88852+00	161	BufferTagsUpload object (161)	1	new through import_export	12	119
35	2020-02-09 09:28:03.894509+00	162	BufferTagsUpload object (162)	1	new through import_export	12	119
36	2020-02-09 09:28:03.902883+00	163	BufferTagsUpload object (163)	1	new through import_export	12	119
37	2020-02-09 09:28:03.908707+00	164	BufferTagsUpload object (164)	1	new through import_export	12	119
38	2020-02-09 09:28:03.917231+00	165	BufferTagsUpload object (165)	1	new through import_export	12	119
39	2020-02-09 09:28:03.923413+00	166	BufferTagsUpload object (166)	1	new through import_export	12	119
40	2020-02-09 09:28:03.92951+00	167	BufferTagsUpload object (167)	1	new through import_export	12	119
41	2020-02-09 09:28:03.935972+00	168	BufferTagsUpload object (168)	1	new through import_export	12	119
42	2020-02-09 09:28:03.942197+00	169	BufferTagsUpload object (169)	1	new through import_export	12	119
43	2020-02-09 09:28:03.949503+00	170	BufferTagsUpload object (170)	1	new through import_export	12	119
44	2020-02-09 09:28:03.955426+00	171	BufferTagsUpload object (171)	1	new through import_export	12	119
45	2020-02-09 09:28:03.961223+00	172	BufferTagsUpload object (172)	1	new through import_export	12	119
46	2020-02-09 09:28:03.967587+00	173	BufferTagsUpload object (173)	1	new through import_export	12	119
47	2020-02-09 09:28:03.976487+00	174	BufferTagsUpload object (174)	1	new through import_export	12	119
48	2020-02-09 09:28:03.982328+00	175	BufferTagsUpload object (175)	1	new through import_export	12	119
49	2020-02-09 09:28:03.988148+00	176	BufferTagsUpload object (176)	1	new through import_export	12	119
50	2020-02-09 09:28:03.993616+00	177	BufferTagsUpload object (177)	1	new through import_export	12	119
51	2020-02-09 09:28:03.999479+00	178	BufferTagsUpload object (178)	1	new through import_export	12	119
52	2020-02-09 09:28:04.006071+00	179	BufferTagsUpload object (179)	1	new through import_export	12	119
53	2020-02-09 09:28:04.01355+00	180	BufferTagsUpload object (180)	1	new through import_export	12	119
54	2020-02-09 09:28:04.018315+00	181	BufferTagsUpload object (181)	1	new through import_export	12	119
55	2020-02-09 09:28:04.022273+00	182	BufferTagsUpload object (182)	1	new through import_export	12	119
56	2020-02-09 09:28:04.026029+00	183	BufferTagsUpload object (183)	1	new through import_export	12	119
57	2020-02-09 09:28:04.029151+00	184	BufferTagsUpload object (184)	1	new through import_export	12	119
58	2020-02-09 09:28:04.032687+00	185	BufferTagsUpload object (185)	1	new through import_export	12	119
59	2020-02-09 09:28:04.037473+00	186	BufferTagsUpload object (186)	1	new through import_export	12	119
60	2020-02-09 09:28:04.040718+00	187	BufferTagsUpload object (187)	1	new through import_export	12	119
61	2020-02-09 09:28:04.043213+00	188	BufferTagsUpload object (188)	1	new through import_export	12	119
62	2020-02-09 09:28:04.045948+00	189	BufferTagsUpload object (189)	1	new through import_export	12	119
63	2020-02-09 09:28:04.048577+00	190	BufferTagsUpload object (190)	1	new through import_export	12	119
64	2020-02-09 09:28:04.051177+00	191	BufferTagsUpload object (191)	1	new through import_export	12	119
65	2020-02-09 09:28:04.053806+00	192	BufferTagsUpload object (192)	1	new through import_export	12	119
66	2020-02-09 09:28:04.056234+00	193	BufferTagsUpload object (193)	1	new through import_export	12	119
67	2020-02-09 09:28:04.058416+00	194	BufferTagsUpload object (194)	1	new through import_export	12	119
68	2020-02-09 09:28:04.06054+00	195	BufferTagsUpload object (195)	1	new through import_export	12	119
69	2020-02-09 09:28:04.062761+00	196	BufferTagsUpload object (196)	1	new through import_export	12	119
70	2020-02-09 09:28:04.065206+00	197	BufferTagsUpload object (197)	1	new through import_export	12	119
71	2020-02-09 09:28:04.067498+00	198	BufferTagsUpload object (198)	1	new through import_export	12	119
72	2020-02-09 09:28:04.070189+00	199	BufferTagsUpload object (199)	1	new through import_export	12	119
73	2020-02-09 09:28:04.072383+00	200	BufferTagsUpload object (200)	1	new through import_export	12	119
74	2020-02-09 09:28:04.07461+00	201	BufferTagsUpload object (201)	1	new through import_export	12	119
75	2020-02-09 09:28:04.078604+00	202	BufferTagsUpload object (202)	1	new through import_export	12	119
76	2020-02-09 09:28:04.08111+00	203	BufferTagsUpload object (203)	1	new through import_export	12	119
77	2020-02-09 09:28:04.084478+00	204	BufferTagsUpload object (204)	1	new through import_export	12	119
78	2020-02-09 09:28:04.087376+00	205	BufferTagsUpload object (205)	1	new through import_export	12	119
79	2020-02-09 09:28:04.090479+00	206	BufferTagsUpload object (206)	1	new through import_export	12	119
80	2020-02-09 09:28:04.093722+00	207	BufferTagsUpload object (207)	1	new through import_export	12	119
81	2020-02-09 09:28:04.098405+00	208	BufferTagsUpload object (208)	1	new through import_export	12	119
82	2020-02-09 09:28:04.101585+00	209	BufferTagsUpload object (209)	1	new through import_export	12	119
83	2020-02-09 09:28:04.105211+00	210	BufferTagsUpload object (210)	1	new through import_export	12	119
84	2020-02-09 09:28:04.10921+00	211	BufferTagsUpload object (211)	1	new through import_export	12	119
85	2020-02-09 09:28:04.112932+00	212	BufferTagsUpload object (212)	1	new through import_export	12	119
86	2020-02-09 09:28:04.116602+00	213	BufferTagsUpload object (213)	1	new through import_export	12	119
87	2020-02-09 09:28:04.120287+00	214	BufferTagsUpload object (214)	1	new through import_export	12	119
88	2020-02-09 09:28:04.124126+00	215	BufferTagsUpload object (215)	1	new through import_export	12	119
89	2020-02-09 09:28:04.128568+00	216	BufferTagsUpload object (216)	1	new through import_export	12	119
90	2020-02-09 09:28:04.132366+00	217	BufferTagsUpload object (217)	1	new through import_export	12	119
91	2020-02-09 09:28:04.136078+00	218	BufferTagsUpload object (218)	1	new through import_export	12	119
92	2020-02-09 09:28:04.140419+00	219	BufferTagsUpload object (219)	1	new through import_export	12	119
93	2020-02-09 09:28:04.1472+00	220	BufferTagsUpload object (220)	1	new through import_export	12	119
94	2020-02-09 09:28:04.152987+00	221	BufferTagsUpload object (221)	1	new through import_export	12	119
95	2020-02-09 09:28:04.159051+00	222	BufferTagsUpload object (222)	1	new through import_export	12	119
96	2020-02-09 09:28:04.168186+00	223	BufferTagsUpload object (223)	1	new through import_export	12	119
97	2020-02-09 09:28:04.174727+00	224	BufferTagsUpload object (224)	1	new through import_export	12	119
98	2020-02-09 09:28:04.183027+00	225	BufferTagsUpload object (225)	1	new through import_export	12	119
99	2020-02-09 09:28:04.192523+00	226	BufferTagsUpload object (226)	1	new through import_export	12	119
100	2020-02-09 09:28:04.198838+00	227	BufferTagsUpload object (227)	1	new through import_export	12	119
101	2020-02-09 09:28:04.205605+00	228	BufferTagsUpload object (228)	1	new through import_export	12	119
102	2020-02-09 09:28:04.212093+00	229	BufferTagsUpload object (229)	1	new through import_export	12	119
103	2020-02-09 09:28:04.220915+00	230	BufferTagsUpload object (230)	1	new through import_export	12	119
104	2020-02-09 09:28:04.227127+00	231	BufferTagsUpload object (231)	1	new through import_export	12	119
105	2020-02-09 09:28:04.234084+00	232	BufferTagsUpload object (232)	1	new through import_export	12	119
106	2020-02-09 09:28:04.241342+00	233	BufferTagsUpload object (233)	1	new through import_export	12	119
107	2020-02-09 09:28:04.247869+00	234	BufferTagsUpload object (234)	1	new through import_export	12	119
108	2020-02-09 09:28:04.254614+00	235	BufferTagsUpload object (235)	1	new through import_export	12	119
109	2020-02-09 09:28:04.260318+00	236	BufferTagsUpload object (236)	1	new through import_export	12	119
110	2020-02-09 09:28:04.267113+00	237	BufferTagsUpload object (237)	1	new through import_export	12	119
111	2020-02-09 09:28:04.274091+00	238	BufferTagsUpload object (238)	1	new through import_export	12	119
112	2020-02-09 09:28:04.280367+00	239	BufferTagsUpload object (239)	1	new through import_export	12	119
113	2020-02-09 09:28:04.288066+00	240	BufferTagsUpload object (240)	1	new through import_export	12	119
114	2020-02-09 09:28:04.294231+00	241	BufferTagsUpload object (241)	1	new through import_export	12	119
115	2020-02-09 09:28:04.301386+00	242	BufferTagsUpload object (242)	1	new through import_export	12	119
116	2020-02-09 09:28:04.308218+00	243	BufferTagsUpload object (243)	1	new through import_export	12	119
117	2020-02-09 09:28:04.317187+00	244	BufferTagsUpload object (244)	1	new through import_export	12	119
118	2020-02-09 09:28:04.323729+00	245	BufferTagsUpload object (245)	1	new through import_export	12	119
119	2020-02-09 09:28:04.331206+00	246	BufferTagsUpload object (246)	1	new through import_export	12	119
120	2020-02-09 09:28:04.33865+00	247	BufferTagsUpload object (247)	1	new through import_export	12	119
121	2020-02-09 09:28:04.344488+00	248	BufferTagsUpload object (248)	1	new through import_export	12	119
122	2020-02-09 09:28:04.350402+00	249	BufferTagsUpload object (249)	1	new through import_export	12	119
123	2020-02-09 09:28:04.356583+00	250	BufferTagsUpload object (250)	1	new through import_export	12	119
124	2020-02-09 09:28:04.365444+00	251	BufferTagsUpload object (251)	1	new through import_export	12	119
125	2020-02-09 09:28:04.372052+00	252	BufferTagsUpload object (252)	1	new through import_export	12	119
126	2020-02-09 09:28:04.380761+00	253	BufferTagsUpload object (253)	1	new through import_export	12	119
127	2020-02-09 09:28:04.387321+00	254	BufferTagsUpload object (254)	1	new through import_export	12	119
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	dashboard	userdashboardmodule
2	jet	bookmark
3	jet	pinnedapplication
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	match	buffermatchupload
11	match	matchstatus
12	tag	buffertagsupload
13	tag	tagstatus
14	tag	taguploadoption
15	tags	controtagview
16	tags	tag
17	tags	tagcombination
18	tags	tagcombinationcontrotag
19	tags	tagcombinationset
20	tags	tagcombinationtoversion
21	tags	version
22	matches	matchview
23	matches	match
24	events	event
25	events	period
26	tools	status
27	graphs	data
28	graphs	graph
29	analysis	analysis
30	reports	playerreport
31	reports	reporttemplate
32	reports	section
33	reports	teamreport
34	nations	city
35	nations	continent
36	nations	federation
37	nations	nation
38	competitions	competition
39	competitions	competitiontype
40	formations	formation
41	formations	formationtorole
42	formations	playerrole
43	formations	position
44	agencies	agency
45	persons	get_tagcombinationfrommatch
46	persons	playerview
47	persons	agent
48	persons	coach
49	persons	constitution
50	persons	footedness
51	persons	physique
52	persons	player
53	teams	team
54	teams	teamtocoach
55	teams	teamtocompetition
56	teams	teamtoplayer
57	teams	teamtype
58	contracts	contract
59	contracts	customer
60	contracts	customertouser
61	contracts	monitoringteam
62	contracts	monitoringteamtouser
63	contracts	scoutingtouser
64	contracts	monitoring
65	contracts	scouting
66	scouting_box	scoutingbox
67	social_django	association
68	social_django	code
69	social_django	nonce
70	social_django	usersocialauth
71	social_django	partial
72	oauth2_provider	application
73	oauth2_provider	accesstoken
74	oauth2_provider	grant
75	oauth2_provider	refreshtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-09 09:18:27.866344+00
2	auth	0001_initial	2020-02-09 09:18:28.236183+00
3	admin	0001_initial	2020-02-09 09:18:28.374196+00
4	admin	0002_logentry_remove_auto_add	2020-02-09 09:18:28.454359+00
5	agencies	0001_initial	2020-02-09 09:18:28.506831+00
6	tags	0001_initial	2020-02-09 09:18:29.414836+00
7	graphs	0001_initial	2020-02-09 09:18:29.90759+00
8	analysis	0001_initial	2020-02-09 09:18:30.113668+00
9	contenttypes	0002_remove_content_type_name	2020-02-09 09:18:30.197846+00
10	auth	0002_alter_permission_name_max_length	2020-02-09 09:18:30.218398+00
11	auth	0003_alter_user_email_max_length	2020-02-09 09:18:30.282956+00
12	auth	0004_alter_user_username_opts	2020-02-09 09:18:30.329822+00
13	auth	0005_alter_user_last_login_null	2020-02-09 09:18:30.388202+00
14	auth	0006_require_contenttypes_0002	2020-02-09 09:18:30.393678+00
15	auth	0007_alter_validators_add_error_messages	2020-02-09 09:18:30.469162+00
16	auth	0008_alter_user_username_max_length	2020-02-09 09:18:30.55145+00
17	auth	0009_alter_user_last_name_max_length	2020-02-09 09:18:30.639271+00
18	nations	0001_initial	2020-02-09 09:18:31.43238+00
19	competitions	0001_initial	2020-02-09 09:18:31.83884+00
20	competitions	0002_competition_federation	2020-02-09 09:18:32.028286+00
21	formations	0001_initial	2020-02-09 09:18:33.502764+00
22	persons	0001_initial	2020-02-09 09:18:34.777852+00
23	teams	0001_initial	2020-02-09 09:18:36.606771+00
24	contracts	0001_initial	2020-02-09 09:18:37.467583+00
25	contracts	0002_auto_20200207_1657	2020-02-09 09:18:38.961679+00
26	dashboard	0001_initial	2020-02-09 09:18:39.024073+00
27	django_registration	0001_initial	2020-02-09 09:18:39.227691+00
28	matches	0001_initial	2020-02-09 09:18:39.268275+00
29	events	0001_initial	2020-02-09 09:18:39.555089+00
30	events	0002_auto_20200207_1657	2020-02-09 09:18:39.97126+00
31	events	0003_auto_20200207_1657	2020-02-09 09:18:40.598635+00
32	jet	0001_initial	2020-02-09 09:18:40.65549+00
33	jet	0002_delete_userdashboardmodule	2020-02-09 09:18:40.673415+00
34	tools	0001_initial	2020-02-09 09:18:40.925559+00
35	match	0001_initial	2020-02-09 09:18:41.667833+00
36	matches	0002_auto_20200207_1657	2020-02-09 09:18:42.572895+00
37	oauth2_provider	0001_initial	2020-02-09 09:18:43.753443+00
38	oauth2_provider	0002_08_updates	2020-02-09 09:18:44.712011+00
39	oauth2_provider	0003_auto_20160316_1503	2020-02-09 09:18:45.003348+00
40	oauth2_provider	0004_auto_20160525_1623	2020-02-09 09:18:45.757826+00
41	oauth2_provider	0005_auto_20170514_1141	2020-02-09 09:18:49.792999+00
42	oauth2_provider	0006_auto_20171214_2232	2020-02-09 09:18:50.657147+00
43	reports	0001_initial	2020-02-09 09:18:52.256546+00
44	scouting_box	0001_initial	2020-02-09 09:18:53.02349+00
45	sessions	0001_initial	2020-02-09 09:18:53.122137+00
46	default	0001_initial	2020-02-09 09:18:53.796447+00
47	social_auth	0001_initial	2020-02-09 09:18:53.801716+00
48	default	0002_add_related_name	2020-02-09 09:18:54.037777+00
49	social_auth	0002_add_related_name	2020-02-09 09:18:54.066708+00
50	default	0003_alter_email_max_length	2020-02-09 09:18:54.183646+00
51	social_auth	0003_alter_email_max_length	2020-02-09 09:18:54.19823+00
52	default	0004_auto_20160423_0400	2020-02-09 09:18:54.423098+00
53	social_auth	0004_auto_20160423_0400	2020-02-09 09:18:54.477906+00
54	social_auth	0005_auto_20160727_2333	2020-02-09 09:18:54.57627+00
55	social_django	0006_partial	2020-02-09 09:18:54.652361+00
56	social_django	0007_code_timestamp	2020-02-09 09:18:54.69461+00
57	social_django	0008_partial_timestamp	2020-02-09 09:18:54.735958+00
58	tag	0001_initial	2020-02-09 09:18:55.877763+00
59	social_django	0003_alter_email_max_length	2020-02-09 09:18:55.885521+00
60	social_django	0005_auto_20160727_2333	2020-02-09 09:18:55.890245+00
61	social_django	0004_auto_20160423_0400	2020-02-09 09:18:55.895042+00
62	social_django	0001_initial	2020-02-09 09:18:55.899743+00
63	social_django	0002_add_related_name	2020-02-09 09:18:55.904802+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.events (id, start_event, end_event, note, created_by_id, match_id, period_id, player_id, team_id) FROM stdin;
\.


--
-- Data for Name: events_tagCombinations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."events_tagCombinations" (id, event_id, tagcombinationtoversion_id, sort_value) FROM stdin;
\.


--
-- Data for Name: federations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.federations (id, name, object_id, content_type_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: footedness; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.footedness (id, type, created_by_id) FROM stdin;
1	Right-Footed	\N
2	Left-Footed	\N
3	Two-Footed	\N
\.


--
-- Data for Name: formationToRoles; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."formationToRoles" (id, url_image, created_by_id, formation_id, role_id) FROM stdin;
1	\N	\N	1	14
2	\N	\N	1	13
3	\N	\N	1	1
4	\N	\N	1	17
5	\N	\N	1	19
6	\N	\N	1	10
7	\N	\N	1	7
8	\N	\N	1	18
9	\N	\N	1	9
10	\N	\N	1	11
11	\N	\N	1	20
12	\N	\N	2	6
13	\N	\N	2	16
14	\N	\N	2	15
15	\N	\N	2	7
16	\N	\N	2	19
17	\N	\N	2	3
18	\N	\N	2	4
19	\N	\N	2	5
20	\N	\N	2	2
21	\N	\N	2	10
22	\N	\N	2	8
23	\N	\N	3	15
24	\N	\N	3	19
25	\N	\N	3	8
26	\N	\N	3	20
27	\N	\N	3	13
28	\N	\N	3	4
29	\N	\N	3	12
30	\N	\N	3	1
31	\N	\N	3	16
32	\N	\N	3	5
33	\N	\N	3	10
34	\N	\N	4	13
35	\N	\N	4	14
36	\N	\N	4	3
37	\N	\N	4	17
38	\N	\N	4	4
39	\N	\N	4	7
40	\N	\N	4	1
41	\N	\N	4	10
42	\N	\N	4	12
43	\N	\N	4	8
44	\N	\N	4	9
45	\N	\N	5	17
46	\N	\N	5	20
47	\N	\N	5	4
48	\N	\N	5	1
49	\N	\N	5	16
50	\N	\N	5	14
51	\N	\N	5	15
52	\N	\N	5	8
53	\N	\N	5	19
54	\N	\N	5	9
55	\N	\N	5	12
56	\N	\N	6	1
57	\N	\N	6	13
58	\N	\N	6	3
59	\N	\N	6	4
60	\N	\N	6	12
61	\N	\N	6	11
62	\N	\N	6	14
63	\N	\N	6	19
64	\N	\N	6	2
65	\N	\N	6	9
66	\N	\N	6	20
67	\N	\N	7	14
68	\N	\N	7	16
69	\N	\N	7	1
70	\N	\N	7	3
71	\N	\N	7	6
72	\N	\N	7	18
73	\N	\N	7	7
74	\N	\N	7	8
75	\N	\N	7	4
76	\N	\N	7	13
77	\N	\N	7	19
78	\N	\N	8	17
79	\N	\N	8	2
80	\N	\N	8	19
81	\N	\N	8	11
82	\N	\N	8	10
83	\N	\N	8	12
84	\N	\N	8	1
85	\N	\N	8	9
86	\N	\N	8	6
87	\N	\N	8	20
88	\N	\N	8	13
89	\N	\N	9	18
90	\N	\N	9	7
91	\N	\N	9	20
92	\N	\N	9	5
93	\N	\N	9	19
94	\N	\N	9	11
95	\N	\N	9	16
96	\N	\N	9	6
97	\N	\N	9	17
98	\N	\N	9	1
99	\N	\N	9	10
100	\N	\N	10	16
101	\N	\N	10	4
102	\N	\N	10	17
103	\N	\N	10	7
104	\N	\N	10	8
105	\N	\N	10	15
106	\N	\N	10	18
107	\N	\N	10	10
108	\N	\N	10	1
109	\N	\N	10	9
110	\N	\N	10	5
\.


--
-- Data for Name: formations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.formations (id, system_of_play, created_by_id) FROM stdin;
1	1-3-3-4	\N
2	1-3-4-3	\N
3	1-3-5-2	\N
4	1-4-2-4	\N
5	1-4-3-3	\N
6	1-4-4-2	\N
7	1-4-5-1	\N
8	1-5-2-3	\N
9	1-5-3-2	\N
10	1-5-4-1	\N
\.


--
-- Data for Name: graphs; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.graphs (id, description, title, chart, "isElaborated", user_id) FROM stdin;
\.


--
-- Data for Name: graphs_input_data; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.graphs_input_data (id, graph_id, data_id) FROM stdin;
\.


--
-- Data for Name: graphs_tagComboSet; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."graphs_tagComboSet" (id, graph_id, tagcombinationset_id) FROM stdin;
\.


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Data for Name: match_buffermatchupload; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.match_buffermatchupload (id, filename, "gameDate", competition, episode, match, team, episode_start, episode_end, period, description, tags, player, notes, error_notes, date_import, created_by_id, status_id) FROM stdin;
\.


--
-- Data for Name: match_matchstatus; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.match_matchstatus (status_ptr_id, "defaultIs") FROM stdin;
1	t
2	f
3	f
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.matches (id, match_week, result, date, "time", away_team_id, competition_id, created_by_id, home_team_id) FROM stdin;
1	1.GIORNATA	2-3	2019-02-13	09:00:00	1	1	\N	16
2	1.GIORNATA	1-0	2019-02-14	09:00:00	10	1	\N	13
3	1.GIORNATA	3-0	2019-02-14	09:00:00	9	1	\N	12
4	1.GIORNATA	1-1	2019-02-14	09:00:00	4	1	\N	14
5	1.GIORNATA	2-3	2019-02-14	09:00:00	7	1	\N	5
6	1.GIORNATA	2-3	2019-02-15	09:00:00	15	1	\N	11
7	1.GIORNATA	6-3	2019-02-15	09:00:00	6	1	\N	3
8	1.GIORNATA	6-3	2019-02-16	09:00:00	8	1	\N	2
9	2.GIORNATA	1-2	2019-02-20	09:00:00	14	1	\N	9
10	2.GIORNATA	3-2	2019-02-21	09:00:00	13	1	\N	6
11	2.GIORNATA	1-0	2019-02-21	09:00:00	3	1	\N	1
12	2.GIORNATA	2-1	2019-02-21	09:00:00	16	1	\N	15
13	2.GIORNATA	3-0	2019-02-21	09:00:00	11	1	\N	4
14	2.GIORNATA	5-0	2019-02-22	09:00:00	12	1	\N	7
15	2.GIORNATA	0-1	2019-02-22	09:00:00	5	1	\N	8
16	2.GIORNATA	3-2	2019-02-23	09:00:00	2	1	\N	10
17	3.GIORNATA	0-2	2019-02-28	09:00:00	14	1	\N	12
18	3.GIORNATA	0-1	2019-02-28	09:00:00	1	1	\N	13
19	3.GIORNATA	1-0	2019-02-28	09:00:00	10	1	\N	4
20	3.GIORNATA	0-2	2019-02-28	09:00:00	7	1	\N	11
21	3.GIORNATA	3-0	2019-02-28	09:00:00	2	1	\N	3
22	3.GIORNATA	3-0	2019-09-29	09:00:00	5	1	\N	16
23	3.GIORNATA	0-0	2019-09-29	09:00:00	9	1	\N	15
24	3.GIORNATA	3-2	2019-09-30	09:00:00	8	1	\N	6
25	4.GIORNATA	2-1	2019-10-04	09:00:00	15	1	\N	5
26	4.GIORNATA	2-0	2019-10-05	09:00:00	6	1	\N	2
27	4.GIORNATA	5-2	2019-10-05	09:00:00	16	1	\N	7
28	4.GIORNATA	4-2	2019-10-05	09:00:00	11	1	\N	14
29	4.GIORNATA	1-1	2019-10-05	09:00:00	3	1	\N	10
30	4.GIORNATA	5-1	2019-10-06	09:00:00	12	1	\N	1
31	4.GIORNATA	1-4	2019-10-06	09:00:00	4	1	\N	8
32	4.GIORNATA	1-1	2019-10-07	09:00:00	13	1	\N	9
33	5.GIORNATA	3-1	2019-10-18	09:00:00	12	1	\N	16
34	5.GIORNATA	0-2	2019-10-18	09:00:00	7	1	\N	15
35	5.GIORNATA	4-3	2019-10-19	09:00:00	1	1	\N	4
36	5.GIORNATA	1-2	2019-10-19	09:00:00	2	1	\N	13
37	5.GIORNATA	2-0	2019-10-19	09:00:00	5	1	\N	6
38	5.GIORNATA	1-3	2019-10-20	09:00:00	14	1	\N	10
39	5.GIORNATA	1-1	2019-10-20	09:00:00	8	1	\N	3
40	5.GIORNATA	3-3	2019-10-21	09:00:00	9	1	\N	11
41	6.GIORNATA	3-3	2019-10-23	09:00:00	16	1	\N	3
42	6.GIORNATA	4-1	2019-10-26	09:00:00	4	1	\N	2
43	6.GIORNATA	2-1	2019-10-26	09:00:00	11	1	\N	12
44	6.GIORNATA	1-1	2019-10-27	09:00:00	13	1	\N	8
45	6.GIORNATA	3-1	2019-10-27	09:00:00	15	1	\N	14
46	6.GIORNATA	3-0	2019-10-28	09:00:00	10	1	\N	5
47	6.GIORNATA	4-0	2019-12-04	09:00:00	9	1	\N	7
48	6.GIORNATA	4-0	2019-12-04	09:00:00	6	1	\N	1
49	7.GIORNATA	2-4	2019-11-01	09:00:00	2	1	\N	1
50	7.GIORNATA	1-2	2019-11-02	09:00:00	7	1	\N	14
51	7.GIORNATA	1-1	2019-11-02	09:00:00	3	1	\N	13
52	7.GIORNATA	0-3	2019-11-02	09:00:00	8	1	\N	15
53	7.GIORNATA	2-1	2019-11-02	09:00:00	16	1	\N	11
54	7.GIORNATA	1-0	2019-11-03	09:00:00	5	1	\N	9
55	7.GIORNATA	5-1	2019-11-03	09:00:00	6	1	\N	10
56	7.GIORNATA	2-2	2019-12-04	09:00:00	12	1	\N	4
57	8.GIORNATA	0-4	2019-11-09	09:00:00	4	1	\N	3
58	8.GIORNATA	2-0	2019-11-09	09:00:00	10	1	\N	8
59	8.GIORNATA	4-0	2019-11-09	09:00:00	9	1	\N	6
60	8.GIORNATA	1-4	2019-11-09	09:00:00	14	1	\N	16
61	8.GIORNATA	3-4	2019-11-09	09:00:00	11	1	\N	13
62	8.GIORNATA	3-3	2019-11-10	09:00:00	7	1	\N	2
63	8.GIORNATA	3-1	2019-11-10	09:00:00	15	1	\N	12
64	8.GIORNATA	2-1	2020-01-22	09:00:00	1	1	\N	5
65	9.GIORNATA	4-1	2019-11-22	09:00:00	13	1	\N	7
66	9.GIORNATA	4-1	2019-11-22	09:00:00	8	1	\N	12
67	9.GIORNATA	2-1	2019-11-23	09:00:00	2	1	\N	15
68	9.GIORNATA	0-0	2019-11-23	09:00:00	10	1	\N	1
69	9.GIORNATA	5-1	2019-11-23	09:00:00	5	1	\N	11
70	9.GIORNATA	1-0	2019-11-23	09:00:00	3	1	\N	9
71	9.GIORNATA	1-0	2019-11-24	09:00:00	6	1	\N	14
72	9.GIORNATA	2-1	2019-11-25	09:00:00	16	1	\N	4
73	10.GIORNATA	4-3	2019-11-29	09:00:00	11	1	\N	2
74	10.GIORNATA	0-1	2019-11-30	09:00:00	7	1	\N	3
75	10.GIORNATA	0-2	2019-11-30	09:00:00	12	1	\N	5
76	10.GIORNATA	1-0	2019-11-30	09:00:00	4	1	\N	6
77	10.GIORNATA	1-0	2019-11-30	09:00:00	15	1	\N	10
78	10.GIORNATA	2-3	2019-11-30	09:00:00	9	1	\N	16
79	10.GIORNATA	0-1	2019-12-01	09:00:00	1	1	\N	8
80	10.GIORNATA	0-1	2019-12-01	09:00:00	14	1	\N	13
81	11.GIORNATA	0-2	2019-12-07	09:00:00	1	1	\N	15
82	11.GIORNATA	1-1	2019-12-07	09:00:00	10	1	\N	12
83	11.GIORNATA	0-3	2019-12-07	09:00:00	13	1	\N	4
84	11.GIORNATA	2-0	2019-12-07	09:00:00	8	1	\N	7
85	11.GIORNATA	0-0	2019-12-07	09:00:00	3	1	\N	11
86	11.GIORNATA	2-1	2019-12-08	09:00:00	2	1	\N	9
87	11.GIORNATA	2-0	2019-12-08	09:00:00	5	1	\N	14
88	11.GIORNATA	3-1	2019-12-09	09:00:00	6	1	\N	16
89	12.GIORNATA	1-0	2019-12-13	09:00:00	4	1	\N	5
90	12.GIORNATA	2-0	2019-12-14	09:00:00	14	1	\N	3
91	12.GIORNATA	1-1	2019-12-14	09:00:00	11	1	\N	1
92	12.GIORNATA	0-0	2019-12-14	09:00:00	9	1	\N	10
93	12.GIORNATA	1-2	2019-12-14	09:00:00	15	1	\N	13
94	12.GIORNATA	1-4	2019-12-15	09:00:00	7	1	\N	6
95	12.GIORNATA	0-0	2019-12-15	09:00:00	12	1	\N	2
96	12.GIORNATA	2-2	2019-12-15	09:00:00	16	1	\N	8
97	13.GIORNATA	1-1	2019-12-20	09:00:00	8	1	\N	11
98	13.GIORNATA	2-1	2019-12-21	09:00:00	3	1	\N	15
99	13.GIORNATA	0-3	2019-12-21	09:00:00	10	1	\N	16
100	13.GIORNATA	2-1	2019-12-21	09:00:00	1	1	\N	7
101	13.GIORNATA	1-1	2019-12-21	09:00:00	4	1	\N	9
102	13.GIORNATA	1-5	2019-12-21	09:00:00	2	1	\N	14
103	13.GIORNATA	3-2	2019-12-21	09:00:00	6	1	\N	12
104	13.GIORNATA	2-1	2019-12-22	09:00:00	13	1	\N	5
105	14.GIORNATA	0-3	2020-01-10	09:00:00	7	1	\N	4
106	14.GIORNATA	2-2	2020-01-11	09:00:00	5	1	\N	3
107	14.GIORNATA	0-3	2020-01-11	09:00:00	14	1	\N	8
108	14.GIORNATA	0-1	2020-01-11	09:00:00	12	1	\N	13
109	14.GIORNATA	0-0	2020-01-11	09:00:00	11	1	\N	10
110	14.GIORNATA	2-1	2020-01-12	09:00:00	16	1	\N	2
111	14.GIORNATA	3-1	2020-01-12	09:00:00	9	1	\N	1
112	14.GIORNATA	0-0	2020-01-12	09:00:00	15	1	\N	6
113	15.GIORNATA	5-4	2020-01-18	09:00:00	2	1	\N	5
114	15.GIORNATA	1-1	2020-01-18	09:00:00	1	1	\N	14
115	15.GIORNATA	3-2	2020-01-18	09:00:00	8	1	\N	9
116	15.GIORNATA	2-1	2020-01-18	09:00:00	3	1	\N	12
117	15.GIORNATA	1-0	2020-01-19	09:00:00	13	1	\N	16
118	15.GIORNATA	0-0	2020-01-19	09:00:00	10	1	\N	7
119	15.GIORNATA	2-0	2020-01-19	09:00:00	6	1	\N	11
120	15.GIORNATA	1-4	2020-01-20	09:00:00	4	1	\N	15
121	16.GIORNATA	2-2	2020-01-24	09:00:00	2	1	\N	8
122	16.GIORNATA	2-2	2020-01-25	09:00:00	16	1	\N	1
123	16.GIORNATA	2-0	2020-01-25	09:00:00	12	1	\N	9
124	16.GIORNATA	2-2	2020-01-25	09:00:00	5	1	\N	7
125	16.GIORNATA	0-1	2020-01-25	09:00:00	3	1	\N	6
126	16.GIORNATA	1-3	2020-01-26	09:00:00	14	1	\N	4
127	16.GIORNATA	1-2	2020-01-26	09:00:00	13	1	\N	10
128	16.GIORNATA	0-2	2020-01-26	09:00:00	11	1	\N	15
129	17.GIORNATA	1-2	2020-02-01	09:00:00	10	1	\N	2
130	17.GIORNATA	1-2	2020-02-01	09:00:00	1	1	\N	3
131	17.GIORNATA	0-1	2020-02-01	09:00:00	6	1	\N	13
132	17.GIORNATA	2-4	2020-02-01	09:00:00	15	1	\N	16
133	17.GIORNATA	2-1	2020-02-01	09:00:00	7	1	\N	12
134	17.GIORNATA	2-1	2020-02-02	09:00:00	9	1	\N	14
135	17.GIORNATA	4-3	2020-02-02	09:00:00	4	1	\N	11
136	17.GIORNATA	0-0	2020-02-03	09:00:00	8	1	\N	5
137	18.GIORNATA	0-0	2020-02-07	09:00:00	15	1	\N	9
138	18.GIORNATA	0-0	2020-02-08	09:00:00	3	1	\N	2
139	18.GIORNATA	0-0	2020-02-08	09:00:00	13	1	\N	1
140	18.GIORNATA	0-0	2020-02-08	09:00:00	6	1	\N	8
141	18.GIORNATA	0-0	2020-02-08	09:00:00	11	1	\N	7
142	18.GIORNATA	0-0	2020-02-08	09:00:00	16	1	\N	5
143	18.GIORNATA	0-0	2020-02-09	09:00:00	12	1	\N	14
144	18.GIORNATA	0-0	2020-02-09	09:00:00	4	1	\N	10
145	19.GIORNATA	0-0	2020-02-15	09:00:00	2	1	\N	6
146	19.GIORNATA	0-0	2020-02-15	09:00:00	1	1	\N	12
147	19.GIORNATA	0-0	2020-02-15	09:00:00	14	1	\N	11
148	19.GIORNATA	0-0	2020-02-15	09:00:00	7	1	\N	16
149	19.GIORNATA	0-0	2020-02-16	09:00:00	10	1	\N	3
150	19.GIORNATA	0-0	2020-02-16	09:00:00	8	1	\N	4
151	19.GIORNATA	0-0	2020-02-17	09:00:00	5	1	\N	15
152	19.GIORNATA	0-0	2020-02-17	09:00:00	9	1	\N	13
153	20.GIORNATA	0-0	2020-02-22	09:00:00	13	1	\N	2
154	20.GIORNATA	0-0	2020-02-22	09:00:00	4	1	\N	1
155	20.GIORNATA	0-0	2020-02-22	09:00:00	6	1	\N	5
156	20.GIORNATA	0-0	2020-02-22	09:00:00	10	1	\N	14
157	20.GIORNATA	0-0	2020-02-22	09:00:00	11	1	\N	9
158	20.GIORNATA	0-0	2020-02-22	09:00:00	16	1	\N	12
159	20.GIORNATA	0-0	2020-02-22	09:00:00	15	1	\N	7
160	20.GIORNATA	0-0	2020-02-22	09:00:00	3	1	\N	8
161	21.GIORNATA	0-0	2020-02-29	09:00:00	1	1	\N	6
162	21.GIORNATA	0-0	2020-02-29	09:00:00	8	1	\N	13
163	21.GIORNATA	0-0	2020-02-29	09:00:00	7	1	\N	9
164	21.GIORNATA	0-0	2020-02-29	09:00:00	5	1	\N	10
165	21.GIORNATA	0-0	2020-02-29	09:00:00	2	1	\N	4
166	21.GIORNATA	0-0	2020-02-29	09:00:00	12	1	\N	11
167	21.GIORNATA	0-0	2020-02-29	09:00:00	3	1	\N	16
168	21.GIORNATA	0-0	2020-02-29	09:00:00	14	1	\N	15
169	22.GIORNATA	0-0	2020-03-07	09:00:00	13	1	\N	3
170	22.GIORNATA	0-0	2020-03-07	09:00:00	1	1	\N	2
171	22.GIORNATA	0-0	2020-03-07	09:00:00	14	1	\N	7
172	22.GIORNATA	0-0	2020-03-07	09:00:00	10	1	\N	6
173	22.GIORNATA	0-0	2020-03-07	09:00:00	11	1	\N	16
174	22.GIORNATA	0-0	2020-03-07	09:00:00	15	1	\N	8
175	22.GIORNATA	0-0	2020-03-07	09:00:00	4	1	\N	12
176	22.GIORNATA	0-0	2020-03-07	09:00:00	9	1	\N	5
177	23.GIORNATA	0-0	2020-03-14	09:00:00	5	1	\N	1
178	23.GIORNATA	0-0	2020-03-14	09:00:00	13	1	\N	11
179	23.GIORNATA	0-0	2020-03-14	09:00:00	6	1	\N	9
180	23.GIORNATA	0-0	2020-03-14	09:00:00	2	1	\N	7
181	23.GIORNATA	0-0	2020-03-14	09:00:00	16	1	\N	14
182	23.GIORNATA	0-0	2020-03-14	09:00:00	12	1	\N	15
183	23.GIORNATA	0-0	2020-03-14	09:00:00	3	1	\N	4
184	23.GIORNATA	0-0	2020-03-14	09:00:00	8	1	\N	10
185	24.GIORNATA	0-0	2020-04-04	09:00:00	7	1	\N	13
186	24.GIORNATA	0-0	2020-04-04	09:00:00	1	1	\N	10
187	24.GIORNATA	0-0	2020-04-04	09:00:00	9	1	\N	3
188	24.GIORNATA	0-0	2020-04-04	09:00:00	14	1	\N	6
189	24.GIORNATA	0-0	2020-04-04	09:00:00	11	1	\N	5
190	24.GIORNATA	0-0	2020-04-04	09:00:00	15	1	\N	2
191	24.GIORNATA	0-0	2020-04-04	09:00:00	12	1	\N	8
192	24.GIORNATA	0-0	2020-04-04	09:00:00	4	1	\N	16
193	25.GIORNATA	0-0	2020-04-18	09:00:00	13	1	\N	14
194	25.GIORNATA	0-0	2020-04-18	09:00:00	8	1	\N	1
195	25.GIORNATA	0-0	2020-04-18	09:00:00	6	1	\N	4
196	25.GIORNATA	0-0	2020-04-18	09:00:00	10	1	\N	15
197	25.GIORNATA	0-0	2020-04-18	09:00:00	5	1	\N	12
198	25.GIORNATA	0-0	2020-04-18	09:00:00	2	1	\N	11
199	25.GIORNATA	0-0	2020-04-18	09:00:00	16	1	\N	9
200	25.GIORNATA	0-0	2020-04-18	09:00:00	3	1	\N	7
201	26.GIORNATA	0-0	2020-04-25	09:00:00	15	1	\N	1
202	26.GIORNATA	0-0	2020-04-25	09:00:00	4	1	\N	13
203	26.GIORNATA	0-0	2020-04-25	09:00:00	7	1	\N	8
204	26.GIORNATA	0-0	2020-04-25	09:00:00	11	1	\N	3
205	26.GIORNATA	0-0	2020-04-25	09:00:00	16	1	\N	6
206	26.GIORNATA	0-0	2020-04-25	09:00:00	12	1	\N	10
207	26.GIORNATA	0-0	2020-04-25	09:00:00	9	1	\N	2
208	26.GIORNATA	0-0	2020-04-25	09:00:00	14	1	\N	5
209	27.GIORNATA	0-0	2020-05-02	09:00:00	13	1	\N	15
210	27.GIORNATA	0-0	2020-05-02	09:00:00	1	1	\N	11
211	27.GIORNATA	0-0	2020-05-02	09:00:00	6	1	\N	7
212	27.GIORNATA	0-0	2020-05-02	09:00:00	10	1	\N	9
213	27.GIORNATA	0-0	2020-05-02	09:00:00	5	1	\N	4
214	27.GIORNATA	0-0	2020-05-02	09:00:00	2	1	\N	12
215	27.GIORNATA	0-0	2020-05-02	09:00:00	3	1	\N	14
216	27.GIORNATA	0-0	2020-05-02	09:00:00	8	1	\N	16
217	28.GIORNATA	0-0	2020-05-09	09:00:00	7	1	\N	1
218	28.GIORNATA	0-0	2020-05-09	09:00:00	5	1	\N	13
219	28.GIORNATA	0-0	2020-05-09	09:00:00	11	1	\N	8
220	28.GIORNATA	0-0	2020-05-09	09:00:00	16	1	\N	10
221	28.GIORNATA	0-0	2020-05-09	09:00:00	15	1	\N	3
222	28.GIORNATA	0-0	2020-05-09	09:00:00	12	1	\N	6
223	28.GIORNATA	0-0	2020-05-09	09:00:00	9	1	\N	4
224	28.GIORNATA	0-0	2020-05-09	09:00:00	14	1	\N	2
225	29.GIORNATA	0-0	2020-05-16	09:00:00	13	1	\N	12
226	29.GIORNATA	0-0	2020-05-16	09:00:00	1	1	\N	9
227	29.GIORNATA	0-0	2020-05-16	09:00:00	6	1	\N	15
228	29.GIORNATA	0-0	2020-05-16	09:00:00	10	1	\N	11
229	29.GIORNATA	0-0	2020-05-16	09:00:00	2	1	\N	16
230	29.GIORNATA	0-0	2020-05-16	09:00:00	4	1	\N	7
231	29.GIORNATA	0-0	2020-05-16	09:00:00	3	1	\N	5
232	29.GIORNATA	0-0	2020-05-16	09:00:00	8	1	\N	14
233	30.GIORNATA	0-0	2020-05-23	09:00:00	16	1	\N	13
234	30.GIORNATA	0-0	2020-05-23	09:00:00	14	1	\N	1
235	30.GIORNATA	0-0	2020-05-23	09:00:00	7	1	\N	10
236	30.GIORNATA	0-0	2020-05-23	09:00:00	11	1	\N	6
237	30.GIORNATA	0-0	2020-05-23	09:00:00	5	1	\N	2
238	30.GIORNATA	0-0	2020-05-23	09:00:00	15	1	\N	4
239	30.GIORNATA	0-0	2020-05-23	09:00:00	12	1	\N	3
240	30.GIORNATA	0-0	2020-05-23	09:00:00	9	1	\N	8
\.


--
-- Data for Name: monitoringTeam; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."monitoringTeam" (id, created_by_id, team_id, contract_id) FROM stdin;
\.


--
-- Data for Name: monitoringTeamToUser; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."monitoringTeamToUser" (id, start, "end", created_by_id, "monitoringTeam_id", user_id) FROM stdin;
\.


--
-- Data for Name: nations; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.nations (id, name, "alpha2Code", continent_id, created_by_id) FROM stdin;
1	AFGHANISTAN	AF	1	\N
2	ÅLAND ISLANDS	AX	2	\N
3	ALBANIA	AL	2	\N
4	ALGERIA	DZ	0	\N
5	AMERICAN SAMOA	AS	4	\N
6	ANDORRA	AD	2	\N
7	ANGOLA	AO	0	\N
8	ANGUILLA	AI	3	\N
9	ANTARCTICA	AQ	\N	\N
10	ANTIGUA AND BARBUDA	AG	3	\N
11	ARGENTINA	AR	3	\N
12	ARMENIA	AM	1	\N
13	ARUBA	AW	3	\N
14	AUSTRALIA	AU	4	\N
15	AUSTRIA	AT	2	\N
16	AZERBAIJAN	AZ	1	\N
17	BAHAMAS	BS	3	\N
18	BAHRAIN	BH	1	\N
19	BANGLADESH	BD	1	\N
20	BARBADOS	BB	3	\N
21	BELARUS	BY	2	\N
22	BELGIUM	BE	2	\N
23	BELIZE	BZ	3	\N
24	BENIN	BJ	0	\N
25	BERMUDA	BM	3	\N
26	BHUTAN	BT	1	\N
27	BOLIVIA (PLURINATIONAL STATE OF)	BO	3	\N
28	BONAIRE, SINT EUSTATIUS AND SABA	BQ	3	\N
29	BOSNIA AND HERZEGOVINA	BA	2	\N
30	BOTSWANA	BW	0	\N
31	BOUVET ISLAND	BV	\N	\N
32	BRAZIL	BR	3	\N
33	BRITISH INDIAN OCEAN TERRITORY	IO	0	\N
34	UNITED STATES MINOR OUTLYING ISLANDS	UM	3	\N
35	VIRGIN ISLANDS (BRITISH)	VG	3	\N
36	VIRGIN ISLANDS (U.S.)	VI	3	\N
37	BRUNEI DARUSSALAM	BN	1	\N
38	BULGARIA	BG	2	\N
39	BURKINA FASO	BF	0	\N
40	BURUNDI	BI	0	\N
41	CAMBODIA	KH	1	\N
42	CAMEROON	CM	0	\N
43	CANADA	CA	3	\N
44	CABO VERDE	CV	0	\N
45	CAYMAN ISLANDS	KY	3	\N
46	CENTRAL AFRICAN REPUBLIC	CF	0	\N
47	CHAD	TD	0	\N
48	CHILE	CL	3	\N
49	CHINA	CN	1	\N
50	CHRISTMAS ISLAND	CX	4	\N
51	COCOS (KEELING) ISLANDS	CC	4	\N
52	COLOMBIA	CO	3	\N
53	COMOROS	KM	0	\N
54	CONGO	CG	0	\N
55	CONGO (DEMOCRATIC REPUBLIC OF THE)	CD	0	\N
56	COOK ISLANDS	CK	4	\N
57	COSTA RICA	CR	3	\N
58	CROATIA	HR	2	\N
59	CUBA	CU	3	\N
60	CURAÇAO	CW	3	\N
61	CYPRUS	CY	2	\N
62	CZECH REPUBLIC	CZ	2	\N
63	DENMARK	DK	2	\N
64	DJIBOUTI	DJ	0	\N
65	DOMINICA	DM	3	\N
66	DOMINICAN REPUBLIC	DO	3	\N
67	ECUADOR	EC	3	\N
68	EGYPT	EG	0	\N
69	EL SALVADOR	SV	3	\N
70	EQUATORIAL GUINEA	GQ	0	\N
71	ERITREA	ER	0	\N
72	ESTONIA	EE	2	\N
73	ETHIOPIA	ET	0	\N
74	FALKLAND ISLANDS (MALVINAS)	FK	3	\N
75	FAROE ISLANDS	FO	2	\N
76	FIJI	FJ	4	\N
77	FINLAND	FI	2	\N
78	FRANCE	FR	2	\N
79	FRENCH GUIANA	GF	3	\N
80	FRENCH POLYNESIA	PF	4	\N
81	FRENCH SOUTHERN TERRITORIES	TF	0	\N
82	GABON	GA	0	\N
83	GAMBIA	GM	0	\N
84	GEORGIA	GE	1	\N
85	GERMANY	DE	2	\N
86	GHANA	GH	0	\N
87	GIBRALTAR	GI	2	\N
88	GREECE	GR	2	\N
89	GREENLAND	GL	3	\N
90	GRENADA	GD	3	\N
91	GUADELOUPE	GP	3	\N
92	GUAM	GU	4	\N
93	GUATEMALA	GT	3	\N
94	GUERNSEY	GG	2	\N
95	GUINEA	GN	0	\N
96	GUINEA-BISSAU	GW	0	\N
97	GUYANA	GY	3	\N
98	HAITI	HT	3	\N
99	HEARD ISLAND AND MCDONALD ISLANDS	HM	\N	\N
100	HOLY SEE	VA	2	\N
101	HONDURAS	HN	3	\N
102	HONG KONG	HK	1	\N
103	HUNGARY	HU	2	\N
104	ICELAND	IS	2	\N
105	INDIA	IN	1	\N
106	INDONESIA	ID	1	\N
107	CÔTE D'IVOIRE	CI	0	\N
108	IRAN (ISLAMIC REPUBLIC OF)	IR	1	\N
109	IRAQ	IQ	1	\N
110	IRELAND	IE	2	\N
111	ISLE OF MAN	IM	2	\N
112	ISRAEL	IL	1	\N
113	ITALY	IT	2	\N
114	JAMAICA	JM	3	\N
115	JAPAN	JP	1	\N
116	JERSEY	JE	2	\N
117	JORDAN	JO	1	\N
118	KAZAKHSTAN	KZ	1	\N
119	KENYA	KE	0	\N
120	KIRIBATI	KI	4	\N
121	KUWAIT	KW	1	\N
122	KYRGYZSTAN	KG	1	\N
123	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	1	\N
124	LATVIA	LV	2	\N
125	LEBANON	LB	1	\N
126	LESOTHO	LS	0	\N
127	LIBERIA	LR	0	\N
128	LIBYA	LY	0	\N
129	LIECHTENSTEIN	LI	2	\N
130	LITHUANIA	LT	2	\N
131	LUXEMBOURG	LU	2	\N
132	MACAO	MO	1	\N
133	MACEDONIA (THE FORMER YUGOSLAV REPUBLIC OF)	MK	2	\N
134	MADAGASCAR	MG	0	\N
135	MALAWI	MW	0	\N
136	MALAYSIA	MY	1	\N
137	MALDIVES	MV	1	\N
138	MALI	ML	0	\N
139	MALTA	MT	2	\N
140	MARSHALL ISLANDS	MH	4	\N
141	MARTINIQUE	MQ	3	\N
142	MAURITANIA	MR	0	\N
143	MAURITIUS	MU	0	\N
144	MAYOTTE	YT	0	\N
145	MEXICO	MX	3	\N
146	MICRONESIA (FEDERATED STATES OF)	FM	4	\N
147	MOLDOVA (REPUBLIC OF)	MD	2	\N
148	MONACO	MC	2	\N
149	MONGOLIA	MN	1	\N
150	MONTENEGRO	ME	2	\N
151	MONTSERRAT	MS	3	\N
152	MOROCCO	MA	0	\N
153	MOZAMBIQUE	MZ	0	\N
154	MYANMAR	MM	1	\N
155	NAMIBIA	NA	0	\N
156	NAURU	NR	4	\N
157	NEPAL	NP	1	\N
158	NETHERLANDS	NL	2	\N
159	NEW CALEDONIA	NC	4	\N
160	NEW ZEALAND	NZ	4	\N
161	NICARAGUA	NI	3	\N
162	NIGER	NE	0	\N
163	NIGERIA	NG	0	\N
164	NIUE	NU	4	\N
165	NORFOLK ISLAND	NF	4	\N
166	KOREA (DEMOCRATIC PEOPLE'S REPUBLIC OF)	KP	1	\N
167	NORTHERN MARIANA ISLANDS	MP	4	\N
168	NORWAY	NO	2	\N
169	OMAN	OM	1	\N
170	PAKISTAN	PK	1	\N
171	PALAU	PW	4	\N
172	PALESTINE, STATE OF	PS	1	\N
173	PANAMA	PA	3	\N
174	PAPUA NEW GUINEA	PG	4	\N
175	PARAGUAY	PY	3	\N
176	PERU	PE	3	\N
177	PHILIPPINES	PH	1	\N
178	PITCAIRN	PN	4	\N
179	POLAND	PL	2	\N
180	PORTUGAL	PT	2	\N
181	PUERTO RICO	PR	3	\N
182	QATAR	QA	1	\N
183	REPUBLIC OF KOSOVO	XK	2	\N
184	RÉUNION	RE	0	\N
185	ROMANIA	RO	2	\N
186	RUSSIAN FEDERATION	RU	2	\N
187	RWANDA	RW	0	\N
188	SAINT BARTHÉLEMY	BL	3	\N
189	SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA	SH	0	\N
190	SAINT KITTS AND NEVIS	KN	3	\N
191	SAINT LUCIA	LC	3	\N
192	SAINT MARTIN (FRENCH PART)	MF	3	\N
193	SAINT PIERRE AND MIQUELON	PM	3	\N
194	SAINT VINCENT AND THE GRENADINES	VC	3	\N
195	SAMOA	WS	4	\N
196	SAN MARINO	SM	2	\N
197	SAO TOME AND PRINCIPE	ST	0	\N
198	SAUDI ARABIA	SA	1	\N
199	SENEGAL	SN	0	\N
200	SERBIA	RS	2	\N
201	SEYCHELLES	SC	0	\N
202	SIERRA LEONE	SL	0	\N
203	SINGAPORE	SG	1	\N
204	SINT MAARTEN (DUTCH PART)	SX	3	\N
205	SLOVAKIA	SK	2	\N
206	SLOVENIA	SI	2	\N
207	SOLOMON ISLANDS	SB	4	\N
208	SOMALIA	SO	0	\N
209	SOUTH AFRICA	ZA	0	\N
210	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	GS	3	\N
211	KOREA (REPUBLIC OF)	KR	1	\N
212	SOUTH SUDAN	SS	0	\N
213	SPAIN	ES	2	\N
214	SRI LANKA	LK	1	\N
215	SUDAN	SD	0	\N
216	SURINAME	SR	3	\N
217	SVALBARD AND JAN MAYEN	SJ	2	\N
218	SWAZILAND	SZ	0	\N
219	SWEDEN	SE	2	\N
220	SWITZERLAND	CH	2	\N
221	SYRIAN ARAB REPUBLIC	SY	1	\N
222	TAIWAN	TW	1	\N
223	TAJIKISTAN	TJ	1	\N
224	TANZANIA, UNITED REPUBLIC OF	TZ	0	\N
225	THAILAND	TH	1	\N
226	TIMOR-LESTE	TL	1	\N
227	TOGO	TG	0	\N
228	TOKELAU	TK	4	\N
229	TONGA	TO	4	\N
230	TRINIDAD AND TOBAGO	TT	3	\N
231	TUNISIA	TN	0	\N
232	TURKEY	TR	1	\N
233	TURKMENISTAN	TM	1	\N
234	TURKS AND CAICOS ISLANDS	TC	3	\N
235	TUVALU	TV	4	\N
236	UGANDA	UG	0	\N
237	UKRAINE	UA	2	\N
238	UNITED ARAB EMIRATES	AE	1	\N
239	UNITED KINGDOM OF GREAT BRITAIN AND NORTHERN IRELAND	GB	2	\N
240	UNITED STATES OF AMERICA	US	3	\N
241	URUGUAY	UY	3	\N
242	UZBEKISTAN	UZ	1	\N
243	VANUATU	VU	4	\N
244	VENEZUELA (BOLIVARIAN REPUBLIC OF)	VE	3	\N
245	VIET NAM	VN	1	\N
246	WALLIS AND FUTUNA	WF	4	\N
247	WESTERN SAHARA	EH	0	\N
248	YEMEN	YE	1	\N
249	ZAMBIA	ZM	0	\N
250	ZIMBABWE	ZW	0	\N
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: period; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.period (id, name, created_by_id) FROM stdin;
0	1T	\N
1	2T	\N
2	1TS	\N
3	2TS	\N
4	CR	\N
\.


--
-- Data for Name: physiques; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.physiques (id, type, created_by_id) FROM stdin;
1	Esile	\N
2	Medio	\N
3	Robusto	\N
\.


--
-- Data for Name: playerRoles; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."playerRoles" (id, full_name, short_name, description, created_by_id, position_id) FROM stdin;
1	GOALKEEPER		\N	\N	\N
2	CENTRE-BACK		\N	\N	\N
3	RIGHT-CENTRE-BACK		\N	\N	\N
4	LEFT-CENTRE-BACK		\N	\N	\N
5	LEFT-BACK		\N	\N	\N
6	RIGHT-BACK		\N	\N	\N
7	LEFT-WING-BACK		\N	\N	\N
8	RIGHT-WING-BACK		\N	\N	\N
9	DEFENSIVE-MIDFIELDER		\N	\N	\N
10	CENTRAL-MIDFIELDER		\N	\N	\N
11	LEFT-MIDFIELDER		\N	\N	\N
12	RIGHT-MIDFIELDER		\N	\N	\N
13	LEFT-WINGER		\N	\N	\N
14	RIGHT-WINGER		\N	\N	\N
15	LEFT-WING-FORWARD		\N	\N	\N
16	RIGHT-WING-FORWARD		\N	\N	\N
17	OFFENSIVE-MIDFIELDER		\N	\N	\N
18	SECOND-STRIKER		\N	\N	\N
19	FIRST-STRIKER		\N	\N	\N
20	CENTRAL-FORWARD		\N	\N	\N
\.


--
-- Data for Name: player_report; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.player_report (id, created_on, name, "isConfirmed", created_by_id, player_id, report_template_id) FROM stdin;
\.


--
-- Data for Name: player_report_contracts; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.player_report_contracts (id, playerreport_id, contract_id) FROM stdin;
\.


--
-- Data for Name: player_report_matches; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.player_report_matches (id, playerreport_id, match_id) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.players (id, last_name, first_name, date_of_birth, profile_image, height, weight, agency_id, constitution_id, created_by_id, footedness_id, physique_id, place_of_birth_id, position_id) FROM stdin;
1	STANKOVIC	FILIP	2002-02-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/552223-1518092872.JPG?LM=1518092892	\N	\N	\N	\N	\N	\N	\N	\N	1
2	POZZER	GIACOMO	2001-02-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/422631-1518093815.JPG?LM=1518093882	\N	\N	\N	\N	\N	\N	\N	\N	1
3	PIROLA	LORENZO	2002-02-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/487834-1557134682.JPG?LM=1557134839	\N	\N	\N	\N	\N	\N	\N	\N	2
4	NTUBE	MICHAEL	2001-02-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/421870-1518093985.JPG?LM=1518094087	\N	\N	\N	\N	\N	\N	\N	\N	2
5	MORETTI	LORENZO	2002-02-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
6	YOUTE KINKOUE	ÉTIENNE	2002-01-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/639712-1556023858.JPG?LM=1556023869	\N	\N	\N	\N	\N	\N	\N	\N	2
7	COLOMBINI	LORENZO	2001-01-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/426244-1518094030.JPG?LM=1518094062	\N	\N	\N	\N	\N	\N	\N	\N	2
8	AGOUME	LUCIEN	2002-02-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/569384-1573556935.JPG?LM=1573556951	\N	\N	\N	\N	\N	\N	\N	\N	3
9	ESPINOZA	EMERSON	2001-03-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/621169-1558528623.PNG?LM=1558528634	\N	\N	\N	\N	\N	\N	\N	\N	3
10	SCHIRÒ	THOMAS	2000-04-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/357997-1551887609.JPG?LM=1551887661	\N	\N	\N	\N	\N	\N	\N	\N	3
11	ATTYS	CHRISTOPHER	2001-03-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
12	SQUIZZATO	NICCOLÒ	2002-01-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/487838-1518094309.JPG?LM=1518094316	\N	\N	\N	\N	\N	\N	\N	\N	3
13	VEZZONI	FRANCO	2001-11-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
14	PERSYN	TIBO	2002-03-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/486347-1568734724.JPG?LM=1568734796	\N	\N	\N	\N	\N	\N	\N	\N	3
15	GIANELLI	JACOPO	2001-03-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/535793-1518094360.JPG?LM=1518094366	\N	\N	\N	\N	\N	\N	\N	\N	3
16	BURGIO	RICCARDO	2001-05-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/537546-1518094522.JPG?LM=1518094548	\N	\N	\N	\N	\N	\N	\N	\N	3
17	ORISTANIO	GAETANO	2002-09-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
18	MULATTIERI	SAMUELE	2000-10-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/457422-1524474935.JPG?LM=1524474941	\N	\N	\N	\N	\N	\N	\N	\N	4
19	BONFANTI	NICHOLAS	2002-03-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/553513-1557134664.JPG?LM=1557134748	\N	\N	\N	\N	\N	\N	\N	\N	4
20	ESPOSITO	SEBASTIANO	2002-07-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/538918-1551691509.JPG?LM=1551691530	\N	\N	\N	\N	\N	\N	\N	\N	4
21	VERGANI	EDOARDO	2001-02-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/421780-1516008596.JPG?LM=1516008603	\N	\N	\N	\N	\N	\N	\N	\N	4
22	FONSECA	MATIAS	2001-03-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/538919-1518094510.JPG?LM=1518094553	\N	\N	\N	\N	\N	\N	\N	\N	4
23	SATRIANO	MARTÍN	2001-02-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/640109-1544639942.JPG?LM=1544639955	\N	\N	\N	\N	\N	\N	\N	\N	4
24	PAGLIARINI	ALESSIO	2000-01-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
25	ZAMARION	EMANUELE	2000-08-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
26	CARDINALI	MATTEO	2001-06-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
27	BIANDA	WILLIAM	2000-04-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/427197-1494231299.JPG?LM=1494231338	\N	\N	\N	\N	\N	\N	\N	\N	2
28	PLESNIEROWICZ	WIKTOR	2001-03-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/407089-1548175486.PNG?LM=1548175543	\N	\N	\N	\N	\N	\N	\N	\N	2
29	TRASCIANI	DANIELE	2000-01-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/454053-1507549205.JPG?LM=1507549210	\N	\N	\N	\N	\N	\N	\N	\N	2
30	SANTESE	ALESSIO	2001-01-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
31	BUTTARO	ALESSIO	2002-09-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
32	TRIPI	FILIPPO	2002-01-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
33	SEMERARO	FRANCESCO	2001-05-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
34	CALAFIORI	RICCARDO	2002-05-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
35	PARODI	STEFANO	2001-01-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
36	BOUAH	DEVID EUGENE	2001-08-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/457235-1569321258.JPG?LM=1569321269	\N	\N	\N	\N	\N	\N	\N	\N	2
37	NIGRO	GENNARO	2000-05-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
38	CHIERICO	LUCA	2001-09-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
39	DARBOE	EBRIMA	2001-06-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
40	SDAIGUI	ZAKARIA	2000-08-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
41	MASANGU	KERES	2000-03-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
42	SIMONETTI	PIER LUIGI	2001-01-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
43	BOVE	EDOARDO	2002-05-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
44	RICCARDI	ALESSIO	2001-04-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/421765-1526651302.JPG?LM=1526651320	\N	\N	\N	\N	\N	\N	\N	\N	3
45	D'ORAZIO	LUDOVICO	2000-02-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
46	ZALEWSKI	NICOLA	2002-01-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/550108-1558940490.JPG?LM=1558940513	\N	\N	\N	\N	\N	\N	\N	\N	4
47	BESUIJEN	VICENTE	2001-04-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/412954-1568733590.JPG?LM=1568733609	\N	\N	\N	\N	\N	\N	\N	\N	4
48	BAMBA	MORY	2002-06-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
49	PROVIDENCE	RUBEN	2001-07-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/536520-1568300695.JPG?LM=1568300713	\N	\N	\N	\N	\N	\N	\N	\N	4
50	ESTRELLA	FELIPE	2001-01-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/648638-1579617614.JPG?LM=1579617636	\N	\N	\N	\N	\N	\N	\N	\N	4
51	TALL	LAMINE	2001-12-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
52	CHIORRA	NICCOLÒ	2001-03-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
53	CHITI	LORENZO	2001-01-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
109	KAIQUE ROCHA		2001-02-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
54	DALLE MURA	CHRISTIAN	2002-02-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/487829-1572338706.JPG?LM=1572338726	\N	\N	\N	\N	\N	\N	\N	\N	2
55	DUTU	EDUARD	2001-04-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
56	SIMONTI	FEDERICO	2000-06-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
57	PONSI	FABIO	2001-02-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
58	PIEROZZI	EDOARDO	2001-09-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
59	FIORINI	MATTIA	2001-03-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
60	LOVISA	ALESSANDRO	2001-08-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/565041-1536475547.JPG?LM=1536475554	\N	\N	\N	\N	\N	\N	\N	\N	3
61	BIANCO	ALESSANDRO	2002-10-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
62	HANULJAK	MARKO	2000-01-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
63	BELOKO	NICKY	2000-02-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/382774-1520031537.JPEG?LM=1520031553	\N	\N	\N	\N	\N	\N	\N	\N	3
64	GORGOS	MARK	2000-05-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
65	CORRADINI	GIOVANNI	2002-11-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
66	PIEROZZI	NICCOLÒ	2001-09-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
67	FRUK	TONI	2001-03-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
68	KOFFI	CHRISTIAN	2000-08-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
69	DUNCAN	BOBBY	2001-06-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/401543-1569925143.JPG?LM=1569925165	\N	\N	\N	\N	\N	\N	\N	\N	4
70	SPALLUTO	SAMUELE	2001-02-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
71	KUKOVEC	NINO	2001-05-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
72	GAETA	LUCIO	2002-02-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
73	VODISEK	ROK	1998-12-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/320871-1432719615.JPG?LM=1433144322	\N	\N	\N	\N	\N	\N	\N	\N	1
74	RADAELLI	NICOLÒ	2001-03-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/460114-1488366481.JPG?LM=1488366490	\N	\N	\N	\N	\N	\N	\N	\N	1
75	DRAGO	GIACOMO	2001-03-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
76	MONTALDO	THOMAS	2001-04-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
77	AGOSTINO	GIUSEPPE	2002-12-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
78	DA CUNHA	VASCO	2000-05-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/445434-1507535132.JPG?LM=1507535142	\N	\N	\N	\N	\N	\N	\N	\N	2
79	DUMBRAVANU	DANIEL	2001-07-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
80	SERPE	LAURENS	2001-02-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/500164-1574267434.JPG?LM=1574267463	\N	\N	\N	\N	\N	\N	\N	\N	2
81	RUGGERI	SAMUELE	2001-01-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
82	RAGGIO	LEONARDO	2001-09-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
83	PICCARDO	MATTEO	2001-01-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
84	TIAGO GONÇALVES		2000-08-18	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
85	PICCARDO	MATTEO	2000-02-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/400576-1522154031.PNG?LM=1522154091	\N	\N	\N	\N	\N	\N	\N	\N	2
86	GASCO	GIACOMO	2001-05-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
87	ROVELLA	NICOLÒ	2001-12-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/525704-1577458782.PNG?LM=1577458795	\N	\N	\N	\N	\N	\N	\N	\N	3
88	ZENNARO	MATTIA	2000-08-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/529841-1564407890.JPG?LM=1564407922	\N	\N	\N	\N	\N	\N	\N	\N	3
89	MASINI	PATRIZIO	2001-01-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
90	VERONA GRÖNBERG	OLIVER	2001-04-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
91	BESAGGIO	MICHELE	2002-04-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
92	EBOA EBONGUE	STEEVE-MIKE	2001-02-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
93	CENCI	THÉO	2002-03-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
94	KALLON	YAYAH	2001-06-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
95	CLEONISE	DENILHO	2001-12-08	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/582131-1577458745.PNG?LM=1577458759	\N	\N	\N	\N	\N	\N	\N	\N	4
96	BUONAVOGLIA	SALVATORE	2001-09-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/460015-1507544462.JPG?LM=1507544470	\N	\N	\N	\N	\N	\N	\N	\N	4
97	BIANCHI	FLAVIO	2000-01-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/364132-1580224023.JPG?LM=1580224064	\N	\N	\N	\N	\N	\N	\N	\N	4
98	MORO	LUCA	2001-01-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/600936-1564742298.JPG?LM=1564742330	\N	\N	\N	\N	\N	\N	\N	\N	4
99	BOSCHINI	LORENZO	2001-12-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
100	RASPA	MATTEO	2001-08-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
101	AVOGADRI	LORENZO	2001-08-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
102	PITTALUGA	FILIPPO	2001-01-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
103	VEIPS	ROBERTS	2000-02-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
104	PASTOR	ÁLEX	1999-10-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/398056-1543829456.JPG?LM=1543829465	\N	\N	\N	\N	\N	\N	\N	\N	2
105	ANGILERI	ANTONY	2001-03-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
106	SÖRENSEN	ARIS AKSEL	2001-05-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
107	OBERT	ADAM	2002-08-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
108	GIORDANO	SIMONE	2001-12-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
110	VAGHI	STEFANO	2001-05-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/537543-1518094009.JPG?LM=1518094074	\N	\N	\N	\N	\N	\N	\N	\N	2
111	ERCOLANO	EMANUEL	2002-10-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
112	CASANOVA	ALESSANDRO	2001-09-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
113	ASKILDSEN	KRISTOFFER	2001-01-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/574495-1580122960.JPG?LM=1580122974	\N	\N	\N	\N	\N	\N	\N	\N	3
114	SABATTINI	LORENZO	2001-10-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/557556-1543828798.JPG?LM=1543828814	\N	\N	\N	\N	\N	\N	\N	\N	3
115	FRANCOFONTE	NICOLÒ	2001-01-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
116	CHRYSOSTOMOU	ANDREAS	2001-01-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
117	CANOVI	DAVIDE	2001-01-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
118	BRENTAN	MICHAEL	2002-04-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/564793-1557134661.JPG?LM=1557134733	\N	\N	\N	\N	\N	\N	\N	\N	3
119	SCOTTI	FRANCESCO	2000-01-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
120	D'AMICO	FELICE	2000-08-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
121	YAYI MPIE	JAMIE	2001-05-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/422764-1518206122.JPG?LM=1518206135	\N	\N	\N	\N	\N	\N	\N	\N	4
122	STOPPA	MATTEO	2000-09-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/391899-1507537305.JPG?LM=1507537311	\N	\N	\N	\N	\N	\N	\N	\N	4
123	BALDÉ	IBOURAHIMA	1999-03-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/398061-1543830582.JPG?LM=1543830592	\N	\N	\N	\N	\N	\N	\N	\N	4
124	GERBI	ERIK	2000-06-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/410305-1541916611.JPG?LM=1541916621	\N	\N	\N	\N	\N	\N	\N	\N	4
125	PRELEC	NIK	2001-06-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
126	SCAFFIDI	FEDERICO	2001-09-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
127	AMADO	BRUNO	2001-12-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/559864-1515057509.JPG?LM=1515057516	\N	\N	\N	\N	\N	\N	\N	\N	4
128	KRAWCZYK	SAM	2003-02-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/682121-1574876664.JPG?LM=1574876671	\N	\N	\N	\N	\N	\N	\N	\N	4
129	FANTONI	THOMAS	2001-04-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
130	MARCONI	ALESSANDRO	2002-06-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
131	MOLLA	MARCO	2002-06-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/574164-1572338406.JPG?LM=1572338441	\N	\N	\N	\N	\N	\N	\N	\N	1
132	ACAMPORA	EMANUELE	2001-07-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/607187-1542274687.PNG?LM=1542274697	\N	\N	\N	\N	\N	\N	\N	\N	2
133	BONINI	FEDERICO	2001-08-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/530552-1566441281.JPEG?LM=1566441288	\N	\N	\N	\N	\N	\N	\N	\N	2
134	MARTIMBIANCO	RICCARDO	2001-08-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/488019-1563889299.JPG?LM=1563889309	\N	\N	\N	\N	\N	\N	\N	\N	2
135	SAPUTO	ROBERTO	2000-08-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/411157-1507618662.PNG?LM=1507618674	\N	\N	\N	\N	\N	\N	\N	\N	2
136	BOLOCA	GABRIELE	2001-03-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
137	PORTANOVA	DENIS	2001-06-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
138	MAZIA	MANUEL	2001-08-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
139	KHAILOTI	OMAR	2001-09-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
140	LUNGHI	RICCARDO	2000-01-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/460120-1488367006.JPG?LM=1488367021	\N	\N	\N	\N	\N	\N	\N	\N	2
141	AGYEMANG	GIUSEPPE	2002-04-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
142	MAZZA	LEONARDO	2000-09-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/420515-1507619013.PNG?LM=1507619028	\N	\N	\N	\N	\N	\N	\N	\N	3
143	BALDURSSON	ANDRI FANNAR	2002-01-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
144	KOUTSOUPIAS	ILIAS	2001-05-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
145	RUFFO LUCI	DION	2001-07-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
146	GRIECO	GIORGIO	2002-02-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
147	PAGLIUCA	MATTIA	2002-04-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
148	VISCONTI	ELIA	2000-06-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/416699-1454234948.JPG?LM=1454234913	\N	\N	\N	\N	\N	\N	\N	\N	3
149	FARINELLI	NICOLA	2001-05-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
150	MANCUSO	FILIPPO	2001-04-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
151	JUWARA	MUSA	2001-12-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/562030-1540279913.JPG?LM=1540279922	\N	\N	\N	\N	\N	\N	\N	\N	4
152	STANZANI	LEONARDO	2000-04-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/357987-1507619099.PNG?LM=1507619112	\N	\N	\N	\N	\N	\N	\N	\N	4
153	ROCCHI	MATIAS	2002-10-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
154	DI DIO	FLAVIO	2002-03-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
155	CANGIANO	GIANMARCO	2001-11-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/496270-1551799103.JPG?LM=1551799113	\N	\N	\N	\N	\N	\N	\N	\N	4
156	SHEHU	KRISTO	2000-03-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
157	COSSALTER	ALEX	2000-05-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/459168-1508479471.JPG?LM=1508479476	\N	\N	\N	\N	\N	\N	\N	\N	4
158	UHUNAMURE	JAMES	2000-06-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/394355-1507619529.PNG?LM=1507619537	\N	\N	\N	\N	\N	\N	\N	\N	4
159	RABBI	SIMONE	2001-10-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
160	MÖLLER	NIKOLAJ	2002-07-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
161	NDIAYE	KHADIM	2000-04-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
162	GELMI	LUDOVICO	2001-05-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
163	DAJCAR	MATEVZ	2002-02-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
164	GUTH	RODRIGO	2000-11-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
165	HEIDENREICH	DAVID	2000-06-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/473887-1560846294.JPG?LM=1560846308	\N	\N	\N	\N	\N	\N	\N	\N	2
166	OKOLI	CALEB	2001-07-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/461833-1562074460.JPG?LM=1562074487	\N	\N	\N	\N	\N	\N	\N	\N	2
167	MILANI	NICOLÒ	2001-06-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
168	CITTADINI	GIORGIO	2002-04-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
169	BROGNI	GIORGIO	2001-01-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/465667-1526651184.JPG?LM=1526651196	\N	\N	\N	\N	\N	\N	\N	\N	2
170	RUGGERI	MATTEO	2002-07-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/616631-1572338544.JPG?LM=1572338568	\N	\N	\N	\N	\N	\N	\N	\N	2
171	BERGONZI	FEDERICO	2001-01-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
172	FINARDI	SEBASTIANO	2001-02-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
173	PANADA	SIMONE	2002-06-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/487836-1557134668.JPG?LM=1557134766	\N	\N	\N	\N	\N	\N	\N	\N	3
174	DA RIVA	JACOPO	2000-10-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
175	GYABUAA	EMMANUEL	2001-09-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/432089-1526650970.JPG?LM=1526650999	\N	\N	\N	\N	\N	\N	\N	\N	3
176	GHISLENI	NICCOLÒ	2001-05-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
177	SIGNORI	SAMUELE	2001-01-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
178	VORLICKY	LUKAS	2002-01-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
179	SIDIBE	ALASSANE	2002-06-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
180	GHISLANDI	DAVIDE	2001-06-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
181	CORTINOVIS	ALESSANDRO	2001-01-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/421768-1526651253.JPG?LM=1526651279	\N	\N	\N	\N	\N	\N	\N	\N	3
182	CAMBIAGHI	NICOLÒ	2000-12-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
183	COLLEY	EBRIMA	2000-02-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/567217-1580454136.JPG?LM=1580454147	\N	\N	\N	\N	\N	\N	\N	\N	4
184	KOBACKI	OLAF	2001-07-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
185	TRAORÉ	AMAD	2002-07-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/536835-1551799584.JPG?LM=1551799594	\N	\N	\N	\N	\N	\N	\N	\N	4
186	PICCOLI	ROBERTO	2001-01-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/432092-1551799013.JPG?LM=1551799027	\N	\N	\N	\N	\N	\N	\N	\N	4
187	NGOCK ITALEN	JONATHAN	2001-08-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
188	BRAGANTINI	MICHELE	2001-05-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
189	BOAROTTO	MARCO	2001-01-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
190	FARRIM	PEDRO	2000-01-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
191	LEGGERO	ALESSANDRO	2001-03-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
192	BONINI	RICCARDO	2002-04-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
193	PASSERA	LUCIANO	2002-01-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
194	MUNARETTI	LUCA	2002-06-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
195	GRAZIOLI	LUCA	2002-08-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
196	ENYAN	ELIMELECH	2001-01-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
197	PAVLEV	DANIEL	2000-10-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/437334-1570172999.PNG?LM=1570173008	\N	\N	\N	\N	\N	\N	\N	\N	2
198	SALVATERRA	THOMAS	2001-01-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
199	ROSSIGNOLI	ALESSANDRO	2001-06-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
200	PETRICCIONE	AGOSTINO	2001-09-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
201	ZUELLI	EMANUELE	2001-11-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
202	PERSEU	FAUSTO	2002-12-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
203	KARAMOKO	IBRAHIM	2001-07-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/538072-1561560181.PNG?LM=1561560197	\N	\N	\N	\N	\N	\N	\N	\N	3
204	DEMIROVIC	ELIAN	2000-06-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/459937-1488367108.JPG?LM=1488367126	\N	\N	\N	\N	\N	\N	\N	\N	3
205	TUZZO	FILIPPO	2001-02-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
206	ASLLANI	MARCO	2001-04-08	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
207	SPERTI	LUCA	2002-02-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
208	VESENTINI	FILIPPO	2002-09-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
209	RAINONE	FABRIZIO	2001-02-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
210	MANCONI	ENRICO	2000-01-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/394356-1542727495.JPG?LM=1542727508	\N	\N	\N	\N	\N	\N	\N	\N	3
211	VERTUA	LUCA	2002-02-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
212	FREY	DANIEL NICOLAS	2002-02-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
213	MERCI	BRUNO	2002-07-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
214	GRUBAC	SERGEJ	2000-05-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/429318-1570173528.PNG?LM=1570173536	\N	\N	\N	\N	\N	\N	\N	\N	4
215	ROVAGLIA	PIETRO	2001-02-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/421417-1570173583.PNG?LM=1570173589	\N	\N	\N	\N	\N	\N	\N	\N	4
216	MAKNI	NABIL	2001-09-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
217	VIVOLI	NICCOLÒ	2001-03-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
218	HVALIC	KLEMEN	2002-04-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
219	PRATELLI	LEANDRO	2002-12-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
220	DONATI	FRANCESCO	2001-01-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/525660-1567672661.PNG?LM=1567672673	\N	\N	\N	\N	\N	\N	\N	\N	2
221	MATTEUCCI	EMANUELE	2000-01-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/358002-1507624165.JPG?LM=1507624170	\N	\N	\N	\N	\N	\N	\N	\N	2
222	FRADELLA	ANTONINO	2001-04-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
223	VITI	MATTIA	2002-01-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
224	CHINNICI	GIORGIO	2002-01-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
225	ADAMOLI	ANDREA	2001-02-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
226	PEZZOLA	LEONARDO	2002-03-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
227	RICCIONI	LORENZO	2002-01-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
228	ARAPI	ALESSANDRO	2002-06-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
229	MARINAI	LORENZO	2002-04-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
230	SIDIBE	SALIF	2001-11-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
231	BELARDINELLI	LUCA	2001-03-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
232	RICCI	SAMUELE	2001-08-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/467992-1526651029.JPG?LM=1526651045	\N	\N	\N	\N	\N	\N	\N	\N	3
233	ZELENKOVS	DMITRIJS	2000-05-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/462887-1507624517.JPG?LM=1507624525	\N	\N	\N	\N	\N	\N	\N	\N	3
234	SAKHO	MOUHAMADOU	2000-05-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
235	ASLLANI	KRISTJAN	2002-03-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
236	SIMIC	LUKA	2002-01-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
237	PISANO	GIOVANNI	2002-01-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
238	MARTINI	MATTEO	2002-05-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
239	VANNUCCI	LUIGI	2002-01-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
240	CANNAVÒ	KEVIN	2000-02-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/458816-1567672619.PNG?LM=1567672629	\N	\N	\N	\N	\N	\N	\N	\N	4
241	LIPARI	MIRCO	2002-07-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
242	BERTOLINI	DAVIDE	2001-02-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
243	LOMBARDI	LUCA	2002-02-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
244	EKONG	EMMANUEL	2002-06-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
245	TROMBINI	LUCA	2001-02-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
246	LEWIS	LUCA	2001-02-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
247	SINGO	WILFRIED STEPHANE	2000-12-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/648779-1564134003.JPG?LM=1564134021	\N	\N	\N	\N	\N	\N	\N	\N	2
248	SINIEGA	GIACOMO	2001-01-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
249	ENRICI	PATRICK	2001-05-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
250	PARPINEL	GIANLUCA	2001-03-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
251	CELESIA	CHRISTIAN	2002-01-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
252	MARCOS	ALEJANDRO	2000-02-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/617052-1548769315.JPG?LM=1548769334	\N	\N	\N	\N	\N	\N	\N	\N	2
253	RICOSSA	RICCARDO	2001-02-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
254	CANCELLIERI	DAMIANO	2001-03-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
255	KOUADIO	CHRIST	2000-12-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
256	GHAZOINI	EMIN	2001-01-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
257	ROTELLA	FEDERICO	2001-10-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
258	ADOPO	MICHEL NDARY	2000-07-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/564305-1578650602.JPG?LM=1578650619	\N	\N	\N	\N	\N	\N	\N	\N	3
259	ONISA	MIHAEL	2000-03-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/418225-1507626535.JPG?LM=1507626540	\N	\N	\N	\N	\N	\N	\N	\N	3
260	SANDRI	MATTIA	2001-04-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
261	PILIUKAITIS	VILIUS	2001-03-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
262	GRECO	JEAN FREDDI	2001-02-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/498557-1526651396.JPG?LM=1526651408	\N	\N	\N	\N	\N	\N	\N	\N	3
263	GARETTO	MARCO	2001-07-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
264	BONGIOVANNI	FRANCESCO	2001-08-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
265	GONELLA	FABIO	2000-04-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
266	KLIMAVICIUS	AUGUSTINAS	2001-04-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/467783-1575146356.JPG?LM=1575146372	\N	\N	\N	\N	\N	\N	\N	\N	4
267	DE RIGO	MATTIA	2001-03-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
268	MARKOVIC	LUKA	2000-02-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/466124-1520612943.JPG?LM=1520612951	\N	\N	\N	\N	\N	\N	\N	\N	4
269	IBRAHIMI	BRIJAN	2001-09-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
270	MUKIELE	NORVIN	2001-02-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
271	VITIELLO	MANUEL	2001-01-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/466402-1507549147.JPG?LM=1507549155	\N	\N	\N	\N	\N	\N	\N	\N	1
272	RUBINO	LUCA	2001-05-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/534072-1520923280.JPG?LM=1520923287	\N	\N	\N	\N	\N	\N	\N	\N	1
273	TURATI	STEFANO	2001-09-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/543666-1575280015.JPG?LM=1575280063	\N	\N	\N	\N	\N	\N	\N	\N	1
274	SACCANI	MATTEO	2001-01-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
275	PILATI	ALESSANDRO	2000-03-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/457440-1484577303.JPG?LM=1484577349	\N	\N	\N	\N	\N	\N	\N	\N	2
276	NAGY	FILIP	2001-02-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
277	MIDOLO	GIOVANNI	2001-04-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
278	BELLUCCI	NICOLÒ	2001-08-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
279	AURELIO	GIUSEPPE	2000-03-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/457444-1507620300.JPG?LM=1507620306	\N	\N	\N	\N	\N	\N	\N	\N	2
280	PINELLI	MATTEO	2001-01-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
281	D'ALESSIO	LORENZO	2001-09-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/534068-1520923376.JPG?LM=1520923383	\N	\N	\N	\N	\N	\N	\N	\N	2
282	SHIBA	CRISTIAN	2001-01-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/494803-1551811824.JPG?LM=1551811835	\N	\N	\N	\N	\N	\N	\N	\N	2
283	BRIZZOLARA	MATTEO	2001-03-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/518226-1520923331.JPG?LM=1520923336	\N	\N	\N	\N	\N	\N	\N	\N	2
284	MEHMETAJ	VITTORIO	2001-03-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
285	ARTIOLI	FEDERICO	2001-06-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/497312-1520923494.JPG?LM=1520923499	\N	\N	\N	\N	\N	\N	\N	\N	3
286	MARGINEAN	IULIUS	2001-07-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
287	AHMETAJ	ALESSANDRO	2000-01-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
288	GHION	ANDREA	2000-02-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/390163-1563276341.JPG?LM=1563276357	\N	\N	\N	\N	\N	\N	\N	\N	3
289	NOTARI	RICCARDO	2001-10-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/537420-1520923612.JPG?LM=1520923626	\N	\N	\N	\N	\N	\N	\N	\N	3
290	STEAU	RAUL	2001-04-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
291	MARTINI	NICHOLAS	2001-05-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/534070-1520923793.JPG?LM=1520923799	\N	\N	\N	\N	\N	\N	\N	\N	4
292	MANZARI	GIACOMO	2000-09-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
293	BARTOLI	EDOARDO	2000-07-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/457442-1484577506.JPG?LM=1484577539	\N	\N	\N	\N	\N	\N	\N	\N	4
294	GÓMEZ	EMILIANO	2001-09-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
295	PELLEGRINI	JACOPO	2000-09-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
296	MATTIOLI	ANDREA	2001-09-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/458800-1520923816.JPG?LM=1520923822	\N	\N	\N	\N	\N	\N	\N	\N	4
297	MANARA	NICO	2001-04-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
298	ODDEI	BRIAN	2002-09-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
299	ISRAEL	FRANCO	2000-04-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/492319-1558943362.PNG?LM=1558943373	\N	\N	\N	\N	\N	\N	\N	\N	1
300	DADONE	FILIPPO	2001-07-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
301	GAROFANI	GIOVANNI	2002-10-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/564792-1579615795.JPG?LM=1579615872	\N	\N	\N	\N	\N	\N	\N	\N	1
302	RAINA	MARCO	2002-05-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
303	RICCIO	ALESSANDRO PIO	2002-02-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/487835-1579615245.JPG?LM=1579615381	\N	\N	\N	\N	\N	\N	\N	\N	2
304	VLASENKO	NIKITA	2001-03-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/510898-1579615455.JPG?LM=1579615498	\N	\N	\N	\N	\N	\N	\N	\N	2
305	DRAGUSIN	RADU	2002-02-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
306	GOZZI	PAOLO	2001-04-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/487333-1519848876.JPG?LM=1519848885	\N	\N	\N	\N	\N	\N	\N	\N	2
307	ANZOLIN	MATTEO	2000-11-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/395127-1480326072.JPG?LM=1480326096	\N	\N	\N	\N	\N	\N	\N	\N	2
308	NTENDA	JEAN-CLAUDE	2002-09-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/585956-1556023737.JPG?LM=1556023747	\N	\N	\N	\N	\N	\N	\N	\N	2
309	VERDUCI	GIUSEPPE	2002-01-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
310	LEO	DANIEL	2001-09-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
311	FONSECA	RAFAEL	2001-01-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/525576-1519849386.JPG?LM=1519849393	\N	\N	\N	\N	\N	\N	\N	\N	2
312	LAMANNA	FRANCESCO	2002-01-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/603897-1572338758.JPG?LM=1572338781	\N	\N	\N	\N	\N	\N	\N	\N	2
313	OCAMPOS	SANTIAGO	2002-01-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/603898-1572341638.PNG?LM=1572341653	\N	\N	\N	\N	\N	\N	\N	\N	2
314	BARRENECHEA	ENZO	2001-05-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/671915-1557302992.JPG?LM=1557303002	\N	\N	\N	\N	\N	\N	\N	\N	3
315	LEONE	GIUSEPPE	2001-05-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/479284-1526565290.JPG?LM=1526565302	\N	\N	\N	\N	\N	\N	\N	\N	3
316	RANOCCHIA	FILIPPO	2001-05-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/489611-1579616418.JPG?LM=1579616499	\N	\N	\N	\N	\N	\N	\N	\N	3
317	PENNER	NICOLAS	2001-06-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
318	DE WINTER	KONI	2002-06-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/490384-1570201823.JPG?LM=1570201845	\N	\N	\N	\N	\N	\N	\N	\N	3
319	AHAMADA	NAOUIROU	2002-03-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/538971-1573556991.JPG?LM=1573557002	\N	\N	\N	\N	\N	\N	\N	\N	3
320	SEKULOV	NIKOLA	2002-02-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/542336-1579616042.JPG?LM=1579616110	\N	\N	\N	\N	\N	\N	\N	\N	3
321	TONGYA	FRANCO	2002-03-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/530851-1557134671.JPG?LM=1557134781	\N	\N	\N	\N	\N	\N	\N	\N	3
322	FAGIOLI	NICOLÒ	2001-02-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
323	SENE	KALY	2001-05-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/625816-1579614473.JPG?LM=1579614623	\N	\N	\N	\N	\N	\N	\N	\N	4
324	MORENO	PABLO	2002-05-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/466811-1557304350.PNG?LM=1557304363	\N	\N	\N	\N	\N	\N	\N	\N	4
325	PETRELLI	ELIA	2001-08-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/477027-1551799205.JPG?LM=1551799224	\N	\N	\N	\N	\N	\N	\N	\N	4
326	DA GRACA	COSIMO MARCO	2002-05-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/564795-1579615593.JPG?LM=1579615700	\N	\N	\N	\N	\N	\N	\N	\N	4
327	MANCINO	VINCENZO	2002-05-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
328	IDASIAK	HUBERT	2002-02-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
329	DANIELE	ANTONIO PIO	2002-07-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
330	SENESE	ALBERTO	2000-03-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/430764-1518707452.JPG?LM=1518707464	\N	\N	\N	\N	\N	\N	\N	\N	2
331	MANZI	CLAUDIO	2000-06-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
332	ZANOLI	ALESSANDRO	2000-10-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
333	BARTIROMO	NICCOLÒ	2000-07-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
334	TSOUNGUI	MARC	2002-07-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
335	COSTANZO	DAVIDE	2002-07-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
336	D'ONOFRIO	NELLO	2002-05-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
337	CALVANO	GIOVANNI	2000-10-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
338	POTENZA	VINCENZO	2002-04-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
339	ESPOSITO	ALESSIO	2001-04-08	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
340	CEPARANO	GIOVANNI	2002-05-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
341	ZANON	SIMONE	2001-08-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/593381-1539451602.JPG?LM=1539451608	\N	\N	\N	\N	\N	\N	\N	\N	3
342	LABRIOLA	VALERIO	2001-04-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
343	SAMI	BRANDO	2001-04-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
344	MARRAZZO	FRANCESCO	2002-06-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
345	MAMAS	RAFAIL	2001-03-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
346	VIRGILIO	RAFFAELE	2002-01-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
347	VRIKKIS	AGAPIOS	2001-05-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
348	ZEDADKA	KARIM	2000-06-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
349	VRAKAS	GEORGIOS	2001-04-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
350	D'AMATO	ANTONIO	2002-03-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
351	CIOFFI	ANTONIO	2002-12-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
352	CAVALLO	CARLO	2002-03-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
353	PALMIERI	CIRO	2000-02-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
354	BOZHANAJ	KLEIS	2001-03-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/221421-1557323486.JPG?LM=1557323497	\N	\N	\N	\N	\N	\N	\N	\N	4
355	VIANNI	SAMUELE	2001-07-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/534174-1566440674.JPEG?LM=1566440683	\N	\N	\N	\N	\N	\N	\N	\N	4
356	SGARBI	LORENZO	2001-03-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/535797-1548346889.JPG?LM=1548346899	\N	\N	\N	\N	\N	\N	\N	\N	4
357	CHIANESE	MARIO	2001-01-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
358	CIOCCI	GIUSEPPE	2002-01-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/535740-1567613237.JPG?LM=1567613254	\N	\N	\N	\N	\N	\N	\N	\N	1
359	PIGA	DAVIDE	2002-01-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
360	ATZENI	MIRKO	2002-06-08	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
361	CUSUMANO	FRANCESCO PAOLO	2001-02-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
362	NADER	ALY	2000-01-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
363	MICHELOTTI	IVAN	2001-05-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
364	BOCCIA	SALVATORE	2001-06-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
365	CARBONI	ANDREA	2001-02-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/481834-1570544015.JPG?LM=1570544024	\N	\N	\N	\N	\N	\N	\N	\N	2
366	ZINFOLLINO	MICHELE	2001-04-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
367	IOVU	IURIE	2002-07-06	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
368	ACELLA	CHRISTIAN	2002-07-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
369	PORRU	FABIO	2000-01-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
370	COSSU	MATTEO	2001-05-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
371	VALENCIA	KENER	2001-10-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
372	LADINETTI	RICCARDO	2000-12-20	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
373	KANYAMUNA	ABEL	2002-06-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
374	DORE	GABRIELE	2001-06-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
375	LOMBARDI	ALESSANDRO	2000-01-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
376	MARIGOSU	FEDERICO	2001-04-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
377	CONTI	BRUNO	2002-06-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
378	DEL PUPO	ISAIAS	2003-03-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
379	MAS	MACIEJ	2001-05-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
380	DESOGUS	JACOPO	2002-10-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
381	GAGLIANO	LUCA	2000-07-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
382	CONTINI	GIANLUCA	2001-06-18	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
383	ALIA	MARCO	2000-04-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
384	FURLANETTO	ALESSIO	2002-02-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
385	MAROCCO	MATTIA	2001-10-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
386	PERUZZI	MATTIA	2002-07-10	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
387	ARMINI	NICOLÒ	2001-03-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/421775-1526651077.JPG?LM=1526651092	\N	\N	\N	\N	\N	\N	\N	\N	2
388	KALAJ	SERGIO	2000-01-28	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
389	FRANCO	DAMIANO	2002-02-22	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
390	RICCI	LUDOVICO	2001-09-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
391	PICA	MARZIO	2002-02-04	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
392	GUSTAVO CIPRIANO		2001-02-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
393	FALBO	LUCA	2000-02-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
394	NDRECKA	ANGELO	2001-09-24	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/539220-1557826599.PNG?LM=1557826611	\N	\N	\N	\N	\N	\N	\N	\N	2
395	NOVELLA	MATTIA	2001-01-25	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
396	KAZIEWICZ	CÉSAR	2002-04-08	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
397	SHOTI	EMILIANO	2001-04-27	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
398	BIANCHI	ALESSIO	2000-10-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
399	FRANCUCCI	FABIO	2001-03-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
400	BERTINI	MARCO	2002-08-07	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
401	MARINO	ANDREA	2001-04-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
402	CESARONI	NICOLÒ	2002-08-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
403	CZYZ	SZYMON	2001-07-08	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
404	MOSCHINI	LUCA	2002-03-16	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
405	DISTEFANO	GIAN MARCO	2000-12-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
406	CERBARA	ALESSANDRO	2001-03-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
407	SHEHU	FLORENT	2002-05-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/610163-1535214814.JPEG?LM=1535214824	\N	\N	\N	\N	\N	\N	\N	\N	4
408	RUSSO	MATTIA	2002-09-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
409	MORO	RAÚL	2002-12-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
410	NIMMERMEER	TYRO	2001-07-09	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
411	ZILLI	MASSIMO	2002-07-17	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
412	TARE	ETIENNE	2003-09-13	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
413	SORRENTINO	ALESSANDRO	2002-04-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
414	GONZÁLEZ	LUKAS	2002-02-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	1
415	BARBAROSSA	FRANCESCO	2002-04-26	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
416	PAOLILLI	MATTEO	2001-07-03	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
417	CHIACCHIA	ALESSANDRO	2002-05-23	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
418	MANÉ	IBRAHIMA	2001-02-15	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
419	QUACQUARELLI	GABRIELE	2002-01-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	2
420	MARTELLA	ALESSANDRO	2000-11-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/459979-1493993309.JPG?LM=1493993604	\N	\N	\N	\N	\N	\N	\N	\N	2
421	RENZETTI	MIKHAIL	2002-05-31	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
422	DIAMBO	AMADOU	2001-02-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
423	SENGHOR	YUGO	2002-01-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
424	CIPOLLETTI	DAVIDE	2001-03-30	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
425	CAMILLERI	MARCO	2000-08-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
426	TRINGALI	SALVATORE	2001-08-21	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
427	MERCADO	NICOLAS	2002-03-01	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
428	DE MARZO	LORENZO	2002-01-11	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
429	TAMBORRIELLO	MATTIA	2002-08-02	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
430	MASELLA	DAVIDE	2002-05-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	3
431	CHIARELLA	MARCO	2002-08-14	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
432	GOMES	ANTÓNIO	2000-08-29	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
433	PAVONE	FABIAN	2000-02-05	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/411312-1493993933.JPG?LM=1493993983	\N	\N	\N	\N	\N	\N	\N	\N	4
434	ZINNO	CLAUDIO	2002-02-19	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
435	BLANUTA	VLADISLAV	2002-01-12	HTTPS://TMSSL.AKAMAIZED.NET//IMAGES/PORTRAIT/HEADER/DEFAULT.JPG?LM=1455618221	\N	\N	\N	\N	\N	\N	\N	\N	4
\.


--
-- Data for Name: players_nationalities; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.players_nationalities (id, player_id, nation_id, sort_value) FROM stdin;
1	1	200	1
2	2	113	1
3	3	113	1
4	4	113	1
5	5	113	1
6	6	78	1
7	7	113	1
8	8	78	1
9	9	67	1
10	10	113	1
11	11	78	1
12	12	113	1
13	13	11	1
14	14	22	1
15	15	113	1
16	16	113	1
17	17	113	1
18	18	113	1
19	19	113	1
20	20	113	1
21	21	113	1
22	22	113	1
23	23	241	1
24	24	113	1
25	25	113	1
26	26	113	1
27	27	78	1
28	28	179	1
29	29	113	1
30	30	113	1
31	31	113	1
32	32	113	1
33	33	113	1
34	34	113	1
35	35	113	1
36	36	113	1
37	38	113	1
38	40	113	1
39	41	22	1
40	42	113	1
41	43	113	1
42	44	113	1
43	45	113	1
44	46	179	1
45	47	158	1
46	49	78	1
47	50	32	1
48	51	199	1
49	52	113	1
50	53	113	1
51	54	113	1
52	55	185	1
53	56	113	1
54	57	113	1
55	58	113	1
56	59	113	1
57	60	113	1
58	61	113	1
59	62	58	1
60	63	220	1
61	64	219	1
62	65	113	1
63	66	113	1
64	67	58	1
65	68	78	1
66	70	113	1
67	71	206	1
68	72	113	1
69	73	206	1
70	74	113	1
71	75	113	1
72	76	113	1
73	77	113	1
74	78	180	1
75	80	113	1
76	81	113	1
77	82	113	1
78	83	113	1
79	84	180	1
80	85	113	1
81	86	113	1
82	87	113	1
83	88	113	1
84	89	113	1
85	90	219	1
86	91	113	1
87	92	78	1
88	93	22	1
89	94	202	1
90	95	158	1
91	96	113	1
92	97	113	1
93	98	113	1
94	99	113	1
95	100	113	1
96	101	113	1
97	102	113	1
98	103	124	1
99	104	213	1
100	105	113	1
101	106	220	1
102	107	205	1
103	108	113	1
104	109	32	1
105	110	113	1
106	111	113	1
107	112	113	1
108	113	168	1
109	114	113	1
110	115	113	1
111	116	61	1
112	117	113	1
113	118	113	1
114	119	113	1
115	120	113	1
116	121	22	1
117	122	113	1
118	123	213	1
119	124	113	1
120	125	206	1
121	126	113	1
122	127	180	1
123	128	158	1
124	129	113	1
125	130	113	1
126	131	113	1
127	132	113	1
128	133	113	1
129	134	113	1
130	135	113	1
131	136	185	1
132	137	113	1
133	138	113	1
134	139	113	1
135	140	113	1
136	141	113	1
137	142	113	1
138	143	104	1
139	144	88	1
140	145	113	1
141	146	113	1
142	147	113	1
143	148	113	1
144	149	113	1
145	150	113	1
146	152	113	1
147	153	113	1
148	154	113	1
149	155	113	1
150	156	88	1
151	157	113	1
152	158	163	1
153	159	113	1
154	160	219	1
155	161	199	1
156	162	113	1
157	163	206	1
158	164	32	1
159	165	62	1
160	166	113	1
161	167	113	1
162	168	113	1
163	169	113	1
164	170	113	1
165	171	113	1
166	172	113	1
167	173	113	1
168	174	113	1
169	175	113	1
170	176	113	1
171	177	113	1
172	178	62	1
173	180	113	1
174	181	113	1
175	182	113	1
176	184	179	1
177	186	113	1
178	187	42	1
179	188	113	1
180	189	113	1
181	190	180	1
182	191	113	1
183	192	113	1
184	193	113	1
185	194	113	1
186	195	113	1
187	196	86	1
188	197	206	1
189	198	113	1
190	199	113	1
191	200	113	1
192	201	113	1
193	202	113	1
194	203	78	1
195	204	206	1
196	205	113	1
197	206	3	1
198	207	113	1
199	208	113	1
200	209	113	1
201	210	113	1
202	211	113	1
203	213	113	1
204	214	150	1
205	215	113	1
206	216	231	1
207	217	113	1
208	218	206	1
209	219	113	1
210	220	113	1
211	221	113	1
212	222	113	1
213	223	113	1
214	224	113	1
215	225	113	1
216	226	113	1
217	227	113	1
218	228	3	1
219	229	113	1
220	231	113	1
221	232	113	1
222	233	124	1
223	234	199	1
224	235	3	1
225	236	200	1
226	237	113	1
227	238	113	1
228	239	113	1
229	240	113	1
230	241	113	1
231	242	113	1
232	243	113	1
233	244	219	1
234	245	113	1
235	248	113	1
236	249	113	1
237	250	113	1
238	251	113	1
239	252	213	1
240	253	113	1
241	254	113	1
242	256	152	1
243	257	113	1
244	258	78	1
245	259	185	1
246	260	113	1
247	261	130	1
248	262	113	1
249	263	113	1
250	264	113	1
251	265	113	1
252	266	130	1
253	267	113	1
254	268	200	1
255	269	3	1
256	270	78	1
257	271	113	1
258	272	113	1
259	273	113	1
260	274	113	1
261	275	113	1
262	276	205	1
263	277	113	1
264	278	113	1
265	279	113	1
266	280	113	1
267	281	113	1
268	282	3	1
269	283	113	1
270	284	3	1
271	285	113	1
272	286	185	1
273	287	113	1
274	288	113	1
275	289	113	1
276	290	185	1
277	291	113	1
278	292	113	1
279	293	113	1
280	294	241	1
281	295	113	1
282	296	113	1
283	297	113	1
284	298	113	1
285	299	241	1
286	300	113	1
287	301	113	1
288	302	113	1
289	303	113	1
290	304	220	1
291	305	185	1
292	306	113	1
293	307	113	1
294	308	78	1
295	309	113	1
296	310	220	1
297	311	180	1
298	312	113	1
299	313	175	1
300	314	11	1
301	315	113	1
302	316	113	1
303	317	62	1
304	318	22	1
305	319	78	1
306	320	113	1
307	321	113	1
308	322	113	1
309	323	199	1
310	324	213	1
311	325	113	1
312	326	113	1
313	327	113	1
314	328	179	1
315	329	113	1
316	330	113	1
317	331	113	1
318	332	113	1
319	333	113	1
320	334	220	1
321	335	113	1
322	336	113	1
323	337	113	1
324	338	113	1
325	339	113	1
326	340	113	1
327	341	113	1
328	342	113	1
329	343	113	1
330	344	113	1
331	345	61	1
332	346	113	1
333	347	61	1
334	348	78	1
335	349	88	1
336	350	113	1
337	351	113	1
338	352	113	1
339	353	113	1
340	354	3	1
341	355	113	1
342	356	113	1
343	357	113	1
344	358	113	1
345	359	113	1
346	360	113	1
347	361	113	1
348	362	113	1
349	363	113	1
350	364	113	1
351	365	113	1
352	366	113	1
353	368	113	1
354	369	113	1
355	370	113	1
356	371	52	1
357	372	113	1
358	373	249	1
359	374	113	1
360	375	113	1
361	376	113	1
362	377	113	1
363	378	11	1
364	379	179	1
365	380	113	1
366	381	113	1
367	382	113	1
368	383	3	1
369	384	113	1
370	385	113	1
371	386	113	1
372	387	113	1
373	388	3	1
374	389	113	1
375	390	113	1
376	391	113	1
377	392	32	1
378	393	113	1
379	394	3	1
380	395	113	1
381	396	78	1
382	397	3	1
383	398	113	1
384	399	113	1
385	400	113	1
386	401	113	1
387	402	113	1
388	403	179	1
389	404	113	1
390	405	113	1
391	406	113	1
392	407	220	1
393	408	113	1
394	409	213	1
395	410	158	1
396	411	113	1
397	412	113	1
398	413	113	1
399	414	241	1
400	415	113	1
401	416	113	1
402	417	113	1
403	418	86	1
404	419	113	1
405	420	113	1
406	421	113	1
407	422	86	1
408	423	113	1
409	424	113	1
410	425	113	1
411	426	113	1
412	427	11	1
413	428	113	1
414	429	113	1
415	430	113	1
416	431	113	1
417	432	180	1
418	433	113	1
419	434	113	1
420	435	185	1
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.positions (id, name, created_by_id) FROM stdin;
1	Goalkeeper	\N
2	Defender	\N
3	Midfielder	\N
4	Forward	\N
\.


--
-- Data for Name: report_templates; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.report_templates (id, description, user_id) FROM stdin;
\.


--
-- Data for Name: report_templates_sections; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.report_templates_sections (id, reporttemplate_id, section_id, sort_value) FROM stdin;
\.


--
-- Data for Name: scoutingToUser; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."scoutingToUser" (id, start, "end", created_by_id, user_id, scouting_id) FROM stdin;
\.


--
-- Data for Name: scouting_box_scoutingbox; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.scouting_box_scoutingbox (id, date_of_match, match_week, minutes, goal, first_string, competition_id, created_by_id, formation_id, player_id, role_id, team_id) FROM stdin;
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.sections (id, title, subtitle, img_section, user_id) FROM stdin;
\.


--
-- Data for Name: sections_analysis; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.sections_analysis (id, section_id, analysis_id, sort_value) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: tagCombinationControTags; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."tagCombinationControTags" (id, created_on, contro_tag_id, created_by_id, tag_combination_id) FROM stdin;
81	2020-02-09 09:27:53.663811+00	136	119	135
82	2020-02-09 09:27:53.736891+00	138	119	137
83	2020-02-09 09:27:53.795124+00	140	119	139
84	2020-02-09 09:27:53.860191+00	142	119	141
85	2020-02-09 09:27:53.93041+00	144	119	143
86	2020-02-09 09:27:54.046591+00	146	119	145
87	2020-02-09 09:27:54.182976+00	148	119	147
88	2020-02-09 09:27:54.314418+00	150	119	149
89	2020-02-09 09:27:54.452147+00	152	119	151
90	2020-02-09 09:27:54.578229+00	154	119	153
91	2020-02-09 09:27:54.708508+00	156	119	155
92	2020-02-09 09:27:54.832397+00	158	119	157
93	2020-02-09 09:27:54.891083+00	160	119	159
94	2020-02-09 09:27:54.952868+00	162	119	161
95	2020-02-09 09:27:55.029462+00	164	119	163
96	2020-02-09 09:27:55.092756+00	166	119	165
97	2020-02-09 09:27:55.166997+00	168	119	167
98	2020-02-09 09:27:55.241182+00	170	119	169
99	2020-02-09 09:27:55.328214+00	172	119	171
100	2020-02-09 09:27:55.458707+00	174	119	173
101	2020-02-09 09:27:55.592875+00	176	119	175
102	2020-02-09 09:27:55.725392+00	178	119	177
103	2020-02-09 09:27:55.857072+00	180	119	179
104	2020-02-09 09:27:55.959731+00	182	119	181
105	2020-02-09 09:27:56.013888+00	184	119	183
106	2020-02-09 09:27:56.087812+00	186	119	185
107	2020-02-09 09:27:56.189632+00	188	119	187
108	2020-02-09 09:27:56.329946+00	190	119	189
109	2020-02-09 09:27:56.474813+00	192	119	191
110	2020-02-09 09:27:56.629413+00	194	119	193
111	2020-02-09 09:27:56.781944+00	196	119	195
112	2020-02-09 09:27:56.93671+00	198	119	197
113	2020-02-09 09:27:57.061495+00	200	119	199
114	2020-02-09 09:27:57.11845+00	202	119	201
115	2020-02-09 09:27:57.18195+00	204	119	203
116	2020-02-09 09:27:57.253959+00	206	119	205
117	2020-02-09 09:27:57.38928+00	208	119	207
118	2020-02-09 09:27:57.546803+00	210	119	209
119	2020-02-09 09:27:57.697347+00	212	119	211
120	2020-02-09 09:27:57.848896+00	214	119	213
121	2020-02-09 09:27:57.990112+00	165	119	166
122	2020-02-09 09:27:58.132103+00	163	119	164
123	2020-02-09 09:27:58.21845+00	161	119	162
124	2020-02-09 09:27:58.292529+00	159	119	160
125	2020-02-09 09:27:58.349408+00	157	119	158
126	2020-02-09 09:27:58.405498+00	155	119	156
127	2020-02-09 09:27:58.482027+00	153	119	154
128	2020-02-09 09:27:58.586965+00	151	119	152
129	2020-02-09 09:27:59.068388+00	181	119	182
130	2020-02-09 09:27:59.202703+00	179	119	180
131	2020-02-09 09:27:59.289863+00	177	119	178
132	2020-02-09 09:27:59.343199+00	175	119	176
133	2020-02-09 09:27:59.392979+00	173	119	174
134	2020-02-09 09:27:59.44354+00	171	119	172
135	2020-02-09 09:27:59.501367+00	169	119	170
136	2020-02-09 09:27:59.60936+00	167	119	168
137	2020-02-09 09:28:00.230246+00	197	119	198
138	2020-02-09 09:28:00.358279+00	195	119	196
139	2020-02-09 09:28:00.421284+00	193	119	194
140	2020-02-09 09:28:00.489395+00	191	119	192
141	2020-02-09 09:28:00.54106+00	189	119	190
142	2020-02-09 09:28:00.603991+00	187	119	188
143	2020-02-09 09:28:00.703388+00	185	119	186
144	2020-02-09 09:28:00.837915+00	183	119	184
145	2020-02-09 09:28:01.425032+00	213	119	214
146	2020-02-09 09:28:01.517983+00	211	119	212
147	2020-02-09 09:28:01.618581+00	209	119	210
148	2020-02-09 09:28:01.67906+00	207	119	208
149	2020-02-09 09:28:01.734919+00	205	119	206
150	2020-02-09 09:28:01.805912+00	203	119	204
151	2020-02-09 09:28:01.901916+00	201	119	202
152	2020-02-09 09:28:02.01296+00	199	119	200
153	2020-02-09 09:28:02.602826+00	149	119	150
154	2020-02-09 09:28:02.810412+00	141	119	142
155	2020-02-09 09:28:02.861177+00	138	119	148
156	2020-02-09 09:28:02.973977+00	139	119	140
157	2020-02-09 09:28:03.039267+00	145	119	146
158	2020-02-09 09:28:03.264734+00	137	119	138
159	2020-02-09 09:28:03.39309+00	143	119	144
160	2020-02-09 09:28:03.634659+00	135	119	136
\.


--
-- Data for Name: tagCombinationToVersions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."tagCombinationToVersions" (id, created_on, value, created_by_id, "tagCombination_id", version_id) FROM stdin;
108	2020-02-09 09:27:50.171685+00	0	119	108	2
109	2020-02-09 09:27:50.302621+00	0	119	109	2
110	2020-02-09 09:27:50.37979+00	0	119	110	2
111	2020-02-09 09:27:50.473249+00	0	119	111	2
112	2020-02-09 09:27:50.565168+00	0	119	112	2
113	2020-02-09 09:27:50.651351+00	0	119	113	2
114	2020-02-09 09:27:50.739559+00	0	119	114	2
115	2020-02-09 09:27:51.400951+00	0	119	115	2
116	2020-02-09 09:27:51.479871+00	0	119	116	2
117	2020-02-09 09:27:51.520376+00	0	119	117	2
118	2020-02-09 09:27:51.565871+00	0	119	118	2
119	2020-02-09 09:27:51.649314+00	0	119	119	2
120	2020-02-09 09:27:51.813603+00	0	119	120	2
121	2020-02-09 09:27:51.984746+00	0	119	121	2
122	2020-02-09 09:27:52.144925+00	0	119	122	2
123	2020-02-09 09:27:52.301323+00	0	119	123	2
124	2020-02-09 09:27:52.455881+00	0	119	124	2
125	2020-02-09 09:27:52.57868+00	0	119	125	2
126	2020-02-09 09:27:52.628088+00	0	119	126	2
127	2020-02-09 09:27:52.709406+00	0	119	127	2
128	2020-02-09 09:27:52.819274+00	0	119	128	2
129	2020-02-09 09:27:52.927895+00	0	119	129	2
130	2020-02-09 09:27:53.033778+00	0	119	130	2
131	2020-02-09 09:27:53.140704+00	0	119	131	2
132	2020-02-09 09:27:53.244106+00	0	119	132	2
133	2020-02-09 09:27:53.358111+00	0	119	133	2
134	2020-02-09 09:27:53.462904+00	0	119	134	2
135	2020-02-09 09:27:53.584162+00	0	119	135	2
136	2020-02-09 09:27:53.654065+00	0	119	136	2
137	2020-02-09 09:27:53.712413+00	0	119	137	2
138	2020-02-09 09:27:53.732959+00	0	119	138	2
139	2020-02-09 09:27:53.775271+00	0	119	139	2
140	2020-02-09 09:27:53.791547+00	0	119	140	2
141	2020-02-09 09:27:53.839013+00	0	119	141	2
142	2020-02-09 09:27:53.857231+00	0	119	142	2
143	2020-02-09 09:27:53.897912+00	0	119	143	2
144	2020-02-09 09:27:53.923964+00	0	119	144	2
145	2020-02-09 09:27:54.001125+00	0	119	145	2
146	2020-02-09 09:27:54.038455+00	0	119	146	2
147	2020-02-09 09:27:54.137773+00	0	119	147	2
148	2020-02-09 09:27:54.175644+00	0	119	148	2
149	2020-02-09 09:27:54.268455+00	0	119	149	2
150	2020-02-09 09:27:54.306272+00	0	119	150	2
151	2020-02-09 09:27:54.406551+00	0	119	151	2
152	2020-02-09 09:27:54.443675+00	0	119	152	2
153	2020-02-09 09:27:54.535857+00	0	119	153	2
154	2020-02-09 09:27:54.570849+00	0	119	154	2
155	2020-02-09 09:27:54.662935+00	0	119	155	2
156	2020-02-09 09:27:54.699899+00	0	119	156	2
157	2020-02-09 09:27:54.801366+00	0	119	157	2
158	2020-02-09 09:27:54.828764+00	0	119	158	2
159	2020-02-09 09:27:54.869582+00	0	119	159	2
160	2020-02-09 09:27:54.887866+00	0	119	160	2
161	2020-02-09 09:27:54.929833+00	0	119	161	2
162	2020-02-09 09:27:54.949064+00	0	119	162	2
163	2020-02-09 09:27:55.002157+00	0	119	163	2
164	2020-02-09 09:27:55.023459+00	0	119	164	2
165	2020-02-09 09:27:55.072877+00	0	119	165	2
166	2020-02-09 09:27:55.088976+00	0	119	166	2
167	2020-02-09 09:27:55.140477+00	0	119	167	2
168	2020-02-09 09:27:55.162491+00	0	119	168	2
169	2020-02-09 09:27:55.216465+00	0	119	169	2
170	2020-02-09 09:27:55.236869+00	0	119	170	2
171	2020-02-09 09:27:55.294525+00	0	119	171	2
172	2020-02-09 09:27:55.320914+00	0	119	172	2
173	2020-02-09 09:27:55.412424+00	0	119	173	2
174	2020-02-09 09:27:55.451002+00	0	119	174	2
175	2020-02-09 09:27:55.546632+00	0	119	175	2
176	2020-02-09 09:27:55.58453+00	0	119	176	2
177	2020-02-09 09:27:55.681061+00	0	119	177	2
178	2020-02-09 09:27:55.716942+00	0	119	178	2
179	2020-02-09 09:27:55.809416+00	0	119	179	2
180	2020-02-09 09:27:55.848211+00	0	119	180	2
181	2020-02-09 09:27:55.940161+00	0	119	181	2
182	2020-02-09 09:27:55.956448+00	0	119	182	2
183	2020-02-09 09:27:55.996082+00	0	119	183	2
184	2020-02-09 09:27:56.010759+00	0	119	184	2
185	2020-02-09 09:27:56.060779+00	0	119	185	2
186	2020-02-09 09:27:56.082456+00	0	119	186	2
187	2020-02-09 09:27:56.150572+00	0	119	187	2
188	2020-02-09 09:27:56.182967+00	0	119	188	2
189	2020-02-09 09:27:56.279749+00	0	119	189	2
190	2020-02-09 09:27:56.321398+00	0	119	190	2
191	2020-02-09 09:27:56.42463+00	0	119	191	2
192	2020-02-09 09:27:56.464576+00	0	119	192	2
193	2020-02-09 09:27:56.575469+00	0	119	193	2
194	2020-02-09 09:27:56.619105+00	0	119	194	2
195	2020-02-09 09:27:56.729447+00	0	119	195	2
196	2020-02-09 09:27:56.772104+00	0	119	196	2
197	2020-02-09 09:27:56.883926+00	0	119	197	2
198	2020-02-09 09:27:56.926363+00	0	119	198	2
199	2020-02-09 09:27:57.037233+00	0	119	199	2
200	2020-02-09 09:27:57.05781+00	0	119	200	2
201	2020-02-09 09:27:57.100742+00	0	119	201	2
202	2020-02-09 09:27:57.114268+00	0	119	202	2
203	2020-02-09 09:27:57.159688+00	0	119	203	2
204	2020-02-09 09:27:57.177664+00	0	119	204	2
205	2020-02-09 09:27:57.224598+00	0	119	205	2
206	2020-02-09 09:27:57.248557+00	0	119	206	2
207	2020-02-09 09:27:57.336406+00	0	119	207	2
208	2020-02-09 09:27:57.379955+00	0	119	208	2
209	2020-02-09 09:27:57.49392+00	0	119	209	2
210	2020-02-09 09:27:57.537538+00	0	119	210	2
211	2020-02-09 09:27:57.647311+00	0	119	211	2
212	2020-02-09 09:27:57.688603+00	0	119	212	2
213	2020-02-09 09:27:57.795603+00	0	119	213	2
214	2020-02-09 09:27:57.840249+00	0	119	214	2
\.


--
-- Data for Name: tag_buffertagsupload; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.tag_buffertagsupload (id, filename, name_set, value_tot, value, notes, tag_combination, contro_tag, error_notes, date_import, created_by_id, status_id) FROM stdin;
128	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, INCROCIATO, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
129	\N	PASSAGGI	\N	\N	\N	PASSAGGIO INTERCETTATO, DIFENSIVA		\N	2020-02-09 09:27:49.98651+00	\N	2
130	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, INCROCIATO, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
131	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, ATTACCO DIRETTO, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
132	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, ATTACCO DIRETTO, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
133	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPAZZATA		\N	2020-02-09 09:27:49.98651+00	\N	2
134	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPAZZATA, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
135	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPAZZATA, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
136	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, VERTICALE LUNGO		\N	2020-02-09 09:27:49.98651+00	\N	2
137	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, VERTICALE LUNGO, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
138	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, VERTICALE LUNGO, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
139	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, ORIZZONTALE		\N	2020-02-09 09:27:49.98651+00	\N	2
140	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, ORIZZONTALE, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
141	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, ORIZZONTALE, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
142	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, CORTO		\N	2020-02-09 09:27:49.98651+00	\N	2
143	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, CORTO, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
144	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, CORTO, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
145	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, INDIETRO		\N	2020-02-09 09:27:49.98651+00	\N	2
146	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, INDIETRO, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
147	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, INDIETRO, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
148	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, PASSAGGIO CHIAVE		\N	2020-02-09 09:27:49.98651+00	\N	2
149	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, PASSAGGIO CHIAVE, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
150	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, PASSAGGIO CHIAVE, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
151	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPONDA, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
152	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPONDA, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
153	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPIZZATA AEREA, POSITIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
154	\N	PASSAGGI	\N	\N	\N	PASSAGGIO, SPIZZATA AEREA, NEGATIVO		\N	2020-02-09 09:27:49.98651+00	\N	2
155	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
156	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
157	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
158	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
159	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
160	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
161	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
162	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
163	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
164	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
165	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
166	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
167	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
168	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
169	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
170	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
171	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
172	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
173	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
174	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
175	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
176	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
177	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
178	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
179	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
180	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
181	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
182	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
183	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
184	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
185	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
186	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
187	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
188	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
189	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
190	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
191	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
192	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
193	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
194	\N	DUELLO OFFENSIVO	\N	\N	\N	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
195	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
196	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
197	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
198	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
199	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
200	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
201	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
202	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
203	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
204	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
205	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
206	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO BASSO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
207	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
208	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
209	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
210	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
211	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
212	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
213	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
214	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
215	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
216	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
217	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
218	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, ANTICIPO AEREO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, ANTICIPO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
219	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
220	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
221	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
222	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
223	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
224	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
225	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
226	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
227	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
228	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
229	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
230	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, CONTRASTO BASSO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, CONTRASTO BASSO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
231	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
232	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
233	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
234	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
235	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
236	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
237	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
238	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
239	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
240	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, DIFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
241	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
242	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, DUELLO AEREO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, DUELLO AEREO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
243	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
244	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
245	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
246	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
247	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
248	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
249	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
250	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, OFFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
251	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, OFFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
252	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
253	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
254	\N	DUELLO DIFENSIVO	\N	\N	\N	DUELLO DIFENSIVO, UNO CONTRO UNO, NEGATIVO, ULTRA OFFENSIVA	DUELLO OFFENSIVO, UNO CONTRO UNO, POSITIVO, ULTRA DIFENSIVA	\N	2020-02-09 09:27:49.98651+00	\N	2
\.


--
-- Data for Name: tag_tagstatus; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.tag_tagstatus (status_ptr_id, "defaultIs") FROM stdin;
1	t
2	f
3	f
\.


--
-- Data for Name: tag_taguploadoption; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.tag_taguploadoption (id, name, description, created_by_id) FROM stdin;
1	ADD		\N
2	CHANGE		\N
3	REMOVE		\N
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.tags (id, created_on, name, created_by_id) FROM stdin;
26	2020-02-09 09:27:50.113685+00	PASSAGGIO	119
27	2020-02-09 09:27:50.121648+00	INCROCIATO	119
28	2020-02-09 09:27:50.127743+00	POSITIVO	119
29	2020-02-09 09:27:50.258581+00	PASSAGGIO INTERCETTATO	119
30	2020-02-09 09:27:50.265903+00	DIFENSIVA	119
31	2020-02-09 09:27:50.3517+00	NEGATIVO	119
32	2020-02-09 09:27:50.441578+00	ATTACCO DIRETTO	119
33	2020-02-09 09:27:50.621487+00	SPAZZATA	119
34	2020-02-09 09:27:51.46545+00	VERTICALE LUNGO	119
35	2020-02-09 09:27:51.613953+00	ORIZZONTALE	119
36	2020-02-09 09:27:52.092541+00	CORTO	119
37	2020-02-09 09:27:52.554516+00	INDIETRO	119
38	2020-02-09 09:27:52.780175+00	PASSAGGIO CHIAVE	119
39	2020-02-09 09:27:53.102904+00	SPONDA	119
40	2020-02-09 09:27:53.318651+00	SPIZZATA AEREA	119
41	2020-02-09 09:27:53.536355+00	DUELLO OFFENSIVO	119
42	2020-02-09 09:27:53.542487+00	UNO CONTRO UNO	119
43	2020-02-09 09:27:53.551873+00	ULTRA DIFENSIVA	119
44	2020-02-09 09:27:53.591505+00	DUELLO DIFENSIVO	119
45	2020-02-09 09:27:53.604587+00	ULTRA OFFENSIVA	119
46	2020-02-09 09:27:53.719169+00	OFFENSIVA	119
47	2020-02-09 09:27:54.373768+00	ANTICIPO BASSO	119
48	2020-02-09 09:27:55.12031+00	ANTICIPO AEREO	119
49	2020-02-09 09:27:55.983519+00	CONTRASTO BASSO	119
50	2020-02-09 09:27:57.003547+00	DUELLO AEREO	119
\.


--
-- Data for Name: teamToCoach; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."teamToCoach" (id, start, "end", coach_id, created_by_id, team_id) FROM stdin;
\.


--
-- Data for Name: teamToCompetitions; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."teamToCompetitions" (id, current_position, competition_id, created_by_id, team_id) FROM stdin;
1	0	1	\N	1
2	0	1	\N	2
3	0	1	\N	3
4	0	1	\N	4
5	0	1	\N	5
6	0	1	\N	6
7	0	1	\N	7
8	0	1	\N	8
9	0	1	\N	9
10	0	1	\N	10
11	0	1	\N	11
12	0	1	\N	12
13	0	1	\N	13
14	0	1	\N	14
15	0	1	\N	15
16	0	1	\N	16
\.


--
-- Data for Name: teamTypes; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public."teamTypes" (id, name, created_by_id) FROM stdin;
1	Under13	\N
2	Under14	\N
3	Under15	\N
4	Under16	\N
5	Under17	\N
6	Under18	\N
7	Under19	\N
8	Under20	\N
9	Under21	\N
10	Under22	\N
11	Under23	\N
12	First Squad	\N
\.


--
-- Data for Name: team_report; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.team_report (id, created_on, name, "isConfirmed", created_by_id, report_template_id, team_id) FROM stdin;
\.


--
-- Data for Name: team_report_contracts; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.team_report_contracts (id, teamreport_id, contract_id) FROM stdin;
\.


--
-- Data for Name: team_report_matches; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.team_report_matches (id, teamreport_id, match_id) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.teams (id, name, "isNationalTeam", city_id, created_by_id, nation_id, "referenceTeam_id", type_id) FROM stdin;
1	INTER PRIMAVERA	f	\N	119	113	\N	9
2	ROMA PRIMAVERA	f	\N	\N	113	\N	9
3	FIORENTINA PRIMAVERA	f	\N	\N	113	\N	9
4	GENOA PRIMAVERA	f	\N	\N	113	\N	9
5	SAMPDORIA PRIMAVERA	f	\N	\N	113	\N	9
6	BOLOGNA PRIMAVERA	f	\N	\N	113	\N	9
7	ATALANTA PRIMAVERA	f	\N	\N	113	\N	9
8	CHIEVO PRIMAVERA	f	\N	\N	113	\N	9
9	EMPOLI PRIMAVERA	f	\N	\N	113	\N	9
10	TORINO PRIMAVERA	f	\N	\N	113	\N	9
11	SASSUOLO PRIMAVERA	f	\N	\N	113	\N	9
12	JUVENTUS PRIMAVERA	f	\N	\N	113	\N	9
13	NAPOLI PRIMAVERA	f	\N	119	113	\N	9
14	CAGLIARI PRIMAVERA	f	\N	\N	113	\N	9
15	LAZIO PRIMAVERA	f	\N	\N	113	\N	9
16	PESCARA PRIMAVERA	f	\N	\N	113	\N	9
\.


--
-- Data for Name: teams_teamtoplayer; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.teams_teamtoplayer (id, start, "end", "isCaptain", tshirt_number, created_by_id, player_id, team_id) FROM stdin;
1	2019-07-01	2020-06-30	f	22	\N	1	1
2	2019-07-01	2020-06-30	f	38	\N	2	1
3	2019-07-01	2020-06-30	f	52	\N	3	1
4	2019-07-01	2020-06-30	f	76	\N	4	1
5	2019-07-01	2020-06-30	f	50	\N	5	1
6	2019-07-01	2020-06-30	f	86	\N	6	1
7	2019-07-01	2020-06-30	f	78	\N	7	1
8	2019-07-01	2020-06-30	f	46	\N	8	1
9	2019-07-01	2020-06-30	f	31	\N	9	1
10	2019-07-01	2020-06-30	f	36	\N	10	1
11	2019-07-01	2020-06-30	f	34	\N	11	1
12	2019-07-01	2020-06-30	f	75	\N	12	1
13	2019-07-01	2020-06-30	f	47	\N	13	1
14	2019-07-01	2020-06-30	f	42	\N	14	1
15	2019-07-01	2020-06-30	f	99	\N	15	1
16	2019-07-01	2020-06-30	f	21	\N	16	1
17	2019-07-01	2020-06-30	f	15	\N	17	1
18	2019-07-01	2020-06-30	f	14	\N	18	1
19	2019-07-01	2020-06-30	f	1	\N	19	1
20	2019-07-01	2020-06-30	f	26	\N	20	1
21	2019-07-01	2020-06-30	f	83	\N	21	1
22	2019-07-01	2020-06-30	f	13	\N	22	1
23	2019-07-01	2020-06-30	f	23	\N	23	1
24	2019-07-01	2020-06-30	f	78	\N	24	2
25	2019-07-01	2020-06-30	f	55	\N	25	2
26	2019-07-01	2020-06-30	f	21	\N	26	2
27	2019-07-01	2020-06-30	f	28	\N	27	2
28	2019-07-01	2020-06-30	f	49	\N	28	2
29	2019-07-01	2020-06-30	f	74	\N	29	2
30	2019-07-01	2020-06-30	f	67	\N	30	2
31	2019-07-01	2020-06-30	f	9	\N	31	2
32	2019-07-01	2020-06-30	f	81	\N	32	2
33	2019-07-01	2020-06-30	f	48	\N	33	2
34	2019-07-01	2020-06-30	f	46	\N	34	2
35	2019-07-01	2020-06-30	f	37	\N	35	2
36	2019-07-01	2020-06-30	f	54	\N	36	2
37	2019-07-01	2020-06-30	f	47	\N	37	2
38	2019-07-01	2020-06-30	f	42	\N	38	2
39	2019-07-01	2020-06-30	f	33	\N	39	2
40	2019-07-01	2020-06-30	f	39	\N	40	2
41	2019-07-01	2020-06-30	f	86	\N	41	2
42	2019-07-01	2020-06-30	f	54	\N	42	2
43	2019-07-01	2020-06-30	f	94	\N	43	2
44	2019-07-01	2020-06-30	f	53	\N	44	2
45	2019-07-01	2020-06-30	f	55	\N	45	2
46	2019-07-01	2020-06-30	f	46	\N	46	2
47	2019-07-01	2020-06-30	f	43	\N	47	2
48	2019-07-01	2020-06-30	f	40	\N	48	2
49	2019-07-01	2020-06-30	f	47	\N	49	2
50	2019-07-01	2020-06-30	f	79	\N	50	2
51	2019-07-01	2020-06-30	f	23	\N	51	2
52	2019-07-01	2020-06-30	f	12	\N	52	3
53	2019-07-01	2020-06-30	f	98	\N	53	3
54	2019-07-01	2020-06-30	f	37	\N	54	3
55	2019-07-01	2020-06-30	f	30	\N	55	3
56	2019-07-01	2020-06-30	f	34	\N	56	3
57	2019-07-01	2020-06-30	f	83	\N	57	3
58	2019-07-01	2020-06-30	f	31	\N	58	3
59	2019-07-01	2020-06-30	f	23	\N	59	3
60	2019-07-01	2020-06-30	f	10	\N	60	3
61	2019-07-01	2020-06-30	f	79	\N	61	3
62	2019-07-01	2020-06-30	f	58	\N	62	3
63	2019-07-01	2020-06-30	f	87	\N	63	3
64	2019-07-01	2020-06-30	f	49	\N	64	3
65	2019-07-01	2020-06-30	f	85	\N	65	3
66	2019-07-01	2020-06-30	f	97	\N	66	3
67	2019-07-01	2020-06-30	f	17	\N	67	3
68	2019-07-01	2020-06-30	f	27	\N	68	3
69	2019-07-01	2020-06-30	f	26	\N	69	3
70	2019-07-01	2020-06-30	f	35	\N	70	3
71	2019-07-01	2020-06-30	f	56	\N	71	3
72	2019-07-01	2020-06-30	f	78	\N	72	3
73	2019-07-01	2020-06-30	f	25	\N	73	4
74	2019-07-01	2020-06-30	f	9	\N	74	4
75	2019-07-01	2020-06-30	f	93	\N	75	4
76	2019-07-01	2020-06-30	f	7	\N	76	4
77	2019-07-01	2020-06-30	f	31	\N	77	4
78	2019-07-01	2020-06-30	f	72	\N	78	4
79	2019-07-01	2020-06-30	f	1	\N	79	4
80	2019-07-01	2020-06-30	f	16	\N	80	4
81	2019-07-01	2020-06-30	f	79	\N	81	4
82	2019-07-01	2020-06-30	f	41	\N	82	4
83	2019-07-01	2020-06-30	f	13	\N	83	4
84	2019-07-01	2020-06-30	f	43	\N	84	4
85	2019-07-01	2020-06-30	f	90	\N	85	4
86	2019-07-01	2020-06-30	f	26	\N	86	4
87	2019-07-01	2020-06-30	f	65	\N	87	4
88	2019-07-01	2020-06-30	f	60	\N	88	4
89	2019-07-01	2020-06-30	f	81	\N	89	4
90	2019-07-01	2020-06-30	f	27	\N	90	4
91	2019-07-01	2020-06-30	f	92	\N	91	4
92	2019-07-01	2020-06-30	f	37	\N	92	4
93	2019-07-01	2020-06-30	f	76	\N	93	4
94	2019-07-01	2020-06-30	f	2	\N	94	4
95	2019-07-01	2020-06-30	f	77	\N	95	4
96	2019-07-01	2020-06-30	f	12	\N	96	4
97	2019-07-01	2020-06-30	f	24	\N	97	4
98	2019-07-01	2020-06-30	f	57	\N	98	4
99	2019-07-01	2020-06-30	f	47	\N	99	5
100	2019-07-01	2020-06-30	f	28	\N	100	5
101	2019-07-01	2020-06-30	f	35	\N	101	5
102	2019-07-01	2020-06-30	f	76	\N	102	5
103	2019-07-01	2020-06-30	f	25	\N	103	5
104	2019-07-01	2020-06-30	f	50	\N	104	5
105	2019-07-01	2020-06-30	f	18	\N	105	5
106	2019-07-01	2020-06-30	f	67	\N	106	5
107	2019-07-01	2020-06-30	f	66	\N	107	5
108	2019-07-01	2020-06-30	f	96	\N	108	5
109	2019-07-01	2020-06-30	f	33	\N	109	5
110	2019-07-01	2020-06-30	f	32	\N	110	5
111	2019-07-01	2020-06-30	f	15	\N	111	5
112	2019-07-01	2020-06-30	f	28	\N	112	5
113	2019-07-01	2020-06-30	f	88	\N	113	5
114	2019-07-01	2020-06-30	f	61	\N	114	5
115	2019-07-01	2020-06-30	f	2	\N	115	5
116	2019-07-01	2020-06-30	f	42	\N	116	5
117	2019-07-01	2020-06-30	f	60	\N	117	5
118	2019-07-01	2020-06-30	f	37	\N	118	5
119	2019-07-01	2020-06-30	f	1	\N	119	5
120	2019-07-01	2020-06-30	f	55	\N	120	5
121	2019-07-01	2020-06-30	f	30	\N	121	5
122	2019-07-01	2020-06-30	f	87	\N	122	5
123	2019-07-01	2020-06-30	f	98	\N	123	5
124	2019-07-01	2020-06-30	f	16	\N	124	5
125	2019-07-01	2020-06-30	f	79	\N	125	5
126	2019-07-01	2020-06-30	f	35	\N	126	5
127	2019-07-01	2020-06-30	f	75	\N	127	5
128	2019-07-01	2020-06-30	f	49	\N	128	5
129	2019-07-01	2020-06-30	f	7	\N	129	6
130	2019-07-01	2020-06-30	f	67	\N	130	6
131	2019-07-01	2020-06-30	f	12	\N	131	6
132	2019-07-01	2020-06-30	f	66	\N	132	6
133	2019-07-01	2020-06-30	f	83	\N	133	6
134	2019-07-01	2020-06-30	f	90	\N	134	6
135	2019-07-01	2020-06-30	f	27	\N	135	6
136	2019-07-01	2020-06-30	f	52	\N	136	6
137	2019-07-01	2020-06-30	f	72	\N	137	6
138	2019-07-01	2020-06-30	f	65	\N	138	6
139	2019-07-01	2020-06-30	f	9	\N	139	6
140	2019-07-01	2020-06-30	f	38	\N	140	6
141	2019-07-01	2020-06-30	f	88	\N	141	6
142	2019-07-01	2020-06-30	f	62	\N	142	6
143	2019-07-01	2020-06-30	f	34	\N	143	6
144	2019-07-01	2020-06-30	f	61	\N	144	6
145	2019-07-01	2020-06-30	f	64	\N	145	6
146	2019-07-01	2020-06-30	f	48	\N	146	6
147	2019-07-01	2020-06-30	f	81	\N	147	6
148	2019-07-01	2020-06-30	f	4	\N	148	6
149	2019-07-01	2020-06-30	f	24	\N	149	6
150	2019-07-01	2020-06-30	f	26	\N	150	6
151	2019-07-01	2020-06-30	f	93	\N	151	6
152	2019-07-01	2020-06-30	f	91	\N	152	6
153	2019-07-01	2020-06-30	f	15	\N	153	6
154	2019-07-01	2020-06-30	f	47	\N	154	6
155	2019-07-01	2020-06-30	f	29	\N	155	6
156	2019-07-01	2020-06-30	f	79	\N	156	6
157	2019-07-01	2020-06-30	f	23	\N	157	6
158	2019-07-01	2020-06-30	f	32	\N	158	6
159	2019-07-01	2020-06-30	f	70	\N	159	6
160	2019-07-01	2020-06-30	f	63	\N	160	6
161	2019-07-01	2020-06-30	f	64	\N	161	7
162	2019-07-01	2020-06-30	f	20	\N	162	7
163	2019-07-01	2020-06-30	f	77	\N	163	7
164	2019-07-01	2020-06-30	f	48	\N	164	7
165	2019-07-01	2020-06-30	f	55	\N	165	7
166	2019-07-01	2020-06-30	f	14	\N	166	7
167	2019-07-01	2020-06-30	f	30	\N	167	7
168	2019-07-01	2020-06-30	f	84	\N	168	7
169	2019-07-01	2020-06-30	f	13	\N	169	7
170	2019-07-01	2020-06-30	f	9	\N	170	7
171	2019-07-01	2020-06-30	f	3	\N	171	7
172	2019-07-01	2020-06-30	f	81	\N	172	7
173	2019-07-01	2020-06-30	f	86	\N	173	7
174	2019-07-01	2020-06-30	f	99	\N	174	7
175	2019-07-01	2020-06-30	f	87	\N	175	7
176	2019-07-01	2020-06-30	f	63	\N	176	7
177	2019-07-01	2020-06-30	f	32	\N	177	7
178	2019-07-01	2020-06-30	f	36	\N	178	7
179	2019-07-01	2020-06-30	f	80	\N	179	7
180	2019-07-01	2020-06-30	f	21	\N	180	7
181	2019-07-01	2020-06-30	f	27	\N	181	7
182	2019-07-01	2020-06-30	f	1	\N	182	7
183	2019-07-01	2020-06-30	f	78	\N	183	7
184	2019-07-01	2020-06-30	f	92	\N	184	7
185	2019-07-01	2020-06-30	f	90	\N	185	7
186	2019-07-01	2020-06-30	f	98	\N	186	7
187	2019-07-01	2020-06-30	f	25	\N	187	7
188	2019-07-01	2020-06-30	f	70	\N	188	8
189	2019-07-01	2020-06-30	f	65	\N	189	8
190	2019-07-01	2020-06-30	f	16	\N	190	8
191	2019-07-01	2020-06-30	f	86	\N	191	8
192	2019-07-01	2020-06-30	f	39	\N	192	8
193	2019-07-01	2020-06-30	f	92	\N	193	8
194	2019-07-01	2020-06-30	f	42	\N	194	8
195	2019-07-01	2020-06-30	f	62	\N	195	8
196	2019-07-01	2020-06-30	f	88	\N	196	8
197	2019-07-01	2020-06-30	f	43	\N	197	8
198	2019-07-01	2020-06-30	f	78	\N	198	8
199	2019-07-01	2020-06-30	f	20	\N	199	8
200	2019-07-01	2020-06-30	f	60	\N	200	8
201	2019-07-01	2020-06-30	f	21	\N	201	8
202	2019-07-01	2020-06-30	f	19	\N	202	8
203	2019-07-01	2020-06-30	f	26	\N	203	8
204	2019-07-01	2020-06-30	f	47	\N	204	8
205	2019-07-01	2020-06-30	f	98	\N	205	8
206	2019-07-01	2020-06-30	f	94	\N	206	8
207	2019-07-01	2020-06-30	f	48	\N	207	8
208	2019-07-01	2020-06-30	f	38	\N	208	8
209	2019-07-01	2020-06-30	f	15	\N	209	8
210	2019-07-01	2020-06-30	f	56	\N	210	8
211	2019-07-01	2020-06-30	f	87	\N	211	8
212	2019-07-01	2020-06-30	f	59	\N	212	8
213	2019-07-01	2020-06-30	f	13	\N	213	8
214	2019-07-01	2020-06-30	f	8	\N	214	8
215	2019-07-01	2020-06-30	f	66	\N	215	8
216	2019-07-01	2020-06-30	f	23	\N	216	8
217	2019-07-01	2020-06-30	f	89	\N	217	9
218	2019-07-01	2020-06-30	f	49	\N	218	9
219	2019-07-01	2020-06-30	f	95	\N	219	9
220	2019-07-01	2020-06-30	f	72	\N	220	9
221	2019-07-01	2020-06-30	f	24	\N	221	9
222	2019-07-01	2020-06-30	f	70	\N	222	9
223	2019-07-01	2020-06-30	f	42	\N	223	9
224	2019-07-01	2020-06-30	f	96	\N	224	9
225	2019-07-01	2020-06-30	f	14	\N	225	9
226	2019-07-01	2020-06-30	f	31	\N	226	9
227	2019-07-01	2020-06-30	f	43	\N	227	9
228	2019-07-01	2020-06-30	f	73	\N	228	9
229	2019-07-01	2020-06-30	f	61	\N	229	9
230	2019-07-01	2020-06-30	f	57	\N	230	9
231	2019-07-01	2020-06-30	f	24	\N	231	9
232	2019-07-01	2020-06-30	f	92	\N	232	9
233	2019-07-01	2020-06-30	f	17	\N	233	9
234	2019-07-01	2020-06-30	f	88	\N	234	9
235	2019-07-01	2020-06-30	f	91	\N	235	9
236	2019-07-01	2020-06-30	f	45	\N	236	9
237	2019-07-01	2020-06-30	f	59	\N	237	9
238	2019-07-01	2020-06-30	f	99	\N	238	9
239	2019-07-01	2020-06-30	f	56	\N	239	9
240	2019-07-01	2020-06-30	f	86	\N	240	9
241	2019-07-01	2020-06-30	f	36	\N	241	9
242	2019-07-01	2020-06-30	f	80	\N	242	9
243	2019-07-01	2020-06-30	f	87	\N	243	9
244	2019-07-01	2020-06-30	f	74	\N	244	9
245	2019-07-01	2020-06-30	f	34	\N	245	10
246	2019-07-01	2020-06-30	f	68	\N	246	10
247	2019-07-01	2020-06-30	f	17	\N	247	10
248	2019-07-01	2020-06-30	f	64	\N	248	10
249	2019-07-01	2020-06-30	f	51	\N	249	10
250	2019-07-01	2020-06-30	f	26	\N	250	10
251	2019-07-01	2020-06-30	f	95	\N	251	10
252	2019-07-01	2020-06-30	f	15	\N	252	10
253	2019-07-01	2020-06-30	f	96	\N	253	10
254	2019-07-01	2020-06-30	f	88	\N	254	10
255	2019-07-01	2020-06-30	f	78	\N	255	10
256	2019-07-01	2020-06-30	f	8	\N	256	10
257	2019-07-01	2020-06-30	f	67	\N	257	10
258	2019-07-01	2020-06-30	f	80	\N	258	10
259	2019-07-01	2020-06-30	f	41	\N	259	10
260	2019-07-01	2020-06-30	f	3	\N	260	10
261	2019-07-01	2020-06-30	f	85	\N	261	10
262	2019-07-01	2020-06-30	f	35	\N	262	10
263	2019-07-01	2020-06-30	f	55	\N	263	10
264	2019-07-01	2020-06-30	f	45	\N	264	10
265	2019-07-01	2020-06-30	f	87	\N	265	10
266	2019-07-01	2020-06-30	f	61	\N	266	10
267	2019-07-01	2020-06-30	f	47	\N	267	10
268	2019-07-01	2020-06-30	f	11	\N	268	10
269	2019-07-01	2020-06-30	f	73	\N	269	10
270	2019-07-01	2020-06-30	f	48	\N	270	10
271	2019-07-01	2020-06-30	f	71	\N	271	11
272	2019-07-01	2020-06-30	f	8	\N	272	11
273	2019-07-01	2020-06-30	f	63	\N	273	11
274	2019-07-01	2020-06-30	f	87	\N	274	11
275	2019-07-01	2020-06-30	f	77	\N	275	11
276	2019-07-01	2020-06-30	f	86	\N	276	11
277	2019-07-01	2020-06-30	f	26	\N	277	11
278	2019-07-01	2020-06-30	f	10	\N	278	11
279	2019-07-01	2020-06-30	f	4	\N	279	11
280	2019-07-01	2020-06-30	f	91	\N	280	11
281	2019-07-01	2020-06-30	f	55	\N	281	11
282	2019-07-01	2020-06-30	f	75	\N	282	11
283	2019-07-01	2020-06-30	f	93	\N	283	11
284	2019-07-01	2020-06-30	f	16	\N	284	11
285	2019-07-01	2020-06-30	f	94	\N	285	11
286	2019-07-01	2020-06-30	f	52	\N	286	11
287	2019-07-01	2020-06-30	f	24	\N	287	11
288	2019-07-01	2020-06-30	f	44	\N	288	11
289	2019-07-01	2020-06-30	f	11	\N	289	11
290	2019-07-01	2020-06-30	f	83	\N	290	11
291	2019-07-01	2020-06-30	f	23	\N	291	11
292	2019-07-01	2020-06-30	f	13	\N	292	11
293	2019-07-01	2020-06-30	f	76	\N	293	11
294	2019-07-01	2020-06-30	f	32	\N	294	11
295	2019-07-01	2020-06-30	f	51	\N	295	11
296	2019-07-01	2020-06-30	f	21	\N	296	11
297	2019-07-01	2020-06-30	f	12	\N	297	11
298	2019-07-01	2020-06-30	f	50	\N	298	11
299	2019-07-01	2020-06-30	f	12	\N	299	12
300	2019-07-01	2020-06-30	f	24	\N	300	12
301	2019-07-01	2020-06-30	f	12	\N	301	12
302	2019-07-01	2020-06-30	f	25	\N	302	12
303	2019-07-01	2020-06-30	f	88	\N	303	12
304	2019-07-01	2020-06-30	f	62	\N	304	12
305	2019-07-01	2020-06-30	f	31	\N	305	12
306	2019-07-01	2020-06-30	f	39	\N	306	12
307	2019-07-01	2020-06-30	f	16	\N	307	12
308	2019-07-01	2020-06-30	f	57	\N	308	12
309	2019-07-01	2020-06-30	f	37	\N	309	12
310	2019-07-01	2020-06-30	f	4	\N	310	12
311	2019-07-01	2020-06-30	f	39	\N	311	12
312	2019-07-01	2020-06-30	f	80	\N	312	12
313	2019-07-01	2020-06-30	f	52	\N	313	12
314	2019-07-01	2020-06-30	f	87	\N	314	12
315	2019-07-01	2020-06-30	f	96	\N	315	12
316	2019-07-01	2020-06-30	f	40	\N	316	12
317	2019-07-01	2020-06-30	f	46	\N	317	12
318	2019-07-01	2020-06-30	f	25	\N	318	12
319	2019-07-01	2020-06-30	f	37	\N	319	12
320	2019-07-01	2020-06-30	f	22	\N	320	12
321	2019-07-01	2020-06-30	f	73	\N	321	12
322	2019-07-01	2020-06-30	f	26	\N	322	12
323	2019-07-01	2020-06-30	f	91	\N	323	12
324	2019-07-01	2020-06-30	f	44	\N	324	12
325	2019-07-01	2020-06-30	f	8	\N	325	12
326	2019-07-01	2020-06-30	f	45	\N	326	12
327	2019-07-01	2020-06-30	f	44	\N	327	13
328	2019-07-01	2020-06-30	f	76	\N	328	13
329	2019-07-01	2020-06-30	f	17	\N	329	13
330	2019-07-01	2020-06-30	f	26	\N	330	13
331	2019-07-01	2020-06-30	f	9	\N	331	13
332	2019-07-01	2020-06-30	f	35	\N	332	13
333	2019-07-01	2020-06-30	f	50	\N	333	13
334	2019-07-01	2020-06-30	f	92	\N	334	13
335	2019-07-01	2020-06-30	f	74	\N	335	13
336	2019-07-01	2020-06-30	f	87	\N	336	13
337	2019-07-01	2020-06-30	f	68	\N	337	13
338	2019-07-01	2020-06-30	f	73	\N	338	13
339	2019-07-01	2020-06-30	f	2	\N	339	13
340	2019-07-01	2020-06-30	f	19	\N	340	13
341	2019-07-01	2020-06-30	f	95	\N	341	13
342	2019-07-01	2020-06-30	f	40	\N	342	13
343	2019-07-01	2020-06-30	f	67	\N	343	13
344	2019-07-01	2020-06-30	f	83	\N	344	13
345	2019-07-01	2020-06-30	f	90	\N	345	13
346	2019-07-01	2020-06-30	f	5	\N	346	13
347	2019-07-01	2020-06-30	f	13	\N	347	13
348	2019-07-01	2020-06-30	f	98	\N	348	13
349	2019-07-01	2020-06-30	f	63	\N	349	13
350	2019-07-01	2020-06-30	f	79	\N	350	13
351	2019-07-01	2020-06-30	f	7	\N	351	13
352	2019-07-01	2020-06-30	f	89	\N	352	13
353	2019-07-01	2020-06-30	f	36	\N	353	13
354	2019-07-01	2020-06-30	f	24	\N	354	13
355	2019-07-01	2020-06-30	f	34	\N	355	13
356	2019-07-01	2020-06-30	f	32	\N	356	13
357	2019-07-01	2020-06-30	f	88	\N	357	13
358	2019-07-01	2020-06-30	f	34	\N	358	14
359	2019-07-01	2020-06-30	f	6	\N	359	14
360	2019-07-01	2020-06-30	f	51	\N	360	14
361	2019-07-01	2020-06-30	f	43	\N	361	14
362	2019-07-01	2020-06-30	f	86	\N	362	14
363	2019-07-01	2020-06-30	f	2	\N	363	14
364	2019-07-01	2020-06-30	f	27	\N	364	14
365	2019-07-01	2020-06-30	f	91	\N	365	14
366	2019-07-01	2020-06-30	f	44	\N	366	14
367	2019-07-01	2020-06-30	f	25	\N	367	14
368	2019-07-01	2020-06-30	f	22	\N	368	14
369	2019-07-01	2020-06-30	f	14	\N	369	14
370	2019-07-01	2020-06-30	f	97	\N	370	14
371	2019-07-01	2020-06-30	f	47	\N	371	14
372	2019-07-01	2020-06-30	f	68	\N	372	14
373	2019-07-01	2020-06-30	f	94	\N	373	14
374	2019-07-01	2020-06-30	f	98	\N	374	14
375	2019-07-01	2020-06-30	f	13	\N	375	14
376	2019-07-01	2020-06-30	f	21	\N	376	14
377	2019-07-01	2020-06-30	f	99	\N	377	14
378	2019-07-01	2020-06-30	f	72	\N	378	14
379	2019-07-01	2020-06-30	f	40	\N	379	14
380	2019-07-01	2020-06-30	f	32	\N	380	14
381	2019-07-01	2020-06-30	f	77	\N	381	14
382	2019-07-01	2020-06-30	f	55	\N	382	14
383	2019-07-01	2020-06-30	f	6	\N	383	15
384	2019-07-01	2020-06-30	f	27	\N	384	15
385	2019-07-01	2020-06-30	f	13	\N	385	15
386	2019-07-01	2020-06-30	f	79	\N	386	15
387	2019-07-01	2020-06-30	f	76	\N	387	15
388	2019-07-01	2020-06-30	f	96	\N	388	15
389	2019-07-01	2020-06-30	f	39	\N	389	15
390	2019-07-01	2020-06-30	f	97	\N	390	15
391	2019-07-01	2020-06-30	f	70	\N	391	15
392	2019-07-01	2020-06-30	f	63	\N	392	15
393	2019-07-01	2020-06-30	f	77	\N	393	15
394	2019-07-01	2020-06-30	f	98	\N	394	15
395	2019-07-01	2020-06-30	f	44	\N	395	15
396	2019-07-01	2020-06-30	f	59	\N	396	15
397	2019-07-01	2020-06-30	f	56	\N	397	15
398	2019-07-01	2020-06-30	f	34	\N	398	15
399	2019-07-01	2020-06-30	f	92	\N	399	15
400	2019-07-01	2020-06-30	f	4	\N	400	15
401	2019-07-01	2020-06-30	f	23	\N	401	15
402	2019-07-01	2020-06-30	f	33	\N	402	15
403	2019-07-01	2020-06-30	f	46	\N	403	15
404	2019-07-01	2020-06-30	f	83	\N	404	15
405	2019-07-01	2020-06-30	f	24	\N	405	15
406	2019-07-01	2020-06-30	f	9	\N	406	15
407	2019-07-01	2020-06-30	f	48	\N	407	15
408	2019-07-01	2020-06-30	f	60	\N	408	15
409	2019-07-01	2020-06-30	f	84	\N	409	15
410	2019-07-01	2020-06-30	f	42	\N	410	15
411	2019-07-01	2020-06-30	f	95	\N	411	15
412	2019-07-01	2020-06-30	f	22	\N	412	15
413	2019-07-01	2020-06-30	f	44	\N	413	16
414	2019-07-01	2020-06-30	f	99	\N	414	16
415	2019-07-01	2020-06-30	f	56	\N	415	16
416	2019-07-01	2020-06-30	f	12	\N	416	16
417	2019-07-01	2020-06-30	f	42	\N	417	16
418	2019-07-01	2020-06-30	f	23	\N	418	16
419	2019-07-01	2020-06-30	f	8	\N	419	16
420	2019-07-01	2020-06-30	f	30	\N	420	16
421	2019-07-01	2020-06-30	f	33	\N	421	16
422	2019-07-01	2020-06-30	f	81	\N	422	16
423	2019-07-01	2020-06-30	f	82	\N	423	16
424	2019-07-01	2020-06-30	f	87	\N	424	16
425	2019-07-01	2020-06-30	f	97	\N	425	16
426	2019-07-01	2020-06-30	f	98	\N	426	16
427	2019-07-01	2020-06-30	f	95	\N	427	16
428	2019-07-01	2020-06-30	f	32	\N	428	16
429	2019-07-01	2020-06-30	f	13	\N	429	16
430	2019-07-01	2020-06-30	f	89	\N	430	16
431	2019-07-01	2020-06-30	f	58	\N	431	16
432	2019-07-01	2020-06-30	f	35	\N	432	16
433	2019-07-01	2020-06-30	f	45	\N	433	16
434	2019-07-01	2020-06-30	f	14	\N	434	16
435	2019-07-01	2020-06-30	f	79	\N	435	16
\.


--
-- Data for Name: tools_status; Type: TABLE DATA; Schema: public; Owner: danieletwopointzero
--

COPY public.tools_status (id, name, description, read, write, update, delete, color, created_by_id) FROM stdin;
1	IMPORTING		t	f	f	f	#FFEC40	\N
2	IMPORTED		t	f	f	f	#7CFF54	\N
3	FAILED		t	f	f	f	#FF352E	\N
\.


--
-- Name: TagCombinationSet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."TagCombinationSet_id_seq"', 6, true);


--
-- Name: TagCombinationSet_tagCombinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."TagCombinationSet_tagCombinations_id_seq"', 214, true);


--
-- Name: TagCombinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."TagCombinations_id_seq"', 214, true);


--
-- Name: TagCombinations_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."TagCombinations_tags_id_seq"', 788, true);


--
-- Name: Versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."Versions_id_seq"', 2, true);


--
-- Name: agencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.agencies_id_seq', 1, false);


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.agents_id_seq', 1, false);


--
-- Name: agents_nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.agents_nationalities_id_seq', 1, false);


--
-- Name: analysis_graphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.analysis_graphs_id_seq', 1, false);


--
-- Name: analysis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.analysis_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 6, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 52, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 225, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 6, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 120, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 2, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.cities_id_seq', 5, true);


--
-- Name: coaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.coaches_id_seq', 1, false);


--
-- Name: coaches_nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.coaches_nationalities_id_seq', 1, false);


--
-- Name: competitionTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."competitionTypes_id_seq"', 2, true);


--
-- Name: competitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.competitions_id_seq', 1, true);


--
-- Name: constitutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.constitutions_id_seq', 3, true);


--
-- Name: continents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.continents_id_seq', 4, true);


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.contracts_id_seq', 1, false);


--
-- Name: customerToUser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."customerToUser_id_seq"', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.dashboard_userdashboardmodule_id_seq', 2, true);


--
-- Name: data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.data_id_seq', 1, false);


--
-- Name: data_tag_combinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.data_tag_combinations_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 127, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 75, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 63, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: events_tagCombinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."events_tagCombinations_id_seq"', 1, false);


--
-- Name: federations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.federations_id_seq', 1, false);


--
-- Name: footedness_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.footedness_id_seq', 3, true);


--
-- Name: formationToRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."formationToRoles_id_seq"', 110, true);


--
-- Name: formations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.formations_id_seq', 10, true);


--
-- Name: graphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.graphs_id_seq', 1, false);


--
-- Name: graphs_input_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.graphs_input_data_id_seq', 1, false);


--
-- Name: graphs_tagComboSet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."graphs_tagComboSet_id_seq"', 1, false);


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, false);


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, false);


--
-- Name: match_buffermatchupload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.match_buffermatchupload_id_seq', 1, false);


--
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.matches_id_seq', 240, true);


--
-- Name: monitoringTeamToUser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."monitoringTeamToUser_id_seq"', 1, false);


--
-- Name: monitoringTeam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."monitoringTeam_id_seq"', 1, false);


--
-- Name: nations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.nations_id_seq', 250, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.period_id_seq', 4, true);


--
-- Name: physiques_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.physiques_id_seq', 3, true);


--
-- Name: playerRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."playerRoles_id_seq"', 20, true);


--
-- Name: player_report_contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.player_report_contracts_id_seq', 1, false);


--
-- Name: player_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.player_report_id_seq', 1, false);


--
-- Name: player_report_matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.player_report_matches_id_seq', 1, false);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.players_id_seq', 435, true);


--
-- Name: players_nationalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.players_nationalities_id_seq', 420, true);


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.positions_id_seq', 4, true);


--
-- Name: report_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.report_templates_id_seq', 1, false);


--
-- Name: report_templates_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.report_templates_sections_id_seq', 1, false);


--
-- Name: scoutingToUser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."scoutingToUser_id_seq"', 1, false);


--
-- Name: scouting_box_scoutingbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.scouting_box_scoutingbox_id_seq', 1, false);


--
-- Name: sections_analysis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.sections_analysis_id_seq', 1, false);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.sections_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: tagCombinationControTags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."tagCombinationControTags_id_seq"', 160, true);


--
-- Name: tagCombinationToVersions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."tagCombinationToVersions_id_seq"', 214, true);


--
-- Name: tag_buffertagsupload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.tag_buffertagsupload_id_seq', 254, true);


--
-- Name: tag_taguploadoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.tag_taguploadoption_id_seq', 3, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.tags_id_seq', 50, true);


--
-- Name: teamToCoach_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."teamToCoach_id_seq"', 1, false);


--
-- Name: teamToCompetitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."teamToCompetitions_id_seq"', 16, true);


--
-- Name: teamTypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public."teamTypes_id_seq"', 12, true);


--
-- Name: team_report_contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.team_report_contracts_id_seq', 1, false);


--
-- Name: team_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.team_report_id_seq', 1, false);


--
-- Name: team_report_matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.team_report_matches_id_seq', 1, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.teams_id_seq', 16, true);


--
-- Name: teams_teamtoplayer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.teams_teamtoplayer_id_seq', 435, true);


--
-- Name: tools_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: danieletwopointzero
--

SELECT pg_catalog.setval('public.tools_status_id_seq', 3, true);


--
-- Name: ContractMonitoring ContractMonitoring_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."ContractMonitoring"
    ADD CONSTRAINT "ContractMonitoring_pkey" PRIMARY KEY (contract_ptr_id);


--
-- Name: TagCombinationSet TagCombinationSet_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet"
    ADD CONSTRAINT "TagCombinationSet_name_key" UNIQUE (name);


--
-- Name: TagCombinationSet TagCombinationSet_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet"
    ADD CONSTRAINT "TagCombinationSet_pkey" PRIMARY KEY (id);


--
-- Name: TagCombinationSet_tagCombinations TagCombinationSet_tagCombinations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet_tagCombinations"
    ADD CONSTRAINT "TagCombinationSet_tagCombinations_pkey" PRIMARY KEY (id);


--
-- Name: TagCombinations TagCombinations_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations"
    ADD CONSTRAINT "TagCombinations_name_key" UNIQUE (name);


--
-- Name: TagCombinations TagCombinations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations"
    ADD CONSTRAINT "TagCombinations_pkey" PRIMARY KEY (id);


--
-- Name: TagCombinations_tags TagCombinations_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations_tags"
    ADD CONSTRAINT "TagCombinations_tags_pkey" PRIMARY KEY (id);


--
-- Name: Versions Versions_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."Versions"
    ADD CONSTRAINT "Versions_name_key" UNIQUE (name);


--
-- Name: Versions Versions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."Versions"
    ADD CONSTRAINT "Versions_pkey" PRIMARY KEY (id);


--
-- Name: agencies agencies_company_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agencies
    ADD CONSTRAINT agencies_company_name_key UNIQUE (company_name);


--
-- Name: agencies agencies_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agencies
    ADD CONSTRAINT agencies_pkey PRIMARY KEY (id);


--
-- Name: agents_nationalities agents_nationalities_agent_id_nation_id_35b340f5_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents_nationalities
    ADD CONSTRAINT agents_nationalities_agent_id_nation_id_35b340f5_uniq UNIQUE (agent_id, nation_id);


--
-- Name: agents_nationalities agents_nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents_nationalities
    ADD CONSTRAINT agents_nationalities_pkey PRIMARY KEY (id);


--
-- Name: agents agents_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: analysis_graphs analysis_graphs_analysis_id_graph_id_3a5e7f5c_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis_graphs
    ADD CONSTRAINT analysis_graphs_analysis_id_graph_id_3a5e7f5c_uniq UNIQUE (analysis_id, graph_id);


--
-- Name: analysis_graphs analysis_graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis_graphs
    ADD CONSTRAINT analysis_graphs_pkey PRIMARY KEY (id);


--
-- Name: analysis analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis
    ADD CONSTRAINT analysis_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: coaches_nationalities coaches_nationalities_coach_id_nation_id_9e2cdad0_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches_nationalities
    ADD CONSTRAINT coaches_nationalities_coach_id_nation_id_9e2cdad0_uniq UNIQUE (coach_id, nation_id);


--
-- Name: coaches_nationalities coaches_nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches_nationalities
    ADD CONSTRAINT coaches_nationalities_pkey PRIMARY KEY (id);


--
-- Name: coaches coaches_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_pkey PRIMARY KEY (id);


--
-- Name: competitionTypes competitionTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."competitionTypes"
    ADD CONSTRAINT "competitionTypes_pkey" PRIMARY KEY (id);


--
-- Name: competitionTypes competitionTypes_type_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."competitionTypes"
    ADD CONSTRAINT "competitionTypes_type_key" UNIQUE (type);


--
-- Name: competitions competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (id);


--
-- Name: constitutions constitutions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.constitutions
    ADD CONSTRAINT constitutions_pkey PRIMARY KEY (id);


--
-- Name: constitutions constitutions_type_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.constitutions
    ADD CONSTRAINT constitutions_type_key UNIQUE (type);


--
-- Name: continents continents_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_name_key UNIQUE (name);


--
-- Name: continents continents_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_pkey PRIMARY KEY (id);


--
-- Name: contractScouting contractScouting_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."contractScouting"
    ADD CONSTRAINT "contractScouting_pkey" PRIMARY KEY (contract_ptr_id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: customerToUser customerToUser_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."customerToUser"
    ADD CONSTRAINT "customerToUser_pkey" PRIMARY KEY (id);


--
-- Name: customers customers_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_name_key UNIQUE (name);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customerToUser customertouser_customer_id_user_id_be6a3aa2_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."customerToUser"
    ADD CONSTRAINT customertouser_customer_id_user_id_be6a3aa2_uniq UNIQUE (customer_id, user_id);


--
-- Name: dashboard_userdashboardmodule dashboard_userdashboardmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule
    ADD CONSTRAINT dashboard_userdashboardmodule_pkey PRIMARY KEY (id);


--
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pkey PRIMARY KEY (id);


--
-- Name: data_tag_combinations data_tag_combinations_data_id_tagcombination_id_977f09fc_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data_tag_combinations
    ADD CONSTRAINT data_tag_combinations_data_id_tagcombination_id_977f09fc_uniq UNIQUE (data_id, tagcombination_id);


--
-- Name: data_tag_combinations data_tag_combinations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data_tag_combinations
    ADD CONSTRAINT data_tag_combinations_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: events_tagCombinations events_tagCombinations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."events_tagCombinations"
    ADD CONSTRAINT "events_tagCombinations_pkey" PRIMARY KEY (id);


--
-- Name: events_tagCombinations events_tagcombinations_event_id_tagcombinationt_3c37d161_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."events_tagCombinations"
    ADD CONSTRAINT events_tagcombinations_event_id_tagcombinationt_3c37d161_uniq UNIQUE (event_id, tagcombinationtoversion_id);


--
-- Name: federations federations_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.federations
    ADD CONSTRAINT federations_name_key UNIQUE (name);


--
-- Name: federations federations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.federations
    ADD CONSTRAINT federations_pkey PRIMARY KEY (id);


--
-- Name: footedness footedness_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.footedness
    ADD CONSTRAINT footedness_pkey PRIMARY KEY (id);


--
-- Name: footedness footedness_type_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.footedness
    ADD CONSTRAINT footedness_type_key UNIQUE (type);


--
-- Name: formationToRoles formationToRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."formationToRoles"
    ADD CONSTRAINT "formationToRoles_pkey" PRIMARY KEY (id);


--
-- Name: formations formations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.formations
    ADD CONSTRAINT formations_pkey PRIMARY KEY (id);


--
-- Name: formations formations_system_of_play_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.formations
    ADD CONSTRAINT formations_system_of_play_key UNIQUE (system_of_play);


--
-- Name: formationToRoles formationtoroles_formation_id_role_id_bfc88042_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."formationToRoles"
    ADD CONSTRAINT formationtoroles_formation_id_role_id_bfc88042_uniq UNIQUE (formation_id, role_id);


--
-- Name: graphs_input_data graphs_input_data_graph_id_data_id_9afb1fdb_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs_input_data
    ADD CONSTRAINT graphs_input_data_graph_id_data_id_9afb1fdb_uniq UNIQUE (graph_id, data_id);


--
-- Name: graphs_input_data graphs_input_data_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs_input_data
    ADD CONSTRAINT graphs_input_data_pkey PRIMARY KEY (id);


--
-- Name: graphs graphs_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs
    ADD CONSTRAINT graphs_pkey PRIMARY KEY (id);


--
-- Name: graphs_tagComboSet graphs_tagComboSet_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."graphs_tagComboSet"
    ADD CONSTRAINT "graphs_tagComboSet_pkey" PRIMARY KEY (id);


--
-- Name: graphs_tagComboSet graphs_tagcomboset_graph_id_tagcombinationset_id_d192ec64_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."graphs_tagComboSet"
    ADD CONSTRAINT graphs_tagcomboset_graph_id_tagcombinationset_id_d192ec64_uniq UNIQUE (graph_id, tagcombinationset_id);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: match_buffermatchupload match_buffermatchupload_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.match_buffermatchupload
    ADD CONSTRAINT match_buffermatchupload_pkey PRIMARY KEY (id);


--
-- Name: match_matchstatus match_matchstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.match_matchstatus
    ADD CONSTRAINT match_matchstatus_pkey PRIMARY KEY (status_ptr_id);


--
-- Name: matches matches_competition_id_match_wee_6499fd07_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_competition_id_match_wee_6499fd07_uniq UNIQUE (competition_id, match_week, home_team_id, away_team_id);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: monitoringTeamToUser monitoringTeamToUser_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeamToUser"
    ADD CONSTRAINT "monitoringTeamToUser_pkey" PRIMARY KEY (id);


--
-- Name: monitoringTeam monitoringTeam_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeam"
    ADD CONSTRAINT "monitoringTeam_pkey" PRIMARY KEY (id);


--
-- Name: monitoringTeam monitoringteam_contract_id_team_id_e86e0642_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeam"
    ADD CONSTRAINT monitoringteam_contract_id_team_id_e86e0642_uniq UNIQUE (contract_id, team_id);


--
-- Name: nations nations_alpha2Code_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT "nations_alpha2Code_key" UNIQUE ("alpha2Code");


--
-- Name: nations nations_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: period period_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT period_name_key UNIQUE (name);


--
-- Name: period period_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT period_pkey PRIMARY KEY (id);


--
-- Name: physiques physiques_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.physiques
    ADD CONSTRAINT physiques_pkey PRIMARY KEY (id);


--
-- Name: physiques physiques_type_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.physiques
    ADD CONSTRAINT physiques_type_key UNIQUE (type);


--
-- Name: playerRoles playerRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."playerRoles"
    ADD CONSTRAINT "playerRoles_pkey" PRIMARY KEY (id);


--
-- Name: player_report_contracts player_report_contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_contracts
    ADD CONSTRAINT player_report_contracts_pkey PRIMARY KEY (id);


--
-- Name: player_report_contracts player_report_contracts_playerreport_id_contract_facb74e1_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_contracts
    ADD CONSTRAINT player_report_contracts_playerreport_id_contract_facb74e1_uniq UNIQUE (playerreport_id, contract_id);


--
-- Name: player_report_matches player_report_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_matches
    ADD CONSTRAINT player_report_matches_pkey PRIMARY KEY (id);


--
-- Name: player_report_matches player_report_matches_playerreport_id_match_id_a35401ef_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_matches
    ADD CONSTRAINT player_report_matches_playerreport_id_match_id_a35401ef_uniq UNIQUE (playerreport_id, match_id);


--
-- Name: player_report player_report_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report
    ADD CONSTRAINT player_report_pkey PRIMARY KEY (id);


--
-- Name: playerRoles playerroles_full_name_short_name_921d8be8_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."playerRoles"
    ADD CONSTRAINT playerroles_full_name_short_name_921d8be8_uniq UNIQUE (full_name, short_name);


--
-- Name: players_nationalities players_nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players_nationalities
    ADD CONSTRAINT players_nationalities_pkey PRIMARY KEY (id);


--
-- Name: players_nationalities players_nationalities_player_id_nation_id_2d7380f6_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players_nationalities
    ADD CONSTRAINT players_nationalities_player_id_nation_id_2d7380f6_uniq UNIQUE (player_id, nation_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: positions positions_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_name_key UNIQUE (name);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: report_templates report_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates
    ADD CONSTRAINT report_templates_pkey PRIMARY KEY (id);


--
-- Name: report_templates_sections report_templates_section_reporttemplate_id_sectio_6624a91e_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates_sections
    ADD CONSTRAINT report_templates_section_reporttemplate_id_sectio_6624a91e_uniq UNIQUE (reporttemplate_id, section_id);


--
-- Name: report_templates_sections report_templates_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates_sections
    ADD CONSTRAINT report_templates_sections_pkey PRIMARY KEY (id);


--
-- Name: scoutingToUser scoutingToUser_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."scoutingToUser"
    ADD CONSTRAINT "scoutingToUser_pkey" PRIMARY KEY (id);


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutingbox_pkey PRIMARY KEY (id);


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_player_id_competition_id_5b6264b0_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutingbox_player_id_competition_id_5b6264b0_uniq UNIQUE (player_id, competition_id, match_week);


--
-- Name: sections_analysis sections_analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections_analysis
    ADD CONSTRAINT sections_analysis_pkey PRIMARY KEY (id);


--
-- Name: sections_analysis sections_analysis_section_id_analysis_id_6f7d2008_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections_analysis
    ADD CONSTRAINT sections_analysis_section_id_analysis_id_6f7d2008_uniq UNIQUE (section_id, analysis_id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: tagCombinationControTags tagCombinationControTags_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationControTags"
    ADD CONSTRAINT "tagCombinationControTags_pkey" PRIMARY KEY (id);


--
-- Name: tagCombinationToVersions tagCombinationToVersions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationToVersions"
    ADD CONSTRAINT "tagCombinationToVersions_pkey" PRIMARY KEY (id);


--
-- Name: tag_buffertagsupload tag_buffertagsupload_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_buffertagsupload
    ADD CONSTRAINT tag_buffertagsupload_pkey PRIMARY KEY (id);


--
-- Name: tag_tagstatus tag_tagstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_tagstatus
    ADD CONSTRAINT tag_tagstatus_pkey PRIMARY KEY (status_ptr_id);


--
-- Name: tag_taguploadoption tag_taguploadoption_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_taguploadoption
    ADD CONSTRAINT tag_taguploadoption_pkey PRIMARY KEY (id);


--
-- Name: tagCombinationControTags tagcombinationcontrotags_tag_combination_id_contr_2af8643d_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationControTags"
    ADD CONSTRAINT tagcombinationcontrotags_tag_combination_id_contr_2af8643d_uniq UNIQUE (tag_combination_id, contro_tag_id);


--
-- Name: TagCombinations_tags tagcombinations_tags_tagcombination_id_tag_id_907b7087_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations_tags"
    ADD CONSTRAINT tagcombinations_tags_tagcombination_id_tag_id_907b7087_uniq UNIQUE (tagcombination_id, tag_id);


--
-- Name: TagCombinationSet_tagCombinations tagcombinationset_tagcom_tagcombinationset_id_tag_1e22f5be_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet_tagCombinations"
    ADD CONSTRAINT tagcombinationset_tagcom_tagcombinationset_id_tag_1e22f5be_uniq UNIQUE (tagcombinationset_id, tagcombinationtoversion_id);


--
-- Name: tagCombinationToVersions tagcombinationtoversions_tagcombination_id_versio_f78974d9_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationToVersions"
    ADD CONSTRAINT tagcombinationtoversions_tagcombination_id_versio_f78974d9_uniq UNIQUE ("tagCombination_id", version_id);


--
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: teamToCoach teamToCoach_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCoach"
    ADD CONSTRAINT "teamToCoach_pkey" PRIMARY KEY (id);


--
-- Name: teamToCompetitions teamToCompetitions_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCompetitions"
    ADD CONSTRAINT "teamToCompetitions_pkey" PRIMARY KEY (id);


--
-- Name: teamTypes teamTypes_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamTypes"
    ADD CONSTRAINT "teamTypes_name_key" UNIQUE (name);


--
-- Name: teamTypes teamTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamTypes"
    ADD CONSTRAINT "teamTypes_pkey" PRIMARY KEY (id);


--
-- Name: team_report_contracts team_report_contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_contracts
    ADD CONSTRAINT team_report_contracts_pkey PRIMARY KEY (id);


--
-- Name: team_report_contracts team_report_contracts_teamreport_id_contract_id_0f795ace_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_contracts
    ADD CONSTRAINT team_report_contracts_teamreport_id_contract_id_0f795ace_uniq UNIQUE (teamreport_id, contract_id);


--
-- Name: team_report_matches team_report_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_matches
    ADD CONSTRAINT team_report_matches_pkey PRIMARY KEY (id);


--
-- Name: team_report_matches team_report_matches_teamreport_id_match_id_01a9f40c_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_matches
    ADD CONSTRAINT team_report_matches_teamreport_id_match_id_01a9f40c_uniq UNIQUE (teamreport_id, match_id);


--
-- Name: team_report team_report_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report
    ADD CONSTRAINT team_report_pkey PRIMARY KEY (id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: teams_teamtoplayer teams_teamtoplayer_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams_teamtoplayer
    ADD CONSTRAINT teams_teamtoplayer_pkey PRIMARY KEY (id);


--
-- Name: teamToCompetitions teamtocompetitions_team_id_competition_id_04c05724_uniq; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCompetitions"
    ADD CONSTRAINT teamtocompetitions_team_id_competition_id_04c05724_uniq UNIQUE (team_id, competition_id);


--
-- Name: tools_status tools_status_pkey; Type: CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tools_status
    ADD CONSTRAINT tools_status_pkey PRIMARY KEY (id);


--
-- Name: TagCombinationSet_created_by_id_a5c1d1ac; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinationSet_created_by_id_a5c1d1ac" ON public."TagCombinationSet" USING btree (created_by_id);


--
-- Name: TagCombinationSet_name_ada114a4_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinationSet_name_ada114a4_like" ON public."TagCombinationSet" USING btree (name varchar_pattern_ops);


--
-- Name: TagCombinationSet_tagCombi_tagcombinationtoversion_id_60190ac2; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinationSet_tagCombi_tagcombinationtoversion_id_60190ac2" ON public."TagCombinationSet_tagCombinations" USING btree (tagcombinationtoversion_id);


--
-- Name: TagCombinationSet_tagCombinations_tagcombinationset_id_3acf430e; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinationSet_tagCombinations_tagcombinationset_id_3acf430e" ON public."TagCombinationSet_tagCombinations" USING btree (tagcombinationset_id);


--
-- Name: TagCombinations_created_by_id_46b5793b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinations_created_by_id_46b5793b" ON public."TagCombinations" USING btree (created_by_id);


--
-- Name: TagCombinations_name_5d6781b0_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinations_name_5d6781b0_like" ON public."TagCombinations" USING btree (name varchar_pattern_ops);


--
-- Name: TagCombinations_tags_tag_id_8831b6c1; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinations_tags_tag_id_8831b6c1" ON public."TagCombinations_tags" USING btree (tag_id);


--
-- Name: TagCombinations_tags_tagcombination_id_bdadd939; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "TagCombinations_tags_tagcombination_id_bdadd939" ON public."TagCombinations_tags" USING btree (tagcombination_id);


--
-- Name: Versions_created_by_id_e93089c3; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "Versions_created_by_id_e93089c3" ON public."Versions" USING btree (created_by_id);


--
-- Name: Versions_name_a8b664bd_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "Versions_name_a8b664bd_like" ON public."Versions" USING btree (name varchar_pattern_ops);


--
-- Name: agencies_company_name_cdb0c45a_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agencies_company_name_cdb0c45a_like ON public.agencies USING btree (company_name varchar_pattern_ops);


--
-- Name: agencies_created_by_id_fa643a76; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agencies_created_by_id_fa643a76 ON public.agencies USING btree (created_by_id);


--
-- Name: agents_company_id_b4854bbb; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agents_company_id_b4854bbb ON public.agents USING btree (company_id);


--
-- Name: agents_created_by_id_28533169; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agents_created_by_id_28533169 ON public.agents USING btree (created_by_id);


--
-- Name: agents_nationalities_agent_id_205ca50e; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agents_nationalities_agent_id_205ca50e ON public.agents_nationalities USING btree (agent_id);


--
-- Name: agents_nationalities_nation_id_f5abd171; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agents_nationalities_nation_id_f5abd171 ON public.agents_nationalities USING btree (nation_id);


--
-- Name: agents_place_of_birth_id_6e550ddf; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX agents_place_of_birth_id_6e550ddf ON public.agents USING btree (place_of_birth_id);


--
-- Name: analysis_graphs_analysis_id_cce53c80; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX analysis_graphs_analysis_id_cce53c80 ON public.analysis_graphs USING btree (analysis_id);


--
-- Name: analysis_graphs_graph_id_c37135fd; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX analysis_graphs_graph_id_c37135fd ON public.analysis_graphs USING btree (graph_id);


--
-- Name: analysis_user_id_5382dacb; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX analysis_user_id_5382dacb ON public.analysis USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cities_created_by_id_7f1c2ff2; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX cities_created_by_id_7f1c2ff2 ON public.cities USING btree (created_by_id);


--
-- Name: cities_nation_id_c00b0e03; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX cities_nation_id_c00b0e03 ON public.cities USING btree (nation_id);


--
-- Name: coaches_agency_id_cc179b64; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX coaches_agency_id_cc179b64 ON public.coaches USING btree (agency_id);


--
-- Name: coaches_created_by_id_639b8272; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX coaches_created_by_id_639b8272 ON public.coaches USING btree (created_by_id);


--
-- Name: coaches_nationalities_coach_id_8b4842a8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX coaches_nationalities_coach_id_8b4842a8 ON public.coaches_nationalities USING btree (coach_id);


--
-- Name: coaches_nationalities_nation_id_64ddb1c9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX coaches_nationalities_nation_id_64ddb1c9 ON public.coaches_nationalities USING btree (nation_id);


--
-- Name: coaches_place_of_birth_id_bab31e19; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX coaches_place_of_birth_id_bab31e19 ON public.coaches USING btree (place_of_birth_id);


--
-- Name: competitionTypes_created_by_id_2f894625; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "competitionTypes_created_by_id_2f894625" ON public."competitionTypes" USING btree (created_by_id);


--
-- Name: competitionTypes_type_ce242980_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "competitionTypes_type_ce242980_like" ON public."competitionTypes" USING btree (type varchar_pattern_ops);


--
-- Name: competitions_competitionType_id_d6e65b4d; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "competitions_competitionType_id_d6e65b4d" ON public.competitions USING btree ("competitionType_id");


--
-- Name: competitions_federation_id_7fedae23; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX competitions_federation_id_7fedae23 ON public.competitions USING btree (federation_id);


--
-- Name: constitutions_created_by_id_4c106937; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX constitutions_created_by_id_4c106937 ON public.constitutions USING btree (created_by_id);


--
-- Name: constitutions_type_00894d5b_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX constitutions_type_00894d5b_like ON public.constitutions USING btree (type varchar_pattern_ops);


--
-- Name: continents_created_by_id_7e466e1b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX continents_created_by_id_7e466e1b ON public.continents USING btree (created_by_id);


--
-- Name: continents_name_1942a99b_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX continents_name_1942a99b_like ON public.continents USING btree (name varchar_pattern_ops);


--
-- Name: contracts_created_by_id_0589e5ed; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX contracts_created_by_id_0589e5ed ON public.contracts USING btree (created_by_id);


--
-- Name: contracts_customer_id_aa17bff1; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX contracts_customer_id_aa17bff1 ON public.contracts USING btree (customer_id);


--
-- Name: customerToUser_created_by_id_1aa59b29; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "customerToUser_created_by_id_1aa59b29" ON public."customerToUser" USING btree (created_by_id);


--
-- Name: customerToUser_customer_id_85dcb3e0; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "customerToUser_customer_id_85dcb3e0" ON public."customerToUser" USING btree (customer_id);


--
-- Name: customerToUser_user_id_148d4a87; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "customerToUser_user_id_148d4a87" ON public."customerToUser" USING btree (user_id);


--
-- Name: customers_created_by_id_3d0160f2; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX customers_created_by_id_3d0160f2 ON public.customers USING btree (created_by_id);


--
-- Name: customers_name_dd11b9a1_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX customers_name_dd11b9a1_like ON public.customers USING btree (name varchar_pattern_ops);


--
-- Name: customers_user_reference_id_6d399342; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX customers_user_reference_id_6d399342 ON public.customers USING btree (user_reference_id);


--
-- Name: data_data_inheritance_id_2fdcf160; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX data_data_inheritance_id_2fdcf160 ON public.data USING btree (data_inheritance_id);


--
-- Name: data_tag_combinations_data_id_887572a9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX data_tag_combinations_data_id_887572a9 ON public.data_tag_combinations USING btree (data_id);


--
-- Name: data_tag_combinations_tagcombination_id_7f3884c6; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX data_tag_combinations_tagcombination_id_7f3884c6 ON public.data_tag_combinations USING btree (tagcombination_id);


--
-- Name: data_user_id_f69e4f61; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX data_user_id_f69e4f61 ON public.data USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: events_created_by_id_673d80a8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX events_created_by_id_673d80a8 ON public.events USING btree (created_by_id);


--
-- Name: events_match_id_3325ede9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX events_match_id_3325ede9 ON public.events USING btree (match_id);


--
-- Name: events_period_id_10bce295; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX events_period_id_10bce295 ON public.events USING btree (period_id);


--
-- Name: events_player_id_741c6b95; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX events_player_id_741c6b95 ON public.events USING btree (player_id);


--
-- Name: events_tagCombinations_event_id_61118546; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "events_tagCombinations_event_id_61118546" ON public."events_tagCombinations" USING btree (event_id);


--
-- Name: events_tagCombinations_tagcombinationtoversion_id_e09592c6; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "events_tagCombinations_tagcombinationtoversion_id_e09592c6" ON public."events_tagCombinations" USING btree (tagcombinationtoversion_id);


--
-- Name: events_team_id_66d73197; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX events_team_id_66d73197 ON public.events USING btree (team_id);


--
-- Name: federations_content_type_id_87684cae; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX federations_content_type_id_87684cae ON public.federations USING btree (content_type_id);


--
-- Name: federations_created_by_id_0ec3bc19; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX federations_created_by_id_0ec3bc19 ON public.federations USING btree (created_by_id);


--
-- Name: federations_name_14e6acb0_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX federations_name_14e6acb0_like ON public.federations USING btree (name varchar_pattern_ops);


--
-- Name: footedness_created_by_id_339cf806; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX footedness_created_by_id_339cf806 ON public.footedness USING btree (created_by_id);


--
-- Name: footedness_type_5f3befa7_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX footedness_type_5f3befa7_like ON public.footedness USING btree (type varchar_pattern_ops);


--
-- Name: formationToRoles_created_by_id_1c5c118b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "formationToRoles_created_by_id_1c5c118b" ON public."formationToRoles" USING btree (created_by_id);


--
-- Name: formationToRoles_formation_id_970088d3; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "formationToRoles_formation_id_970088d3" ON public."formationToRoles" USING btree (formation_id);


--
-- Name: formationToRoles_role_id_a4b059c0; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "formationToRoles_role_id_a4b059c0" ON public."formationToRoles" USING btree (role_id);


--
-- Name: formations_created_by_id_eca10d81; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX formations_created_by_id_eca10d81 ON public.formations USING btree (created_by_id);


--
-- Name: formations_system_of_play_b09fbcbf_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX formations_system_of_play_b09fbcbf_like ON public.formations USING btree (system_of_play varchar_pattern_ops);


--
-- Name: graphs_input_data_data_id_fbb32fca; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX graphs_input_data_data_id_fbb32fca ON public.graphs_input_data USING btree (data_id);


--
-- Name: graphs_input_data_graph_id_0a5ebc58; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX graphs_input_data_graph_id_0a5ebc58 ON public.graphs_input_data USING btree (graph_id);


--
-- Name: graphs_tagComboSet_graph_id_d267d44d; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "graphs_tagComboSet_graph_id_d267d44d" ON public."graphs_tagComboSet" USING btree (graph_id);


--
-- Name: graphs_tagComboSet_tagcombinationset_id_c287a916; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "graphs_tagComboSet_tagcombinationset_id_c287a916" ON public."graphs_tagComboSet" USING btree (tagcombinationset_id);


--
-- Name: graphs_user_id_77939a41; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX graphs_user_id_77939a41 ON public.graphs USING btree (user_id);


--
-- Name: match_buffermatchupload_created_by_id_da0a8154; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX match_buffermatchupload_created_by_id_da0a8154 ON public.match_buffermatchupload USING btree (created_by_id);


--
-- Name: match_buffermatchupload_status_id_4a26ec44; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX match_buffermatchupload_status_id_4a26ec44 ON public.match_buffermatchupload USING btree (status_id);


--
-- Name: matches_away_team_id_e9ac1ee8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX matches_away_team_id_e9ac1ee8 ON public.matches USING btree (away_team_id);


--
-- Name: matches_competition_id_bcb09a15; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX matches_competition_id_bcb09a15 ON public.matches USING btree (competition_id);


--
-- Name: matches_created_by_id_c3b0b6b8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX matches_created_by_id_c3b0b6b8 ON public.matches USING btree (created_by_id);


--
-- Name: matches_home_team_id_d79411d2; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX matches_home_team_id_d79411d2 ON public.matches USING btree (home_team_id);


--
-- Name: monitoringTeamToUser_created_by_id_141ae082; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "monitoringTeamToUser_created_by_id_141ae082" ON public."monitoringTeamToUser" USING btree (created_by_id);


--
-- Name: monitoringTeamToUser_monitoringTeam_id_ec3e5b0f; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "monitoringTeamToUser_monitoringTeam_id_ec3e5b0f" ON public."monitoringTeamToUser" USING btree ("monitoringTeam_id");


--
-- Name: monitoringTeamToUser_user_id_55c9e48a; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "monitoringTeamToUser_user_id_55c9e48a" ON public."monitoringTeamToUser" USING btree (user_id);


--
-- Name: monitoringTeam_contract_id_9bb471b2; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "monitoringTeam_contract_id_9bb471b2" ON public."monitoringTeam" USING btree (contract_id);


--
-- Name: monitoringTeam_created_by_id_2852e10a; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "monitoringTeam_created_by_id_2852e10a" ON public."monitoringTeam" USING btree (created_by_id);


--
-- Name: monitoringTeam_team_id_4acc554f; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "monitoringTeam_team_id_4acc554f" ON public."monitoringTeam" USING btree (team_id);


--
-- Name: nations_alpha2Code_24a53c5a_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "nations_alpha2Code_24a53c5a_like" ON public.nations USING btree ("alpha2Code" varchar_pattern_ops);


--
-- Name: nations_continent_id_cf7d6003; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX nations_continent_id_cf7d6003 ON public.nations USING btree (continent_id);


--
-- Name: nations_created_by_id_c5c53d0e; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX nations_created_by_id_c5c53d0e ON public.nations USING btree (created_by_id);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: period_created_by_id_ea5021a2; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX period_created_by_id_ea5021a2 ON public.period USING btree (created_by_id);


--
-- Name: period_name_26f16338_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX period_name_26f16338_like ON public.period USING btree (name varchar_pattern_ops);


--
-- Name: physiques_created_by_id_75d5ec90; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX physiques_created_by_id_75d5ec90 ON public.physiques USING btree (created_by_id);


--
-- Name: physiques_type_442aef06_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX physiques_type_442aef06_like ON public.physiques USING btree (type varchar_pattern_ops);


--
-- Name: playerRoles_created_by_id_e8e7cdd9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "playerRoles_created_by_id_e8e7cdd9" ON public."playerRoles" USING btree (created_by_id);


--
-- Name: playerRoles_position_id_c9993193; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "playerRoles_position_id_c9993193" ON public."playerRoles" USING btree (position_id);


--
-- Name: player_report_contracts_contract_id_f2d6f7d5; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_contracts_contract_id_f2d6f7d5 ON public.player_report_contracts USING btree (contract_id);


--
-- Name: player_report_contracts_playerreport_id_ae92e93e; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_contracts_playerreport_id_ae92e93e ON public.player_report_contracts USING btree (playerreport_id);


--
-- Name: player_report_created_by_id_78b656ca; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_created_by_id_78b656ca ON public.player_report USING btree (created_by_id);


--
-- Name: player_report_matches_match_id_3cc6a94c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_matches_match_id_3cc6a94c ON public.player_report_matches USING btree (match_id);


--
-- Name: player_report_matches_playerreport_id_dae382f4; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_matches_playerreport_id_dae382f4 ON public.player_report_matches USING btree (playerreport_id);


--
-- Name: player_report_player_id_32bb6b13; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_player_id_32bb6b13 ON public.player_report USING btree (player_id);


--
-- Name: player_report_report_template_id_cce431ad; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX player_report_report_template_id_cce431ad ON public.player_report USING btree (report_template_id);


--
-- Name: players_agency_id_8e8544cc; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_agency_id_8e8544cc ON public.players USING btree (agency_id);


--
-- Name: players_constitution_id_3f31573e; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_constitution_id_3f31573e ON public.players USING btree (constitution_id);


--
-- Name: players_created_by_id_1e12a7ba; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_created_by_id_1e12a7ba ON public.players USING btree (created_by_id);


--
-- Name: players_footedness_id_94f9331c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_footedness_id_94f9331c ON public.players USING btree (footedness_id);


--
-- Name: players_nationalities_nation_id_888d8dc8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_nationalities_nation_id_888d8dc8 ON public.players_nationalities USING btree (nation_id);


--
-- Name: players_nationalities_player_id_69f2b31c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_nationalities_player_id_69f2b31c ON public.players_nationalities USING btree (player_id);


--
-- Name: players_physique_id_01f783d4; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_physique_id_01f783d4 ON public.players USING btree (physique_id);


--
-- Name: players_place_of_birth_id_4dbe1cc1; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_place_of_birth_id_4dbe1cc1 ON public.players USING btree (place_of_birth_id);


--
-- Name: players_position_id_7767c977; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX players_position_id_7767c977 ON public.players USING btree (position_id);


--
-- Name: positions_created_by_id_ca44b6de; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX positions_created_by_id_ca44b6de ON public.positions USING btree (created_by_id);


--
-- Name: positions_name_48eb8120_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX positions_name_48eb8120_like ON public.positions USING btree (name varchar_pattern_ops);


--
-- Name: report_templates_sections_reporttemplate_id_7f92b8dc; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX report_templates_sections_reporttemplate_id_7f92b8dc ON public.report_templates_sections USING btree (reporttemplate_id);


--
-- Name: report_templates_sections_section_id_e52172ce; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX report_templates_sections_section_id_e52172ce ON public.report_templates_sections USING btree (section_id);


--
-- Name: report_templates_user_id_c7f757d3; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX report_templates_user_id_c7f757d3 ON public.report_templates USING btree (user_id);


--
-- Name: scoutingToUser_created_by_id_9025b256; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "scoutingToUser_created_by_id_9025b256" ON public."scoutingToUser" USING btree (created_by_id);


--
-- Name: scoutingToUser_scouting_id_d1980b48; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "scoutingToUser_scouting_id_d1980b48" ON public."scoutingToUser" USING btree (scouting_id);


--
-- Name: scoutingToUser_user_id_314248f7; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "scoutingToUser_user_id_314248f7" ON public."scoutingToUser" USING btree (user_id);


--
-- Name: scouting_box_scoutingbox_competition_id_004de421; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX scouting_box_scoutingbox_competition_id_004de421 ON public.scouting_box_scoutingbox USING btree (competition_id);


--
-- Name: scouting_box_scoutingbox_created_by_id_e9258050; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX scouting_box_scoutingbox_created_by_id_e9258050 ON public.scouting_box_scoutingbox USING btree (created_by_id);


--
-- Name: scouting_box_scoutingbox_formation_id_4325e249; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX scouting_box_scoutingbox_formation_id_4325e249 ON public.scouting_box_scoutingbox USING btree (formation_id);


--
-- Name: scouting_box_scoutingbox_player_id_1265f09d; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX scouting_box_scoutingbox_player_id_1265f09d ON public.scouting_box_scoutingbox USING btree (player_id);


--
-- Name: scouting_box_scoutingbox_role_id_b38a2e47; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX scouting_box_scoutingbox_role_id_b38a2e47 ON public.scouting_box_scoutingbox USING btree (role_id);


--
-- Name: scouting_box_scoutingbox_team_id_7d2a5f33; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX scouting_box_scoutingbox_team_id_7d2a5f33 ON public.scouting_box_scoutingbox USING btree (team_id);


--
-- Name: sections_analysis_analysis_id_2cf3787f; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX sections_analysis_analysis_id_2cf3787f ON public.sections_analysis USING btree (analysis_id);


--
-- Name: sections_analysis_section_id_01214ea9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX sections_analysis_section_id_01214ea9 ON public.sections_analysis USING btree (section_id);


--
-- Name: sections_user_id_eef10f21; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX sections_user_id_eef10f21 ON public.sections USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: tagCombinationControTags_contro_tag_id_5b11f204; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "tagCombinationControTags_contro_tag_id_5b11f204" ON public."tagCombinationControTags" USING btree (contro_tag_id);


--
-- Name: tagCombinationControTags_created_by_id_a7cb543c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "tagCombinationControTags_created_by_id_a7cb543c" ON public."tagCombinationControTags" USING btree (created_by_id);


--
-- Name: tagCombinationControTags_tag_combination_id_17ca03b7; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "tagCombinationControTags_tag_combination_id_17ca03b7" ON public."tagCombinationControTags" USING btree (tag_combination_id);


--
-- Name: tagCombinationToVersions_created_by_id_7649ce2c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "tagCombinationToVersions_created_by_id_7649ce2c" ON public."tagCombinationToVersions" USING btree (created_by_id);


--
-- Name: tagCombinationToVersions_tagCombination_id_49922974; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "tagCombinationToVersions_tagCombination_id_49922974" ON public."tagCombinationToVersions" USING btree ("tagCombination_id");


--
-- Name: tagCombinationToVersions_version_id_fd0bcdfd; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "tagCombinationToVersions_version_id_fd0bcdfd" ON public."tagCombinationToVersions" USING btree (version_id);


--
-- Name: tag_buffertagsupload_created_by_id_27211b39; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX tag_buffertagsupload_created_by_id_27211b39 ON public.tag_buffertagsupload USING btree (created_by_id);


--
-- Name: tag_buffertagsupload_status_id_ba91bd7b; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX tag_buffertagsupload_status_id_ba91bd7b ON public.tag_buffertagsupload USING btree (status_id);


--
-- Name: tag_taguploadoption_created_by_id_a3d4523f; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX tag_taguploadoption_created_by_id_a3d4523f ON public.tag_taguploadoption USING btree (created_by_id);


--
-- Name: tags_created_by_id_bc2c5343; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX tags_created_by_id_bc2c5343 ON public.tags USING btree (created_by_id);


--
-- Name: tags_name_d06e0d9e_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX tags_name_d06e0d9e_like ON public.tags USING btree (name varchar_pattern_ops);


--
-- Name: teamToCoach_coach_id_d0d86afa; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamToCoach_coach_id_d0d86afa" ON public."teamToCoach" USING btree (coach_id);


--
-- Name: teamToCoach_created_by_id_5588c8b9; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamToCoach_created_by_id_5588c8b9" ON public."teamToCoach" USING btree (created_by_id);


--
-- Name: teamToCoach_team_id_33e5443c; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamToCoach_team_id_33e5443c" ON public."teamToCoach" USING btree (team_id);


--
-- Name: teamToCompetitions_competition_id_4d60d974; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamToCompetitions_competition_id_4d60d974" ON public."teamToCompetitions" USING btree (competition_id);


--
-- Name: teamToCompetitions_created_by_id_95dd80b0; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamToCompetitions_created_by_id_95dd80b0" ON public."teamToCompetitions" USING btree (created_by_id);


--
-- Name: teamToCompetitions_team_id_5f5831cb; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamToCompetitions_team_id_5f5831cb" ON public."teamToCompetitions" USING btree (team_id);


--
-- Name: teamTypes_created_by_id_bc5fe2ec; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamTypes_created_by_id_bc5fe2ec" ON public."teamTypes" USING btree (created_by_id);


--
-- Name: teamTypes_name_06d02459_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teamTypes_name_06d02459_like" ON public."teamTypes" USING btree (name varchar_pattern_ops);


--
-- Name: team_report_contracts_contract_id_5dfd5291; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_contracts_contract_id_5dfd5291 ON public.team_report_contracts USING btree (contract_id);


--
-- Name: team_report_contracts_teamreport_id_bb48af40; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_contracts_teamreport_id_bb48af40 ON public.team_report_contracts USING btree (teamreport_id);


--
-- Name: team_report_created_by_id_d42bc94a; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_created_by_id_d42bc94a ON public.team_report USING btree (created_by_id);


--
-- Name: team_report_matches_match_id_b0e78d69; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_matches_match_id_b0e78d69 ON public.team_report_matches USING btree (match_id);


--
-- Name: team_report_matches_teamreport_id_cedbc6ab; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_matches_teamreport_id_cedbc6ab ON public.team_report_matches USING btree (teamreport_id);


--
-- Name: team_report_report_template_id_25d070a8; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_report_template_id_25d070a8 ON public.team_report USING btree (report_template_id);


--
-- Name: team_report_team_id_6e4ad104; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX team_report_team_id_6e4ad104 ON public.team_report USING btree (team_id);


--
-- Name: teams_city_id_02f2b201; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_city_id_02f2b201 ON public.teams USING btree (city_id);


--
-- Name: teams_created_by_id_8ddefb7a; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_created_by_id_8ddefb7a ON public.teams USING btree (created_by_id);


--
-- Name: teams_name_bd7d028e_like; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_name_bd7d028e_like ON public.teams USING btree (name varchar_pattern_ops);


--
-- Name: teams_nation_id_fdf7c634; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_nation_id_fdf7c634 ON public.teams USING btree (nation_id);


--
-- Name: teams_referenceTeam_id_2c0ddf47; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX "teams_referenceTeam_id_2c0ddf47" ON public.teams USING btree ("referenceTeam_id");


--
-- Name: teams_teamtoplayer_created_by_id_35a85ae5; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_teamtoplayer_created_by_id_35a85ae5 ON public.teams_teamtoplayer USING btree (created_by_id);


--
-- Name: teams_teamtoplayer_player_id_89764b02; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_teamtoplayer_player_id_89764b02 ON public.teams_teamtoplayer USING btree (player_id);


--
-- Name: teams_teamtoplayer_team_id_285460d0; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_teamtoplayer_team_id_285460d0 ON public.teams_teamtoplayer USING btree (team_id);


--
-- Name: teams_type_id_d3cd5f0d; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX teams_type_id_d3cd5f0d ON public.teams USING btree (type_id);


--
-- Name: tools_status_created_by_id_7d2ce674; Type: INDEX; Schema: public; Owner: danieletwopointzero
--

CREATE INDEX tools_status_created_by_id_7d2ce674 ON public.tools_status USING btree (created_by_id);


--
-- Name: ContractMonitoring ContractMonitoring_contract_ptr_id_e46f6b60_fk_contracts_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."ContractMonitoring"
    ADD CONSTRAINT "ContractMonitoring_contract_ptr_id_e46f6b60_fk_contracts_id" FOREIGN KEY (contract_ptr_id) REFERENCES public.contracts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TagCombinationSet TagCombinationSet_created_by_id_a5c1d1ac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet"
    ADD CONSTRAINT "TagCombinationSet_created_by_id_a5c1d1ac_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TagCombinationSet_tagCombinations TagCombinationSet_ta_tagcombinationset_id_3acf430e_fk_TagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet_tagCombinations"
    ADD CONSTRAINT "TagCombinationSet_ta_tagcombinationset_id_3acf430e_fk_TagCombin" FOREIGN KEY (tagcombinationset_id) REFERENCES public."TagCombinationSet"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TagCombinationSet_tagCombinations TagCombinationSet_ta_tagcombinationtovers_60190ac2_fk_tagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinationSet_tagCombinations"
    ADD CONSTRAINT "TagCombinationSet_ta_tagcombinationtovers_60190ac2_fk_tagCombin" FOREIGN KEY (tagcombinationtoversion_id) REFERENCES public."tagCombinationToVersions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TagCombinations TagCombinations_created_by_id_46b5793b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations"
    ADD CONSTRAINT "TagCombinations_created_by_id_46b5793b_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TagCombinations_tags TagCombinations_tags_tag_id_8831b6c1_fk_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations_tags"
    ADD CONSTRAINT "TagCombinations_tags_tag_id_8831b6c1_fk_tags_id" FOREIGN KEY (tag_id) REFERENCES public.tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TagCombinations_tags TagCombinations_tags_tagcombination_id_bdadd939_fk_TagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."TagCombinations_tags"
    ADD CONSTRAINT "TagCombinations_tags_tagcombination_id_bdadd939_fk_TagCombin" FOREIGN KEY (tagcombination_id) REFERENCES public."TagCombinations"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Versions Versions_created_by_id_e93089c3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."Versions"
    ADD CONSTRAINT "Versions_created_by_id_e93089c3_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agencies agencies_created_by_id_fa643a76_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agencies
    ADD CONSTRAINT agencies_created_by_id_fa643a76_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agents agents_company_id_b4854bbb_fk_agencies_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_company_id_b4854bbb_fk_agencies_id FOREIGN KEY (company_id) REFERENCES public.agencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agents agents_created_by_id_28533169_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_created_by_id_28533169_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agents_nationalities agents_nationalities_agent_id_205ca50e_fk_agents_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents_nationalities
    ADD CONSTRAINT agents_nationalities_agent_id_205ca50e_fk_agents_id FOREIGN KEY (agent_id) REFERENCES public.agents(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agents_nationalities agents_nationalities_nation_id_f5abd171_fk_nations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents_nationalities
    ADD CONSTRAINT agents_nationalities_nation_id_f5abd171_fk_nations_id FOREIGN KEY (nation_id) REFERENCES public.nations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agents agents_place_of_birth_id_6e550ddf_fk_cities_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_place_of_birth_id_6e550ddf_fk_cities_id FOREIGN KEY (place_of_birth_id) REFERENCES public.cities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analysis_graphs analysis_graphs_analysis_id_cce53c80_fk_analysis_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis_graphs
    ADD CONSTRAINT analysis_graphs_analysis_id_cce53c80_fk_analysis_id FOREIGN KEY (analysis_id) REFERENCES public.analysis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analysis_graphs analysis_graphs_graph_id_c37135fd_fk_graphs_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis_graphs
    ADD CONSTRAINT analysis_graphs_graph_id_c37135fd_fk_graphs_id FOREIGN KEY (graph_id) REFERENCES public.graphs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analysis analysis_user_id_5382dacb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.analysis
    ADD CONSTRAINT analysis_user_id_5382dacb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cities cities_created_by_id_7f1c2ff2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_created_by_id_7f1c2ff2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cities cities_nation_id_c00b0e03_fk_nations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_nation_id_c00b0e03_fk_nations_id FOREIGN KEY (nation_id) REFERENCES public.nations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coaches coaches_agency_id_cc179b64_fk_agencies_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_agency_id_cc179b64_fk_agencies_id FOREIGN KEY (agency_id) REFERENCES public.agencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coaches coaches_created_by_id_639b8272_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_created_by_id_639b8272_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coaches_nationalities coaches_nationalities_coach_id_8b4842a8_fk_coaches_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches_nationalities
    ADD CONSTRAINT coaches_nationalities_coach_id_8b4842a8_fk_coaches_id FOREIGN KEY (coach_id) REFERENCES public.coaches(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coaches_nationalities coaches_nationalities_nation_id_64ddb1c9_fk_nations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches_nationalities
    ADD CONSTRAINT coaches_nationalities_nation_id_64ddb1c9_fk_nations_id FOREIGN KEY (nation_id) REFERENCES public.nations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: coaches coaches_place_of_birth_id_bab31e19_fk_cities_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.coaches
    ADD CONSTRAINT coaches_place_of_birth_id_bab31e19_fk_cities_id FOREIGN KEY (place_of_birth_id) REFERENCES public.cities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competitionTypes competitionTypes_created_by_id_2f894625_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."competitionTypes"
    ADD CONSTRAINT "competitionTypes_created_by_id_2f894625_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competitions competitions_competitionType_id_d6e65b4d_fk_competitionTypes_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT "competitions_competitionType_id_d6e65b4d_fk_competitionTypes_id" FOREIGN KEY ("competitionType_id") REFERENCES public."competitionTypes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competitions competitions_federation_id_7fedae23_fk_federations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_federation_id_7fedae23_fk_federations_id FOREIGN KEY (federation_id) REFERENCES public.federations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: constitutions constitutions_created_by_id_4c106937_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.constitutions
    ADD CONSTRAINT constitutions_created_by_id_4c106937_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: continents continents_created_by_id_7e466e1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.continents
    ADD CONSTRAINT continents_created_by_id_7e466e1b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contractScouting contractScouting_contract_ptr_id_523cb8be_fk_contracts_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."contractScouting"
    ADD CONSTRAINT "contractScouting_contract_ptr_id_523cb8be_fk_contracts_id" FOREIGN KEY (contract_ptr_id) REFERENCES public.contracts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contracts contracts_created_by_id_0589e5ed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_created_by_id_0589e5ed_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contracts contracts_customer_id_aa17bff1_fk_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_customer_id_aa17bff1_fk_customers_id FOREIGN KEY (customer_id) REFERENCES public.customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customerToUser customerToUser_created_by_id_1aa59b29_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."customerToUser"
    ADD CONSTRAINT "customerToUser_created_by_id_1aa59b29_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customerToUser customerToUser_customer_id_85dcb3e0_fk_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."customerToUser"
    ADD CONSTRAINT "customerToUser_customer_id_85dcb3e0_fk_customers_id" FOREIGN KEY (customer_id) REFERENCES public.customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customerToUser customerToUser_user_id_148d4a87_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."customerToUser"
    ADD CONSTRAINT "customerToUser_user_id_148d4a87_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers customers_created_by_id_3d0160f2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_created_by_id_3d0160f2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers customers_user_reference_id_6d399342_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_reference_id_6d399342_fk_auth_user_id FOREIGN KEY (user_reference_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data data_data_inheritance_id_2fdcf160_fk_data_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_data_inheritance_id_2fdcf160_fk_data_id FOREIGN KEY (data_inheritance_id) REFERENCES public.data(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data_tag_combinations data_tag_combination_tagcombination_id_7f3884c6_fk_TagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data_tag_combinations
    ADD CONSTRAINT "data_tag_combination_tagcombination_id_7f3884c6_fk_TagCombin" FOREIGN KEY (tagcombination_id) REFERENCES public."TagCombinations"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data_tag_combinations data_tag_combinations_data_id_887572a9_fk_data_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data_tag_combinations
    ADD CONSTRAINT data_tag_combinations_data_id_887572a9_fk_data_id FOREIGN KEY (data_id) REFERENCES public.data(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data data_user_id_f69e4f61_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_user_id_f69e4f61_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events events_created_by_id_673d80a8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_created_by_id_673d80a8_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events events_match_id_3325ede9_fk_matches_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_match_id_3325ede9_fk_matches_id FOREIGN KEY (match_id) REFERENCES public.matches(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events events_period_id_10bce295_fk_period_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_period_id_10bce295_fk_period_id FOREIGN KEY (period_id) REFERENCES public.period(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events events_player_id_741c6b95_fk_players_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_player_id_741c6b95_fk_players_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_tagCombinations events_tagCombinatio_tagcombinationtovers_e09592c6_fk_tagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."events_tagCombinations"
    ADD CONSTRAINT "events_tagCombinatio_tagcombinationtovers_e09592c6_fk_tagCombin" FOREIGN KEY (tagcombinationtoversion_id) REFERENCES public."tagCombinationToVersions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events_tagCombinations events_tagCombinations_event_id_61118546_fk_events_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."events_tagCombinations"
    ADD CONSTRAINT "events_tagCombinations_event_id_61118546_fk_events_id" FOREIGN KEY (event_id) REFERENCES public.events(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: events events_team_id_66d73197_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_team_id_66d73197_fk_teams_id FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: federations federations_content_type_id_87684cae_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.federations
    ADD CONSTRAINT federations_content_type_id_87684cae_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: federations federations_created_by_id_0ec3bc19_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.federations
    ADD CONSTRAINT federations_created_by_id_0ec3bc19_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: footedness footedness_created_by_id_339cf806_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.footedness
    ADD CONSTRAINT footedness_created_by_id_339cf806_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: formationToRoles formationToRoles_created_by_id_1c5c118b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."formationToRoles"
    ADD CONSTRAINT "formationToRoles_created_by_id_1c5c118b_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: formationToRoles formationToRoles_formation_id_970088d3_fk_formations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."formationToRoles"
    ADD CONSTRAINT "formationToRoles_formation_id_970088d3_fk_formations_id" FOREIGN KEY (formation_id) REFERENCES public.formations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: formationToRoles formationToRoles_role_id_a4b059c0_fk_playerRoles_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."formationToRoles"
    ADD CONSTRAINT "formationToRoles_role_id_a4b059c0_fk_playerRoles_id" FOREIGN KEY (role_id) REFERENCES public."playerRoles"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: formations formations_created_by_id_eca10d81_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.formations
    ADD CONSTRAINT formations_created_by_id_eca10d81_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graphs_input_data graphs_input_data_data_id_fbb32fca_fk_data_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs_input_data
    ADD CONSTRAINT graphs_input_data_data_id_fbb32fca_fk_data_id FOREIGN KEY (data_id) REFERENCES public.data(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graphs_input_data graphs_input_data_graph_id_0a5ebc58_fk_graphs_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs_input_data
    ADD CONSTRAINT graphs_input_data_graph_id_0a5ebc58_fk_graphs_id FOREIGN KEY (graph_id) REFERENCES public.graphs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graphs_tagComboSet graphs_tagComboSet_graph_id_d267d44d_fk_graphs_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."graphs_tagComboSet"
    ADD CONSTRAINT "graphs_tagComboSet_graph_id_d267d44d_fk_graphs_id" FOREIGN KEY (graph_id) REFERENCES public.graphs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graphs_tagComboSet graphs_tagComboSet_tagcombinationset_id_c287a916_fk_TagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."graphs_tagComboSet"
    ADD CONSTRAINT "graphs_tagComboSet_tagcombinationset_id_c287a916_fk_TagCombin" FOREIGN KEY (tagcombinationset_id) REFERENCES public."TagCombinationSet"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: graphs graphs_user_id_77939a41_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.graphs
    ADD CONSTRAINT graphs_user_id_77939a41_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_buffermatchupload match_buffermatchupl_status_id_4a26ec44_fk_match_mat; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.match_buffermatchupload
    ADD CONSTRAINT match_buffermatchupl_status_id_4a26ec44_fk_match_mat FOREIGN KEY (status_id) REFERENCES public.match_matchstatus(status_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_buffermatchupload match_buffermatchupload_created_by_id_da0a8154_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.match_buffermatchupload
    ADD CONSTRAINT match_buffermatchupload_created_by_id_da0a8154_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_matchstatus match_matchstatus_status_ptr_id_5089860b_fk_tools_status_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.match_matchstatus
    ADD CONSTRAINT match_matchstatus_status_ptr_id_5089860b_fk_tools_status_id FOREIGN KEY (status_ptr_id) REFERENCES public.tools_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: matches matches_away_team_id_e9ac1ee8_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_away_team_id_e9ac1ee8_fk_teams_id FOREIGN KEY (away_team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: matches matches_competition_id_bcb09a15_fk_competitions_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_competition_id_bcb09a15_fk_competitions_id FOREIGN KEY (competition_id) REFERENCES public.competitions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: matches matches_created_by_id_c3b0b6b8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_created_by_id_c3b0b6b8_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: matches matches_home_team_id_d79411d2_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_home_team_id_d79411d2_fk_teams_id FOREIGN KEY (home_team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitoringTeamToUser monitoringTeamToUser_created_by_id_141ae082_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeamToUser"
    ADD CONSTRAINT "monitoringTeamToUser_created_by_id_141ae082_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitoringTeamToUser monitoringTeamToUser_monitoringTeam_id_ec3e5b0f_fk_monitorin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeamToUser"
    ADD CONSTRAINT "monitoringTeamToUser_monitoringTeam_id_ec3e5b0f_fk_monitorin" FOREIGN KEY ("monitoringTeam_id") REFERENCES public."monitoringTeam"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitoringTeamToUser monitoringTeamToUser_user_id_55c9e48a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeamToUser"
    ADD CONSTRAINT "monitoringTeamToUser_user_id_55c9e48a_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitoringTeam monitoringTeam_contract_id_9bb471b2_fk_ContractM; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeam"
    ADD CONSTRAINT "monitoringTeam_contract_id_9bb471b2_fk_ContractM" FOREIGN KEY (contract_id) REFERENCES public."ContractMonitoring"(contract_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitoringTeam monitoringTeam_created_by_id_2852e10a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeam"
    ADD CONSTRAINT "monitoringTeam_created_by_id_2852e10a_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitoringTeam monitoringTeam_team_id_4acc554f_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."monitoringTeam"
    ADD CONSTRAINT "monitoringTeam_team_id_4acc554f_fk_teams_id" FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nations nations_continent_id_cf7d6003_fk_continents_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_continent_id_cf7d6003_fk_continents_id FOREIGN KEY (continent_id) REFERENCES public.continents(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nations nations_created_by_id_c5c53d0e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.nations
    ADD CONSTRAINT nations_created_by_id_c5c53d0e_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: period period_created_by_id_ea5021a2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT period_created_by_id_ea5021a2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: physiques physiques_created_by_id_75d5ec90_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.physiques
    ADD CONSTRAINT physiques_created_by_id_75d5ec90_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: playerRoles playerRoles_created_by_id_e8e7cdd9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."playerRoles"
    ADD CONSTRAINT "playerRoles_created_by_id_e8e7cdd9_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: playerRoles playerRoles_position_id_c9993193_fk_positions_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."playerRoles"
    ADD CONSTRAINT "playerRoles_position_id_c9993193_fk_positions_id" FOREIGN KEY (position_id) REFERENCES public.positions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report_contracts player_report_contra_playerreport_id_ae92e93e_fk_player_re; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_contracts
    ADD CONSTRAINT player_report_contra_playerreport_id_ae92e93e_fk_player_re FOREIGN KEY (playerreport_id) REFERENCES public.player_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report_contracts player_report_contracts_contract_id_f2d6f7d5_fk_contracts_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_contracts
    ADD CONSTRAINT player_report_contracts_contract_id_f2d6f7d5_fk_contracts_id FOREIGN KEY (contract_id) REFERENCES public.contracts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report player_report_created_by_id_78b656ca_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report
    ADD CONSTRAINT player_report_created_by_id_78b656ca_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report_matches player_report_matche_playerreport_id_dae382f4_fk_player_re; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_matches
    ADD CONSTRAINT player_report_matche_playerreport_id_dae382f4_fk_player_re FOREIGN KEY (playerreport_id) REFERENCES public.player_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report_matches player_report_matches_match_id_3cc6a94c_fk_matches_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report_matches
    ADD CONSTRAINT player_report_matches_match_id_3cc6a94c_fk_matches_id FOREIGN KEY (match_id) REFERENCES public.matches(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report player_report_player_id_32bb6b13_fk_players_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report
    ADD CONSTRAINT player_report_player_id_32bb6b13_fk_players_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: player_report player_report_report_template_id_cce431ad_fk_report_te; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.player_report
    ADD CONSTRAINT player_report_report_template_id_cce431ad_fk_report_te FOREIGN KEY (report_template_id) REFERENCES public.report_templates(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_agency_id_8e8544cc_fk_agencies_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_agency_id_8e8544cc_fk_agencies_id FOREIGN KEY (agency_id) REFERENCES public.agencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_constitution_id_3f31573e_fk_constitutions_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_constitution_id_3f31573e_fk_constitutions_id FOREIGN KEY (constitution_id) REFERENCES public.constitutions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_created_by_id_1e12a7ba_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_created_by_id_1e12a7ba_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_footedness_id_94f9331c_fk_footedness_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_footedness_id_94f9331c_fk_footedness_id FOREIGN KEY (footedness_id) REFERENCES public.footedness(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_nationalities players_nationalities_nation_id_888d8dc8_fk_nations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players_nationalities
    ADD CONSTRAINT players_nationalities_nation_id_888d8dc8_fk_nations_id FOREIGN KEY (nation_id) REFERENCES public.nations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players_nationalities players_nationalities_player_id_69f2b31c_fk_players_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players_nationalities
    ADD CONSTRAINT players_nationalities_player_id_69f2b31c_fk_players_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_physique_id_01f783d4_fk_physiques_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_physique_id_01f783d4_fk_physiques_id FOREIGN KEY (physique_id) REFERENCES public.physiques(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_place_of_birth_id_4dbe1cc1_fk_cities_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_place_of_birth_id_4dbe1cc1_fk_cities_id FOREIGN KEY (place_of_birth_id) REFERENCES public.cities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: players players_position_id_7767c977_fk_positions_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_position_id_7767c977_fk_positions_id FOREIGN KEY (position_id) REFERENCES public.positions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: positions positions_created_by_id_ca44b6de_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_created_by_id_ca44b6de_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: report_templates_sections report_templates_sec_reporttemplate_id_7f92b8dc_fk_report_te; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates_sections
    ADD CONSTRAINT report_templates_sec_reporttemplate_id_7f92b8dc_fk_report_te FOREIGN KEY (reporttemplate_id) REFERENCES public.report_templates(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: report_templates_sections report_templates_sections_section_id_e52172ce_fk_sections_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates_sections
    ADD CONSTRAINT report_templates_sections_section_id_e52172ce_fk_sections_id FOREIGN KEY (section_id) REFERENCES public.sections(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: report_templates report_templates_user_id_c7f757d3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.report_templates
    ADD CONSTRAINT report_templates_user_id_c7f757d3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scoutingToUser scoutingToUser_created_by_id_9025b256_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."scoutingToUser"
    ADD CONSTRAINT "scoutingToUser_created_by_id_9025b256_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scoutingToUser scoutingToUser_scouting_id_d1980b48_fk_contractS; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."scoutingToUser"
    ADD CONSTRAINT "scoutingToUser_scouting_id_d1980b48_fk_contractS" FOREIGN KEY (scouting_id) REFERENCES public."contractScouting"(contract_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scoutingToUser scoutingToUser_user_id_314248f7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."scoutingToUser"
    ADD CONSTRAINT "scoutingToUser_user_id_314248f7_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scouting_box_scoutingbox scouting_box_scoutin_competition_id_004de421_fk_competiti; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutin_competition_id_004de421_fk_competiti FOREIGN KEY (competition_id) REFERENCES public.competitions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_created_by_id_e9258050_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutingbox_created_by_id_e9258050_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_formation_id_4325e249_fk_formations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutingbox_formation_id_4325e249_fk_formations_id FOREIGN KEY (formation_id) REFERENCES public.formations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_player_id_1265f09d_fk_players_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutingbox_player_id_1265f09d_fk_players_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_role_id_b38a2e47_fk_playerRoles_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT "scouting_box_scoutingbox_role_id_b38a2e47_fk_playerRoles_id" FOREIGN KEY (role_id) REFERENCES public."playerRoles"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scouting_box_scoutingbox scouting_box_scoutingbox_team_id_7d2a5f33_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.scouting_box_scoutingbox
    ADD CONSTRAINT scouting_box_scoutingbox_team_id_7d2a5f33_fk_teams_id FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_analysis sections_analysis_analysis_id_2cf3787f_fk_analysis_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections_analysis
    ADD CONSTRAINT sections_analysis_analysis_id_2cf3787f_fk_analysis_id FOREIGN KEY (analysis_id) REFERENCES public.analysis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections_analysis sections_analysis_section_id_01214ea9_fk_sections_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections_analysis
    ADD CONSTRAINT sections_analysis_section_id_01214ea9_fk_sections_id FOREIGN KEY (section_id) REFERENCES public.sections(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sections sections_user_id_eef10f21_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_user_id_eef10f21_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagCombinationControTags tagCombinationControTags_created_by_id_a7cb543c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationControTags"
    ADD CONSTRAINT "tagCombinationControTags_created_by_id_a7cb543c_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagCombinationControTags tagCombinationContro_contro_tag_id_5b11f204_fk_tagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationControTags"
    ADD CONSTRAINT "tagCombinationContro_contro_tag_id_5b11f204_fk_tagCombin" FOREIGN KEY (contro_tag_id) REFERENCES public."tagCombinationToVersions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagCombinationControTags tagCombinationContro_tag_combination_id_17ca03b7_fk_tagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationControTags"
    ADD CONSTRAINT "tagCombinationContro_tag_combination_id_17ca03b7_fk_tagCombin" FOREIGN KEY (tag_combination_id) REFERENCES public."tagCombinationToVersions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagCombinationToVersions tagCombinationToVers_tagCombination_id_49922974_fk_TagCombin; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationToVersions"
    ADD CONSTRAINT "tagCombinationToVers_tagCombination_id_49922974_fk_TagCombin" FOREIGN KEY ("tagCombination_id") REFERENCES public."TagCombinations"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagCombinationToVersions tagCombinationToVersions_created_by_id_7649ce2c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationToVersions"
    ADD CONSTRAINT "tagCombinationToVersions_created_by_id_7649ce2c_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagCombinationToVersions tagCombinationToVersions_version_id_fd0bcdfd_fk_Versions_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."tagCombinationToVersions"
    ADD CONSTRAINT "tagCombinationToVersions_version_id_fd0bcdfd_fk_Versions_id" FOREIGN KEY (version_id) REFERENCES public."Versions"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_buffertagsupload tag_buffertagsupload_created_by_id_27211b39_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_buffertagsupload
    ADD CONSTRAINT tag_buffertagsupload_created_by_id_27211b39_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_buffertagsupload tag_buffertagsupload_status_id_ba91bd7b_fk_tag_tagst; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_buffertagsupload
    ADD CONSTRAINT tag_buffertagsupload_status_id_ba91bd7b_fk_tag_tagst FOREIGN KEY (status_id) REFERENCES public.tag_tagstatus(status_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_tagstatus tag_tagstatus_status_ptr_id_09c8a511_fk_tools_status_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_tagstatus
    ADD CONSTRAINT tag_tagstatus_status_ptr_id_09c8a511_fk_tools_status_id FOREIGN KEY (status_ptr_id) REFERENCES public.tools_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_taguploadoption tag_taguploadoption_created_by_id_a3d4523f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tag_taguploadoption
    ADD CONSTRAINT tag_taguploadoption_created_by_id_a3d4523f_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags tags_created_by_id_bc2c5343_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_created_by_id_bc2c5343_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamToCoach teamToCoach_coach_id_d0d86afa_fk_coaches_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCoach"
    ADD CONSTRAINT "teamToCoach_coach_id_d0d86afa_fk_coaches_id" FOREIGN KEY (coach_id) REFERENCES public.coaches(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamToCoach teamToCoach_created_by_id_5588c8b9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCoach"
    ADD CONSTRAINT "teamToCoach_created_by_id_5588c8b9_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamToCoach teamToCoach_team_id_33e5443c_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCoach"
    ADD CONSTRAINT "teamToCoach_team_id_33e5443c_fk_teams_id" FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamToCompetitions teamToCompetitions_competition_id_4d60d974_fk_competitions_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCompetitions"
    ADD CONSTRAINT "teamToCompetitions_competition_id_4d60d974_fk_competitions_id" FOREIGN KEY (competition_id) REFERENCES public.competitions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamToCompetitions teamToCompetitions_created_by_id_95dd80b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCompetitions"
    ADD CONSTRAINT "teamToCompetitions_created_by_id_95dd80b0_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamToCompetitions teamToCompetitions_team_id_5f5831cb_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamToCompetitions"
    ADD CONSTRAINT "teamToCompetitions_team_id_5f5831cb_fk_teams_id" FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teamTypes teamTypes_created_by_id_bc5fe2ec_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public."teamTypes"
    ADD CONSTRAINT "teamTypes_created_by_id_bc5fe2ec_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report_contracts team_report_contracts_contract_id_5dfd5291_fk_contracts_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_contracts
    ADD CONSTRAINT team_report_contracts_contract_id_5dfd5291_fk_contracts_id FOREIGN KEY (contract_id) REFERENCES public.contracts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report_contracts team_report_contracts_teamreport_id_bb48af40_fk_team_report_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_contracts
    ADD CONSTRAINT team_report_contracts_teamreport_id_bb48af40_fk_team_report_id FOREIGN KEY (teamreport_id) REFERENCES public.team_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report team_report_created_by_id_d42bc94a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report
    ADD CONSTRAINT team_report_created_by_id_d42bc94a_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report_matches team_report_matches_match_id_b0e78d69_fk_matches_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_matches
    ADD CONSTRAINT team_report_matches_match_id_b0e78d69_fk_matches_id FOREIGN KEY (match_id) REFERENCES public.matches(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report_matches team_report_matches_teamreport_id_cedbc6ab_fk_team_report_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report_matches
    ADD CONSTRAINT team_report_matches_teamreport_id_cedbc6ab_fk_team_report_id FOREIGN KEY (teamreport_id) REFERENCES public.team_report(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report team_report_report_template_id_25d070a8_fk_report_templates_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report
    ADD CONSTRAINT team_report_report_template_id_25d070a8_fk_report_templates_id FOREIGN KEY (report_template_id) REFERENCES public.report_templates(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_report team_report_team_id_6e4ad104_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.team_report
    ADD CONSTRAINT team_report_team_id_6e4ad104_fk_teams_id FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams teams_city_id_02f2b201_fk_cities_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_city_id_02f2b201_fk_cities_id FOREIGN KEY (city_id) REFERENCES public.cities(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams teams_created_by_id_8ddefb7a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_created_by_id_8ddefb7a_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams teams_nation_id_fdf7c634_fk_nations_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_nation_id_fdf7c634_fk_nations_id FOREIGN KEY (nation_id) REFERENCES public.nations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams teams_referenceTeam_id_2c0ddf47_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "teams_referenceTeam_id_2c0ddf47_fk_teams_id" FOREIGN KEY ("referenceTeam_id") REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_teamtoplayer teams_teamtoplayer_created_by_id_35a85ae5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams_teamtoplayer
    ADD CONSTRAINT teams_teamtoplayer_created_by_id_35a85ae5_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_teamtoplayer teams_teamtoplayer_player_id_89764b02_fk_players_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams_teamtoplayer
    ADD CONSTRAINT teams_teamtoplayer_player_id_89764b02_fk_players_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_teamtoplayer teams_teamtoplayer_team_id_285460d0_fk_teams_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams_teamtoplayer
    ADD CONSTRAINT teams_teamtoplayer_team_id_285460d0_fk_teams_id FOREIGN KEY (team_id) REFERENCES public.teams(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams teams_type_id_d3cd5f0d_fk_teamTypes_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "teams_type_id_d3cd5f0d_fk_teamTypes_id" FOREIGN KEY (type_id) REFERENCES public."teamTypes"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tools_status tools_status_created_by_id_7d2ce674_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: danieletwopointzero
--

ALTER TABLE ONLY public.tools_status
    ADD CONSTRAINT tools_status_created_by_id_7d2ce674_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

