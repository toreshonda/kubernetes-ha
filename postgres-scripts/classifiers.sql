\c nseec;
--

CREATE SCHEMA classifiers;


ALTER SCHEMA classifiers OWNER TO postgres;

SET search_path = classifiers, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 18671)
-- Name: accreditationcertificatestatusclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE accreditationcertificatestatusclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048)
);


ALTER TABLE accreditationcertificatestatusclassifier OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18677)
-- Name: accreditationcertificatestatusclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE accreditationcertificatestatusclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accreditationcertificatestatusclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4677 (class 0 OID 0)
-- Dependencies: 198
-- Name: accreditationcertificatestatusclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE accreditationcertificatestatusclassifier_id_seq OWNED BY accreditationcertificatestatusclassifier.id;


--
-- TOC entry 199 (class 1259 OID 18679)
-- Name: additionalparamsforcustomsfeesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE additionalparamsforcustomsfeesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    ref character varying(20),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE additionalparamsforcustomsfeesclassifier OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18685)
-- Name: additionalparamsforcustomsfeesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE additionalparamsforcustomsfeesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE additionalparamsforcustomsfeesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4678 (class 0 OID 0)
-- Dependencies: 200
-- Name: additionalparamsforcustomsfeesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE additionalparamsforcustomsfeesclassifier_id_seq OWNED BY additionalparamsforcustomsfeesclassifier.id;


--
-- TOC entry 201 (class 1259 OID 18687)
-- Name: addresskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE addresskindclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE addresskindclassifier OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18693)
-- Name: addresskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE addresskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4679 (class 0 OID 0)
-- Dependencies: 202
-- Name: addresskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE addresskindclassifier_id_seq OWNED BY addresskindclassifier.id;


--
-- TOC entry 203 (class 1259 OID 18695)
-- Name: bankidentitykindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE bankidentitykindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE bankidentitykindclassifier OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18701)
-- Name: bankidentitykindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE bankidentitykindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bankidentitykindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4680 (class 0 OID 0)
-- Dependencies: 204
-- Name: bankidentitykindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE bankidentitykindclassifier_id_seq OWNED BY bankidentitykindclassifier.id;


--
-- TOC entry 205 (class 1259 OID 18703)
-- Name: biologicalsexclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE biologicalsexclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE biologicalsexclassifier OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18709)
-- Name: biologicalsexclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE biologicalsexclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biologicalsexclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4681 (class 0 OID 0)
-- Dependencies: 206
-- Name: biologicalsexclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE biologicalsexclassifier_id_seq OWNED BY biologicalsexclassifier.id;


--
-- TOC entry 207 (class 1259 OID 18711)
-- Name: brakingsystemtypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE brakingsystemtypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE brakingsystemtypeclassifier OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18717)
-- Name: brakingsystemtypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE brakingsystemtypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brakingsystemtypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4682 (class 0 OID 0)
-- Dependencies: 208
-- Name: brakingsystemtypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE brakingsystemtypeclassifier_id_seq OWNED BY brakingsystemtypeclassifier.id;


--
-- TOC entry 209 (class 1259 OID 18719)
-- Name: businessentitytypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE businessentitytypeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE businessentitytypeclassifier OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18725)
-- Name: businessentitytypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE businessentitytypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE businessentitytypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4683 (class 0 OID 0)
-- Dependencies: 210
-- Name: businessentitytypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE businessentitytypeclassifier_id_seq OWNED BY businessentitytypeclassifier.id;


--
-- TOC entry 211 (class 1259 OID 18727)
-- Name: businessentitytypecodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE businessentitytypecodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE businessentitytypecodeclassifier OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18733)
-- Name: businessentitytypecodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE businessentitytypecodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE businessentitytypecodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4684 (class 0 OID 0)
-- Dependencies: 212
-- Name: businessentitytypecodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE businessentitytypecodeclassifier_id_seq OWNED BY businessentitytypecodeclassifier.id;


--
-- TOC entry 213 (class 1259 OID 18735)
-- Name: cargolocationclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE cargolocationclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE cargolocationclassifier OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18741)
-- Name: cargolocationclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE cargolocationclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargolocationclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4685 (class 0 OID 0)
-- Dependencies: 214
-- Name: cargolocationclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE cargolocationclassifier_id_seq OWNED BY cargolocationclassifier.id;


--
-- TOC entry 215 (class 1259 OID 18743)
-- Name: cargopackagekindsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE cargopackagekindsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    int_name character varying(255),
    contriesspecificlimits character varying(255)
);


ALTER TABLE cargopackagekindsclassifier OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18749)
-- Name: cargopackagekindsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE cargopackagekindsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargopackagekindsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4686 (class 0 OID 0)
-- Dependencies: 216
-- Name: cargopackagekindsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE cargopackagekindsclassifier_id_seq OWNED BY cargopackagekindsclassifier.id;


--
-- TOC entry 217 (class 1259 OID 18751)
-- Name: certificatioorganizationkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE certificatioorganizationkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE certificatioorganizationkindclassifier OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18757)
-- Name: certificatioorganizationkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE certificatioorganizationkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE certificatioorganizationkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4687 (class 0 OID 0)
-- Dependencies: 218
-- Name: certificatioorganizationkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE certificatioorganizationkindclassifier_id_seq OWNED BY certificatioorganizationkindclassifier.id;


--
-- TOC entry 219 (class 1259 OID 18759)
-- Name: communicationchannelclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE communicationchannelclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE communicationchannelclassifier OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18765)
-- Name: communicationchannelclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE communicationchannelclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communicationchannelclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4688 (class 0 OID 0)
-- Dependencies: 220
-- Name: communicationchannelclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE communicationchannelclassifier_id_seq OWNED BY communicationchannelclassifier.id;


--
-- TOC entry 221 (class 1259 OID 18767)
-- Name: conformityassessmentdocstypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE conformityassessmentdocstypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE conformityassessmentdocstypesclassifier OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18773)
-- Name: conformityassessmentdocstypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE conformityassessmentdocstypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conformityassessmentdocstypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4689 (class 0 OID 0)
-- Dependencies: 222
-- Name: conformityassessmentdocstypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE conformityassessmentdocstypesclassifier_id_seq OWNED BY conformityassessmentdocstypesclassifier.id;


--
-- TOC entry 223 (class 1259 OID 18775)
-- Name: countriesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE countriesclassifier (
    id integer NOT NULL,
    code character varying(20),
    shortname character varying(255),
    name character varying(2048),
    sequence character varying(20),
    contriesspecificlimits character varying(255),
    appliedforcountry character varying(20),
    reference character varying(1024),
    technicalinfo character varying(255),
    addinfro character varying(255)
);


ALTER TABLE countriesclassifier OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18781)
-- Name: countriesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE countriesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countriesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4690 (class 0 OID 0)
-- Dependencies: 224
-- Name: countriesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE countriesclassifier_id_seq OWNED BY countriesclassifier.id;


--
-- TOC entry 225 (class 1259 OID 18783)
-- Name: currencyclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE currencyclassifier (
    id integer NOT NULL,
    digitalcode integer,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE currencyclassifier OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18789)
-- Name: currencyclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE currencyclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE currencyclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4691 (class 0 OID 0)
-- Dependencies: 226
-- Name: currencyclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE currencyclassifier_id_seq OWNED BY currencyclassifier.id;


--
-- TOC entry 227 (class 1259 OID 18791)
-- Name: customcheckpointcctvplacementclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customcheckpointcctvplacementclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE customcheckpointcctvplacementclassifier OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18797)
-- Name: customcheckpointcctvplacementclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customcheckpointcctvplacementclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customcheckpointcctvplacementclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4692 (class 0 OID 0)
-- Dependencies: 228
-- Name: customcheckpointcctvplacementclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customcheckpointcctvplacementclassifier_id_seq OWNED BY customcheckpointcctvplacementclassifier.id;


--
-- TOC entry 229 (class 1259 OID 18799)
-- Name: customcheckpointcommchannelclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customcheckpointcommchannelclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE customcheckpointcommchannelclassifier OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18805)
-- Name: customcheckpointcommchannelclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customcheckpointcommchannelclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customcheckpointcommchannelclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4693 (class 0 OID 0)
-- Dependencies: 230
-- Name: customcheckpointcommchannelclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customcheckpointcommchannelclassifier_id_seq OWNED BY customcheckpointcommchannelclassifier.id;


--
-- TOC entry 231 (class 1259 OID 18807)
-- Name: customprocesskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customprocesskindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customprocesskindclassifier OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18813)
-- Name: customprocesskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customprocesskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customprocesskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4694 (class 0 OID 0)
-- Dependencies: 232
-- Name: customprocesskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customprocesskindclassifier_id_seq OWNED BY customprocesskindclassifier.id;


--
-- TOC entry 233 (class 1259 OID 18815)
-- Name: customsconclusionsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsconclusionsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsconclusionsclassifier OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18821)
-- Name: customsconclusionsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsconclusionsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsconclusionsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4695 (class 0 OID 0)
-- Dependencies: 234
-- Name: customsconclusionsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsconclusionsclassifier_id_seq OWNED BY customsconclusionsclassifier.id;


--
-- TOC entry 235 (class 1259 OID 18823)
-- Name: customsfeesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    chapter_code character varying(20)
);


ALTER TABLE customsfeesclassifier OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18829)
-- Name: customsfeesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4696 (class 0 OID 0)
-- Dependencies: 236
-- Name: customsfeesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesclassifier_id_seq OWNED BY customsfeesclassifier.id;


--
-- TOC entry 237 (class 1259 OID 18831)
-- Name: customsfeesclassifierchapters; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesclassifierchapters (
    id integer NOT NULL,
    chapter_code character varying(20),
    chapter_name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesclassifierchapters OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18837)
-- Name: customsfeesclassifierchapters_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesclassifierchapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesclassifierchapters_id_seq OWNER TO postgres;

--
-- TOC entry 4697 (class 0 OID 0)
-- Dependencies: 238
-- Name: customsfeesclassifierchapters_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesclassifierchapters_id_seq OWNED BY customsfeesclassifierchapters.id;


--
-- TOC entry 239 (class 1259 OID 18839)
-- Name: customsfeesfeaturesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesfeaturesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesfeaturesclassifier OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18845)
-- Name: customsfeesfeaturesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesfeaturesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesfeaturesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4698 (class 0 OID 0)
-- Dependencies: 240
-- Name: customsfeesfeaturesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesfeaturesclassifier_id_seq OWNED BY customsfeesfeaturesclassifier.id;


--
-- TOC entry 241 (class 1259 OID 18847)
-- Name: customsfeesguaranteemethodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesguaranteemethodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesguaranteemethodsclassifier OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18853)
-- Name: customsfeesguaranteemethodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesguaranteemethodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesguaranteemethodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4699 (class 0 OID 0)
-- Dependencies: 242
-- Name: customsfeesguaranteemethodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesguaranteemethodsclassifier_id_seq OWNED BY customsfeesguaranteemethodsclassifier.id;


--
-- TOC entry 243 (class 1259 OID 18855)
-- Name: customsfeesmethodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesmethodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesmethodsclassifier OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18861)
-- Name: customsfeesmethodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesmethodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesmethodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4700 (class 0 OID 0)
-- Dependencies: 244
-- Name: customsfeesmethodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesmethodsclassifier_id_seq OWNED BY customsfeesmethodsclassifier.id;


--
-- TOC entry 245 (class 1259 OID 18863)
-- Name: customstransitmovementofgoodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customstransitmovementofgoodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE customstransitmovementofgoodsclassifier OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18869)
-- Name: customstransitmovementofgoodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customstransitmovementofgoodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customstransitmovementofgoodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4701 (class 0 OID 0)
-- Dependencies: 246
-- Name: customstransitmovementofgoodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customstransitmovementofgoodsclassifier_id_seq OWNED BY customstransitmovementofgoodsclassifier.id;


--
-- TOC entry 247 (class 1259 OID 18871)
-- Name: customsvalueconclusionclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsvalueconclusionclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsvalueconclusionclassifier OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18877)
-- Name: customsvalueconclusionclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsvalueconclusionclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsvalueconclusionclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4702 (class 0 OID 0)
-- Dependencies: 248
-- Name: customsvalueconclusionclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsvalueconclusionclassifier_id_seq OWNED BY customsvalueconclusionclassifier.id;


--
-- TOC entry 249 (class 1259 OID 18879)
-- Name: dataformatclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE dataformatclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE dataformatclassifier OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18885)
-- Name: dataformatclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE dataformatclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dataformatclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4703 (class 0 OID 0)
-- Dependencies: 250
-- Name: dataformatclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE dataformatclassifier_id_seq OWNED BY dataformatclassifier.id;


--
-- TOC entry 251 (class 1259 OID 18887)
-- Name: declarationofgoodsfeaturesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE declarationofgoodsfeaturesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE declarationofgoodsfeaturesclassifier OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18893)
-- Name: declarationofgoodsfeaturesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE declarationofgoodsfeaturesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE declarationofgoodsfeaturesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4704 (class 0 OID 0)
-- Dependencies: 252
-- Name: declarationofgoodsfeaturesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE declarationofgoodsfeaturesclassifier_id_seq OWNED BY declarationofgoodsfeaturesclassifier.id;


--
-- TOC entry 253 (class 1259 OID 18895)
-- Name: definingcustomsvaluemethodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE definingcustomsvaluemethodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE definingcustomsvaluemethodsclassifier OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18901)
-- Name: definingcustomsvaluemethodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE definingcustomsvaluemethodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE definingcustomsvaluemethodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4705 (class 0 OID 0)
-- Dependencies: 254
-- Name: definingcustomsvaluemethodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE definingcustomsvaluemethodsclassifier_id_seq OWNED BY definingcustomsvaluemethodsclassifier.id;


--
-- TOC entry 255 (class 1259 OID 18903)
-- Name: docstatstatusclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE docstatstatusclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE docstatstatusclassifier OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18909)
-- Name: docstatstatusclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE docstatstatusclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE docstatstatusclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4706 (class 0 OID 0)
-- Dependencies: 256
-- Name: docstatstatusclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE docstatstatusclassifier_id_seq OWNED BY docstatstatusclassifier.id;


--
-- TOC entry 257 (class 1259 OID 18911)
-- Name: documentprocessingresultcodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE documentprocessingresultcodeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE documentprocessingresultcodeclassifier OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 18917)
-- Name: documentprocessingresultcodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE documentprocessingresultcodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documentprocessingresultcodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4707 (class 0 OID 0)
-- Dependencies: 258
-- Name: documentprocessingresultcodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE documentprocessingresultcodeclassifier_id_seq OWNED BY documentprocessingresultcodeclassifier.id;


--
-- TOC entry 259 (class 1259 OID 18919)
-- Name: electronicvehicleandchassiscertificatestatusclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE electronicvehicleandchassiscertificatestatusclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE electronicvehicleandchassiscertificatestatusclassifier OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 18925)
-- Name: electronicvehicleandchassiscertificatestatusclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE electronicvehicleandchassiscertificatestatusclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE electronicvehicleandchassiscertificatestatusclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4708 (class 0 OID 0)
-- Dependencies: 260
-- Name: electronicvehicleandchassiscertificatestatusclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE electronicvehicleandchassiscertificatestatusclassifier_id_seq OWNED BY electronicvehicleandchassiscertificatestatusclassifier.id;


--
-- TOC entry 261 (class 1259 OID 18927)
-- Name: exemptionsfromcustomsdutychapters; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE exemptionsfromcustomsdutychapters (
    id integer NOT NULL,
    chapter_code character varying(20),
    chapter_name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE exemptionsfromcustomsdutychapters OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 18933)
-- Name: exemptionsfromcustomsdutychapters_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE exemptionsfromcustomsdutychapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exemptionsfromcustomsdutychapters_id_seq OWNER TO postgres;

--
-- TOC entry 4709 (class 0 OID 0)
-- Dependencies: 262
-- Name: exemptionsfromcustomsdutychapters_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE exemptionsfromcustomsdutychapters_id_seq OWNED BY exemptionsfromcustomsdutychapters.id;


--
-- TOC entry 263 (class 1259 OID 18935)
-- Name: exemptionsfromcustomsdutyclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE exemptionsfromcustomsdutyclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    chapter_code character varying(20)
);


ALTER TABLE exemptionsfromcustomsdutyclassifier OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 18941)
-- Name: exemptionsfromcustomsdutyclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE exemptionsfromcustomsdutyclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exemptionsfromcustomsdutyclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4710 (class 0 OID 0)
-- Dependencies: 264
-- Name: exemptionsfromcustomsdutyclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE exemptionsfromcustomsdutyclassifier_id_seq OWNED BY exemptionsfromcustomsdutyclassifier.id;


--
-- TOC entry 265 (class 1259 OID 18943)
-- Name: featureofmovementofgoodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE featureofmovementofgoodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE featureofmovementofgoodsclassifier OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 18949)
-- Name: featureofmovementofgoodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE featureofmovementofgoodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE featureofmovementofgoodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4711 (class 0 OID 0)
-- Dependencies: 266
-- Name: featureofmovementofgoodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE featureofmovementofgoodsclassifier_id_seq OWNED BY featureofmovementofgoodsclassifier.id;


--
-- TOC entry 267 (class 1259 OID 18951)
-- Name: govcontrolsystemandtechresourceskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE govcontrolsystemandtechresourceskindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE govcontrolsystemandtechresourceskindclassifier OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 18957)
-- Name: govcontrolsystemandtechresourceskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE govcontrolsystemandtechresourceskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE govcontrolsystemandtechresourceskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4712 (class 0 OID 0)
-- Dependencies: 268
-- Name: govcontrolsystemandtechresourceskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE govcontrolsystemandtechresourceskindclassifier_id_seq OWNED BY govcontrolsystemandtechresourceskindclassifier.id;


--
-- TOC entry 269 (class 1259 OID 18959)
-- Name: govcontrolsystemkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE govcontrolsystemkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE govcontrolsystemkindclassifier OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 18965)
-- Name: govcontrolsystemkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE govcontrolsystemkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE govcontrolsystemkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4713 (class 0 OID 0)
-- Dependencies: 270
-- Name: govcontrolsystemkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE govcontrolsystemkindclassifier_id_seq OWNED BY govcontrolsystemkindclassifier.id;


--
-- TOC entry 271 (class 1259 OID 18967)
-- Name: govsupportsystemkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE govsupportsystemkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE govsupportsystemkindclassifier OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 18973)
-- Name: govsupportsystemkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE govsupportsystemkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE govsupportsystemkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4714 (class 0 OID 0)
-- Dependencies: 272
-- Name: govsupportsystemkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE govsupportsystemkindclassifier_id_seq OWNED BY govsupportsystemkindclassifier.id;


--
-- TOC entry 273 (class 1259 OID 18975)
-- Name: incidentassessmentcodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE incidentassessmentcodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE incidentassessmentcodeclassifier OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 18981)
-- Name: incidentassessmentcodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE incidentassessmentcodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incidentassessmentcodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4715 (class 0 OID 0)
-- Dependencies: 274
-- Name: incidentassessmentcodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE incidentassessmentcodeclassifier_id_seq OWNED BY incidentassessmentcodeclassifier.id;


--
-- TOC entry 275 (class 1259 OID 18983)
-- Name: institutionaleconomysectorclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE institutionaleconomysectorclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE institutionaleconomysectorclassifier OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 18989)
-- Name: institutionaleconomysectorclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE institutionaleconomysectorclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE institutionaleconomysectorclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4716 (class 0 OID 0)
-- Dependencies: 276
-- Name: institutionaleconomysectorclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE institutionaleconomysectorclassifier_id_seq OWNED BY institutionaleconomysectorclassifier.id;


--
-- TOC entry 277 (class 1259 OID 18991)
-- Name: internatioanltransporttypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE internatioanltransporttypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE internatioanltransporttypesclassifier OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 18997)
-- Name: internatioanltransporttypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE internatioanltransporttypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE internatioanltransporttypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4717 (class 0 OID 0)
-- Dependencies: 278
-- Name: internatioanltransporttypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE internatioanltransporttypesclassifier_id_seq OWNED BY internatioanltransporttypesclassifier.id;


--
-- TOC entry 279 (class 1259 OID 18999)
-- Name: issuersellerclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE issuersellerclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE issuersellerclassifier OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 19005)
-- Name: issuersellerclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE issuersellerclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issuersellerclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4718 (class 0 OID 0)
-- Dependencies: 280
-- Name: issuersellerclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE issuersellerclassifier_id_seq OWNED BY issuersellerclassifier.id;


--
-- TOC entry 281 (class 1259 OID 19007)
-- Name: kindidclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindidclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE kindidclassifier OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 19013)
-- Name: kindidclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindidclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindidclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4719 (class 0 OID 0)
-- Dependencies: 282
-- Name: kindidclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindidclassifier_id_seq OWNED BY kindidclassifier.id;


--
-- TOC entry 283 (class 1259 OID 19015)
-- Name: kindofdocumentsforcustomsdeclarationchapters; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindofdocumentsforcustomsdeclarationchapters (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE kindofdocumentsforcustomsdeclarationchapters OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 19021)
-- Name: kindofdocumentsforcustomsdeclarationchapters_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindofdocumentsforcustomsdeclarationchapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindofdocumentsforcustomsdeclarationchapters_id_seq OWNER TO postgres;

--
-- TOC entry 4720 (class 0 OID 0)
-- Dependencies: 284
-- Name: kindofdocumentsforcustomsdeclarationchapters_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindofdocumentsforcustomsdeclarationchapters_id_seq OWNED BY kindofdocumentsforcustomsdeclarationchapters.id;


--
-- TOC entry 285 (class 1259 OID 19023)
-- Name: kindofdocumentsforcustomsdeclarationclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindofdocumentsforcustomsdeclarationclassifier (
    id integer NOT NULL,
    code character varying(20),
    chapter_code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    ts integer
);


ALTER TABLE kindofdocumentsforcustomsdeclarationclassifier OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 19029)
-- Name: kindofdocumentsforcustomsdeclarationclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindofdocumentsforcustomsdeclarationclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindofdocumentsforcustomsdeclarationclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4721 (class 0 OID 0)
-- Dependencies: 286
-- Name: kindofdocumentsforcustomsdeclarationclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindofdocumentsforcustomsdeclarationclassifier_id_seq OWNED BY kindofdocumentsforcustomsdeclarationclassifier.id;


--
-- TOC entry 287 (class 1259 OID 19031)
-- Name: kindoftransportandtransportationgoodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindoftransportandtransportationgoodsclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE kindoftransportandtransportationgoodsclassifier OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 19037)
-- Name: kindoftransportandtransportationgoodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindoftransportandtransportationgoodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindoftransportandtransportationgoodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4722 (class 0 OID 0)
-- Dependencies: 288
-- Name: kindoftransportandtransportationgoodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindoftransportandtransportationgoodsclassifier_id_seq OWNED BY kindoftransportandtransportationgoodsclassifier.id;


--
-- TOC entry 289 (class 1259 OID 19039)
-- Name: languagecodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE languagecodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE languagecodeclassifier OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 19045)
-- Name: languagecodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE languagecodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languagecodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4723 (class 0 OID 0)
-- Dependencies: 290
-- Name: languagecodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE languagecodeclassifier_id_seq OWNED BY languagecodeclassifier.id;


--
-- TOC entry 291 (class 1259 OID 19047)
-- Name: measurementunitclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE measurementunitclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    reference character varying(20),
    contriesspecificlimits character varying(255)
);


ALTER TABLE measurementunitclassifier OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 19053)
-- Name: measurementunitclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE measurementunitclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementunitclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4724 (class 0 OID 0)
-- Dependencies: 292
-- Name: measurementunitclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE measurementunitclassifier_id_seq OWNED BY measurementunitclassifier.id;


--
-- TOC entry 293 (class 1259 OID 19055)
-- Name: measurementunitcodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE measurementunitcodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE measurementunitcodeclassifier OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19061)
-- Name: measurementunitcodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE measurementunitcodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementunitcodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4725 (class 0 OID 0)
-- Dependencies: 294
-- Name: measurementunitcodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE measurementunitcodeclassifier_id_seq OWNED BY measurementunitcodeclassifier.id;


--
-- TOC entry 295 (class 1259 OID 19063)
-- Name: measuresensurecompliancecustomstransitprocedure; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE measuresensurecompliancecustomstransitprocedure (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE measuresensurecompliancecustomstransitprocedure OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 19069)
-- Name: measuresensurecompliancecustomstransitprocedure_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE measuresensurecompliancecustomstransitprocedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measuresensurecompliancecustomstransitprocedure_id_seq OWNER TO postgres;

--
-- TOC entry 4726 (class 0 OID 0)
-- Dependencies: 296
-- Name: measuresensurecompliancecustomstransitprocedure_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE measuresensurecompliancecustomstransitprocedure_id_seq OWNED BY measuresensurecompliancecustomstransitprocedure.id;


--
-- TOC entry 297 (class 1259 OID 19071)
-- Name: nsicountry; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE nsicountry (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE nsicountry OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 19077)
-- Name: nsicountry_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE nsicountry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nsicountry_id_seq OWNER TO postgres;

--
-- TOC entry 4727 (class 0 OID 0)
-- Dependencies: 298
-- Name: nsicountry_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE nsicountry_id_seq OWNED BY nsicountry.id;


--
-- TOC entry 299 (class 1259 OID 19079)
-- Name: objectpassedcustomcheckpointclssifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE objectpassedcustomcheckpointclssifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE objectpassedcustomcheckpointclssifier OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 19085)
-- Name: objectpassedcustomcheckpointclssifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE objectpassedcustomcheckpointclssifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objectpassedcustomcheckpointclssifier_id_seq OWNER TO postgres;

--
-- TOC entry 4728 (class 0 OID 0)
-- Dependencies: 300
-- Name: objectpassedcustomcheckpointclssifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE objectpassedcustomcheckpointclssifier_id_seq OWNED BY objectpassedcustomcheckpointclssifier.id;


--
-- TOC entry 301 (class 1259 OID 19087)
-- Name: pharmaprodconsignmentlimitkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE pharmaprodconsignmentlimitkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE pharmaprodconsignmentlimitkindclassifier OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 19093)
-- Name: pharmaprodconsignmentlimitkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE pharmaprodconsignmentlimitkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pharmaprodconsignmentlimitkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4729 (class 0 OID 0)
-- Dependencies: 302
-- Name: pharmaprodconsignmentlimitkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE pharmaprodconsignmentlimitkindclassifier_id_seq OWNED BY pharmaprodconsignmentlimitkindclassifier.id;


--
-- TOC entry 303 (class 1259 OID 19095)
-- Name: pharmaproductregistrationdocelementkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE pharmaproductregistrationdocelementkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE pharmaproductregistrationdocelementkindclassifier OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 19101)
-- Name: pharmaproductregistrationdocelementkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE pharmaproductregistrationdocelementkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pharmaproductregistrationdocelementkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4730 (class 0 OID 0)
-- Dependencies: 304
-- Name: pharmaproductregistrationdocelementkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE pharmaproductregistrationdocelementkindclassifier_id_seq OWNED BY pharmaproductregistrationdocelementkindclassifier.id;


--
-- TOC entry 305 (class 1259 OID 19103)
-- Name: registrationproductdoccodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE registrationproductdoccodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE registrationproductdoccodeclassifier OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 19109)
-- Name: registrationproductdoccodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE registrationproductdoccodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registrationproductdoccodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4731 (class 0 OID 0)
-- Dependencies: 306
-- Name: registrationproductdoccodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE registrationproductdoccodeclassifier_id_seq OWNED BY registrationproductdoccodeclassifier.id;


--
-- TOC entry 307 (class 1259 OID 19111)
-- Name: registrationproductfilecodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE registrationproductfilecodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE registrationproductfilecodeclassifier OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 19117)
-- Name: registrationproductfilecodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE registrationproductfilecodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registrationproductfilecodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4732 (class 0 OID 0)
-- Dependencies: 308
-- Name: registrationproductfilecodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE registrationproductfilecodeclassifier_id_seq OWNED BY registrationproductfilecodeclassifier.id;


--
-- TOC entry 309 (class 1259 OID 19119)
-- Name: specialsimplificationtypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE specialsimplificationtypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE specialsimplificationtypeclassifier OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 19125)
-- Name: specialsimplificationtypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE specialsimplificationtypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialsimplificationtypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4733 (class 0 OID 0)
-- Dependencies: 310
-- Name: specialsimplificationtypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE specialsimplificationtypeclassifier_id_seq OWNED BY specialsimplificationtypeclassifier.id;


--
-- TOC entry 311 (class 1259 OID 19127)
-- Name: steeringwheelpositionclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE steeringwheelpositionclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE steeringwheelpositionclassifier OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 19133)
-- Name: steeringwheelpositionclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE steeringwheelpositionclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE steeringwheelpositionclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4734 (class 0 OID 0)
-- Dependencies: 312
-- Name: steeringwheelpositionclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE steeringwheelpositionclassifier_id_seq OWNED BY steeringwheelpositionclassifier.id;


--
-- TOC entry 313 (class 1259 OID 19135)
-- Name: subjectsoflawclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE subjectsoflawclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE subjectsoflawclassifier OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 19141)
-- Name: subjectsoflawclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE subjectsoflawclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjectsoflawclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4735 (class 0 OID 0)
-- Dependencies: 314
-- Name: subjectsoflawclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE subjectsoflawclassifier_id_seq OWNED BY subjectsoflawclassifier.id;


--
-- TOC entry 315 (class 1259 OID 19143)
-- Name: technicalobjectkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE technicalobjectkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE technicalobjectkindclassifier OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 19149)
-- Name: technicalobjectkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE technicalobjectkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE technicalobjectkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4736 (class 0 OID 0)
-- Dependencies: 316
-- Name: technicalobjectkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE technicalobjectkindclassifier_id_seq OWNED BY technicalobjectkindclassifier.id;


--
-- TOC entry 317 (class 1259 OID 19151)
-- Name: termsofdeliveryclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE termsofdeliveryclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    destinationtype character varying(255),
    contriesspecificlimits character varying(255)
);


ALTER TABLE termsofdeliveryclassifier OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 19157)
-- Name: termsofdeliveryclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE termsofdeliveryclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE termsofdeliveryclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4737 (class 0 OID 0)
-- Dependencies: 318
-- Name: termsofdeliveryclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE termsofdeliveryclassifier_id_seq OWNED BY termsofdeliveryclassifier.id;


--
-- TOC entry 319 (class 1259 OID 19159)
-- Name: transactiontypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE transactiontypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE transactiontypeclassifier OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 19165)
-- Name: transactiontypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE transactiontypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactiontypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4738 (class 0 OID 0)
-- Dependencies: 320
-- Name: transactiontypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE transactiontypeclassifier_id_seq OWNED BY transactiontypeclassifier.id;


--
-- TOC entry 321 (class 1259 OID 19167)
-- Name: transportandfreightmodesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE transportandfreightmodesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE transportandfreightmodesclassifier OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 19173)
-- Name: transportandfreightmodesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE transportandfreightmodesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transportandfreightmodesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4739 (class 0 OID 0)
-- Dependencies: 322
-- Name: transportandfreightmodesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE transportandfreightmodesclassifier_id_seq OWNED BY transportandfreightmodesclassifier.id;


--
-- TOC entry 323 (class 1259 OID 19175)
-- Name: userkindtimeadvincidentclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE userkindtimeadvincidentclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE userkindtimeadvincidentclassifier OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 19181)
-- Name: userkindtimeadvincidentclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE userkindtimeadvincidentclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userkindtimeadvincidentclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4740 (class 0 OID 0)
-- Dependencies: 324
-- Name: userkindtimeadvincidentclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE userkindtimeadvincidentclassifier_id_seq OWNED BY userkindtimeadvincidentclassifier.id;


--
-- TOC entry 325 (class 1259 OID 19183)
-- Name: vehiclebodycolorclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclebodycolorclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclebodycolorclassifier OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 19189)
-- Name: vehiclebodycolorclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclebodycolorclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclebodycolorclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4741 (class 0 OID 0)
-- Dependencies: 326
-- Name: vehiclebodycolorclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclebodycolorclassifier_id_seq OWNED BY vehiclebodycolorclassifier.id;


--
-- TOC entry 327 (class 1259 OID 19191)
-- Name: vehiclebrandsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclebrandsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclebrandsclassifier OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 19197)
-- Name: vehiclebrandsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclebrandsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclebrandsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4742 (class 0 OID 0)
-- Dependencies: 328
-- Name: vehiclebrandsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclebrandsclassifier_id_seq OWNED BY vehiclebrandsclassifier.id;


--
-- TOC entry 329 (class 1259 OID 19199)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecategorypereaeutechnicalregulationsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    description character varying(1024),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecategorypereaeutechnicalregulationsclassifier OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 19205)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecategorypereaeutechnicalregulationsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecategorypereaeutechnicalregulationsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4743 (class 0 OID 0)
-- Dependencies: 330
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecategorypereaeutechnicalregulationsclassifier_id_seq OWNED BY vehiclecategorypereaeutechnicalregulationsclassifier.id;


--
-- TOC entry 331 (class 1259 OID 19207)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecategoryperviennaconventiononroadtrafficclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    description character varying(1024),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecategoryperviennaconventiononroadtrafficclassifier OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 19213)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq OWNER TO postgres;

--
-- TOC entry 4744 (class 0 OID 0)
-- Dependencies: 332
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq OWNED BY vehiclecategoryperviennaconventiononroadtrafficclassifier.id;


--
-- TOC entry 333 (class 1259 OID 19215)
-- Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecatperelectrontechcertificateregistrationrulesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    description character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecatperelectrontechcertificateregistrationrulesclassifier OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 19221)
-- Name: vehiclecatperelectrontechcertificateregistrationrulescla_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecatperelectrontechcertificateregistrationrulescla_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecatperelectrontechcertificateregistrationrulescla_id_seq OWNER TO postgres;

--
-- TOC entry 4745 (class 0 OID 0)
-- Dependencies: 334
-- Name: vehiclecatperelectrontechcertificateregistrationrulescla_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecatperelectrontechcertificateregistrationrulescla_id_seq OWNED BY vehiclecatperelectrontechcertificateregistrationrulesclassifier.id;


--
-- TOC entry 335 (class 1259 OID 19223)
-- Name: vehiclechassisclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclechassisclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclechassisclassifier OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 19229)
-- Name: vehiclechassisclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclechassisclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclechassisclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4746 (class 0 OID 0)
-- Dependencies: 336
-- Name: vehiclechassisclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclechassisclassifier_id_seq OWNED BY vehiclechassisclassifier.id;


--
-- TOC entry 337 (class 1259 OID 19231)
-- Name: vehiclecomponentschassistypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecomponentschassistypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecomponentschassistypesclassifier OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 19237)
-- Name: vehiclecomponentschassistypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecomponentschassistypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecomponentschassistypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4747 (class 0 OID 0)
-- Dependencies: 338
-- Name: vehiclecomponentschassistypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecomponentschassistypesclassifier_id_seq OWNED BY vehiclecomponentschassistypesclassifier.id;


--
-- TOC entry 339 (class 1259 OID 19239)
-- Name: vehicleelectricmachinetypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleelectricmachinetypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleelectricmachinetypeclassifier OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 19245)
-- Name: vehicleelectricmachinetypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleelectricmachinetypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleelectricmachinetypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4748 (class 0 OID 0)
-- Dependencies: 340
-- Name: vehicleelectricmachinetypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleelectricmachinetypeclassifier_id_seq OWNED BY vehicleelectricmachinetypeclassifier.id;


--
-- TOC entry 341 (class 1259 OID 19247)
-- Name: vehicleelectroniccertificateissuecauseclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleelectroniccertificateissuecauseclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleelectroniccertificateissuecauseclassifier OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 19253)
-- Name: vehicleelectroniccertificateissuecauseclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleelectroniccertificateissuecauseclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleelectroniccertificateissuecauseclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4749 (class 0 OID 0)
-- Dependencies: 342
-- Name: vehicleelectroniccertificateissuecauseclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleelectroniccertificateissuecauseclassifier_id_seq OWNED BY vehicleelectroniccertificateissuecauseclassifier.id;


--
-- TOC entry 343 (class 1259 OID 19255)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleelectroniccertificateissuecausewodocumentationsubstantia (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleelectroniccertificateissuecausewodocumentationsubstantia OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 19261)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsub_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleelectroniccertificateissuecausewodocumentationsub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleelectroniccertificateissuecausewodocumentationsub_id_seq OWNER TO postgres;

--
-- TOC entry 4750 (class 0 OID 0)
-- Dependencies: 344
-- Name: vehicleelectroniccertificateissuecausewodocumentationsub_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleelectroniccertificateissuecausewodocumentationsub_id_seq OWNED BY vehicleelectroniccertificateissuecausewodocumentationsubstantia.id;


--
-- TOC entry 345 (class 1259 OID 19263)
-- Name: vehicleenvironmentalclassclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleenvironmentalclassclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleenvironmentalclassclassifier OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 19269)
-- Name: vehicleenvironmentalclassclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleenvironmentalclassclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleenvironmentalclassclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4751 (class 0 OID 0)
-- Dependencies: 346
-- Name: vehicleenvironmentalclassclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleenvironmentalclassclassifier_id_seq OWNED BY vehicleenvironmentalclassclassifier.id;


--
-- TOC entry 347 (class 1259 OID 19271)
-- Name: vehiclefueltypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclefueltypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclefueltypesclassifier OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 19277)
-- Name: vehiclefueltypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclefueltypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclefueltypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4752 (class 0 OID 0)
-- Dependencies: 348
-- Name: vehiclefueltypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclefueltypesclassifier_id_seq OWNED BY vehiclefueltypesclassifier.id;


--
-- TOC entry 349 (class 1259 OID 19279)
-- Name: vehiclemanufacturertypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclemanufacturertypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclemanufacturertypeclassifier OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 19285)
-- Name: vehiclemanufacturertypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclemanufacturertypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclemanufacturertypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4753 (class 0 OID 0)
-- Dependencies: 350
-- Name: vehiclemanufacturertypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclemanufacturertypeclassifier_id_seq OWNED BY vehiclemanufacturertypeclassifier.id;


--
-- TOC entry 351 (class 1259 OID 19287)
-- Name: vehiclepassportissuerkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclepassportissuerkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(4000),
    shortname character varying(255)
);


ALTER TABLE vehiclepassportissuerkindclassifier OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 19293)
-- Name: vehiclepassportissuerkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclepassportissuerkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclepassportissuerkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4754 (class 0 OID 0)
-- Dependencies: 352
-- Name: vehiclepassportissuerkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclepassportissuerkindclassifier_id_seq OWNED BY vehiclepassportissuerkindclassifier.id;


--
-- TOC entry 353 (class 1259 OID 19295)
-- Name: vehiclepropellertypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclepropellertypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclepropellertypesclassifier OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 19301)
-- Name: vehiclepropellertypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclepropellertypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclepropellertypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4755 (class 0 OID 0)
-- Dependencies: 354
-- Name: vehiclepropellertypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclepropellertypesclassifier_id_seq OWNED BY vehiclepropellertypesclassifier.id;


--
-- TOC entry 355 (class 1259 OID 19303)
-- Name: vehicleregistrationclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleregistrationclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleregistrationclassifier OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 19309)
-- Name: vehicleregistrationclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleregistrationclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleregistrationclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4756 (class 0 OID 0)
-- Dependencies: 356
-- Name: vehicleregistrationclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleregistrationclassifier_id_seq OWNED BY vehicleregistrationclassifier.id;


--
-- TOC entry 357 (class 1259 OID 19311)
-- Name: vehiclesuspensiontypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclesuspensiontypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclesuspensiontypeclassifier OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 19317)
-- Name: vehiclesuspensiontypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclesuspensiontypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclesuspensiontypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4757 (class 0 OID 0)
-- Dependencies: 358
-- Name: vehiclesuspensiontypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclesuspensiontypeclassifier_id_seq OWNED BY vehiclesuspensiontypeclassifier.id;


--
-- TOC entry 359 (class 1259 OID 19319)
-- Name: vehicletechnicalcertificatetypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicletechnicalcertificatetypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicletechnicalcertificatetypesclassifier OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 19325)
-- Name: vehicletechnicalcertificatetypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicletechnicalcertificatetypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicletechnicalcertificatetypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4758 (class 0 OID 0)
-- Dependencies: 360
-- Name: vehicletechnicalcertificatetypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicletechnicalcertificatetypesclassifier_id_seq OWNED BY vehicletechnicalcertificatetypesclassifier.id;


--
-- TOC entry 361 (class 1259 OID 19327)
-- Name: vehicleweighttypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleweighttypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    description character varying(512),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleweighttypeclassifier OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 19333)
-- Name: vehicleweighttypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleweighttypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleweighttypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4759 (class 0 OID 0)
-- Dependencies: 362
-- Name: vehicleweighttypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleweighttypeclassifier_id_seq OWNED BY vehicleweighttypeclassifier.id;


--
-- TOC entry 363 (class 1259 OID 19335)
-- Name: waypointkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE waypointkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE waypointkindclassifier OWNER TO postgres;

--
-- TOC entry 364 (class 1259 OID 19341)
-- Name: waypointkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE waypointkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE waypointkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4760 (class 0 OID 0)
-- Dependencies: 364
-- Name: waypointkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE waypointkindclassifier_id_seq OWNED BY waypointkindclassifier.id;


--
-- TOC entry 365 (class 1259 OID 19343)
-- Name: workinghourskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE workinghourskindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE workinghourskindclassifier OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 19349)
-- Name: workinghourskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE workinghourskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workinghourskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4761 (class 0 OID 0)
-- Dependencies: 366
-- Name: workinghourskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE workinghourskindclassifier_id_seq OWNED BY workinghourskindclassifier.id;


--
-- TOC entry 4127 (class 2604 OID 19351)
-- Name: accreditationcertificatestatusclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY accreditationcertificatestatusclassifier ALTER COLUMN id SET DEFAULT nextval('accreditationcertificatestatusclassifier_id_seq'::regclass);


--
-- TOC entry 4128 (class 2604 OID 19352)
-- Name: additionalparamsforcustomsfeesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY additionalparamsforcustomsfeesclassifier ALTER COLUMN id SET DEFAULT nextval('additionalparamsforcustomsfeesclassifier_id_seq'::regclass);


--
-- TOC entry 4129 (class 2604 OID 19353)
-- Name: addresskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY addresskindclassifier ALTER COLUMN id SET DEFAULT nextval('addresskindclassifier_id_seq'::regclass);


--
-- TOC entry 4130 (class 2604 OID 19354)
-- Name: bankidentitykindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY bankidentitykindclassifier ALTER COLUMN id SET DEFAULT nextval('bankidentitykindclassifier_id_seq'::regclass);


--
-- TOC entry 4131 (class 2604 OID 19355)
-- Name: biologicalsexclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY biologicalsexclassifier ALTER COLUMN id SET DEFAULT nextval('biologicalsexclassifier_id_seq'::regclass);


--
-- TOC entry 4132 (class 2604 OID 19356)
-- Name: brakingsystemtypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY brakingsystemtypeclassifier ALTER COLUMN id SET DEFAULT nextval('brakingsystemtypeclassifier_id_seq'::regclass);


--
-- TOC entry 4133 (class 2604 OID 19357)
-- Name: businessentitytypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypeclassifier ALTER COLUMN id SET DEFAULT nextval('businessentitytypeclassifier_id_seq'::regclass);


--
-- TOC entry 4134 (class 2604 OID 19358)
-- Name: businessentitytypecodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypecodeclassifier ALTER COLUMN id SET DEFAULT nextval('businessentitytypecodeclassifier_id_seq'::regclass);


--
-- TOC entry 4135 (class 2604 OID 19359)
-- Name: cargolocationclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargolocationclassifier ALTER COLUMN id SET DEFAULT nextval('cargolocationclassifier_id_seq'::regclass);


--
-- TOC entry 4136 (class 2604 OID 19360)
-- Name: cargopackagekindsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargopackagekindsclassifier ALTER COLUMN id SET DEFAULT nextval('cargopackagekindsclassifier_id_seq'::regclass);


--
-- TOC entry 4137 (class 2604 OID 19361)
-- Name: certificatioorganizationkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY certificatioorganizationkindclassifier ALTER COLUMN id SET DEFAULT nextval('certificatioorganizationkindclassifier_id_seq'::regclass);


--
-- TOC entry 4138 (class 2604 OID 19362)
-- Name: communicationchannelclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY communicationchannelclassifier ALTER COLUMN id SET DEFAULT nextval('communicationchannelclassifier_id_seq'::regclass);


--
-- TOC entry 4139 (class 2604 OID 19363)
-- Name: conformityassessmentdocstypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY conformityassessmentdocstypesclassifier ALTER COLUMN id SET DEFAULT nextval('conformityassessmentdocstypesclassifier_id_seq'::regclass);


--
-- TOC entry 4140 (class 2604 OID 19364)
-- Name: countriesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY countriesclassifier ALTER COLUMN id SET DEFAULT nextval('countriesclassifier_id_seq'::regclass);


--
-- TOC entry 4141 (class 2604 OID 19365)
-- Name: currencyclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY currencyclassifier ALTER COLUMN id SET DEFAULT nextval('currencyclassifier_id_seq'::regclass);


--
-- TOC entry 4142 (class 2604 OID 19366)
-- Name: customcheckpointcctvplacementclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcctvplacementclassifier ALTER COLUMN id SET DEFAULT nextval('customcheckpointcctvplacementclassifier_id_seq'::regclass);


--
-- TOC entry 4143 (class 2604 OID 19367)
-- Name: customcheckpointcommchannelclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcommchannelclassifier ALTER COLUMN id SET DEFAULT nextval('customcheckpointcommchannelclassifier_id_seq'::regclass);


--
-- TOC entry 4144 (class 2604 OID 19368)
-- Name: customprocesskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customprocesskindclassifier ALTER COLUMN id SET DEFAULT nextval('customprocesskindclassifier_id_seq'::regclass);


--
-- TOC entry 4145 (class 2604 OID 19369)
-- Name: customsconclusionsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsconclusionsclassifier ALTER COLUMN id SET DEFAULT nextval('customsconclusionsclassifier_id_seq'::regclass);


--
-- TOC entry 4146 (class 2604 OID 19370)
-- Name: customsfeesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesclassifier_id_seq'::regclass);


--
-- TOC entry 4147 (class 2604 OID 19371)
-- Name: customsfeesclassifierchapters id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifierchapters ALTER COLUMN id SET DEFAULT nextval('customsfeesclassifierchapters_id_seq'::regclass);


--
-- TOC entry 4148 (class 2604 OID 19372)
-- Name: customsfeesfeaturesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesfeaturesclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesfeaturesclassifier_id_seq'::regclass);


--
-- TOC entry 4149 (class 2604 OID 19373)
-- Name: customsfeesguaranteemethodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesguaranteemethodsclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesguaranteemethodsclassifier_id_seq'::regclass);


--
-- TOC entry 4150 (class 2604 OID 19374)
-- Name: customsfeesmethodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesmethodsclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesmethodsclassifier_id_seq'::regclass);


--
-- TOC entry 4151 (class 2604 OID 19375)
-- Name: customstransitmovementofgoodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customstransitmovementofgoodsclassifier ALTER COLUMN id SET DEFAULT nextval('customstransitmovementofgoodsclassifier_id_seq'::regclass);


--
-- TOC entry 4152 (class 2604 OID 19376)
-- Name: customsvalueconclusionclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsvalueconclusionclassifier ALTER COLUMN id SET DEFAULT nextval('customsvalueconclusionclassifier_id_seq'::regclass);


--
-- TOC entry 4153 (class 2604 OID 19377)
-- Name: dataformatclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY dataformatclassifier ALTER COLUMN id SET DEFAULT nextval('dataformatclassifier_id_seq'::regclass);


--
-- TOC entry 4154 (class 2604 OID 19378)
-- Name: declarationofgoodsfeaturesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY declarationofgoodsfeaturesclassifier ALTER COLUMN id SET DEFAULT nextval('declarationofgoodsfeaturesclassifier_id_seq'::regclass);


--
-- TOC entry 4155 (class 2604 OID 19379)
-- Name: definingcustomsvaluemethodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY definingcustomsvaluemethodsclassifier ALTER COLUMN id SET DEFAULT nextval('definingcustomsvaluemethodsclassifier_id_seq'::regclass);


--
-- TOC entry 4156 (class 2604 OID 19380)
-- Name: docstatstatusclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY docstatstatusclassifier ALTER COLUMN id SET DEFAULT nextval('docstatstatusclassifier_id_seq'::regclass);


--
-- TOC entry 4157 (class 2604 OID 19381)
-- Name: documentprocessingresultcodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY documentprocessingresultcodeclassifier ALTER COLUMN id SET DEFAULT nextval('documentprocessingresultcodeclassifier_id_seq'::regclass);


--
-- TOC entry 4158 (class 2604 OID 19382)
-- Name: electronicvehicleandchassiscertificatestatusclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY electronicvehicleandchassiscertificatestatusclassifier ALTER COLUMN id SET DEFAULT nextval('electronicvehicleandchassiscertificatestatusclassifier_id_seq'::regclass);


--
-- TOC entry 4159 (class 2604 OID 19383)
-- Name: exemptionsfromcustomsdutychapters id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutychapters ALTER COLUMN id SET DEFAULT nextval('exemptionsfromcustomsdutychapters_id_seq'::regclass);


--
-- TOC entry 4160 (class 2604 OID 19384)
-- Name: exemptionsfromcustomsdutyclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutyclassifier ALTER COLUMN id SET DEFAULT nextval('exemptionsfromcustomsdutyclassifier_id_seq'::regclass);


--
-- TOC entry 4161 (class 2604 OID 19385)
-- Name: featureofmovementofgoodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY featureofmovementofgoodsclassifier ALTER COLUMN id SET DEFAULT nextval('featureofmovementofgoodsclassifier_id_seq'::regclass);


--
-- TOC entry 4162 (class 2604 OID 19386)
-- Name: govcontrolsystemandtechresourceskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemandtechresourceskindclassifier ALTER COLUMN id SET DEFAULT nextval('govcontrolsystemandtechresourceskindclassifier_id_seq'::regclass);


--
-- TOC entry 4163 (class 2604 OID 19387)
-- Name: govcontrolsystemkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemkindclassifier ALTER COLUMN id SET DEFAULT nextval('govcontrolsystemkindclassifier_id_seq'::regclass);


--
-- TOC entry 4164 (class 2604 OID 19388)
-- Name: govsupportsystemkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govsupportsystemkindclassifier ALTER COLUMN id SET DEFAULT nextval('govsupportsystemkindclassifier_id_seq'::regclass);


--
-- TOC entry 4165 (class 2604 OID 19389)
-- Name: incidentassessmentcodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY incidentassessmentcodeclassifier ALTER COLUMN id SET DEFAULT nextval('incidentassessmentcodeclassifier_id_seq'::regclass);


--
-- TOC entry 4166 (class 2604 OID 19390)
-- Name: institutionaleconomysectorclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY institutionaleconomysectorclassifier ALTER COLUMN id SET DEFAULT nextval('institutionaleconomysectorclassifier_id_seq'::regclass);


--
-- TOC entry 4167 (class 2604 OID 19391)
-- Name: internatioanltransporttypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY internatioanltransporttypesclassifier ALTER COLUMN id SET DEFAULT nextval('internatioanltransporttypesclassifier_id_seq'::regclass);


--
-- TOC entry 4168 (class 2604 OID 19392)
-- Name: issuersellerclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY issuersellerclassifier ALTER COLUMN id SET DEFAULT nextval('issuersellerclassifier_id_seq'::regclass);


--
-- TOC entry 4169 (class 2604 OID 19393)
-- Name: kindidclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindidclassifier ALTER COLUMN id SET DEFAULT nextval('kindidclassifier_id_seq'::regclass);


--
-- TOC entry 4170 (class 2604 OID 19394)
-- Name: kindofdocumentsforcustomsdeclarationchapters id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationchapters ALTER COLUMN id SET DEFAULT nextval('kindofdocumentsforcustomsdeclarationchapters_id_seq'::regclass);


--
-- TOC entry 4171 (class 2604 OID 19395)
-- Name: kindofdocumentsforcustomsdeclarationclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationclassifier ALTER COLUMN id SET DEFAULT nextval('kindofdocumentsforcustomsdeclarationclassifier_id_seq'::regclass);


--
-- TOC entry 4172 (class 2604 OID 19396)
-- Name: kindoftransportandtransportationgoodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindoftransportandtransportationgoodsclassifier ALTER COLUMN id SET DEFAULT nextval('kindoftransportandtransportationgoodsclassifier_id_seq'::regclass);


--
-- TOC entry 4173 (class 2604 OID 19397)
-- Name: languagecodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY languagecodeclassifier ALTER COLUMN id SET DEFAULT nextval('languagecodeclassifier_id_seq'::regclass);


--
-- TOC entry 4174 (class 2604 OID 19398)
-- Name: measurementunitclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitclassifier ALTER COLUMN id SET DEFAULT nextval('measurementunitclassifier_id_seq'::regclass);


--
-- TOC entry 4175 (class 2604 OID 19399)
-- Name: measurementunitcodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitcodeclassifier ALTER COLUMN id SET DEFAULT nextval('measurementunitcodeclassifier_id_seq'::regclass);


--
-- TOC entry 4176 (class 2604 OID 19400)
-- Name: measuresensurecompliancecustomstransitprocedure id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measuresensurecompliancecustomstransitprocedure ALTER COLUMN id SET DEFAULT nextval('measuresensurecompliancecustomstransitprocedure_id_seq'::regclass);


--
-- TOC entry 4177 (class 2604 OID 19401)
-- Name: nsicountry id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY nsicountry ALTER COLUMN id SET DEFAULT nextval('nsicountry_id_seq'::regclass);


--
-- TOC entry 4178 (class 2604 OID 19402)
-- Name: objectpassedcustomcheckpointclssifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY objectpassedcustomcheckpointclssifier ALTER COLUMN id SET DEFAULT nextval('objectpassedcustomcheckpointclssifier_id_seq'::regclass);


--
-- TOC entry 4179 (class 2604 OID 19403)
-- Name: pharmaprodconsignmentlimitkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaprodconsignmentlimitkindclassifier ALTER COLUMN id SET DEFAULT nextval('pharmaprodconsignmentlimitkindclassifier_id_seq'::regclass);


--
-- TOC entry 4180 (class 2604 OID 19404)
-- Name: pharmaproductregistrationdocelementkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaproductregistrationdocelementkindclassifier ALTER COLUMN id SET DEFAULT nextval('pharmaproductregistrationdocelementkindclassifier_id_seq'::regclass);


--
-- TOC entry 4181 (class 2604 OID 19405)
-- Name: registrationproductdoccodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductdoccodeclassifier ALTER COLUMN id SET DEFAULT nextval('registrationproductdoccodeclassifier_id_seq'::regclass);


--
-- TOC entry 4182 (class 2604 OID 19406)
-- Name: registrationproductfilecodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductfilecodeclassifier ALTER COLUMN id SET DEFAULT nextval('registrationproductfilecodeclassifier_id_seq'::regclass);


--
-- TOC entry 4183 (class 2604 OID 19407)
-- Name: specialsimplificationtypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY specialsimplificationtypeclassifier ALTER COLUMN id SET DEFAULT nextval('specialsimplificationtypeclassifier_id_seq'::regclass);


--
-- TOC entry 4184 (class 2604 OID 19408)
-- Name: steeringwheelpositionclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY steeringwheelpositionclassifier ALTER COLUMN id SET DEFAULT nextval('steeringwheelpositionclassifier_id_seq'::regclass);


--
-- TOC entry 4185 (class 2604 OID 19409)
-- Name: subjectsoflawclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY subjectsoflawclassifier ALTER COLUMN id SET DEFAULT nextval('subjectsoflawclassifier_id_seq'::regclass);


--
-- TOC entry 4186 (class 2604 OID 19410)
-- Name: technicalobjectkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY technicalobjectkindclassifier ALTER COLUMN id SET DEFAULT nextval('technicalobjectkindclassifier_id_seq'::regclass);


--
-- TOC entry 4187 (class 2604 OID 19411)
-- Name: termsofdeliveryclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY termsofdeliveryclassifier ALTER COLUMN id SET DEFAULT nextval('termsofdeliveryclassifier_id_seq'::regclass);


--
-- TOC entry 4188 (class 2604 OID 19412)
-- Name: transactiontypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transactiontypeclassifier ALTER COLUMN id SET DEFAULT nextval('transactiontypeclassifier_id_seq'::regclass);


--
-- TOC entry 4189 (class 2604 OID 19413)
-- Name: transportandfreightmodesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transportandfreightmodesclassifier ALTER COLUMN id SET DEFAULT nextval('transportandfreightmodesclassifier_id_seq'::regclass);


--
-- TOC entry 4190 (class 2604 OID 19414)
-- Name: userkindtimeadvincidentclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY userkindtimeadvincidentclassifier ALTER COLUMN id SET DEFAULT nextval('userkindtimeadvincidentclassifier_id_seq'::regclass);


--
-- TOC entry 4191 (class 2604 OID 19415)
-- Name: vehiclebodycolorclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebodycolorclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclebodycolorclassifier_id_seq'::regclass);


--
-- TOC entry 4192 (class 2604 OID 19416)
-- Name: vehiclebrandsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebrandsclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclebrandsclassifier_id_seq'::regclass);


--
-- TOC entry 4193 (class 2604 OID 19417)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategorypereaeutechnicalregulationsclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecategorypereaeutechnicalregulationsclassifier_id_seq'::regclass);


--
-- TOC entry 4194 (class 2604 OID 19418)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategoryperviennaconventiononroadtrafficclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq'::regclass);


--
-- TOC entry 4195 (class 2604 OID 19419)
-- Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecatperelectrontechcertificateregistrationrulesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecatperelectrontechcertificateregistrationrulescla_id_seq'::regclass);


--
-- TOC entry 4196 (class 2604 OID 19420)
-- Name: vehiclechassisclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclechassisclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclechassisclassifier_id_seq'::regclass);


--
-- TOC entry 4197 (class 2604 OID 19421)
-- Name: vehiclecomponentschassistypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecomponentschassistypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecomponentschassistypesclassifier_id_seq'::regclass);


--
-- TOC entry 4198 (class 2604 OID 19422)
-- Name: vehicleelectricmachinetypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectricmachinetypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleelectricmachinetypeclassifier_id_seq'::regclass);


--
-- TOC entry 4199 (class 2604 OID 19423)
-- Name: vehicleelectroniccertificateissuecauseclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecauseclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleelectroniccertificateissuecauseclassifier_id_seq'::regclass);


--
-- TOC entry 4200 (class 2604 OID 19424)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecausewodocumentationsubstantia ALTER COLUMN id SET DEFAULT nextval('vehicleelectroniccertificateissuecausewodocumentationsub_id_seq'::regclass);


--
-- TOC entry 4201 (class 2604 OID 19425)
-- Name: vehicleenvironmentalclassclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleenvironmentalclassclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleenvironmentalclassclassifier_id_seq'::regclass);


--
-- TOC entry 4202 (class 2604 OID 19426)
-- Name: vehiclefueltypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclefueltypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclefueltypesclassifier_id_seq'::regclass);


--
-- TOC entry 4203 (class 2604 OID 19427)
-- Name: vehiclemanufacturertypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclemanufacturertypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclemanufacturertypeclassifier_id_seq'::regclass);


--
-- TOC entry 4204 (class 2604 OID 19428)
-- Name: vehiclepassportissuerkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepassportissuerkindclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclepassportissuerkindclassifier_id_seq'::regclass);


--
-- TOC entry 4205 (class 2604 OID 19429)
-- Name: vehiclepropellertypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepropellertypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclepropellertypesclassifier_id_seq'::regclass);


--
-- TOC entry 4206 (class 2604 OID 19430)
-- Name: vehicleregistrationclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleregistrationclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleregistrationclassifier_id_seq'::regclass);


--
-- TOC entry 4207 (class 2604 OID 19431)
-- Name: vehiclesuspensiontypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclesuspensiontypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclesuspensiontypeclassifier_id_seq'::regclass);


--
-- TOC entry 4208 (class 2604 OID 19432)
-- Name: vehicletechnicalcertificatetypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicletechnicalcertificatetypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehicletechnicalcertificatetypesclassifier_id_seq'::regclass);


--
-- TOC entry 4209 (class 2604 OID 19433)
-- Name: vehicleweighttypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleweighttypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleweighttypeclassifier_id_seq'::regclass);


--
-- TOC entry 4210 (class 2604 OID 19434)
-- Name: waypointkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY waypointkindclassifier ALTER COLUMN id SET DEFAULT nextval('waypointkindclassifier_id_seq'::regclass);


--
-- TOC entry 4211 (class 2604 OID 19435)
-- Name: workinghourskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY workinghourskindclassifier ALTER COLUMN id SET DEFAULT nextval('workinghourskindclassifier_id_seq'::regclass);


--
-- TOC entry 4503 (class 0 OID 18671)
-- Dependencies: 197
-- Data for Name: accreditationcertificatestatusclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO accreditationcertificatestatusclassifier VALUES (26, '01', 'действует');
INSERT INTO accreditationcertificatestatusclassifier VALUES (27, '02', 'приостановлен');
INSERT INTO accreditationcertificatestatusclassifier VALUES (28, '03', 'прекращен');
INSERT INTO accreditationcertificatestatusclassifier VALUES (29, '04', 'продлен');
INSERT INTO accreditationcertificatestatusclassifier VALUES (30, '05', 'возобновлен');
INSERT INTO accreditationcertificatestatusclassifier VALUES (31, '06', 'отозван');
INSERT INTO accreditationcertificatestatusclassifier VALUES (32, '07', 'аннулирован');
INSERT INTO accreditationcertificatestatusclassifier VALUES (33, '08', 'погашен');


--
-- TOC entry 4505 (class 0 OID 18679)
-- Dependencies: 199
-- Data for Name: additionalparamsforcustomsfeesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (15, '111', 'КУБИЧЕСКИЙ САНТИМЕТР', 'СМ3', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (16, '117', 'Тонна полной массы', 'ТПМ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (17, '118', 'Метр кубический внутреннего объема кузова', 'М3ВОК', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (18, '168', 'ТОННА, МЕТРИЧЕСКАЯ ТОННА (1000 КГ)', 'Т', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (19, '214', 'КИЛОВАТТ', 'КВТ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (20, '251', 'ЛОШАДИНАЯ СИЛА', 'Л.С.', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (21, '111', 'КУБИЧЕСКИЙ САНТИМЕТР', 'СМ3', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (22, '117', 'Тонна полной массы', 'ТПМ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (23, '118', 'Метр кубический внутреннего объема кузова', 'М3ВОК', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (24, '168', 'ТОННА, МЕТРИЧЕСКАЯ ТОННА (1000 КГ)', 'Т', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (25, '214', 'КИЛОВАТТ', 'КВТ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (26, '251', 'ЛОШАДИНАЯ СИЛА', 'Л.С.', NULL, NULL);


--
-- TOC entry 4507 (class 0 OID 18687)
-- Dependencies: 201
-- Data for Name: addresskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO addresskindclassifier VALUES (1, '1', 'Адрес регистрации');
INSERT INTO addresskindclassifier VALUES (2, '2', 'Фактический адрес');
INSERT INTO addresskindclassifier VALUES (3, '3', 'Почтовый адрес');


--
-- TOC entry 4509 (class 0 OID 18695)
-- Dependencies: 203
-- Data for Name: bankidentitykindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4511 (class 0 OID 18703)
-- Dependencies: 205
-- Data for Name: biologicalsexclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4513 (class 0 OID 18711)
-- Dependencies: 207
-- Data for Name: brakingsystemtypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO brakingsystemtypeclassifier VALUES (1, '04', 'вспомогательная (износостойкая)', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (2, '01', 'рабочая', '2', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (3, '03', 'стояночная', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (4, '01', 'рабочая', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (5, '01', 'рабочая', '1', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (6, '03', 'стояночная', '2', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (7, '03', 'стояночная', '1', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (8, '02', 'запасная', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (9, '02', 'запасная', '1', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (10, '02', 'запасная', '2', NULL, NULL);


--
-- TOC entry 4515 (class 0 OID 18719)
-- Dependencies: 209
-- Data for Name: businessentitytypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO businessentitytypeclassifier VALUES (1, '20610', 'Нотариальные палаты');
INSERT INTO businessentitytypeclassifier VALUES (2, '65000', 'Унитарные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (3, '65242', 'Государственные унитарные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (4, '65241', 'Федеральные государственные унитарные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (5, '20211', 'Органы общественной самодеятельности');
INSERT INTO businessentitytypeclassifier VALUES (6, '65243', 'Муниципальные унитарные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (7, '15300', 'Крестьянские (фермерские) хозяйства');
INSERT INTO businessentitytypeclassifier VALUES (8, '20210', 'Общественные движения');
INSERT INTO businessentitytypeclassifier VALUES (9, '71400', 'Автономные некоммерческие организации');
INSERT INTO businessentitytypeclassifier VALUES (10, '75204', 'Государственные казенные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (11, '20618', 'Ассоциации (союзы) садоводческих, огороднических и дачных некоммерческих объединений');
INSERT INTO businessentitytypeclassifier VALUES (12, '75203', 'Государственные бюджетные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (13, '20617', 'Садоводческие, огороднические или дачные некоммерческие партнерства');
INSERT INTO businessentitytypeclassifier VALUES (14, '3000', 'Хозяйственные партнерства');
INSERT INTO businessentitytypeclassifier VALUES (15, '20616', 'Коллегии адвокатов');
INSERT INTO businessentitytypeclassifier VALUES (16, '75201', 'Государственные автономные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (17, '20615', 'Адвокатские бюро');
INSERT INTO businessentitytypeclassifier VALUES (18, '20614', 'Некоммерческие партнерства');
INSERT INTO businessentitytypeclassifier VALUES (19, '20217', 'Территориальные общественные самоуправления');
INSERT INTO businessentitytypeclassifier VALUES (20, '20613', 'Объединения фермерских хозяйств');
INSERT INTO businessentitytypeclassifier VALUES (21, '20612', 'Объединения работодателей');
INSERT INTO businessentitytypeclassifier VALUES (22, '20611', 'Торгово-промышленные палаты');
INSERT INTO businessentitytypeclassifier VALUES (23, '20609', 'Адвокатские палаты');
INSERT INTO businessentitytypeclassifier VALUES (24, '20608', 'Союзы потребительских обществ');
INSERT INTO businessentitytypeclassifier VALUES (25, '20104', 'Кредитные потребительские кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (26, '20103', 'Жилищные накопительные кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (27, '20620', 'Объединения (ассоциации и союзы) благотворительных организаций');
INSERT INTO businessentitytypeclassifier VALUES (28, '20102', 'Жилищные или жилищно-строительные кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (29, '20101', 'Гаражные и гаражно-строительные кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (30, '14100', 'Сельскохозяйственные производственные кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (31, '20100', 'Потребительские кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (32, '20109', 'Сельскохозяйственные потребительские перерабатывающие кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (33, '20108', 'Общества взаимного страхования');
INSERT INTO businessentitytypeclassifier VALUES (34, '20107', 'Потребительские общества');
INSERT INTO businessentitytypeclassifier VALUES (35, '20106', 'Кредитные кооперативы второго уровня');
INSERT INTO businessentitytypeclassifier VALUES (36, '20105', 'Кредитные потребительские кооперативы граждан');
INSERT INTO businessentitytypeclassifier VALUES (37, '50200', 'Организационно-правовые формы для деятельности граждан, не отнесенной к предпринимательству');
INSERT INTO businessentitytypeclassifier VALUES (38, '20619', 'Саморегулируемые организации');
INSERT INTO businessentitytypeclassifier VALUES (39, '12200', 'Акционерные общества');
INSERT INTO businessentitytypeclassifier VALUES (40, '50202', 'Нотариусы, занимающиеся частной практикой');
INSERT INTO businessentitytypeclassifier VALUES (41, '50201', 'Адвокаты, учредившие адвокатский кабинет');
INSERT INTO businessentitytypeclassifier VALUES (42, '65143', 'Муниципальные казенные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (43, '65142', 'Казенные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (44, '75505', 'Общественные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (45, '14155', 'Кооперативные хозяйства (коопхозы)');
INSERT INTO businessentitytypeclassifier VALUES (46, '14153', 'Сельскохозяйственные артели (колхозы)');
INSERT INTO businessentitytypeclassifier VALUES (47, '75502', 'Благотворительные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (48, '14154', 'Рыболовецкие артели (колхозы)');
INSERT INTO businessentitytypeclassifier VALUES (49, '75104', 'Федеральные государственные казенные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (50, '75500', 'Частные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (51, '20716', 'Товарищества собственников жилья');
INSERT INTO businessentitytypeclassifier VALUES (52, '75103', 'Федеральные государственные бюджетные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (53, '75101', 'Федеральные государственные автономные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (54, '30002', 'Филиалы юридических лиц');
INSERT INTO businessentitytypeclassifier VALUES (55, '30001', 'Представительства юридических лиц');
INSERT INTO businessentitytypeclassifier VALUES (56, '30004', 'Структурные подразделения обособленных подразделений юридических лиц');
INSERT INTO businessentitytypeclassifier VALUES (57, '30003', 'Обособленные подразделения юридических лиц');
INSERT INTO businessentitytypeclassifier VALUES (58, '30006', 'Простые товарищества');
INSERT INTO businessentitytypeclassifier VALUES (59, '30005', 'Паевые инвестиционные фонды');
INSERT INTO businessentitytypeclassifier VALUES (60, '30008', 'Районные суды, городские суды, межрайонные суды (районные суды)');
INSERT INTO businessentitytypeclassifier VALUES (61, '65141', 'Федеральные казенные предприятия');
INSERT INTO businessentitytypeclassifier VALUES (62, '20202', 'Профсоюзные организации');
INSERT INTO businessentitytypeclassifier VALUES (63, '20201', 'Политические партии');
INSERT INTO businessentitytypeclassifier VALUES (64, '20200', 'Общественные организации');
INSERT INTO businessentitytypeclassifier VALUES (65, '11051', 'Полные товарищества');
INSERT INTO businessentitytypeclassifier VALUES (66, '14200', 'Производственные кооперативы (кроме сельскохозяйственных производственных кооперативов)');
INSERT INTO businessentitytypeclassifier VALUES (67, '20607', 'Союзы (ассоциации) общин малочисленных народов');
INSERT INTO businessentitytypeclassifier VALUES (68, '20606', 'Союзы (ассоциации) общественных объединений');
INSERT INTO businessentitytypeclassifier VALUES (69, '20605', 'Союзы (ассоциации) кооперативов');
INSERT INTO businessentitytypeclassifier VALUES (70, '20604', 'Союзы (ассоциации) кредитных кооперативов');
INSERT INTO businessentitytypeclassifier VALUES (71, '20603', 'Советы муниципальных образований субъектов');
INSERT INTO businessentitytypeclassifier VALUES (72, '20601', 'Ассоциации (союзы) экономического взаимодействия субъектов');
INSERT INTO businessentitytypeclassifier VALUES (73, '20600', 'Ассоциации (союзы)');
INSERT INTO businessentitytypeclassifier VALUES (74, '50101', 'Главы крестьянских (фермерских) хозяйств');
INSERT INTO businessentitytypeclassifier VALUES (75, '50100', 'Организационно-правовые формы для коммерческой деятельности граждан');
INSERT INTO businessentitytypeclassifier VALUES (76, '50102', 'Индивидуальные предприниматели');
INSERT INTO businessentitytypeclassifier VALUES (77, '12267', 'Непубличные акционерные общества');
INSERT INTO businessentitytypeclassifier VALUES (78, '12300', 'Общества с ограниченной ответственностью');
INSERT INTO businessentitytypeclassifier VALUES (79, '71602', 'Государственные компании');
INSERT INTO businessentitytypeclassifier VALUES (80, '65200', 'Унитарные предприятия, основанные на праве хозяйственного ведения');
INSERT INTO businessentitytypeclassifier VALUES (81, '71600', 'Публично-правовые компании');
INSERT INTO businessentitytypeclassifier VALUES (82, '71601', 'Государственные корпорации');
INSERT INTO businessentitytypeclassifier VALUES (83, '75404', 'Муниципальные казенные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (84, '75403', 'Муниципальные бюджетные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (85, '75401', 'Муниципальные автономные учреждения');
INSERT INTO businessentitytypeclassifier VALUES (86, '75400', 'Учреждения, созданные муниципальным образованием (муниципальные учреждения)');
INSERT INTO businessentitytypeclassifier VALUES (87, '75000', 'Учреждения');
INSERT INTO businessentitytypeclassifier VALUES (88, '70402', 'Негосударственные пенсионные фонды');
INSERT INTO businessentitytypeclassifier VALUES (89, '70401', 'Благотворительные фонды');
INSERT INTO businessentitytypeclassifier VALUES (90, '70404', 'Экологические фонды');
INSERT INTO businessentitytypeclassifier VALUES (91, '70403', 'Общественные фонды');
INSERT INTO businessentitytypeclassifier VALUES (92, '71610', 'Отделения иностранных некоммерческих неправительственных организаций');
INSERT INTO businessentitytypeclassifier VALUES (93, '12000', 'Хозяйственные общества');
INSERT INTO businessentitytypeclassifier VALUES (94, '70400', 'Фонды');
INSERT INTO businessentitytypeclassifier VALUES (95, '20701', 'Садоводческие, огороднические или дачные некоммерческие товарищества');
INSERT INTO businessentitytypeclassifier VALUES (96, '20700', 'Товарищества собственников недвижимости');
INSERT INTO businessentitytypeclassifier VALUES (97, '12247', 'Публичные акционерные общества');
INSERT INTO businessentitytypeclassifier VALUES (98, '20115', 'Сельскохозяйственные потребительские животноводческие кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (99, '20114', 'Сельскохозяйственные потребительские огороднические кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (100, '20113', 'Сельскохозяйственные потребительские садоводческие кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (101, '20112', 'Сельскохозяйственные потребительские снабженческие кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (102, '65100', 'Унитарные предприятия, основанные на праве оперативного управления (казенные предприятия)');
INSERT INTO businessentitytypeclassifier VALUES (103, '20111', 'Сельскохозяйственные потребительские обслуживающие кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (104, '19000', 'Прочие юридические лица, являющиеся коммерческими организациями');
INSERT INTO businessentitytypeclassifier VALUES (105, '20110', 'Сельскохозяйственные потребительские сбытовые (торговые) кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (106, '40002', 'Неправительственные международные организации');
INSERT INTO businessentitytypeclassifier VALUES (107, '71500', 'Религиозные организации');
INSERT INTO businessentitytypeclassifier VALUES (108, '40001', 'Межправительственные международные организации');
INSERT INTO businessentitytypeclassifier VALUES (109, '75300', 'Государственные академии наук');
INSERT INTO businessentitytypeclassifier VALUES (110, '11000', 'Хозяйственные товарищества');
INSERT INTO businessentitytypeclassifier VALUES (111, '20121', 'Фонды проката');
INSERT INTO businessentitytypeclassifier VALUES (112, '20120', 'Садоводческие, огороднические или дачные потребительские кооперативы');
INSERT INTO businessentitytypeclassifier VALUES (113, '14000', 'Производственные кооперативы (артели) ');


--
-- TOC entry 4517 (class 0 OID 18727)
-- Dependencies: 211
-- Data for Name: businessentitytypecodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO businessentitytypecodeclassifier VALUES (1, '11000', 'Хозяйственные товарищества');
INSERT INTO businessentitytypecodeclassifier VALUES (2, '11051', 'Полные товариществ');
INSERT INTO businessentitytypecodeclassifier VALUES (3, '12000', 'Хозяйственные общества');
INSERT INTO businessentitytypecodeclassifier VALUES (4, '12200', 'Акционерные общества');
INSERT INTO businessentitytypecodeclassifier VALUES (5, '12247', 'Публичные акционерные общества');
INSERT INTO businessentitytypecodeclassifier VALUES (6, '12267', 'Непубличные акционерные общества');
INSERT INTO businessentitytypecodeclassifier VALUES (7, '12300', 'Общества с ограниченной ответственностью');
INSERT INTO businessentitytypecodeclassifier VALUES (8, '14000', 'Производственные кооперативы (артели)');
INSERT INTO businessentitytypecodeclassifier VALUES (9, '14100', 'Сельскохозяйственные производственные кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (10, '14153', 'Сельскохозяйственные артели (колхозы)');
INSERT INTO businessentitytypecodeclassifier VALUES (11, '14154', 'Рыболовецкие артели (колхозы)');
INSERT INTO businessentitytypecodeclassifier VALUES (12, '14155', 'Кооперативные хозяйства (коопхозы)');
INSERT INTO businessentitytypecodeclassifier VALUES (13, '14200', 'Производственные кооперативы (кроме сельскохозяйственных производственных кооперативов)');
INSERT INTO businessentitytypecodeclassifier VALUES (14, '15300', 'Крестьянские (фермерские) хозяйства');
INSERT INTO businessentitytypecodeclassifier VALUES (15, '19000', 'Прочие юридические лица, являющиеся коммерческими организациями');
INSERT INTO businessentitytypecodeclassifier VALUES (16, '20100', 'Потребительские кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (17, '20101', 'Гаражные и гаражно-строительные кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (18, '20102', 'Жилищные или жилищно-строительные кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (19, '20103', 'Жилищные накопительные кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (20, '20104', 'Кредитные потребительские кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (21, '20105', 'Кредитные потребительские кооперативы граждан');
INSERT INTO businessentitytypecodeclassifier VALUES (22, '20106', 'Кредитные кооперативы второго уровня');
INSERT INTO businessentitytypecodeclassifier VALUES (23, '20107', 'Потребительские общества');
INSERT INTO businessentitytypecodeclassifier VALUES (24, '20108', 'Общества взаимного страхования');
INSERT INTO businessentitytypecodeclassifier VALUES (25, '20109', 'Сельскохозяйственные потребительские перерабатывающие кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (26, '20110', 'Сельскохозяйственные потребительские сбытовые (торговые) кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (27, '20111', 'Сельскохозяйственные потребительские обслуживающие кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (28, '20112', 'Сельскохозяйственные потребительские снабженческие кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (29, '20113', 'Сельскохозяйственные потребительские садоводческие кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (30, '20114', 'Сельскохозяйственные потребительские огороднические кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (31, '20115', 'Сельскохозяйственные потребительские животноводческие кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (32, '20120', 'Садоводческие, огороднические или дачные потребительские кооперативы');
INSERT INTO businessentitytypecodeclassifier VALUES (33, '20121', 'Фонды проката');
INSERT INTO businessentitytypecodeclassifier VALUES (34, '20200', 'Общественные организации');
INSERT INTO businessentitytypecodeclassifier VALUES (35, '20201', 'Политические партии');
INSERT INTO businessentitytypecodeclassifier VALUES (36, '20202', 'Профсоюзные организации');
INSERT INTO businessentitytypecodeclassifier VALUES (37, '20210', 'Общественные движения');
INSERT INTO businessentitytypecodeclassifier VALUES (38, '20211', 'Органы общественной самодеятельности');
INSERT INTO businessentitytypecodeclassifier VALUES (39, '20217', 'Территориальные общественные самоуправления');
INSERT INTO businessentitytypecodeclassifier VALUES (40, '20600', 'Ассоциации (союзы)');
INSERT INTO businessentitytypecodeclassifier VALUES (41, '20601', 'Ассоциации (союзы) экономического взаимодействия субъектов');
INSERT INTO businessentitytypecodeclassifier VALUES (42, '20603', 'Советы муниципальных образований субъектов');
INSERT INTO businessentitytypecodeclassifier VALUES (43, '20604', 'Союзы (ассоциации) кредитных кооперативов');
INSERT INTO businessentitytypecodeclassifier VALUES (44, '20605', 'Союзы (ассоциации) кооперативов');
INSERT INTO businessentitytypecodeclassifier VALUES (45, '20606', 'Союзы (ассоциации) общественных объединений');
INSERT INTO businessentitytypecodeclassifier VALUES (46, '20607', 'Союзы (ассоциации) общин малочисленных народов');
INSERT INTO businessentitytypecodeclassifier VALUES (47, '20608', 'Союзы потребительских обществ');
INSERT INTO businessentitytypecodeclassifier VALUES (48, '20609', 'Адвокатские палаты');
INSERT INTO businessentitytypecodeclassifier VALUES (49, '20610', 'Нотариальные палаты');
INSERT INTO businessentitytypecodeclassifier VALUES (50, '20611', 'Торгово-промышленные палаты');
INSERT INTO businessentitytypecodeclassifier VALUES (51, '20612', 'Объединения работодателей');
INSERT INTO businessentitytypecodeclassifier VALUES (52, '20613', 'Объединения фермерских хозяйств');
INSERT INTO businessentitytypecodeclassifier VALUES (53, '20614', 'Некоммерческие партнерства');
INSERT INTO businessentitytypecodeclassifier VALUES (54, '20615', 'Адвокатские бюро');
INSERT INTO businessentitytypecodeclassifier VALUES (55, '20616', 'Коллегии адвокатов');
INSERT INTO businessentitytypecodeclassifier VALUES (56, '20617', 'Садоводческие, огороднические или дачные некоммерческие партнерства');
INSERT INTO businessentitytypecodeclassifier VALUES (57, '20618', 'Ассоциации (союзы) садоводческих, огороднических и дачных некоммерческих объединений');
INSERT INTO businessentitytypecodeclassifier VALUES (58, '20619', 'Саморегулируемые организации');
INSERT INTO businessentitytypecodeclassifier VALUES (59, '20620', 'Объединения (ассоциации и союзы) благотворительных организаций');
INSERT INTO businessentitytypecodeclassifier VALUES (60, '20700', 'Товарищества собственников недвижимости');
INSERT INTO businessentitytypecodeclassifier VALUES (61, '20701', 'Садоводческие, огороднические или дачные некоммерческие товарищества');
INSERT INTO businessentitytypecodeclassifier VALUES (62, '20716', 'Товарищества собственников жилья');
INSERT INTO businessentitytypecodeclassifier VALUES (63, '3000', 'Хозяйственные партнерства');
INSERT INTO businessentitytypecodeclassifier VALUES (64, '30001', 'Представительства юридических лиц');
INSERT INTO businessentitytypecodeclassifier VALUES (65, '30002', 'Филиалы юридических лиц');
INSERT INTO businessentitytypecodeclassifier VALUES (66, '30003', 'Обособленные подразделения юридических лиц');
INSERT INTO businessentitytypecodeclassifier VALUES (67, '30004', 'Структурные подразделения обособленных подразделений юридических лиц');
INSERT INTO businessentitytypecodeclassifier VALUES (68, '30005', 'Паевые инвестиционные фонды');
INSERT INTO businessentitytypecodeclassifier VALUES (69, '30006', 'Простые товарищества');
INSERT INTO businessentitytypecodeclassifier VALUES (70, '30008', 'Районные суды, городские суды, межрайонные суды (районные суды)');
INSERT INTO businessentitytypecodeclassifier VALUES (71, '40001', 'Межправительственные международные организации');
INSERT INTO businessentitytypecodeclassifier VALUES (72, '40002', 'Неправительственные международные организации');
INSERT INTO businessentitytypecodeclassifier VALUES (73, '50100', 'Организационно-правовые формы для коммерческой деятельности граждан');
INSERT INTO businessentitytypecodeclassifier VALUES (74, '50101', 'Главы крестьянских (фермерских) хозяйств');
INSERT INTO businessentitytypecodeclassifier VALUES (75, '50102', 'Индивидуальные предприниматели');
INSERT INTO businessentitytypecodeclassifier VALUES (76, '50200', 'Организационно-правовые формы для деятельности граждан, не отнесенной к предпринимательству');
INSERT INTO businessentitytypecodeclassifier VALUES (77, '50201', 'Адвокаты, учредившие адвокатский кабинет');
INSERT INTO businessentitytypecodeclassifier VALUES (78, '50202', 'Нотариусы, занимающиеся частной практикой');
INSERT INTO businessentitytypecodeclassifier VALUES (79, '65000', 'Унитарные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (80, '65100', 'Унитарные предприятия, основанные на праве оперативного управления (казенные предприятия)');
INSERT INTO businessentitytypecodeclassifier VALUES (81, '65141', 'Федеральные казенные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (82, '65142', 'Казенные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (83, '65143', 'Муниципальные казенные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (84, '65200', 'Унитарные предприятия, основанные на праве хозяйственного ведения');
INSERT INTO businessentitytypecodeclassifier VALUES (85, '65241', 'Федеральные государственные унитарные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (86, '65242', 'Государственные унитарные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (87, '65243', 'Муниципальные унитарные предприятия');
INSERT INTO businessentitytypecodeclassifier VALUES (88, '70400', 'Фонды');
INSERT INTO businessentitytypecodeclassifier VALUES (89, '70401', 'Благотворительные фонды');
INSERT INTO businessentitytypecodeclassifier VALUES (90, '70402', 'Негосударственные пенсионные фонды');
INSERT INTO businessentitytypecodeclassifier VALUES (91, '70403', 'Общественные фонды');
INSERT INTO businessentitytypecodeclassifier VALUES (92, '70404', 'Экологические фонды');
INSERT INTO businessentitytypecodeclassifier VALUES (93, '71400', 'Автономные некоммерческие организации');
INSERT INTO businessentitytypecodeclassifier VALUES (94, '71500', 'Религиозные организации');
INSERT INTO businessentitytypecodeclassifier VALUES (95, '71600', 'Публично-правовые компании');
INSERT INTO businessentitytypecodeclassifier VALUES (96, '71601', 'Государственные корпорации');
INSERT INTO businessentitytypecodeclassifier VALUES (97, '71602', 'Государственные компании');
INSERT INTO businessentitytypecodeclassifier VALUES (98, '71610', 'Отделения иностранных некоммерческих неправительственных организаций');
INSERT INTO businessentitytypecodeclassifier VALUES (99, '75000', 'Учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (100, '75101', 'Федеральные государственные автономные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (101, '75103', 'Федеральные государственные бюджетные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (102, '75104', 'Федеральные государственные казенные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (103, '75201', 'Государственные автономные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (104, '75203', 'Государственные бюджетные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (105, '75204', 'Государственные казенные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (106, '75300', 'Государственные академии наук');
INSERT INTO businessentitytypecodeclassifier VALUES (107, '75400', 'Учреждения, созданные муниципальным образованием (муниципальные учреждения)');
INSERT INTO businessentitytypecodeclassifier VALUES (108, '75401', 'Муниципальные автономные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (109, '75403', 'Муниципальные бюджетные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (110, '75404', 'Муниципальные казенные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (111, '75500', 'Частные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (112, '75502', 'Благотворительные учреждения');
INSERT INTO businessentitytypecodeclassifier VALUES (113, '75505', 'Общественные учреждения');


--
-- TOC entry 4519 (class 0 OID 18735)
-- Dependencies: 213
-- Data for Name: cargolocationclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO cargolocationclassifier VALUES (1, '11', 'Склад временного хранения', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (2, '21', 'Таможенный склад', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (3, '22', 'Магазин беспошлинной торговли', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (4, '25', 'Свободный склад', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (5, '31', 'Склад получателя товаров', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (6, '60', 'Помещение, открытая площадка и иная территория уполномоченного экономического оператора', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (7, '80', 'Свободная (специальная, особая) экономическая зона', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (8, '41', 'Склад хранения собственных товаров', 'KZ', NULL);
INSERT INTO cargolocationclassifier VALUES (9, '52', 'Транспортное средство', 'KZ', NULL);
INSERT INTO cargolocationclassifier VALUES (10, '92', 'Склад таможенного органа', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (11, '93', 'Отдельные помещения в местах международного почтового обмена', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (12, '94', 'Место хранения неполученного или невостребованного багажа, перемещаемого в рамках договора авиационной или железнодорожной перевозки пассажира', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (13, '95', 'Место разгрузки и перегрузки (перевалки) товаров в пределах территории морского (речного) порта', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (14, '96', 'Специально оборудованное место разгрузки и перегрузки (перевалки) иностранных товаров в пределах режимной территории аэропорта при условии, что место ввоза таких товаров в Российскую Федерацию и место их вывоза из Российской Федерации совпадают', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (15, '97', 'Железнодорожные пути и контейнерные площадки, расположенные в согласованных с таможенными органами местах в пределах железнодорожных станций и предназначенные для временного хранения товаров без их выгрузки из транспортных средств', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (16, '99', 'Иное место нахождения товаров', NULL, NULL);


--
-- TOC entry 4521 (class 0 OID 18743)
-- Dependencies: 215
-- Data for Name: cargopackagekindsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO cargopackagekindsclassifier VALUES (1, '1A', 'Барабан стальной', 'Drum, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (2, '1B', 'Барабан, алюминиевый', 'Drum, aluminium', '');
INSERT INTO cargopackagekindsclassifier VALUES (3, '1D', 'Барабан фанерный', 'Drum, plywood', '');
INSERT INTO cargopackagekindsclassifier VALUES (4, '1F', 'Контейнер, гибкий', 'Container, flexible', '');
INSERT INTO cargopackagekindsclassifier VALUES (5, '1G', 'Барабан фибровый', 'Drum, fibre', '');
INSERT INTO cargopackagekindsclassifier VALUES (6, '1W', 'Барабан, деревянный', 'Drum, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (7, '2C', 'Бочка (емкостью около 164 л) деревянная', 'Barrel, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (8, '3A', 'Канистра, стальная', 'Jerrycan, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (9, '3H', 'Канистра, пластмассовая', 'Jerrycan, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (10, '43', 'Мешок большой для крупноразмерных навалочных грузов', 'Bag, super bulk', '');
INSERT INTO cargopackagekindsclassifier VALUES (11, '44', 'Мешок полиэтиленовый', 'Bag, polybag', '');
INSERT INTO cargopackagekindsclassifier VALUES (12, '4A', 'Коробка, стальная', 'Box, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (13, '4B', 'Коробка, алюминиевая', 'Box, aluminium', '');
INSERT INTO cargopackagekindsclassifier VALUES (14, '4C', 'Коробка из естественной древесины', 'Box, natural wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (15, '4D', 'Коробка, фанерная', 'Box, plywood', '');
INSERT INTO cargopackagekindsclassifier VALUES (16, '4F', 'Коробка из древесного материала', 'Box, reconstituted wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (17, '4G', 'Коробка из фибрового картона', 'Box, fibreboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (18, '4H', 'Коробка, пластмассовая', 'Box, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (19, '5H', 'Мешок из полимерной ткани', 'Bag, woven plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (20, '5L', 'Мешок текстильный', 'Bag, textile', '');
INSERT INTO cargopackagekindsclassifier VALUES (21, '5M', 'Мешок, бумажный', 'Bag, paper', '');
INSERT INTO cargopackagekindsclassifier VALUES (22, '6H', 'Комбинированная упаковка: пластмассовый сосуд', 'Composite packaging, plastic receptacle', '');
INSERT INTO cargopackagekindsclassifier VALUES (23, '6P', 'Комбинированная упаковка: стеклянный сосуд', 'Composite packaging, glass receptacle', '');
INSERT INTO cargopackagekindsclassifier VALUES (24, '7A', 'Ящик автомобильный', 'Case, car', '');
INSERT INTO cargopackagekindsclassifier VALUES (25, '7B', 'Ящик деревянный', 'Case, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (26, '8A', 'Поддон деревянный', 'Pallet, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (27, '8B', 'Ящик деревянный', 'Crate, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (28, '8C', 'Пачка деревянная', 'Bundle, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (29, 'AA', 'Контейнер средней грузоподъемности для массовых грузов из жесткой пластмассы', 'Intermediate bulk container, rigid plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (30, 'AB', 'Сосуд, фибровый', 'Receptacle, fibre', '');
INSERT INTO cargopackagekindsclassifier VALUES (31, 'AC', 'Сосуд, бумажный', 'Receptacle, paper', '');
INSERT INTO cargopackagekindsclassifier VALUES (32, 'AD', 'Сосуд, деревянный', 'Receptacle, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (33, 'AE', 'Аэрозольная упаковка', 'Aerosol', '');
INSERT INTO cargopackagekindsclassifier VALUES (34, 'AF', 'Поддон модульный с обечайкой 80 x 60 см', 'Pallet, modular, collars 80 cm x 60 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (35, 'AG', 'Поддон в термоусадочной пленке', 'Pallet, shrink-wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (36, 'AH', 'Поддон 100 x 110 см', 'Pallet, 100 cm x 110 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (37, 'AI', 'Грейферный ковш', 'Clamshell', '');
INSERT INTO cargopackagekindsclassifier VALUES (38, 'AJ', 'Кулек', 'Cone', '');
INSERT INTO cargopackagekindsclassifier VALUES (39, 'AL', 'Шар', 'Ball', '');
INSERT INTO cargopackagekindsclassifier VALUES (40, 'AM', 'Ампула, незащищенная', 'Ampoule, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (41, 'AP', 'Ампула, защищенная', 'Ampoule, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (42, 'AT', 'Пульверизатор', 'Atomizer', '');
INSERT INTO cargopackagekindsclassifier VALUES (43, 'AV', 'Капсула', 'Capsule', '');
INSERT INTO cargopackagekindsclassifier VALUES (44, 'B4', 'Лента', 'Belt', '');
INSERT INTO cargopackagekindsclassifier VALUES (45, 'BA', 'Бочка (емкостью около 164 л)', 'Barrel', '');
INSERT INTO cargopackagekindsclassifier VALUES (46, 'BB', 'Бобина', 'Bobbin', '');
INSERT INTO cargopackagekindsclassifier VALUES (47, 'BC', 'Ящик решетчатый для бутылок', 'Bottlecrate/bottlerack', '');
INSERT INTO cargopackagekindsclassifier VALUES (48, 'BD', 'Доска', 'Board', '');
INSERT INTO cargopackagekindsclassifier VALUES (49, 'BE', 'Пакет (пачка/связка)', 'Bundle', '');
INSERT INTO cargopackagekindsclassifier VALUES (50, 'BF', 'Баллон, незащищенный', 'Balloon, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (51, 'BG', 'Мешок', 'Bag', '');
INSERT INTO cargopackagekindsclassifier VALUES (52, 'BH', 'Пачка (пакет/связка)', 'Bunch', '');
INSERT INTO cargopackagekindsclassifier VALUES (53, 'BI', 'Бункер', 'Bin', '');
INSERT INTO cargopackagekindsclassifier VALUES (54, 'BJ', 'Бадья', 'Bucket', '');
INSERT INTO cargopackagekindsclassifier VALUES (55, 'BK', 'Корзина', 'Basket', '');
INSERT INTO cargopackagekindsclassifier VALUES (56, 'BL', 'Кипа, спрессованная', 'Bale, compressed', '');
INSERT INTO cargopackagekindsclassifier VALUES (57, 'BM', 'Чан', 'Basin', '');
INSERT INTO cargopackagekindsclassifier VALUES (58, 'BN', 'Кипа, неспрессованная', 'Bale, non-compressed', '');
INSERT INTO cargopackagekindsclassifier VALUES (59, 'BO', 'Бутылка цилиндрическая незащищенная', 'Bottle, non-protected, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (60, 'BP', 'Баллон, защищенный', 'Balloon, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (61, 'BQ', 'Бутылка цилиндрическая защищенная', 'Bottle, protected cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (62, 'BR', 'Брус (брусок)', 'Bar', '');
INSERT INTO cargopackagekindsclassifier VALUES (63, 'BS', 'Бутылка с выпуклыми стенками незащищенная', 'Bottle, non-protected, bulbous', '');
INSERT INTO cargopackagekindsclassifier VALUES (64, 'BT', 'Рулон (обивочного или настилочного материала)', 'Bolt', '');
INSERT INTO cargopackagekindsclassifier VALUES (65, 'BU', 'Бочка для вина или пива', 'Butt', '');
INSERT INTO cargopackagekindsclassifier VALUES (66, 'BV', 'Бутылка с выпуклыми стенками защищенная', 'Bottle, protected bulbous', '');
INSERT INTO cargopackagekindsclassifier VALUES (67, 'BW', 'Коробка для жидкостей', 'Box, for liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (68, 'BX', 'Коробка', 'Box', '');
INSERT INTO cargopackagekindsclassifier VALUES (69, 'BY', 'Доска в пакете/пачке/связке', 'Board, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (70, 'BZ', 'Брус (брусок) в пакете/пачке/связке', 'Bars, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (71, 'CA', 'Банка (емкостью менее 5 л) жестяная прямоугольная', 'Can, rectangular', '');
INSERT INTO cargopackagekindsclassifier VALUES (72, 'CB', 'Ящик решетчатый для пива', 'Crate, beer', '');
INSERT INTO cargopackagekindsclassifier VALUES (73, 'CC', 'Бидон', 'Churn', '');
INSERT INTO cargopackagekindsclassifier VALUES (74, 'CD', 'Банка (емкостью менее 5 л) жестяная с ручкой и выпускным отверстием', 'Can, with handle and spout', '');
INSERT INTO cargopackagekindsclassifier VALUES (75, 'CE', 'Корзина, рыбацкая', 'Creel', '');
INSERT INTO cargopackagekindsclassifier VALUES (76, 'CF', 'Кофр', 'Coffer', '');
INSERT INTO cargopackagekindsclassifier VALUES (77, 'CG', 'Клеть', 'Cage', '');
INSERT INTO cargopackagekindsclassifier VALUES (78, 'CH', 'Сундук', 'Chest', '');
INSERT INTO cargopackagekindsclassifier VALUES (79, 'CI', 'Банка жестяная для сухих продуктов (массой до 2,2 кг)', 'Canister', '');
INSERT INTO cargopackagekindsclassifier VALUES (80, 'CJ', 'Гроб', 'Coffin', '');
INSERT INTO cargopackagekindsclassifier VALUES (81, 'CK', 'Бочка', 'Cask', '');
INSERT INTO cargopackagekindsclassifier VALUES (82, 'CL', 'Бухта', 'Coil', '');
INSERT INTO cargopackagekindsclassifier VALUES (83, 'CM', 'Кардная лента', 'Card', '');
INSERT INTO cargopackagekindsclassifier VALUES (84, 'CN', 'Контейнер, прочее транспортировочное оборудование, кроме поименованного', 'Container, not otherwise specified as transport equipment', '');
INSERT INTO cargopackagekindsclassifier VALUES (234, 'RO', 'Рулон (полосового материала)', 'Roll', '');
INSERT INTO cargopackagekindsclassifier VALUES (85, 'CO', 'Бутыль оплетенная незащищенная', 'Carboy, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (86, 'CP', 'Бутыль оплетенная защищенная', 'Carboy, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (87, 'CQ', 'Кассета', 'Cartridge', '');
INSERT INTO cargopackagekindsclassifier VALUES (88, 'CR', 'Ящик, решетчатый (или обрешетка)', 'Crate', '');
INSERT INTO cargopackagekindsclassifier VALUES (89, 'CS', 'Ящик', 'Case', '');
INSERT INTO cargopackagekindsclassifier VALUES (90, 'CT', 'Коробка, картонная', 'Carton', '');
INSERT INTO cargopackagekindsclassifier VALUES (91, 'CU', 'Чаша', 'Cup', '');
INSERT INTO cargopackagekindsclassifier VALUES (92, 'CV', 'Чехол', 'Cover', '');
INSERT INTO cargopackagekindsclassifier VALUES (93, 'CW', 'Клеть, роликовая', 'Cage, roll', '');
INSERT INTO cargopackagekindsclassifier VALUES (94, 'CX', 'Банка (емкостью менее 5 л) жестяная цилиндрическая', 'Can, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (95, 'CY', 'Цилиндр', 'Cylinder', '');
INSERT INTO cargopackagekindsclassifier VALUES (96, 'CZ', 'Брезент', 'Canvas', '');
INSERT INTO cargopackagekindsclassifier VALUES (97, 'DA', 'Ящик решетчатый (или обрешетка) многослойный пластмассовый', 'Crate, multiple layer, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (98, 'DB', 'Ящик решетчатый (или обрешетка) многослойный деревянный', 'Crate, multiple layer, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (99, 'DC', 'Ящик решетчатый (или обрешетка) многослойный картонный', 'Crate, multiple layer, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (100, 'DG', 'Клеть (многооборотная) Общего фонда транспортировочного оборудования EC', 'Cage, Commonwealth Handling Equipment Pool (CHEP)', '');
INSERT INTO cargopackagekindsclassifier VALUES (101, 'DH', 'Коробка (многооборотная) из Общего фонда транспортировочного оборудования ЕС, Еврокоробка', 'Box, Commonwealth Handling Equipment Pool (CHEP), Eurobox', '');
INSERT INTO cargopackagekindsclassifier VALUES (102, 'DI', 'Барабан, железный', 'Drum, iron', '');
INSERT INTO cargopackagekindsclassifier VALUES (103, 'DJ', 'Бутыль оплетенная большая (емкостью от 9 до 54 л) незащищенная', 'Demijohn, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (104, 'DK', 'Ящик решетчатый для массовых грузов картонный', 'Crate, bulk, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (105, 'DL', 'Ящик решетчатый для массовых грузов пластмассовый', 'Crate, bulk, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (106, 'DM', 'Ящик решетчатый для массовых грузов деревянный', 'Crate, bulk, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (107, 'DN', 'Дозатор', 'Dispenser', '');
INSERT INTO cargopackagekindsclassifier VALUES (108, 'DP', 'Бутыль оплетенная большая (емкостью от 9 до 54 л) защищенная', 'Demijohn, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (109, 'DR', 'Барабан', 'Drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (110, 'DS', 'Лоток с одним настилом без покрытия пластмассовый', 'Tray, one layer no cover, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (111, 'DT', 'Лоток с одним настилом без покрытия деревянный', 'Tray, one layer no cover, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (112, 'DU', 'Лоток с одним настилом без покрытия полистироловый', 'Tray, one layer no cover, polystyrene', '');
INSERT INTO cargopackagekindsclassifier VALUES (113, 'DV', 'Лоток с одним настилом без покрытия картонный', 'Tray, one layer no cover, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (114, 'DW', 'Лоток с двумя настилами без покрытия пластмассовый', 'Tray, two layers no cover, plastic tray', '');
INSERT INTO cargopackagekindsclassifier VALUES (115, 'DX', 'Лоток с двумя настилами без покрытия деревянный', 'Tray, two layers no cover, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (116, 'DY', 'Лоток с двумя настилами без покрытия картонный', 'Tray, two layers no cover, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (117, 'EC', 'Мешок, пластмассовый', 'Bag, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (118, 'ED', 'Ящик с поддоном', 'Case, with pallet base', '');
INSERT INTO cargopackagekindsclassifier VALUES (119, 'EE', 'Ящик с поддоном деревянный', 'Case, with pallet base, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (120, 'EF', 'Ящик с поддоном картонный', 'Case, with pallet base, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (121, 'EG', 'Ящик с поддоном пластмассовый', 'Case, with pallet base, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (122, 'EH', 'Ящик с поддоном металлический', 'Case, with pallet base, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (123, 'EI', 'Ящик, изотермический', 'Case, isothermic', '');
INSERT INTO cargopackagekindsclassifier VALUES (124, 'EN', 'Конверт', 'Envelope', '');
INSERT INTO cargopackagekindsclassifier VALUES (125, 'FC', 'Ящик решетчатый для фруктов', 'Crate, fruit', '');
INSERT INTO cargopackagekindsclassifier VALUES (126, 'FD', 'Ящик решетчатый (или обрешетка) рамный', 'Crate, framed', '');
INSERT INTO cargopackagekindsclassifier VALUES (127, 'FE', 'Мягкий мешок, Гибкая цистерна', 'Flexitank, Flexibag', '');
INSERT INTO cargopackagekindsclassifier VALUES (128, 'FI', 'Бочонок (емкостью около 41 л)', 'Firkin', '');
INSERT INTO cargopackagekindsclassifier VALUES (129, 'FL', 'Фляга', 'Flask', '');
INSERT INTO cargopackagekindsclassifier VALUES (130, 'FO', 'Сундучок', 'Footlocker', '');
INSERT INTO cargopackagekindsclassifier VALUES (131, 'FP', 'Кассета с пленкой (фильмпак)', 'Filmpack', '');
INSERT INTO cargopackagekindsclassifier VALUES (132, 'FR', 'Рама', 'Frame', '');
INSERT INTO cargopackagekindsclassifier VALUES (133, 'FT', 'Контейнер для пищевых продуктов', 'Foodtainer', '');
INSERT INTO cargopackagekindsclassifier VALUES (134, 'FX', 'Мешок, гибкий контейнер', 'Bag, flexible container', '');
INSERT INTO cargopackagekindsclassifier VALUES (135, 'GB', 'Баллон, газовый', 'Bottle, gas', '');
INSERT INTO cargopackagekindsclassifier VALUES (136, 'GI', 'Балка', 'Girder', '');
INSERT INTO cargopackagekindsclassifier VALUES (137, 'GL', 'Контейнер, галлон', 'Container, gallon', '');
INSERT INTO cargopackagekindsclassifier VALUES (138, 'GR', 'Сосуд, стеклянный', 'Receptacle, glass', '');
INSERT INTO cargopackagekindsclassifier VALUES (139, 'GY', 'Мешок из мешковины', 'Bag, gunny', '');
INSERT INTO cargopackagekindsclassifier VALUES (140, 'GZ', 'Балка в пакете/пачке/связке', 'Girders, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (141, 'HA', 'Корзина с ручкой, пластмассовая', 'Basket, with handle, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (142, 'HB', 'Корзина с ручкой из древесины', 'Basket, with handle, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (143, 'HC', 'Корзина с ручкой, картонная', 'Basket, with handle, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (144, 'HG', 'Бочка емкостью 238 л (хогсхед)', 'Hogshead', '');
INSERT INTO cargopackagekindsclassifier VALUES (145, 'HN', 'Крюк', 'Hanger', '');
INSERT INTO cargopackagekindsclassifier VALUES (146, 'HR', 'Корзина с крышкой', 'Hamper', '');
INSERT INTO cargopackagekindsclassifier VALUES (147, 'IA', 'Упаковка демонстрационная деревянная', 'Package, display, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (148, 'IB', 'Упаковка демонстрационная картонная', 'Package, display, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (149, 'IC', 'Упаковка демонстрационная пластмассовая', 'Package, display, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (150, 'ID', 'Упаковка демонстрационная металлическая', 'Package, display, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (151, 'IE', 'Упаковка, выставочная', 'Package, show', '');
INSERT INTO cargopackagekindsclassifier VALUES (152, 'IF', 'Упаковка, выпрессованная', 'Package, flow', '');
INSERT INTO cargopackagekindsclassifier VALUES (153, 'IG', 'Упаковка в оберточной бумаге', 'Package, paper wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (154, 'IH', 'Барабан, пластмассовый', 'Drum, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (155, 'IK', 'Упаковка картонная с отверстиями для бутылок', 'Package, cardboard, with bottle grip-holes', '');
INSERT INTO cargopackagekindsclassifier VALUES (156, 'IN', 'Слиток', 'Ingot', '');
INSERT INTO cargopackagekindsclassifier VALUES (157, 'IZ', 'Слитки в пакете/пачке/связке', 'Ingots, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (158, 'JB', 'Мешок большой,', 'Bag, jumbo', '');
INSERT INTO cargopackagekindsclassifier VALUES (159, 'JC', 'Канистра, прямоугольная', 'Jerrican, rectangular', '');
INSERT INTO cargopackagekindsclassifier VALUES (160, 'JG', 'Кувшин, маленький', 'Jug', '');
INSERT INTO cargopackagekindsclassifier VALUES (161, 'JR', 'Банка широкогорлая (емкостью около 4,5 литров)', 'Jar', '');
INSERT INTO cargopackagekindsclassifier VALUES (162, 'JT', 'Мешок, джутовый', 'Jute bag', '');
INSERT INTO cargopackagekindsclassifier VALUES (163, 'JY', 'Канистра, цилиндрическая', 'Jerrican, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (164, 'KG', 'Бочонок (емкостью около 46 л)', 'Keg', '');
INSERT INTO cargopackagekindsclassifier VALUES (165, 'KI', 'Набор', 'Kit', '');
INSERT INTO cargopackagekindsclassifier VALUES (166, 'LE', 'Багаж', 'Luggage', '');
INSERT INTO cargopackagekindsclassifier VALUES (167, 'LG', 'Бревно', 'Log', '');
INSERT INTO cargopackagekindsclassifier VALUES (168, 'LT', 'Грузовая партия (лот)', 'Lot', '');
INSERT INTO cargopackagekindsclassifier VALUES (169, 'LU', 'Ящик', 'Lug', '');
INSERT INTO cargopackagekindsclassifier VALUES (170, 'LV', 'Короб деревянный (лифтван) размером около 220 см (длина) x 115 см (ширина) x 220 см (высота)', 'Liftvan', '');
INSERT INTO cargopackagekindsclassifier VALUES (171, 'LZ', 'Бревно в пакете/пачке/связке', 'Logs, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (172, 'MA', 'Ящик металлический', 'Crate, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (173, 'MB', 'Пакет бумажный многослойный', 'Bag, multiply', '');
INSERT INTO cargopackagekindsclassifier VALUES (174, 'MC', 'Ящик решетчатый для молока', 'Crate, milk', '');
INSERT INTO cargopackagekindsclassifier VALUES (175, 'ME', 'Контейнер металлический', 'Container, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (176, 'MR', 'Сосуд, металлический', 'Receptacle, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (177, 'MS', 'Мешок (куль) многослойный', 'Sack, multi-wall', '');
INSERT INTO cargopackagekindsclassifier VALUES (178, 'MT', 'Мешок, рогожный', 'Mat', '');
INSERT INTO cargopackagekindsclassifier VALUES (179, 'MW', 'Сосуд с пластмассовым покрытием', 'Receptacle, plastic wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (180, 'MX', 'Спичечный коробок', 'Matchbox', '');
INSERT INTO cargopackagekindsclassifier VALUES (181, 'NE', 'Неупакованный или нерасфасованный', 'Unpacked or unpackaged', '');
INSERT INTO cargopackagekindsclassifier VALUES (182, 'NF', 'Неупакованный или нерасфасованный одноместный груз', 'Unpacked or unpackaged, single unit', '');
INSERT INTO cargopackagekindsclassifier VALUES (183, 'NG', 'Неупакованный или нерасфасованный многоместный груз', 'Unpacked or unpackaged, multiple units', '');
INSERT INTO cargopackagekindsclassifier VALUES (184, 'NS', 'Гнездо (ячейка)', 'Nest', '');
INSERT INTO cargopackagekindsclassifier VALUES (185, 'NT', 'Сетка', 'Net', '');
INSERT INTO cargopackagekindsclassifier VALUES (186, 'NU', 'Сетка трубчатая пластмассовая', 'Net, tube, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (187, 'NV', 'Сетка трубчатая текстильная', 'Net, tube, textile', '');
INSERT INTO cargopackagekindsclassifier VALUES (188, 'OT', 'Октабин', 'Octabin', '');
INSERT INTO cargopackagekindsclassifier VALUES (189, 'OU', 'Контейнер наружный', 'Container, outer', '');
INSERT INTO cargopackagekindsclassifier VALUES (190, 'P2', 'Лоток', 'Pan', '');
INSERT INTO cargopackagekindsclassifier VALUES (191, 'PA', 'Пакет', 'Packet', '');
INSERT INTO cargopackagekindsclassifier VALUES (192, 'PB', 'Поддон, ящичный', 'Pallet, box', '');
INSERT INTO cargopackagekindsclassifier VALUES (193, 'PC', 'Бандероль', 'Parcel', '');
INSERT INTO cargopackagekindsclassifier VALUES (194, 'PD', 'Поддон модульный с обечайкой 80 x 100 см', 'Pallet, modular, collars 80 cm x 100 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (195, 'PE', 'Поддон модульный с обечайкой 80 х 120 см', 'Pallet, modular, collars 80 cm x 120 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (196, 'PF', 'Штабель', 'Pen', '');
INSERT INTO cargopackagekindsclassifier VALUES (197, 'PG', 'Плита', 'Plate', '');
INSERT INTO cargopackagekindsclassifier VALUES (198, 'PH', 'Кувшин, большой', 'Pitcher', '');
INSERT INTO cargopackagekindsclassifier VALUES (199, 'PI', 'Труба', 'Pipe', '');
INSERT INTO cargopackagekindsclassifier VALUES (200, 'PJ', 'Корзина из шпона для ягод и фруктов', 'Punnet', '');
INSERT INTO cargopackagekindsclassifier VALUES (201, 'PK', 'Упаковка', 'Package', '');
INSERT INTO cargopackagekindsclassifier VALUES (202, 'PL', 'Ведро', 'Pail', '');
INSERT INTO cargopackagekindsclassifier VALUES (203, 'PN', 'Доска, толстая', 'Plank', '');
INSERT INTO cargopackagekindsclassifier VALUES (204, 'PO', 'Пакет (мешочек)', 'Pouch', '');
INSERT INTO cargopackagekindsclassifier VALUES (205, 'PP', 'Штука', 'Piece', '');
INSERT INTO cargopackagekindsclassifier VALUES (206, 'PR', 'Сосуд, пластмассовый', 'Receptacle, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (207, 'PT', 'Горшок', 'Pot', '');
INSERT INTO cargopackagekindsclassifier VALUES (208, 'PU', 'Лоток', 'Tray', '');
INSERT INTO cargopackagekindsclassifier VALUES (209, 'PV', 'Труба в пакете/пачке/связке', 'Pipes, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (210, 'PX', 'Поддон', 'Pallet', '');
INSERT INTO cargopackagekindsclassifier VALUES (211, 'PY', 'Плиты в пакете/пачке/связке', 'Plates, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (212, 'PZ', 'Доска толстая в пакете/пачке/связке', 'Planks, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (213, 'QA', 'Барабан стальной с несъемным днищем', 'Drum, steel, non - removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (214, 'QB', 'Барабан стальной со съемным днищем', 'Drum, steel, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (215, 'QC', 'Барабан алюминиевый с несъемным днищем', 'Drum, aluminium, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (216, 'QD', 'Барабан алюминиевый со съемным днищем', 'Drum, aluminium, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (217, 'QF', 'Барабан пластмассовый с несъемным днищем', 'Drum, plastic, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (218, 'QG', 'Барабан пластмассовый со съемным днищем', 'Drum, plastic, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (219, 'QH', 'Бочка (емкостью около 164 л) деревянная шпунтованная', 'Barrel, wooden, bung type', '');
INSERT INTO cargopackagekindsclassifier VALUES (220, 'QJ', 'Бочка (емкостью около 164 л) деревянная со съемным днищем', 'Barrel, wooden, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (221, 'QK', 'Канистра стальная с несъемным днищем', 'Jerrican, steel, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (222, 'QL', 'Канистра стальная со съемным днищем', 'Jerrican, steel, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (223, 'QM', 'Канистра пластмассовая с несъемным днищем', 'Jerrican, plastic, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (224, 'QN', 'Канистра пластмассовая со съемным днищем', 'Jerrican, plastic, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (225, 'QP', 'Коробка деревянная из естественной древесины обыкновенная', 'Box, wooden, natural wood, ordinary', '');
INSERT INTO cargopackagekindsclassifier VALUES (226, 'QQ', 'Коробка деревянная из естественной древесины с плотно пригнанными стенками', 'Box, wooden, natural wood, with sift proof walls', '');
INSERT INTO cargopackagekindsclassifier VALUES (227, 'QR', 'Коробка, пенопластовая', 'Box, plastic, expanded', '');
INSERT INTO cargopackagekindsclassifier VALUES (228, 'QS', 'Коробка из твердой пластмассы', 'Box, plastic, solid', '');
INSERT INTO cargopackagekindsclassifier VALUES (229, 'RD', 'Прут', 'Rod', '');
INSERT INTO cargopackagekindsclassifier VALUES (230, 'RG', 'Кольцо', 'Ring', '');
INSERT INTO cargopackagekindsclassifier VALUES (231, 'RJ', 'Стойка, вешалка для одежды', 'Rack, clothing hanger', '');
INSERT INTO cargopackagekindsclassifier VALUES (232, 'RK', 'Стойка', 'Rack', '');
INSERT INTO cargopackagekindsclassifier VALUES (233, 'RL', 'Катушка', 'Reel', '');
INSERT INTO cargopackagekindsclassifier VALUES (235, 'RT', 'Сетка типа используемой для овощей или фруктов', 'Rednet', '');
INSERT INTO cargopackagekindsclassifier VALUES (236, 'RZ', 'Прут в пакете/пачке/связке', 'Rods, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (237, 'SA', 'Мешок (куль)', 'Sack', '');
INSERT INTO cargopackagekindsclassifier VALUES (238, 'SB', 'Сляб', 'Slab', '');
INSERT INTO cargopackagekindsclassifier VALUES (239, 'SC', 'Ящик решетчатый (или обрешетка) мелкий', 'Crate, shallow', '');
INSERT INTO cargopackagekindsclassifier VALUES (240, 'SD', 'Шпиндель', 'Spindle', '');
INSERT INTO cargopackagekindsclassifier VALUES (241, 'SE', 'Сундук, морской', 'Sea-chest', '');
INSERT INTO cargopackagekindsclassifier VALUES (242, 'SH', 'Пакетик', 'Sachet', '');
INSERT INTO cargopackagekindsclassifier VALUES (243, 'SI', 'Стеллаж', 'Skid', '');
INSERT INTO cargopackagekindsclassifier VALUES (244, 'SK', 'Ящик, каркасный', 'Case, skeleton', '');
INSERT INTO cargopackagekindsclassifier VALUES (245, 'SL', 'Лист, прокладной', 'Slipsheet', '');
INSERT INTO cargopackagekindsclassifier VALUES (246, 'SM', 'Лист, металлический', 'Sheet metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (247, 'SO', 'Шпулька', 'Spool', '');
INSERT INTO cargopackagekindsclassifier VALUES (248, 'SP', 'Лист с пластмассовым покрытием', 'Sheet, plastic wrapping', '');
INSERT INTO cargopackagekindsclassifier VALUES (249, 'SS', 'Ящик, стальной', 'Case, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (250, 'ST', 'Лист', 'Sheet', '');
INSERT INTO cargopackagekindsclassifier VALUES (251, 'SU', 'Чемодан', 'Suitcase', '');
INSERT INTO cargopackagekindsclassifier VALUES (252, 'SV', 'Конверт, стальной', 'Envelope, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (253, 'SW', 'В термоусадочной пленке', 'Shrink-wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (254, 'SX', 'Комплект', 'Set', '');
INSERT INTO cargopackagekindsclassifier VALUES (255, 'SY', 'Гильза', 'Sleeve', '');
INSERT INTO cargopackagekindsclassifier VALUES (256, 'SZ', 'Лист в пакете/пачке/связке', 'Sheets, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (257, 'T1', 'Таблетка', 'Tablet', '');
INSERT INTO cargopackagekindsclassifier VALUES (258, 'TB', 'Кадка', 'Tub', '');
INSERT INTO cargopackagekindsclassifier VALUES (259, 'TC', 'Чайная коробка', 'Tea-chest', '');
INSERT INTO cargopackagekindsclassifier VALUES (260, 'TD', 'Трубка или туба, складывающаяся', 'Tube, collapsible', '');
INSERT INTO cargopackagekindsclassifier VALUES (261, 'TE', 'Шина', 'Tyre', '');
INSERT INTO cargopackagekindsclassifier VALUES (262, 'TG', 'Цистерна контейнер универсальный', 'Tank container, generic', '');
INSERT INTO cargopackagekindsclassifier VALUES (263, 'TI', 'Бочка деревянная (емкостью около 200 л)', 'Tierce', '');
INSERT INTO cargopackagekindsclassifier VALUES (264, 'TK', 'Цистерна, прямоугольная', 'Tank, rectangular', '');
INSERT INTO cargopackagekindsclassifier VALUES (265, 'TL', 'Кадка с крышкой', 'Tub, with lid', '');
INSERT INTO cargopackagekindsclassifier VALUES (266, 'TN', 'Банка, жестяная (консервная)', 'Tin', '');
INSERT INTO cargopackagekindsclassifier VALUES (267, 'TO', 'Бочка для вина или пива большая (емкостью около 1146 л) (тан)', 'Tun', '');
INSERT INTO cargopackagekindsclassifier VALUES (268, 'TR', 'Сундук, дорожный', 'Trunk', '');
INSERT INTO cargopackagekindsclassifier VALUES (269, 'TS', 'Связка', 'Truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (270, 'TT', 'Мешок', 'Bag, tote', '');
INSERT INTO cargopackagekindsclassifier VALUES (271, 'TU', 'Трубка или туба', 'Tube', '');
INSERT INTO cargopackagekindsclassifier VALUES (272, 'TV', 'Трубка или туба с насадкой', 'Tube, with nozzle', '');
INSERT INTO cargopackagekindsclassifier VALUES (273, 'TW', 'Поддон', 'Pallet, triwall', '');
INSERT INTO cargopackagekindsclassifier VALUES (274, 'TY', 'Цистерна, цилиндрическая', 'Tank, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (275, 'TZ', 'Трубка или туба в пакете/пачке/связке', 'Tubes, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (276, 'UC', 'Без клети', 'Uncaged', '');
INSERT INTO cargopackagekindsclassifier VALUES (277, 'UN', 'Единица', 'Unit', '');
INSERT INTO cargopackagekindsclassifier VALUES (278, 'VA', 'Бак', 'Vat', '');
INSERT INTO cargopackagekindsclassifier VALUES (279, 'VG', 'Наливом газ (при 1031 мБар и 15°C)', 'Bulk, gas (at 1 031 mbar and 15° C)', '');
INSERT INTO cargopackagekindsclassifier VALUES (280, 'VI', 'Флакон', 'Vial', '');
INSERT INTO cargopackagekindsclassifier VALUES (281, 'VK', 'Консоль для оборудования, помещающаяся в минифургон', 'Vanpack', '');
INSERT INTO cargopackagekindsclassifier VALUES (282, 'VL', 'Наливом жидкость', 'Bulk, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (283, 'VO', 'Насыпью твердые крупные частицы (мелкие куски)', 'Bulk, solid, large particles (nodules)', '');
INSERT INTO cargopackagekindsclassifier VALUES (284, 'VP', 'В вакуумной упаковке', 'Vacuum-packed', '');
INSERT INTO cargopackagekindsclassifier VALUES (285, 'VQ', 'Наливом газ сжиженный (при температуре/давлении, отличающихся от нормальных)', 'Bulk, liquefied gas (at abnormal temperature/pressure)', '');
INSERT INTO cargopackagekindsclassifier VALUES (286, 'VR', 'Насыпью твердые гранулированные частицы (гранулы)', 'Bulk, solid, granular particles (grains)', '');
INSERT INTO cargopackagekindsclassifier VALUES (287, 'VS', 'Навалом металлолом', 'Bulk, scrap metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (288, 'VY', 'Насыпью твердые мелкие частицы (порошки)', 'Bulk, solid, fine particles (powders)', '');
INSERT INTO cargopackagekindsclassifier VALUES (289, 'WA', 'Контейнер средней грузоподъемности для массовых грузов', 'Intermediate bulk container', '');
INSERT INTO cargopackagekindsclassifier VALUES (290, 'WB', 'Бутылка оплетенная', 'Wicker bottle', '');
INSERT INTO cargopackagekindsclassifier VALUES (291, 'WC', 'Контейнер средней грузоподъемности для массовых грузов стальной', 'Intermediate bulk container, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (292, 'WD', 'Контейнер средней грузоподъемности для массовых грузов алюминиевый', 'Intermediate bulk container, aluminium', '');
INSERT INTO cargopackagekindsclassifier VALUES (293, 'WF', 'Контейнер средней грузоподъемности для массовых грузов металлический', 'Intermediate bulk container, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (294, 'WG', 'Контейнер средней грузоподъемности для массовых грузов герметизированный свыше 10 КПа', 'Intermediate bulk container, steel, pressurised  10 kpa', '');
INSERT INTO cargopackagekindsclassifier VALUES (295, 'WH', 'Контейнер средней грузоподъемности для массовых грузов алюминиевый герметизированный свыше 10 КПа', 'Intermediate bulk container, aluminium, pressurised  10 kpa', '');
INSERT INTO cargopackagekindsclassifier VALUES (296, 'WJ', 'Контейнер средней грузоподъемности для массовых грузов герметизированный 10 Кпа', 'Intermediate bulk container, metal, pressure 10 kpa', '');
INSERT INTO cargopackagekindsclassifier VALUES (297, 'WK', 'Контейнер средней грузоподъемности для наливных грузов стальной', 'Intermediate bulk container, steel, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (298, 'WL', 'Контейнер средней грузоподъемности для наливных грузов алюминиевый', 'Intermediate bulk container, aluminium, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (299, 'WM', 'Контейнер средней грузоподъемности для наливных грузов металлический', 'Intermediate bulk container, metal, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (300, 'WN', 'Контейнер средней грузоподъемности для массовых грузов из полимерной ткани без покрытия/вкладыша', 'Intermediate bulk container, woven plastic, without coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (301, 'WP', 'Контейнер средней грузоподъемности для массовых грузов из полимерной ткани с покрытием', 'Intermediate bulk container, woven plastic, coated', '');
INSERT INTO cargopackagekindsclassifier VALUES (302, 'WQ', 'Контейнер средней грузоподъемности для массовых грузов из полимерной ткани с вкладышем', 'Intermediate bulk container, woven plastic, with liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (303, 'WR', 'Контейнер средней грузоподъемности для массовых грузов из пластикового волокна с покрытием и вкладышем', 'Intermediate bulk container, woven plastic, coated and liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (304, 'WS', 'Контейнер средней грузоподъемности для массовых грузов из полимерной пленки', 'Intermediate bulk container, plastic film', '');
INSERT INTO cargopackagekindsclassifier VALUES (305, 'WT', 'Контейнер средней грузоподъемности для массовых грузов текстильный без покрытия/вкладыша', 'Intermediate bulk container, textile without coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (306, 'WU', 'Контейнер средней грузоподъемности для массовых грузов из естественной древесины с внутренним вкладышем', 'Intermediate bulk container, natural wood, with inner liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (307, 'WV', 'Контейнер средней грузоподъемности для массовых грузов текстильный с покрытием', 'Intermediate bulk container, textile, coated', '');
INSERT INTO cargopackagekindsclassifier VALUES (308, 'WW', 'Контейнер средней грузоподъемности для массовых грузов текстильный с вкладышем', 'Intermediate bulk container, textile, with liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (309, 'WX', 'Контейнер средней грузоподъемности для массовых грузов текстильный с покрытием и вкладышем', 'Intermediate bulk container, textile, coated and liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (310, 'WY', 'Контейнер средней грузоподъемности для массовых грузов фанерный с внутренним вкладышем', 'Intermediate bulk container, plywood, with inner liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (311, 'WZ', 'Контейнер средней грузоподъемности для массовых грузов из древесного материала с внутренним вкладышем', 'Intermediate bulk container, reconstituted wood, with inner liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (312, 'XA', 'Мешок из полимерной ткани без внутреннего покрытия/вкладыша', 'Bag, woven plastic, without inner coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (313, 'XB', 'Мешок из полимерной ткани, плотный', 'Bag, woven plastic, sift proof', '');
INSERT INTO cargopackagekindsclassifier VALUES (314, 'XC', 'Мешок из полимерной ткани влагонепроницаемый', 'Bag, woven plastic, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (315, 'XD', 'Мешок из полимерной пленки', 'Bag, plastics film', '');
INSERT INTO cargopackagekindsclassifier VALUES (316, 'XF', 'Мешок текстильный без внутреннего покрытия/вкладыша', 'Bag, textile, without inner coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (317, 'XG', 'Мешок текстильный плотный', 'Bag, textile, sift proof', '');
INSERT INTO cargopackagekindsclassifier VALUES (318, 'XH', 'Мешок текстильный влагонепроницаемый', 'Bag, textile, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (319, 'XJ', 'Мешок бумажный многослойный', 'Bag, paper, multi-wall', '');
INSERT INTO cargopackagekindsclassifier VALUES (320, 'XK', 'Мешок бумажный многослойный влагонепроницаемый', 'Bag, paper, multi-wall, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (321, 'YA', 'Комбинированная упаковка: пластмассовый сосуд в барабане стальном', 'Composite packaging, plastic receptacle in steel drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (322, 'YB', 'Комбинированная упаковка: пластмассовый сосуд в ящике решетчатом (или обрешетке) из стали', 'Composite packaging, plastic receptacle in steel crate box', '');
INSERT INTO cargopackagekindsclassifier VALUES (323, 'YC', 'Комбинированная упаковка: пластмассовый сосуд в барабане алюминиевом', 'Composite packaging, plastic receptacle in aluminium drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (324, 'YD', 'Комбинированная упаковка: пластмассовый сосуд в ящике решетчатом (или обрешетке) из алюминия', 'Composite packaging, plastic receptacle in aluminium crate', '');
INSERT INTO cargopackagekindsclassifier VALUES (325, 'YF', 'Комбинированная упаковка: пластмассовый сосуд в деревянной коробке', 'Composite packaging, plastic receptacle in wooden box', '');
INSERT INTO cargopackagekindsclassifier VALUES (326, 'YH', 'Комбинированная упаковка: пластмассовый сосуд в коробке фанерной', 'Composite packaging, plastic receptacle in plywood box', '');
INSERT INTO cargopackagekindsclassifier VALUES (327, 'YJ', 'Комбинированная упаковка: пластмассовый сосуд в барабане фибровом', 'Composite packaging, plastic receptacle in fibre drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (328, 'YK', 'Комбинированная упаковка: пластмассовый сосуд в коробке из фибрового картона', 'Composite packaging, plastic receptacle in fibreboard box', '');
INSERT INTO cargopackagekindsclassifier VALUES (329, 'YL', 'Комбинированная упаковка: пластмассовый сосуд в барабане пластмассовом', 'Composite packaging, plastic receptacle in plastic drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (330, 'YM', 'Комбинированная упаковка: пластмассовый сосуд в коробке из твердой пластмассы', 'Composite packaging, plastic receptacle in solid plastic box', '');
INSERT INTO cargopackagekindsclassifier VALUES (331, 'YN', 'Комбинированная упаковка: стеклянный сосуд в стальном барабане', 'Composite packaging, glass receptacle in steel drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (332, 'YP', 'Комбинированная упаковка: стеклянный сосуд в ящике решетчатом (или обрешетке) из стали', 'Composite packaging, glass receptacle in steel crate box', '');
INSERT INTO cargopackagekindsclassifier VALUES (333, 'YQ', 'Комбинированная упаковка: стеклянный сосуд в барабане алюминиевом', 'Composite packaging, glass receptacle in aluminium drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (334, 'YR', 'Комбинированная упаковка: стеклянный сосуд в ящике решетчатом (или обрешетке) из алюминия', 'Composite packaging, glass receptacle in aluminium crate', '');
INSERT INTO cargopackagekindsclassifier VALUES (335, 'YS', 'Комбинированная упаковка: стеклянный сосуд в коробке деревянной', 'Composite packaging, glass receptacle in wooden box', '');
INSERT INTO cargopackagekindsclassifier VALUES (336, 'YT', 'Комбинированная упаковка: стеклянный сосуд в барабане фанерном', 'Composite packaging, glass receptacle in plywood drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (337, 'YV', 'Комбинированная упаковка: стеклянный сосуд в корзине плетеной с крышкой', 'Composite packaging, glass receptacle in wickerwork hamper', '');
INSERT INTO cargopackagekindsclassifier VALUES (338, 'YW', 'Комбинированная упаковка: стеклянный сосуд в барабане фибровом', 'Composite packaging, glass receptacle in fibre drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (339, 'YX', 'Комбинированная упаковка: стеклянный сосуд в коробке из фибрового картона', 'Composite packaging, glass receptacle in fibreboard box', '');
INSERT INTO cargopackagekindsclassifier VALUES (340, 'YY', 'Комбинированная упаковка: стеклянный сосуд в пакете пенопластовом', 'Composite packaging, glass receptacle in expandable plastic pack', '');
INSERT INTO cargopackagekindsclassifier VALUES (341, 'YZ', 'Комбинированная упаковка: стеклянный сосуд в пакете из твердой пластмассы', 'Composite packaging, glass receptacle in solid plastic pack', '');
INSERT INTO cargopackagekindsclassifier VALUES (342, 'ZA', 'Контейнер средней грузоподъемности для массовых грузов бумажный многослойный', 'Intermediate bulk container, paper, multi-wall', '');
INSERT INTO cargopackagekindsclassifier VALUES (343, 'ZB', 'Мешок, большой', 'Bag, large', '');
INSERT INTO cargopackagekindsclassifier VALUES (344, 'ZC', 'Контейнер средней грузоподъемности для массовых грузов бумажный многослойный влагонепроницаемый', 'Intermediate bulk container, paper, multi-wall, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (345, 'ZD', 'Контейнер средней грузоподъемности для твердых навалочных/насыпных грузов из жесткой пластмассы с конструкционным оснащением', 'Intermediate bulk container, rigid plastic, with structural equipment, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (346, 'ZF', 'Контейнер средней грузоподъемности для твердых навалочных/насыпных грузов из жесткой пластмассы автономный', 'Intermediate bulk container, rigid plastic, freestanding, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (347, 'ZG', 'Контейнер средней грузоподъемности для массовых грузов из жесткой пластмассы с конструкционным оснащением герметизированный', 'Intermediate bulk container, rigid plastic, with structural equipment, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (348, 'ZH', 'Контейнер средней грузоподъемности для массовых грузов из жесткой пластмассы автономный герметизированный', 'Intermediate bulk container, rigid plastic, freestanding, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (349, 'ZJ', 'Контейнер средней грузоподъемности для наливных грузов из жесткой пластмассы с конструкционным оснащением', 'Intermediate bulk container, rigid plastic, with structural equipment, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (350, 'ZK', 'Контейнер средней грузоподъемности для наливных грузов из жесткой пластмассы автономный', 'Intermediate bulk container, rigid plastic, freestanding, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (351, 'ZL', 'Контейнер средней грузоподъемности для твердых навалочных/насыпных грузов составной из жесткой пластмассы', 'Intermediate bulk container, composite, rigid plastic, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (352, 'ZM', 'Контейнер средней грузоподъемности для твердых навалочных/насыпных грузов составной из гибкой пластмассы', 'Intermediate bulk container, composite, flexible plastic, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (353, 'ZN', 'Контейнер средней грузоподъемности для массовых грузов составной из жесткой пластмассы герметизированный', 'Intermediate bulk container, composite, rigid plastic, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (354, 'ZP', 'Контейнер средней грузоподъемности для массовых грузов составной из гибкой пластмассы герметизированный', 'Intermediate bulk container, composite, flexible plastic, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (355, 'ZQ', 'Контейнер средней грузоподъемности для наливных грузов составной из жесткой пластмассы', 'Intermediate bulk container, composite, rigid plastic, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (356, 'ZR', 'Контейнер средней грузоподъемности для наливных грузов составной из гибкой пластмассы', 'Intermediate bulk container, composite, flexible plastic, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (357, 'ZS', 'Контейнер средней грузоподъемности для массовых грузов составной', 'Intermediate bulk container, composite', '');
INSERT INTO cargopackagekindsclassifier VALUES (358, 'ZT', 'Контейнер средней грузоподъемности для массовых грузов из фибрового картона', 'Intermediate bulk container, fibreboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (359, 'ZU', 'Контейнер средней грузоподъемности для массовых грузов гибкий', 'Intermediate bulk container, flexible', '');
INSERT INTO cargopackagekindsclassifier VALUES (360, 'ZV', 'Контейнер средней грузоподъемности для массовых грузов из прочего металла, кроме стали', 'Intermediate bulk container, metal, other than steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (361, 'ZW', 'Контейнер средней грузоподъемности для массовых грузов из естественной древесины', 'Intermediate bulk container, natural wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (362, 'ZX', 'Контейнер средней грузоподъемности для массовых грузов фанерный', 'Intermediate bulk container, plywood', '');
INSERT INTO cargopackagekindsclassifier VALUES (363, 'ZY', 'Контейнер средней грузоподъемности для массовых грузов из древесного материала', 'Intermediate bulk container, reconstituted wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (364, 'ZZ', 'По взаимному определению', 'Mutually defined', '');


--
-- TOC entry 4523 (class 0 OID 18751)
-- Dependencies: 217
-- Data for Name: certificatioorganizationkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4525 (class 0 OID 18759)
-- Dependencies: 219
-- Data for Name: communicationchannelclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO communicationchannelclassifier VALUES (1, 'TE', 'телефон');
INSERT INTO communicationchannelclassifier VALUES (2, 'FX', 'телефакс');
INSERT INTO communicationchannelclassifier VALUES (3, 'TG', 'телеграф');
INSERT INTO communicationchannelclassifier VALUES (4, 'EM', 'электронная почта');
INSERT INTO communicationchannelclassifier VALUES (5, 'TL', 'телекс');
INSERT INTO communicationchannelclassifier VALUES (6, 'AO', 'адрес сайта в сети Интернет');


--
-- TOC entry 4527 (class 0 OID 18767)
-- Dependencies: 221
-- Data for Name: conformityassessmentdocstypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO conformityassessmentdocstypesclassifier VALUES (1, '05', 'сертификат соответствия требованиям технического регламента Евразийского экономического союза (технического регламента Таможенного союза)', 'сертификат соответствия ТР ЕАЭС', NULL, 'единая форма сертификата соответствия требованиям технического регламента Таможенного союза, утвержденная Решением Коллегии Евразийской экономической комиссии от 25 декабря 2012 г. № 293');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (2, '10', 'декларация о соответствии требованиям технического регламента Евразийского экономического союза (технического регламента Таможенного союза)', 'декларация о соответствии ТР ЕАЭС', NULL, 'единая форма декларации о соответствии требованиям технического регламента Таможенного союза, утвержденная Решением Коллегии Евразийской экономической комиссии от 25 декабря 2012 г. № 293');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (3, '15', 'сертификат соответствия, оформленный по единой форме Евразийского экономического союза', 'сертификат соответствия по единой форме ЕАЭС', NULL, 'Единая форма сертификата соответствия, утвержденная Решением Комиссии Таможенного союза от 18 июня 2010 г. № 319');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (4, '20', 'декларация о соответствии, оформленная по единой форме Евразийского экономического союза', 'декларация о соответствии по единой форме ЕАЭС', NULL, 'Единая форма декларации о соответствии, утвержденная Решением Комиссии Таможенного союза от 18 июня 2010 г. № 319');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (5, '25', 'свидетельство о регистрации (государственной регистрации), подтверждающее соответствие требованиям технических регламентов Евразийского экономического союза (технических регламентов Таможенного союза)', 'свидетельство о регистрации ЕАЭС', NULL, 'Протокол о техническом регулировании в рамках Евразийского экономического союза (приложение № 9 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (6, '30', 'одобрение типа транспортного средства, подтверждающее соответствие требованиям технического регламента Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011)', 'одобрение типа транспортного средства ЕАЭС', NULL, 'одобрение типа транспортного средства (форма) (приложение № 14 к техническому регламенту Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011), принятому Решением Комиссии Таможенного союза от 9 декабря 2011 г. № 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (7, '35', 'одобрение типа шасси, подтверждающее соответствие требованиям технического регламента Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011)', 'одобрение типа шасси ЕАЭС', NULL, 'одобрение типа шасси транспортного средства (форма) (приложение № 15 к техническому регламенту Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011), принятому Решением Комиссии Таможенного союза от 9 декабря 2011 г. № 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (8, '40', 'свидетельство о безопасности конструкции транспортного средства, подтверждающее соответствие требованиям технического регламента Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011)', 'свидетельство о безопасности конструкции транспортного средства ЕАЭС', NULL, 'свидетельство о безопасности конструкции транспортного средства (форма) (приложение № 17 к техническому регламенту Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011), принятому Решением Комиссии Таможенного союза от 9 декабря 2011 г. № 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (9, '45', 'свидетельство о соответствии транспортного средства с внесенными в его конструкцию изменениями требованиям безопасности, подтверждающее соответствие требованиям технического регламента Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011)', 'свидетельство о соответствии с внесенными изменениями ЕАЭС', NULL, 'свидетельство о соответствии транспортного средства с внесенными в его конструкцию изменениями требованиям безопасности (форма) (приложение № 18 к техническому регламенту Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011), принятому Решением Комиссии Таможенного союза от 9 декабря 2011 г. № 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (10, '50', 'документ об оценке соответствия обязательным требованиям, установленным законодательством государства – члена Евразийского экономического союза, выданный в отношении объекта технического регулирования технического регламента Евразийского экономического союза (технического регламента Таможенного союза) до дня вступления в силу этого технического регламента', 'документ об оценке соответствия национальным требованиям', NULL, NULL);


--
-- TOC entry 4529 (class 0 OID 18775)
-- Dependencies: 223
-- Data for Name: countriesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO countriesclassifier VALUES (1, 'RS', 'СЕРБИЯ', 'СЕРБИЯ', '192000000', 'RS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (2, 'MD', 'МОЛДОВА, РЕСПУБЛИКА', 'МОЛДОВА, РЕСПУБЛИКА', '140000000', 'MD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (3, 'GS', 'ЮЖН.ДЖОРДЖИЯ И ЮЖН.САНДВИЧ.ОСТРОВА', 'ЮЖН.ДЖОРДЖИЯ И ЮЖН.САНДВИЧ.ОСТРОВА', '91000000', 'GS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (4, 'CF', 'ЦЕНТРАЛЬНО-АФРИКАНСКАЯ РЕСПУБЛИКА', 'ЦЕНТРАЛЬНО-АФРИКАНСКАЯ РЕСПУБЛИКА', '42000000', 'CF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (5, 'VN', 'ВЬЕТНАМ', 'ВЬЕТНАМ', '243000000', 'VN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (6, 'RU', 'РОССИЯ', 'РОССИЯ', '193000000', 'RU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (7, 'ME', 'ЧЕРНОГОРИЯ', 'ЧЕРНОГОРИЯ', '141000000', 'ME', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (8, 'GT', 'ГВАТЕМАЛА', 'ГВАТЕМАЛА', '92000000', 'GT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (9, 'CG', 'КОНГО', 'КОНГО', '43000000', 'CG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (10, 'VU', 'ВАНУАТУ', 'ВАНУАТУ', '244000000', 'VU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (11, 'RW', 'РУАНДА', 'РУАНДА', '194000000', 'RW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (12, 'MF', 'СЕН-МАРТЕН', 'СЕН-МАРТЕН', '142000000', 'MF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (13, 'GU', 'ГУАМ', 'ГУАМ', '93000000', 'GU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (14, 'CH', 'ШВЕЙЦАРИЯ', 'ШВЕЙЦАРИЯ', '44000000', 'CH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (15, 'WF', 'УОЛЛИС И ФУТУНА', 'УОЛЛИС И ФУТУНА', '245000000', 'WF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (16, 'SA', 'САУДОВСКАЯ АРАВИЯ', 'САУДОВСКАЯ АРАВИЯ', '195000000', 'SA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (17, 'MG', 'МАДАГАСКАР', 'МАДАГАСКАР', '143000000', 'MG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (18, 'GW', 'ГВИНЕЯ-БИСАУ', 'ГВИНЕЯ-БИСАУ', '94000000', 'GW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (19, 'CI', 'КОТ Д''ИВУАР', 'КОТ Д&', '45000000', 'CI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (20, 'WS', 'САМОА', 'САМОА', '246000000', 'WS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (21, 'SB', 'СОЛОМОНОВЫ ОСТРОВА', 'СОЛОМОНОВЫ ОСТРОВА', '196000000', 'SB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (22, 'MH', 'МАРШАЛЛОВЫ ОСТРОВА', 'МАРШАЛЛОВЫ ОСТРОВА', '144000000', 'MH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (23, 'GY', 'ГАЙАНА', 'ГАЙАНА', '95000000', 'GY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (24, 'CK', 'ОСТРОВА КУКА', 'ОСТРОВА КУКА', '46000000', 'CK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (25, 'YE', 'ЙЕМЕН', 'ЙЕМЕН', '247000000', 'YE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (26, 'SC', 'СЕЙШЕЛЫ', 'СЕЙШЕЛЫ', '197000000', 'SC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (27, 'MK', 'РЕСПУБЛИКА МАКЕДОНИЯ', 'РЕСПУБЛИКА МАКЕДОНИЯ', '145000000', 'MK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (28, 'HK', 'ГОНКОНГ', 'ГОНКОНГ', '96000000', 'HK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (29, 'CL', 'ЧИЛИ', 'ЧИЛИ', '47000000', 'CL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (30, 'YT', 'МАЙОТТА', 'МАЙОТТА', '248000000', 'YT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (31, 'SD', 'СУДАН', 'СУДАН', '198000000', 'SD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (32, 'ML', 'МАЛИ', 'МАЛИ', '146000000', 'ML', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (33, 'HM', 'ОСТРОВ ХЕРД И ОСТРОВА МАКДОНАЛЬД', 'ОСТРОВ ХЕРД И ОСТРОВА МАКДОНАЛЬД', '97000000', 'HM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (34, 'CM', 'КАМЕРУН', 'КАМЕРУН', '48000000', 'CM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (35, 'ZA', 'ЮЖНАЯ АФРИКА', 'ЮЖНАЯ АФРИКА', '249000000', 'ZA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (36, 'SE', 'ШВЕЦИЯ', 'ШВЕЦИЯ', '199000000', 'SE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (37, 'MM', 'МЬЯНМА', 'МЬЯНМА', '147000000', 'MM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (38, 'HN', 'ГОНДУРАС', 'ГОНДУРАС', '98000000', 'HN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (39, 'CN', 'КИТАЙ', 'КИТАЙ', '49000000', 'CN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (40, 'ZM', 'ЗАМБИЯ', 'ЗАМБИЯ', '250000000', 'ZM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (41, 'SG', 'СИНГАПУР', 'СИНГАПУР', '200000000', 'SG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (42, 'MN', 'МОНГОЛИЯ', 'МОНГОЛИЯ', '148000000', 'MN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (43, 'HR', 'ХОРВАТИЯ', 'ХОРВАТИЯ', '99000000', 'HR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (44, 'CO', 'КОЛУМБИЯ', 'КОЛУМБИЯ', '50000000', 'CO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (45, 'ZW', 'ЗИМБАБВЕ', 'ЗИМБАБВЕ', '251000000', 'ZW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (46, 'SH', 'СВ. ЕЛЕНА, О. ВОЗНЕСЕНИЯ, ТР.-ДА-КУНЬЯ', 'СВ. ЕЛЕНА, О. ВОЗНЕСЕНИЯ, ТР.-ДА-КУНЬЯ', '201000000', 'SH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (47, 'MO', 'МАКАО', 'МАКАО', '149000000', 'MO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (48, 'HT', 'ГАИТИ', 'ГАИТИ', '100000000', 'HT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (49, 'MP', 'СЕВЕРНЫЕ МАРИАНСКИЕ ОСТРОВА', 'СЕВЕРНЫЕ МАРИАНСКИЕ ОСТРОВА', '150000000', 'MP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (50, 'PM', 'СЕНТ-ПЬЕР И МИКЕЛОН', 'СЕНТ-ПЬЕР И МИКЕЛОН', '181000000', 'PM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (51, 'LI', 'ЛИХТЕНШТЕЙН', 'ЛИХТЕНШТЕЙН', '130000000', 'LI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (52, 'GF', 'ФРАНЦУЗСКАЯ ГВИАНА', 'ФРАНЦУЗСКАЯ ГВИАНА', '81000000', 'GF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (53, 'BR', 'БРАЗИЛИЯ', 'БРАЗИЛИЯ', '32000000', 'BR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (54, 'UG', 'УГАНДА', 'УГАНДА', '233000000', 'UG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (55, 'PN', 'ПИТКЭРН', 'ПИТКЭРН', '182000000', 'PN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (56, 'LK', 'ШРИ-ЛАНКА', 'ШРИ-ЛАНКА', '131000000', 'LK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (57, 'GG', 'ГЕРНСИ', 'ГЕРНСИ', '82000000', 'GG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (58, 'BS', 'БАГАМЫ', 'БАГАМЫ', '33000000', 'BS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (59, 'UM', 'МАЛЫЕ ТИХООКЕАН.ОТДАЛЕН.ОСТ-ВА С.Ш.', 'МАЛЫЕ ТИХООКЕАН.ОТДАЛЕН.ОСТ-ВА С.Ш.', '234000000', 'UM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (60, 'PR', 'ПУЭРТО-РИКО', 'ПУЭРТО-РИКО', '184000000', 'PR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (61, 'LR', 'ЛИБЕРИЯ', 'ЛИБЕРИЯ', '132000000', 'LR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (62, 'GH', 'ГАНА', 'ГАНА', '83000000', 'GH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (63, 'BT', 'БУТАН', 'БУТАН', '34000000', 'BT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (64, 'US', 'СОЕДИНЕННЫЕ ШТАТЫ', 'СОЕДИНЕННЫЕ ШТАТЫ', '235000000', 'US', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (65, 'PS', 'ПАЛЕСТИНА, ГОСУДАРСТВО', 'ПАЛЕСТИНА, ГОСУДАРСТВО', '185000000', 'PS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (66, 'LS', 'ЛЕСОТО', 'ЛЕСОТО', '133000000', 'LS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (67, 'GI', 'ГИБРАЛТАР', 'ГИБРАЛТАР', '84000000', 'GI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (68, 'BV', 'ОСТРОВ БУВЕ', 'ОСТРОВ БУВЕ', '35000000', 'BV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (69, 'UY', 'УРУГВАЙ', 'УРУГВАЙ', '236000000', 'UY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (70, 'PT', 'ПОРТУГАЛИЯ', 'ПОРТУГАЛИЯ', '186000000', 'PT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (71, 'LT', 'ЛИТВА', 'ЛИТВА', '134000000', 'LT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (72, 'GL', 'ГРЕНЛАНДИЯ', 'ГРЕНЛАНДИЯ', '85000000', 'GL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (73, 'BW', 'БОТСВАНА', 'БОТСВАНА', '36000000', 'BW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (74, 'UZ', 'УЗБЕКИСТАН', 'УЗБЕКИСТАН', '237000000', 'UZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (75, 'PW', 'ПАЛАУ', 'ПАЛАУ', '187000000', 'PW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (76, 'LU', 'ЛЮКСЕМБУРГ', 'ЛЮКСЕМБУРГ', '135000000', 'LU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (77, 'GM', 'ГАМБИЯ', 'ГАМБИЯ', '86000000', 'GM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (78, 'BY', 'БЕЛАРУСЬ', 'БЕЛАРУСЬ', '37000000', 'BY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (151, 'NA', 'НАМИБИЯ', 'НАМИБИЯ', '161000000', 'NA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (79, 'VA', 'ПАПСКИЙ ПРЕСТОЛ(ГОС.-ГОРОД ВАТИКАН)', 'ПАПСКИЙ ПРЕСТОЛ(ГОС.-ГОРОД ВАТИКАН)', '238000000', 'VA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (80, 'PY', 'ПАРАГВАЙ', 'ПАРАГВАЙ', '188000000', 'PY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (81, 'LV', 'ЛАТВИЯ', 'ЛАТВИЯ', '136000000', 'LV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (82, 'GN', 'ГВИНЕЯ', 'ГВИНЕЯ', '87000000', 'GN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (83, 'BZ', 'БЕЛИЗ', 'БЕЛИЗ', '38000000', 'BZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (84, 'VC', 'СЕНТ-ВИНСЕНТ И ГРЕНАДИНЫ', 'СЕНТ-ВИНСЕНТ И ГРЕНАДИНЫ', '239000000', 'VC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (85, 'QA', 'КАТАР', 'КАТАР', '189000000', 'QA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (86, 'LY', 'ЛИВИЯ', 'ЛИВИЯ', '137000000', 'LY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (87, 'GP', 'ГВАДЕЛУПА', 'ГВАДЕЛУПА', '88000000', 'GP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (88, 'CA', 'КАНАДА', 'КАНАДА', '39000000', 'CA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (89, 'VE', 'ВЕНЕСУЭЛА,БОЛИВАРИАНСКАЯ РЕСПУБЛИКА', 'ВЕНЕСУЭЛА,БОЛИВАРИАНСКАЯ РЕСПУБЛИКА', '240000000', 'VE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (90, 'RE', 'РЕЮНЬОН', 'РЕЮНЬОН', '190000000', 'RE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (91, 'MA', 'МАРОККО', 'МАРОККО', '138000000', 'MA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (92, 'GQ', 'ЭКВАТОРИАЛЬНАЯ ГВИНЕЯ', 'ЭКВАТОРИАЛЬНАЯ ГВИНЕЯ', '89000000', 'GQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (93, 'CC', 'КОКОСОВЫЕ (КИЛИНГ) ОСТРОВА', 'КОКОСОВЫЕ (КИЛИНГ) ОСТРОВА', '40000000', 'CC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (94, 'VG', 'ВИРГИНСКИЕ ОСТРОВА, БРИТАНСКИЕ', 'ВИРГИНСКИЕ ОСТРОВА, БРИТАНСКИЕ', '241000000', 'VG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (95, 'RO', 'РУМЫНИЯ', 'РУМЫНИЯ', '191000000', 'RO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (96, 'MC', 'МОНАКО', 'МОНАКО', '139000000', 'MC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (97, 'GR', 'ГРЕЦИЯ', 'ГРЕЦИЯ', '90000000', 'GR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (98, 'CD', 'КОНГО, ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА', 'КОНГО, ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА', '41000000', 'CD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (99, 'VI', 'ВИРГИНСКИЕ ОСТРОВА, США', 'ВИРГИНСКИЕ ОСТРОВА, США', '242000000', 'VI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (100, 'NU', 'НИУЭ', 'НИУЭ', '171000000', 'NU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (101, 'KM', 'КОМОРЫ', 'КОМОРЫ', '120000000', 'KM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (102, 'FI', 'ФИНЛЯНДИЯ', 'ФИНЛЯНДИЯ', '71000000', 'FI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (103, 'BF', 'БУРКИНА-ФАСО', 'БУРКИНА-ФАСО', '22000000', 'BF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (104, 'TL', 'ТИМОР-ЛЕСТЕ', 'ТИМОР-ЛЕСТЕ', '223000000', 'TL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (105, 'NZ', 'НОВАЯ ЗЕЛАНДИЯ', 'НОВАЯ ЗЕЛАНДИЯ', '172000000', 'NZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (106, 'KN', 'СЕНТ-КИТС И НЕВИС', 'СЕНТ-КИТС И НЕВИС', '121000000', 'KN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (107, 'FJ', 'ФИДЖИ', 'ФИДЖИ', '72000000', 'FJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (108, 'BG', 'БОЛГАРИЯ', 'БОЛГАРИЯ', '23000000', 'BG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (109, 'TM', 'ТУРКМЕНИЯ', 'ТУРКМЕНИЯ', '224000000', 'TM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (110, 'OM', 'ОМАН', 'ОМАН', '173000000', 'OM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (111, 'KP', 'КОРЕЯ, НАРОДНО-ДЕМОКРАТИЧ. РЕСПУБЛИКА', 'КОРЕЯ, НАРОДНО-ДЕМОКРАТИЧ. РЕСПУБЛИКА', '122000000', 'KP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (112, 'FK', 'ФОЛКЛЕНДСКИЕ ОСТРОВА (МАЛЬВИНСКИЕ)', 'ФОЛКЛЕНДСКИЕ ОСТРОВА (МАЛЬВИНСКИЕ)', '73000000', 'FK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (113, 'BH', 'БАХРЕЙН', 'БАХРЕЙН', '24000000', 'BH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (114, 'TN', 'ТУНИС', 'ТУНИС', '225000000', 'TN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (115, 'PA', 'ПАНАМА', 'ПАНАМА', '174000000', 'PA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (116, 'KR', 'КОРЕЯ, РЕСПУБЛИКА', 'КОРЕЯ, РЕСПУБЛИКА', '123000000', 'KR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (117, 'FM', 'МИКРОНЕЗИЯ, ФЕДЕРАТИВНЫЕ ШТАТЫ', 'МИКРОНЕЗИЯ, ФЕДЕРАТИВНЫЕ ШТАТЫ', '74000000', 'FM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (118, 'BI', 'БУРУНДИ', 'БУРУНДИ', '25000000', 'BI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (119, 'TO', 'ТОНГА', 'ТОНГА', '226000000', 'TO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (120, 'PE', 'ПЕРУ', 'ПЕРУ', '175000000', 'PE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (121, 'KW', 'КУВЕЙТ', 'КУВЕЙТ', '124000000', 'KW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (122, 'FO', 'ФАРЕРСКИЕ ОСТРОВА', 'ФАРЕРСКИЕ ОСТРОВА', '75000000', 'FO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (123, 'BJ', 'БЕНИН', 'БЕНИН', '26000000', 'BJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (124, 'TR', 'ТУРЦИЯ', 'ТУРЦИЯ', '227000000', 'TR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (125, 'PF', 'ФРАНЦУЗСКАЯ ПОЛИНЕЗИЯ', 'ФРАНЦУЗСКАЯ ПОЛИНЕЗИЯ', '176000000', 'PF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (126, 'KY', 'ОСТРОВА КАЙМАН', 'ОСТРОВА КАЙМАН', '125000000', 'KY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (127, 'FR', 'ФРАНЦИЯ', 'ФРАНЦИЯ', '76000000', 'FR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (128, 'BL', 'СЕН-БАРТЕЛЕМИ', 'СЕН-БАРТЕЛЕМИ', '27000000', 'BL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (129, 'TT', 'ТРИНИДАД И ТОБАГО', 'ТРИНИДАД И ТОБАГО', '228000000', 'TT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (130, 'PG', 'ПАПУА НОВАЯ ГВИНЕЯ', 'ПАПУА НОВАЯ ГВИНЕЯ', '177000000', 'PG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (131, 'KZ', 'КАЗАХСТАН', 'КАЗАХСТАН', '126000000', 'KZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (132, 'GA', 'ГАБОН', 'ГАБОН', '77000000', 'GA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (133, 'BM', 'БЕРМУДЫ', 'БЕРМУДЫ', '28000000', 'BM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (134, 'TV', 'ТУВАЛУ', 'ТУВАЛУ', '229000000', 'TV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (135, 'PH', 'ФИЛИППИНЫ', 'ФИЛИППИНЫ', '178000000', 'PH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (136, 'LA', 'ЛАОССКАЯ НАРОДНО-ДЕМОКРАТИЧ. РЕСПУБЛИКА', 'ЛАОССКАЯ НАРОДНО-ДЕМОКРАТИЧ. РЕСПУБЛИКА', '127000000', 'LA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (137, 'GB', 'СОЕДИНЕННОЕ КОРОЛЕВСТВО', 'СОЕДИНЕННОЕ КОРОЛЕВСТВО', '78000000', 'GB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (138, 'BN', 'БРУНЕЙ-ДАРУССАЛАМ', 'БРУНЕЙ-ДАРУССАЛАМ', '29000000', 'BN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (139, 'TW', 'ТАЙВАНЬ (КИТАЙ)', 'ТАЙВАНЬ (КИТАЙ)', '230000000', 'TW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (140, 'PK', 'ПАКИСТАН', 'ПАКИСТАН', '179000000', 'PK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (141, 'LB', 'ЛИВАН', 'ЛИВАН', '128000000', 'LB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (142, 'GD', 'ГРЕНАДА', 'ГРЕНАДА', '79000000', 'GD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (143, 'BO', 'БОЛИВИЯ, МНОГОНАЦИОНАЛЬНОЕ ГОСУДАРСТВО', 'БОЛИВИЯ, МНОГОНАЦИОНАЛЬНОЕ ГОСУДАРСТВО', '30000000', 'BO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (144, 'TZ', 'ТАНЗАНИЯ, ОБЪЕДИНЕННАЯ РЕСПУБЛИКА', 'ТАНЗАНИЯ, ОБЪЕДИНЕННАЯ РЕСПУБЛИКА', '231000000', 'TZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (145, 'PL', 'ПОЛЬША', 'ПОЛЬША', '180000000', 'PL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (146, 'LC', 'СЕНТ-ЛЮСИЯ', 'СЕНТ-ЛЮСИЯ', '129000000', 'LC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (147, 'GE', 'ГРУЗИЯ', 'ГРУЗИЯ', '80000000', 'GE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (148, 'BQ', 'БОНЭЙР, СИНТ-ЭСТАТИУС И САБА', 'БОНЭЙР, СИНТ-ЭСТАТИУС И САБА', '31000000', 'BQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (149, 'UA', 'УКРАИНА', 'УКРАИНА', '232000000', 'UA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (150, 'IS', 'ИСЛАНДИЯ', 'ИСЛАНДИЯ', '110000000', 'IS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (152, 'DM', 'ДОМИНИКА', 'ДОМИНИКА', '61000000', 'DM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (153, 'AS', 'АМЕРИКАНСКОЕ САМОА', 'АМЕРИКАНСКОЕ САМОА', '12000000', 'AS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (154, 'SX', 'СЕН-МАРТЕН (нидерландская часть)', 'СЕН-МАРТЕН (нидерландская часть)', '213000000', 'SX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (155, 'IT', 'ИТАЛИЯ', 'ИТАЛИЯ', '111000000', 'IT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (156, 'NC', 'НОВАЯ КАЛЕДОНИЯ', 'НОВАЯ КАЛЕДОНИЯ', '162000000', 'NC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (157, 'DO', 'ДОМИНИКАНСКАЯ РЕСПУБЛИКА', 'ДОМИНИКАНСКАЯ РЕСПУБЛИКА', '62000000', 'DO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (158, 'AT', 'АВСТРИЯ', 'АВСТРИЯ', '13000000', 'AT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (159, 'SY', 'СИРИЙСКАЯ АРАБСКАЯ РЕСПУБЛИКА', 'СИРИЙСКАЯ АРАБСКАЯ РЕСПУБЛИКА', '214000000', 'SY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (160, 'JE', 'ДЖЕРСИ', 'ДЖЕРСИ', '112000000', 'JE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (161, 'NE', 'НИГЕР', 'НИГЕР', '163000000', 'NE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (162, 'DZ', 'АЛЖИР', 'АЛЖИР', '63000000', 'DZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (163, 'AU', 'АВСТРАЛИЯ', 'АВСТРАЛИЯ', '14000000', 'AU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (164, 'SZ', 'СВАЗИЛЕНД', 'СВАЗИЛЕНД', '215000000', 'SZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (165, 'NF', 'ОСТРОВ НОРФОЛК', 'ОСТРОВ НОРФОЛК', '164000000', 'NF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (166, 'JM', 'ЯМАЙКА', 'ЯМАЙКА', '113000000', 'JM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (167, 'EC', 'ЭКВАДОР', 'ЭКВАДОР', '64000000', 'EC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (168, 'AW', 'АРУБА', 'АРУБА', '15000000', 'AW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (169, 'TC', 'ОСТРОВА ТЕРКС И КАЙКОС', 'ОСТРОВА ТЕРКС И КАЙКОС', '216000000', 'TC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (170, 'NG', 'НИГЕРИЯ', 'НИГЕРИЯ', '165000000', 'NG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (171, 'JO', 'ИОРДАНИЯ', 'ИОРДАНИЯ', '114000000', 'JO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (172, 'EE', 'ЭСТОНИЯ', 'ЭСТОНИЯ', '65000000', 'EE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (173, 'AX', 'ЭЛАНДСКИЕ ОСТРОВА', 'ЭЛАНДСКИЕ ОСТРОВА', '16000000', 'AX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (174, 'TD', 'ЧАД', 'ЧАД', '217000000', 'TD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (175, 'NI', 'НИКАРАГУА', 'НИКАРАГУА', '166000000', 'NI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (176, 'JP', 'ЯПОНИЯ', 'ЯПОНИЯ', '115000000', 'JP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (177, 'EG', 'ЕГИПЕТ', 'ЕГИПЕТ', '66000000', 'EG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (178, 'AZ', 'АЗЕРБАЙДЖАН', 'АЗЕРБАЙДЖАН', '17000000', 'AZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (179, 'TF', 'ФРАНЦУЗСКИЕ ЮЖНЫЕ ТЕРРИТОРИИ', 'ФРАНЦУЗСКИЕ ЮЖНЫЕ ТЕРРИТОРИИ', '218000000', 'TF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (180, 'NL', 'НИДЕРЛАНДЫ', 'НИДЕРЛАНДЫ', '167000000', 'NL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (181, 'KE', 'КЕНИЯ', 'КЕНИЯ', '116000000', 'KE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (182, 'EH', 'ЗАПАДНАЯ САХАРА', 'ЗАПАДНАЯ САХАРА', '67000000', 'EH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (183, 'BA', 'БОСНИЯ И ГЕРЦЕГОВИНА', 'БОСНИЯ И ГЕРЦЕГОВИНА', '18000000', 'BA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (184, 'TG', 'ТОГО', 'ТОГО', '219000000', 'TG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (185, 'NO', 'НОРВЕГИЯ', 'НОРВЕГИЯ', '168000000', 'NO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (186, 'KG', 'КИРГИЗИЯ', 'Кыргызская республика', '117000000', 'KG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (187, 'ER', 'ЭРИТРЕЯ', 'ЭРИТРЕЯ', '68000000', 'ER', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (188, 'BB', 'БАРБАДОС', 'БАРБАДОС', '19000000', 'BB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (189, 'TH', 'ТАИЛАНД', 'ТАИЛАНД', '220000000', 'TH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (190, 'NP', 'НЕПАЛ', 'НЕПАЛ', '169000000', 'NP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (191, 'KH', 'КАМБОДЖА', 'КАМБОДЖА', '118000000', 'KH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (192, 'ES', 'ИСПАНИЯ', 'ИСПАНИЯ', '69000000', 'ES', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (193, 'BD', 'БАНГЛАДЕШ', 'БАНГЛАДЕШ', '20000000', 'BD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (194, 'TJ', 'ТАДЖИКИСТАН', 'ТАДЖИКИСТАН', '221000000', 'TJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (195, 'NR', 'НАУРУ', 'НАУРУ', '170000000', 'NR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (196, 'KI', 'КИРИБАТИ', 'КИРИБАТИ', '119000000', 'KI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (197, 'ET', 'ЭФИОПИЯ', 'ЭФИОПИЯ', '70000000', 'ET', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (198, 'BE', 'БЕЛЬГИЯ', 'БЕЛЬГИЯ', '21000000', 'BE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (199, 'TK', 'ТОКЕЛАУ', 'ТОКЕЛАУ', '222000000', 'TK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (200, 'AD', 'АНДОРРА', 'АНДОРРА', '1000000', 'AD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (201, 'MQ', 'МАРТИНИКА', 'МАРТИНИКА', '151000000', 'MQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (202, 'SI', 'СЛОВЕНИЯ', 'СЛОВЕНИЯ', '202000000', 'SI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (203, 'CR', 'КОСТА-РИКА', 'КОСТА-РИКА', '51000000', 'CR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (204, 'HU', 'ВЕНГРИЯ', 'ВЕНГРИЯ', '101000000', 'HU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (205, 'SJ', 'ШПИЦБЕРГЕН И ЯН МАЙЕН', 'ШПИЦБЕРГЕН И ЯН МАЙЕН', '203000000', 'SJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (206, 'AE', 'ОБЪЕДИНЕННЫЕ АРАБСКИЕ ЭМИРАТЫ', 'ОБЪЕДИНЕННЫЕ АРАБСКИЕ ЭМИРАТЫ', '2000000', 'AE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (207, 'MR', 'МАВРИТАНИЯ', 'МАВРИТАНИЯ', '152000000', 'MR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (208, 'CU', 'КУБА', 'КУБА', '52000000', 'CU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (209, 'SK', 'СЛОВАКИЯ', 'СЛОВАКИЯ', '204000000', 'SK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (210, 'AF', 'АФГАНИСТАН', 'АФГАНИСТАН', '3000000', 'AF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (211, 'ID', 'ИНДОНЕЗИЯ', 'ИНДОНЕЗИЯ', '102000000', 'ID', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (212, 'MS', 'МОНТСЕРРАТ', 'МОНТСЕРРАТ', '153000000', 'MS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (213, 'CV', 'КАБО-ВЕРДЕ', 'КАБО-ВЕРДЕ', '53000000', 'CV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (214, 'SL', 'СЬЕРРА-ЛЕОНЕ', 'СЬЕРРА-ЛЕОНЕ', '205000000', 'SL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (215, 'AG', 'АНТИГУА И БАРБУДА', 'АНТИГУА И БАРБУДА', '4000000', 'AG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (216, 'IE', 'ИРЛАНДИЯ', 'ИРЛАНДИЯ', '103000000', 'IE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (217, 'MT', 'МАЛЬТА', 'МАЛЬТА', '154000000', 'MT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (218, 'CW', 'КЮРАСАО', 'КЮРАСАО', '54000000', 'CW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (219, 'SM', 'САН-МАРИНО', 'САН-МАРИНО', '206000000', 'SM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (220, 'AI', 'АНГИЛЬЯ', 'АНГИЛЬЯ', '5000000', 'AI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (221, 'IL', 'ИЗРАИЛЬ', 'ИЗРАИЛЬ', '104000000', 'IL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (222, 'MU', 'МАВРИКИЙ', 'МАВРИКИЙ', '155000000', 'MU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (223, 'CX', 'ОСТРОВ РОЖДЕСТВА', 'ОСТРОВ РОЖДЕСТВА', '55000000', 'CX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (224, 'AL', 'АЛБАНИЯ', 'АЛБАНИЯ', '6000000', 'AL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (225, 'SN', 'СЕНЕГАЛ', 'СЕНЕГАЛ', '207000000', 'SN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (226, 'IM', 'ОСТРОВ МЭН', 'ОСТРОВ МЭН', '105000000', 'IM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (227, 'MV', 'МАЛЬДИВЫ', 'МАЛЬДИВЫ', '156000000', 'MV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (228, 'CY', 'КИПР', 'КИПР', '56000000', 'CY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (229, 'AM', 'АРМЕНИЯ', 'АРМЕНИЯ', '7000000', 'AM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (230, 'SO', 'СОМАЛИ', 'СОМАЛИ', '208000000', 'SO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (231, 'IN', 'ИНДИЯ', 'ИНДИЯ', '106000000', 'IN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (232, 'MW', 'МАЛАВИ', 'МАЛАВИ', '157000000', 'MW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (233, 'CZ', 'ЧЕШСКАЯ РЕСПУБЛИКА', 'ЧЕШСКАЯ РЕСПУБЛИКА', '57000000', 'CZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (234, 'SR', 'СУРИНАМ', 'СУРИНАМ', '209000000', 'SR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (235, 'IO', 'БРИТАНСКАЯ ТЕРРИТОРИЯ В ИНДИЙСКОМ ОКЕАНЕ', 'БРИТАНСКАЯ ТЕРРИТОРИЯ В ИНДИЙСКОМ ОКЕАНЕ', '107000000', 'IO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (236, 'MX', 'МЕКСИКА', 'МЕКСИКА', '158000000', 'MX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (237, 'DE', 'ГЕРМАНИЯ', 'ГЕРМАНИЯ', '58000000', 'DE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (238, 'AO', 'АНГОЛА', 'АНГОЛА', '9000000', 'AO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (239, 'SS', 'ЮЖНЫЙ СУДАН', 'ЮЖНЫЙ СУДАН', '210000000', 'SS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (240, 'IQ', 'ИРАК', 'ИРАК', '108000000', 'IQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (241, 'MY', 'МАЛАЙЗИЯ', 'МАЛАЙЗИЯ', '159000000', 'MY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (242, 'DJ', 'ДЖИБУТИ', 'ДЖИБУТИ', '59000000', 'DJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (243, 'AQ', 'АНТАРКТИДА', 'АНТАРКТИДА', '10000000', 'AQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (244, 'ST', 'САН-ТОМЕ И ПРИНСИПИ', 'САН-ТОМЕ И ПРИНСИПИ', '211000000', 'ST', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (245, 'IR', 'ИРАН, ИСЛАМСКАЯ РЕСПУБЛИКА', 'ИРАН, ИСЛАМСКАЯ РЕСПУБЛИКА', '109000000', 'IR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (246, 'MZ', 'МОЗАМБИК', 'МОЗАМБИК', '160000000', 'MZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (247, 'DK', 'ДАНИЯ', 'ДАНИЯ', '60000000', 'DK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (248, 'AR', 'АРГЕНТИНА', 'АРГЕНТИНА', '11000000', 'AR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (249, 'SV', 'ЭЛЬ-САЛЬВАДОР', 'ЭЛЬ-САЛЬВАДОР', '212000000', 'SV', NULL, NULL, NULL, NULL);


--
-- TOC entry 4531 (class 0 OID 18783)
-- Dependencies: 225
-- Data for Name: currencyclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO currencyclassifier VALUES (1, 784, 'AED', 'Дирхам (ОАЭ)', NULL, NULL);
INSERT INTO currencyclassifier VALUES (2, 971, 'AFN', 'Афгани', NULL, NULL);
INSERT INTO currencyclassifier VALUES (3, 8, 'ALL', 'Лек', NULL, NULL);
INSERT INTO currencyclassifier VALUES (4, 51, 'AMD', 'Армянский драм', NULL, NULL);
INSERT INTO currencyclassifier VALUES (5, 532, 'ANG', 'Нидерландский антильский гульден', NULL, NULL);
INSERT INTO currencyclassifier VALUES (6, 973, 'AOA', 'Кванза', NULL, NULL);
INSERT INTO currencyclassifier VALUES (7, 32, 'ARS', 'Аргентинское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (8, 36, 'AUD', 'Австралийский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (9, 533, 'AWG', 'Арубанский флорин', NULL, NULL);
INSERT INTO currencyclassifier VALUES (10, 944, 'AZN', 'Азербайджанский манат', NULL, NULL);
INSERT INTO currencyclassifier VALUES (11, 977, 'BAM', 'Конвертируемая марка', NULL, NULL);
INSERT INTO currencyclassifier VALUES (12, 52, 'BBD', 'Барбадосский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (13, 50, 'BDT', 'Така', NULL, NULL);
INSERT INTO currencyclassifier VALUES (14, 975, 'BGN', 'Болгарский лев', NULL, NULL);
INSERT INTO currencyclassifier VALUES (15, 48, 'BHD', 'Бахрейнский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (16, 108, 'BIF', 'Бурундийский франк', NULL, NULL);
INSERT INTO currencyclassifier VALUES (17, 60, 'BMD', 'Бермудский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (18, 96, 'BND', 'Брунейский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (19, 68, 'BOB', 'Боливиано', NULL, NULL);
INSERT INTO currencyclassifier VALUES (20, 986, 'BRL', 'Бразильский реал', NULL, NULL);
INSERT INTO currencyclassifier VALUES (21, 44, 'BSD', 'Багамский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (22, 64, 'BTN', 'Нгултрум', NULL, NULL);
INSERT INTO currencyclassifier VALUES (23, 72, 'BWP', 'Пула', NULL, NULL);
INSERT INTO currencyclassifier VALUES (24, 933, 'BYN', 'Белорусский рубль', NULL, NULL);
INSERT INTO currencyclassifier VALUES (25, 974, 'BYR', 'Белорусский рубль', NULL, '1 Применяется для денежных средств, уплаченных до 30 июня 2016 г. включительно.');
INSERT INTO currencyclassifier VALUES (26, 84, 'BZD', 'Белизский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (27, 124, 'CAD', 'Канадский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (28, 976, 'CDF', 'Конголезский франк', NULL, NULL);
INSERT INTO currencyclassifier VALUES (29, 756, 'CHF', 'Швейцарский франк', NULL, NULL);
INSERT INTO currencyclassifier VALUES (30, 152, 'CLP', 'Чилийское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (31, 156, 'CNY', 'Юань', NULL, NULL);
INSERT INTO currencyclassifier VALUES (32, 170, 'COP', 'Колумбийское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (33, 970, 'COU', 'Единица реальной стоимости', NULL, NULL);
INSERT INTO currencyclassifier VALUES (34, 188, 'CRC', 'Костариканский колон', NULL, NULL);
INSERT INTO currencyclassifier VALUES (35, 931, 'CUC', 'Конвертируемое песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (36, 192, 'CUP', 'Кубинское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (37, 132, 'CVE', 'Эскудо Кабо-Верде', NULL, NULL);
INSERT INTO currencyclassifier VALUES (38, 203, 'CZK', 'Чешская крона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (39, 262, 'DJF', 'Франк Джибути', NULL, NULL);
INSERT INTO currencyclassifier VALUES (40, 208, 'DKK', 'Датская крона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (41, 214, 'DOP', 'Доминиканское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (42, 12, 'DZD', 'Алжирский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (43, 818, 'EGP', 'Египетский фунт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (44, 232, 'ERN', 'Накфа', NULL, NULL);
INSERT INTO currencyclassifier VALUES (45, 230, 'ETB', 'Эфиопский быр', NULL, NULL);
INSERT INTO currencyclassifier VALUES (46, 978, 'EUR', 'Евро', NULL, NULL);
INSERT INTO currencyclassifier VALUES (47, 242, 'FJD', 'Доллар Фиджи', NULL, NULL);
INSERT INTO currencyclassifier VALUES (48, 238, 'FKP', 'Фунт Фолклендских островов', NULL, NULL);
INSERT INTO currencyclassifier VALUES (49, 826, 'GBP', 'Фунт стерлингов', NULL, NULL);
INSERT INTO currencyclassifier VALUES (50, 981, 'GEL', 'Лари', NULL, NULL);
INSERT INTO currencyclassifier VALUES (51, 936, 'GHS', 'Ганский седи', NULL, NULL);
INSERT INTO currencyclassifier VALUES (52, 292, 'GIP', 'Гибралтарский фунт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (53, 270, 'GMD', 'Даласи', NULL, NULL);
INSERT INTO currencyclassifier VALUES (54, 324, 'GNF', 'Гвинейский франк', NULL, NULL);
INSERT INTO currencyclassifier VALUES (55, 320, 'GTQ', 'Кетсаль', NULL, NULL);
INSERT INTO currencyclassifier VALUES (56, 328, 'GYD', 'Гайанский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (57, 344, 'HKD', 'Гонконгский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (58, 340, 'HNL', 'Лемпира', NULL, NULL);
INSERT INTO currencyclassifier VALUES (59, 191, 'HRK', 'Куна', NULL, NULL);
INSERT INTO currencyclassifier VALUES (60, 332, 'HTG', 'Гурд', NULL, NULL);
INSERT INTO currencyclassifier VALUES (61, 348, 'HUF', 'Форинт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (62, 360, 'IDR', 'Рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (63, 376, 'ILS', 'Новый израильский шекель', NULL, NULL);
INSERT INTO currencyclassifier VALUES (64, 356, 'INR', 'Индийская рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (65, 368, 'IQD', 'Иракский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (66, 364, 'IRR', 'Иранский риал', NULL, NULL);
INSERT INTO currencyclassifier VALUES (67, 352, 'ISK', 'Исландская крона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (68, 388, 'JMD', 'Ямайский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (69, 400, 'JOD', 'Иорданский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (70, 392, 'JPY', 'Иена', NULL, NULL);
INSERT INTO currencyclassifier VALUES (71, 404, 'KES', 'Кенийский шиллинг', NULL, NULL);
INSERT INTO currencyclassifier VALUES (72, 417, 'KGS', 'Сом', NULL, NULL);
INSERT INTO currencyclassifier VALUES (73, 116, 'KHR', 'Риель', NULL, NULL);
INSERT INTO currencyclassifier VALUES (74, 408, 'KPW', 'Северокорейская вона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (75, 410, 'KRW', 'Вона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (76, 414, 'KWD', 'Кувейтский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (77, 136, 'KYD', 'Доллар Островов Кайман', NULL, NULL);
INSERT INTO currencyclassifier VALUES (78, 398, 'KZT', 'Тенге', NULL, NULL);
INSERT INTO currencyclassifier VALUES (79, 418, 'LAK', 'Кип', NULL, NULL);
INSERT INTO currencyclassifier VALUES (80, 422, 'LBP', 'Ливанский фунт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (81, 144, 'LKR', 'Шри-Ланкийская рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (82, 430, 'LRD', 'Либерийский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (83, 426, 'LSL', 'Лоти', NULL, NULL);
INSERT INTO currencyclassifier VALUES (84, 440, 'LTL', 'Литовский лит', NULL, NULL);
INSERT INTO currencyclassifier VALUES (85, 428, 'LVL', 'Латвийский лат', NULL, '2 Не применяется с 15 января 2014 г.');
INSERT INTO currencyclassifier VALUES (86, 434, 'LYD', 'Ливийский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (87, 504, 'MAD', 'Марокканский дирхам', NULL, NULL);
INSERT INTO currencyclassifier VALUES (88, 498, 'MDL', 'Молдавский лей', NULL, NULL);
INSERT INTO currencyclassifier VALUES (89, 969, 'MGA', 'Малагасийский ариари', NULL, NULL);
INSERT INTO currencyclassifier VALUES (90, 807, 'MKD', 'Денар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (91, 104, 'MMK', 'Кьят', NULL, NULL);
INSERT INTO currencyclassifier VALUES (92, 496, 'MNT', 'Тугрик', NULL, NULL);
INSERT INTO currencyclassifier VALUES (93, 446, 'MOP', 'Патака', NULL, NULL);
INSERT INTO currencyclassifier VALUES (94, 478, 'MRO', 'Угия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (95, 480, 'MUR', 'Маврикийская рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (96, 462, 'MVR', 'Руфия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (97, 454, 'MWK', 'Малавийская квача', NULL, NULL);
INSERT INTO currencyclassifier VALUES (98, 484, 'MXN', 'Мексиканское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (99, 458, 'MYR', 'Малайзийский ринггит', NULL, NULL);
INSERT INTO currencyclassifier VALUES (100, 943, 'MZN', 'Мозамбикский метикал', NULL, NULL);
INSERT INTO currencyclassifier VALUES (101, 516, 'NAD', 'Доллар Намибии', NULL, NULL);
INSERT INTO currencyclassifier VALUES (102, 566, 'NGN', 'Найра', NULL, NULL);
INSERT INTO currencyclassifier VALUES (103, 558, 'NIO', 'Золотая кордоба', NULL, NULL);
INSERT INTO currencyclassifier VALUES (104, 578, 'NOK', 'Норвежская крона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (105, 524, 'NPR', 'Непальская рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (106, 554, 'NZD', 'Новозеландский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (107, 512, 'OMR', 'Оманский риал', NULL, NULL);
INSERT INTO currencyclassifier VALUES (108, 590, 'PAB', 'Бальбоа', NULL, NULL);
INSERT INTO currencyclassifier VALUES (109, 604, 'PEN', 'Соль', NULL, NULL);
INSERT INTO currencyclassifier VALUES (110, 598, 'PGK', 'Кина', NULL, NULL);
INSERT INTO currencyclassifier VALUES (111, 608, 'PHP', 'Филиппинское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (112, 586, 'PKR', 'Пакистанская рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (113, 985, 'PLN', 'Злотый', NULL, NULL);
INSERT INTO currencyclassifier VALUES (114, 600, 'PYG', 'Гуарани', NULL, NULL);
INSERT INTO currencyclassifier VALUES (115, 634, 'QAR', 'Катарский риал', NULL, NULL);
INSERT INTO currencyclassifier VALUES (116, 946, 'RON', 'Румынский лей', NULL, NULL);
INSERT INTO currencyclassifier VALUES (117, 941, 'RSD', 'Сербский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (118, 643, 'RUB', 'Российский рубль', NULL, NULL);
INSERT INTO currencyclassifier VALUES (119, 646, 'RWF', 'Франк Руанды', NULL, NULL);
INSERT INTO currencyclassifier VALUES (120, 682, 'SAR', 'Саудовский риял', NULL, NULL);
INSERT INTO currencyclassifier VALUES (121, 90, 'SBD', 'Доллар Соломоновых Островов', NULL, NULL);
INSERT INTO currencyclassifier VALUES (122, 690, 'SCR', 'Сейшельская рупия', NULL, NULL);
INSERT INTO currencyclassifier VALUES (123, 938, 'SDG', 'Суданский фунт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (124, 752, 'SEK', 'Шведская крона', NULL, NULL);
INSERT INTO currencyclassifier VALUES (125, 702, 'SGD', 'Сингапурский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (126, 654, 'SHP', 'Фунт Святой Елены', NULL, NULL);
INSERT INTO currencyclassifier VALUES (127, 694, 'SLL', 'Леоне', NULL, NULL);
INSERT INTO currencyclassifier VALUES (128, 706, 'SOS', 'Сомалийский шиллинг', NULL, NULL);
INSERT INTO currencyclassifier VALUES (129, 968, 'SRD', 'Суринамский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (130, 728, 'SSP', 'Южносуданский фунт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (131, 678, 'STD', 'Добра', NULL, NULL);
INSERT INTO currencyclassifier VALUES (132, 222, 'SVC', 'Сальвадорский колон', NULL, NULL);
INSERT INTO currencyclassifier VALUES (133, 760, 'SYP', 'Сирийский фунт', NULL, NULL);
INSERT INTO currencyclassifier VALUES (134, 748, 'SZL', 'Лилангени', NULL, NULL);
INSERT INTO currencyclassifier VALUES (135, 764, 'THB', 'Бат', NULL, NULL);
INSERT INTO currencyclassifier VALUES (136, 972, 'TJS', 'Сомони', NULL, NULL);
INSERT INTO currencyclassifier VALUES (137, 934, 'TMT', 'Новый туркменский манат', NULL, NULL);
INSERT INTO currencyclassifier VALUES (138, 788, 'TND', 'Тунисский динар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (139, 776, 'TOP', 'Паанга', NULL, NULL);
INSERT INTO currencyclassifier VALUES (140, 949, 'TRY', 'Турецкая лира', NULL, NULL);
INSERT INTO currencyclassifier VALUES (141, 780, 'TTD', 'Доллар Тринидада и Тобаго', NULL, NULL);
INSERT INTO currencyclassifier VALUES (142, 901, 'TWD', 'Новый тайваньский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (143, 834, 'TZS', 'Танзанийский шиллинг', NULL, NULL);
INSERT INTO currencyclassifier VALUES (144, 980, 'UAH', 'Гривна', NULL, NULL);
INSERT INTO currencyclassifier VALUES (145, 800, 'UGX', 'Угандийский шиллинг', NULL, NULL);
INSERT INTO currencyclassifier VALUES (146, 840, 'USD', 'Доллар США', NULL, NULL);
INSERT INTO currencyclassifier VALUES (147, 940, 'UYI', 'Уругвайское песо в индексированных единицах', NULL, NULL);
INSERT INTO currencyclassifier VALUES (148, 858, 'UYU', 'Уругвайское песо', NULL, NULL);
INSERT INTO currencyclassifier VALUES (149, 860, 'UZS', 'Узбекский сум', NULL, NULL);
INSERT INTO currencyclassifier VALUES (150, 937, 'VEF', 'Боливар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (151, 704, 'VND', 'Донг', NULL, NULL);
INSERT INTO currencyclassifier VALUES (152, 548, 'VUV', 'Вату', NULL, NULL);
INSERT INTO currencyclassifier VALUES (153, 882, 'WST', 'Тала', NULL, NULL);
INSERT INTO currencyclassifier VALUES (154, 950, 'XAF', 'Франк КФА ВЕАС', NULL, '3 Франк КФА ВЕАС – денежная единица Банка государств Центральной Африки.');
INSERT INTO currencyclassifier VALUES (155, 951, 'XCD', 'Восточно-карибский доллар', NULL, NULL);
INSERT INTO currencyclassifier VALUES (156, 960, 'XDR', 'СДР (специальные права заимствования)', NULL, NULL);
INSERT INTO currencyclassifier VALUES (157, 952, 'XOF', 'Франк КФА ВСЕАО', NULL, '4 Франк КФА ВСЕАО – денежная единица Центрального Банка государств Западной Африки');
INSERT INTO currencyclassifier VALUES (158, 953, 'XPF', 'Франк КФП', NULL, NULL);
INSERT INTO currencyclassifier VALUES (159, 886, 'YER', 'Йеменский риал', NULL, NULL);
INSERT INTO currencyclassifier VALUES (160, 710, 'ZAR', 'Рэнд', NULL, NULL);
INSERT INTO currencyclassifier VALUES (161, 967, 'ZMW', 'Замбийская квача', NULL, NULL);
INSERT INTO currencyclassifier VALUES (162, 932, 'ZWL', 'Доллар Зимбабве', NULL, NULL);


--
-- TOC entry 4533 (class 0 OID 18791)
-- Dependencies: 227
-- Data for Name: customcheckpointcctvplacementclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4535 (class 0 OID 18799)
-- Dependencies: 229
-- Data for Name: customcheckpointcommchannelclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customcheckpointcommchannelclassifier VALUES (1, '1', 'специальная');
INSERT INTO customcheckpointcommchannelclassifier VALUES (2, '2', 'телефонная');
INSERT INTO customcheckpointcommchannelclassifier VALUES (3, '3', 'радиосвязь');
INSERT INTO customcheckpointcommchannelclassifier VALUES (4, '4', 'иное');


--
-- TOC entry 4537 (class 0 OID 18807)
-- Dependencies: 231
-- Data for Name: customprocesskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customprocesskindclassifier VALUES (1, '0', 'Отсутствие предшествующей таможенной процедуры', NULL);
INSERT INTO customprocesskindclassifier VALUES (2, '10', 'Экспорт', NULL);
INSERT INTO customprocesskindclassifier VALUES (3, '21', 'Переработка вне таможенной территории', NULL);
INSERT INTO customprocesskindclassifier VALUES (4, '23', 'Временный вывоз', NULL);
INSERT INTO customprocesskindclassifier VALUES (5, '31', 'Реэкспорт', NULL);
INSERT INTO customprocesskindclassifier VALUES (6, '40', 'Выпуск для внутреннего потребления', NULL);
INSERT INTO customprocesskindclassifier VALUES (7, '51', 'Переработка на таможенной территории', NULL);
INSERT INTO customprocesskindclassifier VALUES (8, '53', 'Временный ввоз (допуск)', NULL);
INSERT INTO customprocesskindclassifier VALUES (9, '60', 'Реимпорт', NULL);
INSERT INTO customprocesskindclassifier VALUES (10, '70', 'Таможенный склад', NULL);
INSERT INTO customprocesskindclassifier VALUES (11, '77', 'Свободный склад', NULL);
INSERT INTO customprocesskindclassifier VALUES (12, '78', 'Свободная таможенная зона', NULL);
INSERT INTO customprocesskindclassifier VALUES (13, '80', 'Таможенный транзит', NULL);
INSERT INTO customprocesskindclassifier VALUES (14, '90', 'Специальная таможенная процедура', NULL);
INSERT INTO customprocesskindclassifier VALUES (15, '91', 'Переработка для внутреннего потребления', NULL);
INSERT INTO customprocesskindclassifier VALUES (16, '93', 'Уничтожение', NULL);
INSERT INTO customprocesskindclassifier VALUES (17, '94', 'Отказ в пользу государства', NULL);
INSERT INTO customprocesskindclassifier VALUES (18, '96', 'Беспошлинная торговля', NULL);


--
-- TOC entry 4539 (class 0 OID 18815)
-- Dependencies: 233
-- Data for Name: customsconclusionsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsconclusionsclassifier VALUES (1, '10', 'Выпуск разрешен', '');
INSERT INTO customsconclusionsclassifier VALUES (2, '11', 'Выпуск при условии обеспечения уплаты таможенных платежей', '');
INSERT INTO customsconclusionsclassifier VALUES (3, '20', 'Условный выпуск', '');
INSERT INTO customsconclusionsclassifier VALUES (4, '81', 'Таможенная декларация отозвана', '');
INSERT INTO customsconclusionsclassifier VALUES (5, '82', 'Таможенная декларация считается не поданной', '');
INSERT INTO customsconclusionsclassifier VALUES (6, '90', 'Отказано в выпуске', '');
INSERT INTO customsconclusionsclassifier VALUES (7, '91', 'Выпуск приостановлен', '');
INSERT INTO customsconclusionsclassifier VALUES (8, '92', 'Иное решение, предусмотренное законодательством государств- членов Евразийского экономического союза', '');


--
-- TOC entry 4541 (class 0 OID 18823)
-- Dependencies: 235
-- Data for Name: customsfeesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesclassifier VALUES (1, '1010', 'Таможенные сборы за совершение таможенных операций (за таможенное оформление товаров, за таможенное декларирование товаров, за таможенные операции)', '', '1');
INSERT INTO customsfeesclassifier VALUES (2, '1020', 'Таможенные сборы за таможенное сопровождение', '', '1');
INSERT INTO customsfeesclassifier VALUES (3, '2010', 'Ввозные таможенные пошлины (иные пошлины, налоги и сборы, имеющие эквивалентное действие), уплаченные в соответствии с Протоколом о порядке зачисления и распределения сумм ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие), их перечисления в доход бюджетов государств-членов (приложение № 5 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)', '', '1');
INSERT INTO customsfeesclassifier VALUES (4, '2020', 'Ввозная таможенная пошлина, обязанность по уплате которой возникла до вступления в силу Соглашения об установлении и применении в таможенном союзе порядка зачисления и распределения ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие) от 20.05.2010', '', '1');
INSERT INTO customsfeesclassifier VALUES (5, '2040', 'Специальная пошлина, установленная в соответствии с Протоколом о применении специальных защитных, антидемпинговых и компенсационных мер по отношению к третьим странам (приложение № 8 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)', '', '1');
INSERT INTO customsfeesclassifier VALUES (6, '2050', 'Антидемпинговая пошлина, установленная в соответствии с Протоколом о применении специальных защитных, антидемпинговых и компенсационных мер по отношению к третьим странам (приложение № 8 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)', '', '1');
INSERT INTO customsfeesclassifier VALUES (7, '2060', 'Компенсационная пошлина, установленная в соответствии с Протоколом о применении специальных защитных, антидемпинговых и компенсационных мер по отношению к третьим странам (приложение № 8 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)', '', '1');
INSERT INTO customsfeesclassifier VALUES (8, '2140', 'Предварительная специальная пошлина', '', '1');
INSERT INTO customsfeesclassifier VALUES (9, '2150', 'Предварительная антидемпинговая пошлина', '', '1');
INSERT INTO customsfeesclassifier VALUES (10, '2160', 'Предварительная компенсационная пошлина', '', '1');
INSERT INTO customsfeesclassifier VALUES (11, '2240', 'Специальная пошлина, уплачиваемая в порядке, установленном для взимания соответствующих предварительных видов пошлин', '', '1');
INSERT INTO customsfeesclassifier VALUES (12, '2250', 'Антидемпинговая пошлина, уплачиваемая в порядке, установленном для взимания соответствующих предварительных видов пошлин', '', '1');
INSERT INTO customsfeesclassifier VALUES (13, '2260', 'Компенсационная пошлина, уплачиваемая в порядке, установленном для взимания соответствующих предварительных видов пошлин', '', '1');
INSERT INTO customsfeesclassifier VALUES (14, '5010', 'Налог на добавленную стоимость', '', '1');
INSERT INTO customsfeesclassifier VALUES (15, '6010', 'Таможенные пошлины, налоги по единым ставкам в отношении товаров для личного пользования', '', '1');
INSERT INTO customsfeesclassifier VALUES (16, '6020', 'Совокупный таможенный платеж в отношении товаров для личного пользования', '', '1');
INSERT INTO customsfeesclassifier VALUES (17, 'ХХХ1', 'Пени', '', '1');
INSERT INTO customsfeesclassifier VALUES (18, '1030', 'Таможенные сборы за хранение', 'RU', '2.1');
INSERT INTO customsfeesclassifier VALUES (19, '17Х0', 'Прочие таможенные сборы', 'RU', '2.1');
INSERT INTO customsfeesclassifier VALUES (20, '2030', 'Ввозная таможенная пошлина, взимаемая при реимпорте', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (21, '2070', 'Специальная пошлина, установленная в соответствии с законодательством Российской Федерации', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (22, '2080', 'Антидемпинговая пошлина, установленная в соответствии с законодательством Российской Федерации', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (23, '2090', 'Компенсационная пошлина, установленная в соответствии с законодательством Российской Федерации', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (24, '27Х0', 'Прочие пошлины в отношении иностранных товаров', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (25, '3010', 'Вывозная таможенная пошлина на нефть сырую, вывозимую за пределы таможенной территории Евразийского экономического союза', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (26, '3020', 'Вывозная таможенная пошлина на нефть сырую, за исключением нефти, вывозимой за пределы таможенной территории Евразийского экономического союза', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (27, '3030', 'Вывозная таможенная пошлина на газ природный', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (28, '3040', 'Вывозная таможенная пошлина на товары, выработанные из нефти', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (29, '3050', 'Вывозная таможенная пошлина на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (30, '37Х0', 'Прочие вывозные таможенные пошлины', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (31, '4010', '2.4.1. Акциз на этиловый спирт из пищевого сырья (за исключением дистиллятов винного, виноградного, плодового, коньячного, кальвадосного, вискового)', 'RU', '2.4.1');
INSERT INTO customsfeesclassifier VALUES (32, '4140', '2.4.2. Акциз на дистилляты винный, виноградный, плодовый, коньячный, кальвадосный, висковый', 'RU', '2.4.2');
INSERT INTO customsfeesclassifier VALUES (33, '4150', '2.4.3. Акциз на этиловый спирт из непищевого сырья', 'RU', '2.4.3');
INSERT INTO customsfeesclassifier VALUES (34, '4020', '2.4.4. Акциз на спиртосодержащую продукцию', 'RU', '2.4.4');
INSERT INTO customsfeesclassifier VALUES (35, '4120', '2.4.5. Акциз на алкогольную продукцию с объемной долей этилового спирта свыше 9 % (за исключением пива, вин, фруктовых вин, игристых вин (шампанских), винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU', '2.4.5');
INSERT INTO customsfeesclassifier VALUES (36, '4130', '2.4.6. Акциз на алкогольную продукцию с объемной долей этилового спирта до 9 % включительно (за исключением пива, напитков, изготавливаемых на основе пива, вин, фруктовых вин, игристых вин (шампанских), сидра, пуаре, медовухи, винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU', '2.4.6');
INSERT INTO customsfeesclassifier VALUES (37, '4090', 'Акциз на вина, фруктовые вина (за исключением игристых вин (шампанских)), винные напитки, изготавливаемые без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята', 'RU', '2.4.7');
INSERT INTO customsfeesclassifier VALUES (38, '4200', 'Акциз на игристые вина (шампанские)', 'RU', '2.4.7');
INSERT INTO customsfeesclassifier VALUES (39, '4160', '2.4.8. Акциз на сидр, пуаре, медовуху', 'RU', '2.4.8');
INSERT INTO customsfeesclassifier VALUES (40, '4100', 'Акциз на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта до 0,5 % включительно', 'RU', '2.4.9');
INSERT INTO customsfeesclassifier VALUES (41, '4210', 'Акциз на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта свыше 0,5 % и до 8,6 % включительно, напитки, изготавливаемые на основе пива', 'RU', '2.4.9');
INSERT INTO customsfeesclassifier VALUES (42, '4220', 'Акциз на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта свыше 8,6 %', 'RU', '2.4.9');
INSERT INTO customsfeesclassifier VALUES (43, '4030', 'Акциз на табак трубочный, курительный, жевательный, сосательный, нюхательный, кальянный (за исключением табака, используемого в качестве сырья для производства табачной продукции)', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (44, '4230', 'Акциз на сигары', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (45, '4240', 'Акциз на сигариллы (сигариты), биди, кретек', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (46, '4250', 'Акциз на сигареты, папиросы', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (47, '4060', 'Акциз на автомобили легковые с мощностью двигателя до 67,5 кВт (90 л. с.) включительно', 'RU', '2.4.11');
INSERT INTO customsfeesclassifier VALUES (48, '4180', 'Акциз на автомобили легковые с мощностью двигателя свыше 67,5 кВт (90 л. с.) и до 112,5 кВт (150 л. с.) включительно', 'RU', '2.4.11');
INSERT INTO customsfeesclassifier VALUES (49, '4190', 'Акциз на автомобили легковые с мощностью двигателя свыше 112,5 кВт (150 л. с.), мотоциклы с мощностью двигателя свыше 112,5 кВт (150 л. с.)', 'RU', '2.4.11');
INSERT INTO customsfeesclassifier VALUES (50, '4040', '2.4.12. Акциз на бензин автомобильный', 'RU', '2.4.12');
INSERT INTO customsfeesclassifier VALUES (51, '4070', '2.4.13. Акциз на дизельное топливо', 'RU', '2.4.13');
INSERT INTO customsfeesclassifier VALUES (52, '4080', '2.4.14. Акциз на моторные масла для дизельных и (или) карбюраторных (инжекторных) двигателей', 'RU', '2.4.14');
INSERT INTO customsfeesclassifier VALUES (53, '4050', '2.4.15. Акциз на прямогонный бензин', 'RU', '2.4.15');
INSERT INTO customsfeesclassifier VALUES (54, '4260', '2.4.17. Акциз на средние дистилляты', 'RU', '2.4.17');
INSERT INTO customsfeesclassifier VALUES (55, '4270', 'Акциз на электронные системы доставки никотина', '', '2.4.18');
INSERT INTO customsfeesclassifier VALUES (56, '4280', 'Акциз на жидкости для электронных систем доставки никотина', '', '2.4.19');
INSERT INTO customsfeesclassifier VALUES (57, '4290', 'Акциз на табак (табачные изделия), предназначенный для потребления путем нагревания', '', '2.4.20');
INSERT INTO customsfeesclassifier VALUES (58, '2012', 'Проценты за предоставление отсрочки уплаты ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие), уплаченных в соответствии с Протоколом о порядке зачисления и распределения сумм ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие), их перечисления в доход бюджетов государств-членов (приложение № 5 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (59, '2022', 'Проценты за предоставление отсрочки уплаты ввозной таможенной пошлины, обязанность по уплате которой возникла до вступления в силу Соглашения об установлении и применении в Таможенном союзе порядка зачисления и распределения ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие) от 20.05.2010', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (60, '2032', 'Проценты за предоставление отсрочки уплаты ввозной таможенной пошлины, взимаемой при реимпорте', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (251, '9320', 'Экологический сбор за выброс вредных веществ', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (61, '2072', 'Проценты за предоставление отсрочки уплаты специальной пошлины, установленной в соответствии с законодательством Российской Федерации', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (62, '2082', 'Проценты за предоставление отсрочки уплаты антидемпинговой пошлины, установленной в соответствии с законодательством Российской Федерации', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (63, '2092', 'Проценты за предоставление отсрочки уплаты компенсационной пошлины, установленной в соответствии с законодательством Российской Федерации', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (64, '27Х2', 'Проценты за предоставление отсрочки уплаты прочих пошлин в отношении иностранных товаров', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (65, '3012', 'Проценты за предоставление отсрочки уплаты вывозной таможенной пошлин на нефть сырую, вывозимую за пределы таможенной территории Евразийского экономического союза', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (66, '3022', 'Проценты за предоставление отсрочки уплаты вывозной таможенной пошлины на нефть сырую, за исключением нефти, вывозимой за пределы таможенной территории Евразийского экономического союза', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (67, '3032', 'Проценты за предоставление отсрочки уплаты вывозной таможенной пошлины на газ природный', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (68, '3042', 'Проценты за предоставление отсрочки уплаты вывозной таможенной пошлины на товары, выработанные из нефти', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (69, '3052', 'Проценты за предоставление отсрочки уплаты вывозной таможенной пошлины на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (70, '37Х2', 'Проценты за предоставление отсрочки уплаты прочих вывозных таможенных пошлин', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (71, '4012', 'Проценты за предоставление отсрочки уплаты акциза на этиловый спирт из пищевого сырья (за исключением дистиллятов винного, виноградного, плодового, коньячного, кальвадосного, вискового)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (72, '4022', 'Проценты за предоставление отсрочки уплаты акциза на спиртосодержащую продукцию', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (73, '4032', 'Проценты за предоставление отсрочки уплаты акциза на табак трубочный, курительный, жевательный, сосательный, нюхательный, кальянный (за исключением табака, используемого в качестве сырья для производства табачной продукции)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (74, '4232', 'Проценты за предоставление отсрочки уплаты акциза на сигары', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (75, '4242', 'Проценты за предоставление отсрочки уплаты акциза на сигариллы (сигариты), биди, кретек', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (76, '4252', 'Проценты за предоставление отсрочки уплаты акциза на сигареты, папиросы', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (77, '4042', 'Проценты за предоставление отсрочки уплаты акциза на бензин автомобильный', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (78, '4052', 'Проценты за предоставление отсрочки уплаты акциза на прямогонный бензин', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (79, '4062', 'Проценты за предоставление отсрочки уплаты акциза на автомобили легковые с мощностью двигателя до 67,5 кВт (90 л. с.) включительно', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (80, '4182', 'Проценты за предоставление отсрочки уплаты акциза на автомобили легковые с мощностью двигателя свыше 67,5 кВт (90 л. с.) и до 112,5 кВт (150 л. с.) включительно', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (81, '4192', 'Проценты за предоставление отсрочки уплаты акциза на автомобили легковые с мощностью двигателя свыше 112,5 кВт (150 л. с.), мотоциклы с мощностью двигателя свыше 112,5 кВт (150 л. с.)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (82, '4072', 'Проценты за предоставление отсрочки уплаты акциза на дизельное топливо', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (83, '4082', 'Проценты за предоставление отсрочки уплаты акциза на моторные масла для дизельных и (или) карбюраторных (инжекторных двигателей)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (84, '2083', 'Проценты за предоставление рассрочки уплаты антидемпинговой пошлины, установленной в соответствии с законодательством Российской Федерации', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (85, '4092', 'Проценты за предоставление отсрочки уплаты акциза на вина, фруктовые вина (за исключением игристых вин (шампанских)), винные напитки, изготавливаемые без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (86, '4202', 'Проценты за предоставление отсрочки уплаты акциза на игристые вина (шампанские)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (87, '4102', 'Проценты за предоставление отсрочки уплаты акциза на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта до 0,5 % включительно', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (252, '9330', 'Дорожные платежи', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (88, '4212', 'Проценты за предоставление отсрочки уплаты акциза на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта свыше 0,5 % и до 8,6 % включительно, напитки, изготавливаемые на основе пива', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (89, '4222', 'Проценты за предоставление отсрочки уплаты акциза на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта свыше 8,6 %', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (90, '4122', 'Проценты за предоставление отсрочки уплаты акциза на алкогольную продукцию с объемной долей этилового спирта свыше 9 % (за исключением пива, вин, фруктовых вин, игристых вин (шампанских), винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (91, '4132', 'Проценты за предоставление отсрочки уплаты акциза на алкогольную продукцию с объемной долей этилового спирта до 9 % включительно (за исключением пива, напитков, изготавливаемых на основе пива, вин, фруктовых вин, игристых вин (шампанских), сидра, пуаре, медовухи, винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (92, '4142', 'Проценты за предоставление отсрочки уплаты акциза на дистилляты винный, виноградный, плодовый, коньячный, кальвадосный, висковый', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (93, '4152', 'Проценты за предоставление отсрочки уплаты акциза на этиловый спирт из непищевого сырья', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (94, '4162', 'Проценты за предоставление отсрочки уплаты акциза на сидр, пуаре, медовуху', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (95, '4262', 'Проценты за предоставление отсрочки уплаты акциза на средние дистилляты', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (96, '4272', 'Проценты за предоставление отсрочки уплаты акциза на электронные системы доставки никотина', '', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (97, '4282', 'Проценты за предоставление отсрочки уплаты акциза на жидкости для электронных систем доставки никотина', '', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (98, '4292', 'Проценты за предоставление отсрочки уплаты акциза на табак (табачные изделия), предназначенный для потребления путем нагревания', '', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (99, '5012', 'Проценты за предоставление отсрочки уплаты налога на добавленную стоимость', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (100, '4293', 'Проценты за предоставление рассрочки уплаты акциза на табак (табачные изделия), предназначенный для потребления путем нагревания', '', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (101, '2013', 'Проценты за предоставление рассрочки уплаты ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие), уплаченных в соответствии с Протоколом о порядке зачисления и распределения сумм ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие), их перечисления в доход бюджетов государств-членов (приложение № 5 к Договору о Евразийском экономическом союзе от 29 мая 2014 года)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (102, '2023', 'Проценты за предоставление рассрочки уплаты ввозной таможенной пошлины, обязанность по уплате которой возникла до вступления в силу Соглашения об установлении и применении в Таможенном союзе порядка зачисления и распределения ввозных таможенных пошлин (иных пошлин, налогов и сборов, имеющих эквивалентное действие) от 20.05.2010', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (103, '2073', 'Проценты за предоставление рассрочки уплаты специальной пошлины, установленной в соответствии с законодательством Российской Федерации', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (104, '9460', 'Доходы, обращенные в пользу государства', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (105, '2093', 'Проценты за предоставление рассрочки уплаты компенсационной пошлины, установленной в соответствии с законодательством Российской Федерации', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (106, '27Х3', 'Проценты за предоставление рассрочки уплаты прочих пошлин в отношении иностранных товаров', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (107, '3013', 'Проценты за предоставление рассрочки уплаты вывозной таможенной пошлины на нефть сырую, вывозимую за пределы таможенной территории Евразийского экономического союза', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (108, '3023', 'Проценты за предоставление рассрочки уплаты вывозной таможенной пошлины на нефть сырую, за исключением нефти, вывозимой за пределы таможенной территории Евразийского экономического союза', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (253, '9410', 'Государственная пошлина за экспорт', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (109, '3033', 'Проценты за предоставление рассрочки уплаты вывозной таможенной пошлины на газ природный', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (110, '3043', 'Проценты за предоставление рассрочки уплаты вывозной таможенной пошлины на товары, выработанные из нефти', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (111, '3053', 'Проценты за предоставление рассрочки уплаты вывозной таможенной пошлины на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (112, '37Х3', 'Проценты за предоставление рассрочки уплаты прочих вывозных таможенных пошлин', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (113, '4013', 'Проценты за предоставление рассрочки уплаты акциза на этиловый спирт из пищевого сырья (за исключением дистиллятов винного, виноградного, плодового, коньячного, кальвадосного, вискового)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (114, '4023', 'Проценты за предоставление рассрочки уплаты акциза на спиртосодержащую продукцию', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (115, '4033', 'Проценты за предоставление рассрочки уплаты акциза на табак трубочный, курительный, жевательный, сосательный, нюхательный, кальянный (за исключением табака, используемого в качестве сырья для производства табачной продукции)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (116, '4233', 'Проценты за предоставление рассрочки уплаты акциза на сигары', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (117, '4243', 'Проценты за предоставление рассрочки уплаты акциза на сигариллы (сигариты), биди, кретек', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (118, '4253', 'Проценты за предоставление рассрочки уплаты акциза на сигареты, папиросы', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (119, '4043', 'Проценты за предоставление рассрочки уплаты акциза на бензин автомобильный', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (120, '4053', 'Проценты за предоставление рассрочки уплаты акциза на прямогонный бензин', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (121, '4063', 'Проценты за предоставление рассрочки уплаты акциза на автомобили легковые с мощностью двигателя до 67,5 кВт (90 л. с.) включительно', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (122, '4183', 'Проценты за предоставление рассрочки уплаты акциза на автомобили легковые с мощностью двигателя свыше 67,5 кВт (90 л. с.) и до 112,5 кВт (150 л. с.) включительно', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (123, '4193', 'Проценты за предоставление рассрочки уплаты акциза на автомобили легковые с мощностью двигателя свыше 112,5 кВт (150 л. с.), мотоциклы с мощностью двигателя свыше 112,5 кВт (150 л. с.)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (124, '4073', 'Проценты за предоставление рассрочки уплаты акциза на дизельное топливо', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (125, '4083', 'Проценты за предоставление рассрочки уплаты акциза на моторные масла для дизельных и (или) карбюраторных (инжекторных двигателей)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (126, '4093', 'Проценты за предоставление рассрочки уплаты акциза на вина, фруктовые вина (за исключением игристых вин (шампанских)), винные напитки, изготавливаемые без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (127, '4203', 'Проценты за предоставление рассрочки уплаты акциза на игристые вина (шампанские)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (128, '4103', 'Проценты за предоставление рассрочки уплаты акциза на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта до 0,5 % включительно', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (129, '4213', 'Проценты за предоставление рассрочки уплаты акциза на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта свыше 0,5 % и до 8,6 % включительно, напитки, изготавливаемые на основе пива', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (130, '9470', 'Прочие неналоговые доходы', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (131, '4223', 'Проценты за предоставление рассрочки уплаты акциза на пиво с нормативным (стандартизированным) содержанием объемной доли этилового спирта свыше 8,6 %', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (132, '4123', 'Проценты за предоставление рассрочки уплаты акциза на алкогольную продукцию с объемной долей этилового спирта свыше 9 % (за исключением пива, вин, фруктовых вин, игристых вин (шампанских), винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (157, '9930', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в качестве владельца склада временного хранения', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (250, '9310', 'Экологический сбор за импорт товаров, наносящих вред окружающей среде', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (133, '4133', 'Проценты за предоставление рассрочки уплаты акциза на алкогольную продукцию с объемной долей этилового спирта до 9 % включительно (за исключением пива, напитков, изготавливаемых на основе пива, вин, фруктовых вин, игристых вин (шампанских), сидра, пуаре, медовухи, винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (134, '4143', 'Проценты за предоставление рассрочки уплаты акциза на дистилляты винный, виноградный, плодовый, коньячный, кальвадосный, висковый', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (135, '4153', 'Проценты за предоставление рассрочки уплаты акциза на этиловый спирт из непищевого сырья', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (136, '4163', 'Проценты за предоставление рассрочки уплаты акциза на сидр, пуаре, медовуху', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (137, '4263', 'Проценты за предоставление рассрочки уплаты акциза на средние дистилляты', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (138, '4273', 'Проценты за предоставление рассрочки уплаты акциза на электронные системы доставки никотина', '', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (139, '4283', 'Проценты за предоставление рассрочки уплаты акциза на жидкости для электронных систем доставки никотина', '', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (140, '5013', 'Проценты за предоставление рассрочки уплаты налога на добавленную стоимость', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (141, '7015', 'Средства от реализации конфискатов в части реализации материальных запасов по указанному имуществу', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (142, '7030', 'Средства, полученные в результате применения мер гражданско-правовой и административной ответственности', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (143, '7040', 'Средства, полученные в результате применения мер уголовной ответственности по делам, возбужденным таможенными органами', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (144, '7024', 'Штрафы, за исключением штрафов за нарушение валютного законодательства Российской Федерации и актов органов валютного регулирования, назначаемых таможенными органами, и штрафов за нарушение законодательства Российской Федерации об основах конституционного строя Российской Федерации, о государственной власти Российской Федерации, о государственной службе Российской Федерации, о выборах и референдумах Российской Федерации, об Уполномоченном по правам человека в Российской Федерации', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (145, '7025', 'Штрафы за нарушение валютного законодательства Российской Федерации и актов органов валютного регулирования, назначаемые таможенными органами', '', '2.6');
INSERT INTO customsfeesclassifier VALUES (146, '7026', 'Штрафы за нарушение законодательства Российской Федерации об основах конституционного строя Российской Федерации, о государственной власти Российской Федерации, о государственной службе Российской Федерации, о выборах и референдумах Российской Федерации, об Уполномоченном по правам человека в Российской Федерации', '', '2.6');
INSERT INTO customsfeesclassifier VALUES (147, '9010', 'Субсидии и иные суммы, не уплаченные либо полученные прямо или косвенно в качестве выплат, льгот либо возмещений в связи с вывозом товаров с таможенной территории', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (148, '9020', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (149, '9030', 'Прочие доходы от оказания платных услуг получателями средств и компенсации затрат', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (150, '9040', 'Прочие неналоговые доходы', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (151, '9050', 'Прочие поступления от внешнеэкономической деятельности', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (152, '9070', 'Авансовые платежи в счет будущих таможенных и иных платежей', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (153, '9080', 'Обеспечение уплаты таможенных пошлин, налогов, за исключением обеспечения, вносимого денежными средствами (деньгами) либо в связи с осуществлением деятельности в сфере таможенного дела', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (154, '9090', 'Денежные средства (деньги), внесенные в качестве обеспечения уплаты таможенных пошлин, налогов, за исключением денежных средств (денег), вносимых в связи с осуществлением деятельности в сфере таможенного дела', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (155, '9910', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в качестве таможенного представителя', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (156, '9920', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в качестве таможенного перевозчика', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (190, '9130', 'Утилизационный сбор, плательщиком которого выступает юридическое лицо или индивидуальный предприниматель', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (158, '9940', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в качестве владельца таможенного склада', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (159, '9950', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в качестве владельца магазина беспошлинной торговли', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (160, '9960', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в качестве уполномоченного экономического оператора', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (161, '9100', 'Денежные средства, внесенные в качестве обеспечения исполнения обязательств организации об использовании приобретенных акцизных марок, по которым обязательство организации не исполнено', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (162, '9110', 'Средства, уплачиваемые импортерами таможенным органам за выдачу акцизных марок', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (163, '9120', 'Утилизационный сбор, уплачиваемый за колесные транспортные средства (шасси) и прицепы к ним, ввозимые в Российскую Федерацию, кроме колесных транспортных средств (шасси) и прицепов к ним, ввозимых с территории Республики Беларусь', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (164, '9130', 'Утилизационный сбор, уплачиваемый за колесные транспортные средства (шасси) и прицепы к ним, ввозимые в Российскую Федерацию с территории Республики Беларусь', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (165, '9150', 'Утилизационный сбор, уплачиваемый за самоходные машины и прицепы к ним, ввозимые в Российскую Федерацию, кроме самоходных машин и прицепов к ним, ввозимых с территории Республики Беларусь', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (166, '9160', 'Утилизационный сбор, уплачиваемый за самоходные машины и прицепы к ним, ввозимые в Российскую Федерацию с территории Республики Беларусь', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (167, '9140', 'Государственная пошлина за принятие предварительных решений по классификации товаров по ТН ВЭД ЕАЭС', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (168, '1040', 'Таможенные сборы за выдачу квалификационного аттестата специалиста в области таможенного дела (специалиста по таможенным операциям, специалиста по таможенному оформлению)', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (169, '1050', 'Таможенные сборы за принятие таможенным органом предварительного решения', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (170, '1060', 'Таможенные сборы за включение в реестр банков и небанковских кредитно-финансовых организаций, признанных таможенными органами гарантом уплаты таможенных пошлин, налогов', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (171, '1070', 'Таможенные сборы за совершение таможенных операций, взимаемые при перемещении физическими лицами товаров для личного пользования, облагаемых таможенными пошлинами, налогами', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (172, '18Х0', 'Прочие таможенные сборы', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (173, '2840', 'Специальная пошлина, уплачиваемая в соответствии с законодательством Республики Беларусь', 'BY', '3.2');
INSERT INTO customsfeesclassifier VALUES (174, '2850', 'Антидемпинговая пошлина, уплачиваемая в соответствии с законодательством Республики Беларусь', 'BY', '3.2');
INSERT INTO customsfeesclassifier VALUES (175, '28Х0', 'Прочие пошлины в отношении иностранных товаров', 'BY', '3.2');
INSERT INTO customsfeesclassifier VALUES (176, '3010', 'Вывозная таможенная пошлина на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (177, '3050', 'Вывозная таможенная пошлина на калийные удобрения', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (178, '3800', 'Вывозная таможенная пошлина, исчисляемая и уплачиваемая в долларах США при помещении под таможенную процедуру экспорта нефти сырой, страной происхождения которой не является Республика Беларусь, и отдельных категорий товаров, выработанных из нефти', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (179, '3810', 'Вывозная таможенная пошлина при экспорте нефти сырой, страной происхождения которой является Республика Беларусь', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (180, '38Х0', 'Прочие вывозные таможенные пошлины', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (181, '4180', 'Акцизы, на алкогольную продукцию и спиртосодержащие растворы', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (182, '4190', 'Акцизы на пиво', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (183, '4200', 'Акцизы на табачные изделия', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (184, '4220', 'Акцизы на автомобильное и иное используемое в качестве автомобильного топливо', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (185, '4230', 'Акцизы на масла моторные', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (186, '48Х0', 'Прочие акцизы', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (187, 'ХХХ2', 'Проценты за предоставление отсрочки таможенного платежа', 'BY', '3.5');
INSERT INTO customsfeesclassifier VALUES (188, 'ХХХ3', 'Проценты за предоставление рассрочки таможенного платежа', 'BY', '3.5');
INSERT INTO customsfeesclassifier VALUES (189, '9120', 'Утилизационный сбор, плательщиком которого выступает физическое лицо, не являющееся индивидуальным предпринимателем', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (247, '4640', 'Акциз на нефть и продукты из нефти', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (191, '9200', 'Обеспечение уплаты таможенных пошлин, налогов (за исключением обеспечения, вносимого в связи с осуществлением деятельности в сфере таможенного дела)', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (192, '9910', 'Обеспечение уплаты таможенных пошлин, налогов, предоставленное в связи с осуществлением деятельности в сфере таможенного дела', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (193, '98Х0', 'Прочие суммы обеспечения уплаты таможенных пошлин, налогов', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (194, '1039', 'Плата за принятие таможенным органом предварительного решения', 'KZ', '4.1');
INSERT INTO customsfeesclassifier VALUES (195, '1049', 'Прочие таможенные сборы', 'KZ', '4.1');
INSERT INTO customsfeesclassifier VALUES (196, '3010', 'Вывозная таможенная пошлина на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (197, '3070', 'Вывозная таможенная пошлина на сырую нефть', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (198, '3080', 'Вывозная таможенная пошлина на товары, выработанные из нефти', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (199, '39Х0', 'Прочие вывозные таможенные пошлины', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (200, '4310', 'Акциз на сигары, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (201, '4320', 'Акциз на слабоградусные ликероводочные изделия с объемной долей этилового спирта от 1,5 до 12 процентов, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (202, '4330', 'Акцизы на сигариллы, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (203, '4340', 'Акцизы на табак трубочный, курительный, жевательный, сосательный, нюхательный, кальянный и прочий, упакованный в потребительскую тару и предназначенный для конечного потребления, за исключением фармацевтической продукции, содержащей никотин, импортируемый на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (204, '4350', 'Акциз на все виды спирта и спиртосодержащую продукцию, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (205, '4360', 'Акциз на водку, импортируемую на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (206, '4370', 'Акциз на крепкие ликероводочные изделия с объемной долей этилового спирта от 30 до 60 процентов, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (207, '4380', 'Акцизы на вина, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (208, '4390', 'Акцизы на коньяк, бренди импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (209, '4400', 'Акцизы на пиво, импортируемое на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (210, '4410', 'Акцизы на слабоградусные ликероводочные изделия с объемной долей этилового спирта от 12 до 30 процентов, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (211, '4420', 'Акцизы на сигареты с фильтром, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (212, '4430', 'Акцизы на сигареты без фильтра, папиросы, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (248, '4650', 'Акциз на нефтяные газы и газообразные углеводороды (кроме натурального газа)', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (249, '46X0', 'Прочие акцизы', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (213, '4440', 'Акцизы на легковые автомобили (кроме автомобилей с ручным управлением или адаптером ручного управления, специально предназначенных для инвалидов), импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (214, '4450', 'Акцизы на виноматериалы, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (215, '4460', 'Акцизы на дизельное топливо, импортируемое на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (216, '4470', 'Акцизы на бензин (за исключением авиационного), импортируемый на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (217, '4480', 'Акцизы на сырую нефть, газовый конденсат, импортируемые на территорию Республики Казахстан, кроме товаров Евразийского экономического союза, ввозимых с территории Российской Федерации и Республики Беларусь', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (218, '4490', 'Акцизы, доначисленные в результате проведения независимой экспертизы таможенной стоимости товаров, импортируемых на территорию Республики Казахстан', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (219, '49Х0', 'Прочие акцизы', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (220, 'XXX6', 'Проценты за предоставление отсрочки уплаты ввозной таможенной пошлины', '', '4.4.1');
INSERT INTO customsfeesclassifier VALUES (221, 'XXX7', 'Проценты за предоставление рассрочки уплаты ввозной таможенной пошлины', '', '4.4.1');
INSERT INTO customsfeesclassifier VALUES (222, '5020', 'Налог на добавленную стоимость на товары, происходящие и импортируемые с территории Российской Федерации до создания единой таможенной территории', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (223, '5030', 'Налог на добавленную стоимость на товары, происходящие и импортируемые с территории Республики Беларусь до создания единой таможенной территории', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (224, '5040', 'Налог на добавленную стоимость, доначисленный в результате проведения независимой экспертизы таможенной стоимости товаров, импортируемых на территорию Республики Казахстан, кроме налога на добавленную стоимость на товары, происходящих и импортируемых с территории Российской Федерации', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (225, '5050', 'Налог на добавленную стоимость, доначисленный в результате проведения независимой экспертизы таможенной стоимости товаров, происходящих и импортируемых с территории Российской Федерации', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (226, '5060', 'Прочие виды налога на добавленную стоимость', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (227, '7020', 'Административные штрафы, санкции, взыскания, налагаемые таможенными органами, за исключением поступлений от организаций нефтяного сектора', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (228, '9300', 'Сбор за проезд автотранспортных средств по территории Республики Казахстан, кроме сбора за проезд автотранспортных средств по платным государственным автомобильным дорогам местного значения', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (229, '9350', 'Специальная (защитная) пошлина, уплачиваемая в соответствии с законодательством Республики Казахстан', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (230, '9400', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (231, '1030', 'Таможенные сборы за временное хранение', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (232, '1050', 'Таможенные сборы за предоставление таможенным органом предварительного решения о классификации товаров', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (233, '1090', 'Таможенные сборы за таможенный контроль в отношении товаров, перемещаемых по трубопроводам и линиям электропередач', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (234, '15Х0', 'Прочие таможенные сборы', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (235, '3010', 'Вывозная таможенная пошлина на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'AM', '5.2');
INSERT INTO customsfeesclassifier VALUES (236, '35Х0', 'Прочие вывозные таможенные пошлины', 'AM', '5.2');
INSERT INTO customsfeesclassifier VALUES (237, '46Х0', 'Прочие акцизы', 'AM', '5.2');
INSERT INTO customsfeesclassifier VALUES (238, '4510', 'Акциз на этиловый спирт', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (239, '4520', 'Акциз на спиртосодержащую продукцию', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (240, '4530', 'Акциз на вина', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (241, '4540', 'Акциз на пиво', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (242, '4550', 'Акциз на заменители табака', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (243, '4560', 'Акциз на табачные изделия', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (244, '4610', 'Акциз на бензин', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (245, '4620', 'Акциз на дизельное топливо', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (246, '4630', 'Акциз на смазочные материалы', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (254, '1080', 'Прочие таможенные сборы, не поименованные в разделе 1', 'KG', '6.1');
INSERT INTO customsfeesclassifier VALUES (255, '3010', 'Вывозная таможенная пошлина на товары, в отношении которых не установлен отдельный код вида вывозной таможенной пошлины', 'KG', '6.2');
INSERT INTO customsfeesclassifier VALUES (256, '3060', 'Вывозная сезонная таможенная пошлина', 'KG', '6.2');
INSERT INTO customsfeesclassifier VALUES (257, '36Х0', 'Прочие вывозные таможенные пошлины', 'KG', '6.2');
INSERT INTO customsfeesclassifier VALUES (258, '4010', 'Акциз на этиловый спирт', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (259, '4020', 'Акциз на водку и ликеро-водочные изделия', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (260, '4030', 'Акциз на крепленые напитки, крепленые соки и бальзамы', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (261, '4040', 'Акциз на вина', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (262, '4050', 'Акциз на коньяки', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (263, '4060', 'Акциз на вино игристое, включая шампанское', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (264, '4070', 'Акциз на пиво расфасованное', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (265, '4080', 'Акциз на пиво нефасованное', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (266, '4090', 'Акциз на виноматериалы', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (267, '4100', 'Акциз на табачные изделия с фильтром', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (268, '4110', 'Акциз на табачные изделия без фильтра', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (269, '4120', 'Акциз на сигары и сигариллы', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (270, '4130', 'Акциз на прочие изделия, содержащие табак, кроме табака ферментированного', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (271, '4140', 'Акциз на бензин, легкие и средние дистилляты и прочие бензины', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (272, '4150', 'Акциз на топливо реактивное', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (273, '4160', 'Акциз на дизельное топливо', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (274, '4170', 'Акциз на мазут', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (275, '4180', 'Акциз на масла и газовый конденсат', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (276, '4190', 'Акциз на нефть сырую и нефтепродукты сырые, полученные из битуминозных материалов', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (277, '47Х6', 'Прочие акцизы', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (278, 'ХХХ4', 'Проценты за предоставление отсрочки таможенного платежа', 'KG', '6.4');
INSERT INTO customsfeesclassifier VALUES (279, 'ХХХ5', 'Проценты за предоставление рассрочки таможенного платежа', 'KG', '6.4');
INSERT INTO customsfeesclassifier VALUES (280, '9420', 'Сборы с иностранных автоперевозчиков', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (281, '9430', 'Административные штрафы', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (282, '9440', 'Поступления от реализации конфискованного имущества', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (283, '9450', 'Плата за выдачу лицензий', 'KG', '6.5');


--
-- TOC entry 4543 (class 0 OID 18831)
-- Dependencies: 237
-- Data for Name: customsfeesclassifierchapters; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesclassifierchapters VALUES (1, '1', 'Виды платежей, применяемых на всей таможенной территории Евразийского экономического союза', '');
INSERT INTO customsfeesclassifierchapters VALUES (2, '2', 'Виды платежей, уплата которых предусмотрена законодательством о таможенном деле в Российской Федерации', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (3, '3', 'Виды платежей, уплата которых предусмотрена таможенным законодательством Республики Беларусь', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (4, '4', 'Виды платежей, уплата которых предусмотрена законодательством Республики Казахстан', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (5, '5', 'Виды платежей, уплата которых предусмотрена законодательством Республики Армения', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (6, '6', 'Виды платежей, уплата которых предусмотрена законодательством Кыргызской Республики', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (7, '2.1', 'Таможенные сборы', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (8, '2.2', 'Иные пошлины, взимание которых возложено на таможенные органы', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (9, '2.3', 'Вывозная таможенная пошлина', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (10, '2.4', 'Акцизы', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (11, '2.4.1', 'Акциз на этиловый спирт из пищевого сырья (за исключением дистиллятов винного, виноградного, плодового, коньячного, кальвадосного, вискового)', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (12, '2.4.2', 'Акциз на дистилляты винный, виноградный, плодовый, коньячный, кальвадосный, висковый', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (13, '2.4.3', 'Акциз на этиловый спирт из непищевого сырья', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (14, '2.4.4', 'Акциз на спиртосодержащую продукцию', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (15, '2.4.5', 'Акциз на алкогольную продукцию с объемной долей этилового спирта свыше 9 % (за исключением пива, вин, фруктовых вин, игристых вин (шампанских), винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (16, '2.4.6', 'Акциз на алкогольную продукцию с объемной долей этилового спирта до 9 % включительно (за исключением пива, напитков, изготавливаемых на основе пива, вин, фруктовых вин, игристых вин (шампанских), сидра, пуаре, медовухи, винных напитков, изготавливаемых без добавления ректификованного этилового спирта, произведенного из пищевого сырья, и (или) спиртованных виноградного или иного фруктового сусла, и (или) винного дистиллята, и (или) фруктового дистиллята)', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (17, '2.4.7', 'Акциз на вина', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (18, '2.4.8', 'Акциз на сидр, пуаре, медовуху', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (19, '2.4.9', 'Акциз на пиво', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (20, '2.4.10', 'Акциз на табачную продукцию', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (21, '2.4.11', 'Акциз на автомобили легковые и мотоциклы', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (22, '2.4.12', 'Акциз на бензин автомобильный', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (23, '2.4.13', 'Акциз на дизельное топливо', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (24, '2.4.14', 'Акциз на моторные масла для дизельных и (или) карбюраторных (инжекторных) двигателей', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (25, '2.4.15', 'Акциз на прямогонный бензин', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (26, '2.4.17', 'Акциз на средние дистилляты', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (27, '2.4.18', 'Акциз на электронные системы доставки никотина', '');
INSERT INTO customsfeesclassifierchapters VALUES (28, '2.4.19', 'Акциз на жидкости для электронных систем доставки никотина', '');
INSERT INTO customsfeesclassifierchapters VALUES (29, '2.4.20', 'Акциз на табак (табачные изделия), предназначенный для потребления путем нагревания', '');
INSERT INTO customsfeesclassifierchapters VALUES (30, '2.5', 'Проценты', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (31, '2.5.1', 'Проценты за предоставление отсрочки таможенного платежа', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (32, '2.5.2', 'Проценты за предоставление рассрочки таможенного платежа', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (33, '2.6', 'Средства и штрафы', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (34, '2.7', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (35, '3.1', 'Таможенные сборы', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (36, '3.2', 'Иные пошлины, взимание которых возложено на таможенные органы', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (37, '3.3', 'Вывозная таможенная пошлина', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (38, '3.4', 'Акцизы, взимаемые при ввозе товаров на таможенную территорию Евразийского экономического союза', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (39, '3.5', 'Проценты', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (40, '3.6', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (41, '4.1', 'Таможенные сборы', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (42, '4.2', 'Вывозная таможенная пошлина', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (43, '4.3', 'Акцизы', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (44, '4.4', 'Налог на добавленную стоимость', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (45, '4.4.1', 'Проценты', '');
INSERT INTO customsfeesclassifierchapters VALUES (46, '4.5', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (47, '5.1', 'Таможенные сборы', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (48, '5.2', 'Вывозная таможенная пошлина', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (49, '5.3', 'Акцизы', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (50, '5.4', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (51, '6.1', 'Таможенные сборы', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (52, '6.2', 'Вывозная таможенная пошлина', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (53, '6.3', 'Акцизы', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (54, '6.4', 'Проценты', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (55, '6.5', 'Иные виды платежей, взимание которых возложено на таможенные органы', 'KG');


--
-- TOC entry 4545 (class 0 OID 18839)
-- Dependencies: 239
-- Data for Name: customsfeesfeaturesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesfeaturesclassifier VALUES (1, 'ЗН', 'Уплата налога на добавленную стоимость методом зачета (для Республики Казахстан)', 'KZ');
INSERT INTO customsfeesfeaturesclassifier VALUES (2, 'ТР', 'Уплата таможенных пошлин по временной таможенной декларации в отношении товаров, перемещаемых трубопроводным транспортом (для Российском Федерации)', 'RU');
INSERT INTO customsfeesfeaturesclassifier VALUES (3, 'ИУ', 'Уплата платежа до выпуска, а также до истечения срока, указанного в подпункте 2 пункта 1 статьи 197 ТК, в случае выпуска товаров до подачи таможенной декларации', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (4, 'ВУ', 'Платеж уплачен (взыскан) после выпуска товаров в полном размере исчисленной суммы', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (5, 'ОП', 'Отсрочка уплаты таможенных пошлин, изменение срока уплаты налогов или таможенных сборов с единовременным погашением суммы платежа', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (6, 'РП', 'Рассрочка уплаты таможенных пошлин, изменение срока уплаты налогов или таможенных сборов с поэтапным погашением суммы платежа', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (7, 'УН', 'Условное исчисление таможенных пошлин, налогов и таможенных сборов, освобождение от которых предусмотрено международными договорами и актами, составляющими право Евразийского экономического союза, и законодательством государств – членов Евразийского экономического союза', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (8, 'УР', 'Условное исчисление таможенных пошлин, налогов и таможенных сборов исходя из содержания таможенной процедуры, условиями которой предусмотрено освобождение от уплаты таможенных пошлин, налогов и таможенных сборов', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (9, 'УМ', 'Платеж не уплачивается или уплачивается в размере, меньшем исчисленной суммы', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (10, 'ВВ', 'Платеж уплачивается (взыскан) при частичном условном освобождении от уплаты таможенных пошлин, налогов в соответствии с таможенной процедурой временного ввоза (допуска)', 'Ограничений нет');
INSERT INTO customsfeesfeaturesclassifier VALUES (11, 'ОЧ', 'Отсрочка части суммы таможенных пошлин, изменение срока уплаты части суммы налогов или таможенных сборов с единовременным погашением суммы платежа', 'Ограничений нет');


--
-- TOC entry 4547 (class 0 OID 18847)
-- Dependencies: 241
-- Data for Name: customsfeesguaranteemethodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4549 (class 0 OID 18855)
-- Dependencies: 243
-- Data for Name: customsfeesmethodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesmethodsclassifier VALUES (1, 'БН', 'В безналичной форме на соответствующий код бюджетной классификации', '');
INSERT INTO customsfeesmethodsclassifier VALUES (2, 'БЗ', 'Зачетом платежа, уплаченного в безналичной форме на иной код бюджетной классификации', '');
INSERT INTO customsfeesmethodsclassifier VALUES (3, 'НР', 'В наличной форме', '');
INSERT INTO customsfeesmethodsclassifier VALUES (4, 'НЗ', 'Зачетом платежа, уплаченного в наличной форме на иной код бюджетной классификации', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (5, 'ПК', 'С применением микропроцессорных пластиковых карт', '');
INSERT INTO customsfeesmethodsclassifier VALUES (6, 'КЗ', 'Зачетом платежа, уплаченного с применением микропроцессорных пластиковых карт на иной код бюджетной классификации', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (7, 'ПС', 'Предприятию связи', '');
INSERT INTO customsfeesmethodsclassifier VALUES (8, 'СЗ', 'Зачетом платежа, уплаченного предприятию связи на иной код бюджетной классификации', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (9, 'ОБ', 'Путем обращения в таможенные платежи сумм, внесенных на счета, не предназначенные для зачисления сумм таможенных платежей', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (10, 'ВЗ', 'Взаимозачетом таможенных платежей, подлежащих уплате плательщиком, и финансовых обязательств органов государственного управления, исполнительных и распорядительных органов государства-члена Евразийского экономического союза перед этим плательщиком', 'BY');


--
-- TOC entry 4551 (class 0 OID 18863)
-- Dependencies: 245
-- Data for Name: customstransitmovementofgoodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customstransitmovementofgoodsclassifier VALUES (1, 'ТР', 'Перевозка иностранных товаров от таможенного органа в месте прибытия до таможенного органа в месте убытия', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (2, 'ИМ', 'Перевозка иностранных товаров от таможенного органа в месте прибытия до внутреннего таможенного органа', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (3, 'ЭК', 'Перевозка иностранных товаров, а также товаров Евразийского экономического союза от внутреннего таможенного органа до таможенного органа в месте убытия', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (4, 'ВТ', 'Перевозка иностранных товаров от одного внутреннего таможенного органа до другого внутреннего таможенного органа', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (5, 'ТС', 'Перевозка товаров Евразийского экономического союза от таможенного органа места убытия до таможенного органа места прибытия через территорию государства, не являющегося членом Евразийского экономического союза', NULL, NULL);


--
-- TOC entry 4553 (class 0 OID 18871)
-- Dependencies: 247
-- Data for Name: customsvalueconclusionclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsvalueconclusionclassifier VALUES (1, '0', 'Таможенная стоимость принята', 'Ограничений нет');
INSERT INTO customsvalueconclusionclassifier VALUES (2, '1', 'Таможенная стоимость скорректирована', 'Ограничений нет');
INSERT INTO customsvalueconclusionclassifier VALUES (3, '2', 'Проводится дополнительная проверка', 'Ограничений нет');


--
-- TOC entry 4555 (class 0 OID 18879)
-- Dependencies: 249
-- Data for Name: dataformatclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4557 (class 0 OID 18887)
-- Dependencies: 251
-- Data for Name: declarationofgoodsfeaturesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO declarationofgoodsfeaturesclassifier VALUES (1, 'ППД', 'Периодическое таможенное декларирование (полная таможенная декларация) (для Республики Казахстан)', 'KZ');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (2, 'ДВД', 'Дополнительные особенности таможенного декларирования товаров, перемещаемых трубопроводным транспортом и по линиям электропередачи (дополнительная временная таможенная декларация) (для Российской Федерации)', 'RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (3, 'ЗОС', 'Таможенное декларирование товаров с указанием ориентировочных сведений (для Республики Беларусь)', 'BY');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (4, 'ЗТС', 'Таможенное декларирование товаров с указанием точных сведений (для Республики Беларусь)', 'BY');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (5, 'ОТЛ', 'Особенности таможенного декларирования товаров, перемещаемых трубопроводным транспортом или по линиям электропередачи (для Республики Беларусь)', 'BY');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (6, 'НТД', 'Неполное таможенное декларирование (для Республики Казахстан и Российской Федерации)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (7, 'ПДТ', 'Периодическое таможенное декларирование (периодическая таможенная декларация, периодическая декларация на товары) (для Республики Казахстан и Российской Федерации соответственно)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (8, 'ВТД', 'Временное (временное периодическое) таможенное декларирование (временная декларация на товары) (для Республики Казахстан и Российской Федерации)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (9, 'ПВД', 'Временное (временное периодическое) таможенное декларирование (полная декларация на товары) (для Республики Казахстан и Российской Федерации)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (10, 'ОКТ', 'Особенности таможенного декларирования товаров в несобранном или разобранном виде, в том числе некомплектном или незавершенном виде, в течение установленного периода времени (декларация на товары (заявление) на отдельные компоненты)', 'Ограничений нет');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (11, 'ЗПК', 'Особенности таможенного декларирования товаров в несобранном или разобранном виде, в том числе некомплектном или незавершенном виде, в течение установленного периода времени (полная декларация на товары на все компоненты)', 'Ограничений нет');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (12, 'ВДТ', 'Особенности таможенного декларирования товаров при их выпуске до подачи таможенной декларации', 'Ограничений нет');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (13, 'НВТ', 'Особенности таможенного декларирования товаров, незаконно ввезенных на таможенную территорию Евразийского экономического союза', 'Ограничений нет');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (14, 'ПТД', 'Предварительное таможенное декларирование', 'Ограничений нет');


--
-- TOC entry 4559 (class 0 OID 18895)
-- Dependencies: 253
-- Data for Name: definingcustomsvaluemethodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO definingcustomsvaluemethodsclassifier VALUES (1, '0', 'Отложенное определение таможенной стоимости', 'Ограничений нет');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (2, '1', 'Метод по стоимости сделки с ввозимыми товарами', 'Ограничений нет');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (3, '2', 'Метод по стоимости сделки с идентичными товарами', 'Ограничений нет');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (4, '3', 'Метод по стоимости сделки с однородными товарами', 'Ограничений нет');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (5, '4', 'Метод вычитания', 'Ограничений нет');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (6, '5', 'Метод сложения', 'Ограничений нет');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (7, '6', 'Резервный метод', 'Ограничений нет');


--
-- TOC entry 4561 (class 0 OID 18903)
-- Dependencies: 255
-- Data for Name: docstatstatusclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4563 (class 0 OID 18911)
-- Dependencies: 257
-- Data for Name: documentprocessingresultcodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO documentprocessingresultcodeclassifier VALUES (1, '01', 'сведения отсутствуют');
INSERT INTO documentprocessingresultcodeclassifier VALUES (2, '02', 'сведения получены');
INSERT INTO documentprocessingresultcodeclassifier VALUES (3, '03', 'сведения добавлены');
INSERT INTO documentprocessingresultcodeclassifier VALUES (4, '04', 'сведения изменены');
INSERT INTO documentprocessingresultcodeclassifier VALUES (5, '05', 'сведения удалены');
INSERT INTO documentprocessingresultcodeclassifier VALUES (6, '06', 'сведения обработаны');
INSERT INTO documentprocessingresultcodeclassifier VALUES (7, '07', 'сведения не могут быть обработаны');
INSERT INTO documentprocessingresultcodeclassifier VALUES (8, '08', 'сведения не могут быть предоставлены');


--
-- TOC entry 4565 (class 0 OID 18919)
-- Dependencies: 259
-- Data for Name: electronicvehicleandchassiscertificatestatusclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (1, '00', 'заполнение электронного паспорта не завершено', 'незавершенный', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (2, '05', 'электронный паспорт действует', 'действующий', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (3, '10', 'электронный паспорт аннулирован', 'аннулированный', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (4, '15', 'электронный паспорт погашен', 'погашенный', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (5, '90', 'электронный паспорт утилизированного транспортного средства (шасси транспортного средства, самоходной машины или другого вида техники)', 'утилизированный', NULL, NULL);


--
-- TOC entry 4567 (class 0 OID 18927)
-- Dependencies: 261
-- Data for Name: exemptionsfromcustomsdutychapters; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO exemptionsfromcustomsdutychapters VALUES (1, '1', 'Льготы, предусмотренные правом Евразийского экономического союза', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (2, '1.1', 'Льготы по уплате таможенной пошлины', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (3, '2.4', 'Льготы по уплате НДС при ввозе товаров на таможенную территорию Евразийского экономического союза', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (4, '2.4.1', 'Льготы по уплате НДС, предусмотренные законодательными актами Республики Беларусь', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (5, '2.4.3', 'Иные, не поименованные в подразделах 1.3. и 2.4, льготы по уплате НДС в отношении товаров, ввозимых на территорию Республики Беларусь', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (6, '1.2', 'Льготы по уплате акцизов, взимаемых при ввозе подакцизных товаров на таможенную территорию Евразийского экономического союза', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (7, '1.3', 'Льготы по уплате налога на добавленную стоимость (далее - НДС), взимаемого при ввозе товаров на таможенную территорию Евразийского экономического союза', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (8, '2', 'Льготы предусмотренные законодательством Республики Беларусь', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (9, '2.1', 'Льготы по уплате таможенных сборов', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (10, '6.4.2', 'Льготы по уплате НДС, предусмотренные международными договорами Кыргызской Республики', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (11, '6.4.3', 'Иные, не поименованные в подразделах 1.3 и 6.4, льготы по уплате НДС', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (12, '3.4.3', 'Иные, не поименованные в разделах 1.3. и 3.4., льготы по уплате НДС в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (13, '4', 'Льготы, предусмотренные законодательством о таможенном деле в Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (14, '4.1', 'Льготы по уплате таможенных сборов за таможенные операции, предусмотренные законодательством Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (15, '4.1.1', 'Льготы по уплате таможенных сборов за таможенные операции, предусмотренные законодательными актами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (16, '2.2', 'Льготы по уплате таможенных пошлин', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (17, '2.2.1', 'Льготы, установленные законодательными актами Республики Беларусь', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (18, '2.2.2', 'Льготы, предусмотренные международными договорами', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (19, '2.2.3', 'Иные, не поименованные в подразделе 2.2, льготы по уплате таможенных пошлин', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (20, '2.3', 'Льготы по уплате акцизов, взимаемых при ввозе подакцизных товаров на таможенную территорию Евразийского экономического союза', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (21, '2.3.1', 'Льготы по уплате акцизов, предусмотренные законодательными актами Республики Беларусь', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (22, '2.3.2', 'Льготы по уплате акцизов, предусмотренные международными договорами', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (23, '2.3.3', 'Иные, не поименованные в подразделах 1.2. и 2.3, льготы по уплате акцизов в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (24, '2.4.2', 'Льготы по уплате НДС, предусмотренные международными договорами', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (25, '3', 'Льготы, предусмотренные законодательством Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (26, '3.1', 'Льготы по уплате таможенных сборов за таможенное декларирование', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (27, '3.1.1', 'Льготы по уплате таможенных сборов за таможенное декларирование, предусмотренные законодательными актами Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (28, '3.1.2', 'Льготы по уплате таможенных сборов за таможенное декларирование, предусмотренные международными договорами Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (29, '3.1.3', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, помещаемых под таможенную процедуру отказа в пользу государства', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (30, '3.1.4', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров не используется (не запрашивается)', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (31, '3.1.5', 'Иные, не поименованные в подразделе 3.1, льготы по уплате таможенных сборов за таможенное декларирование', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (32, '3.2', 'Льготы по уплате таможенных пошлин', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (33, '3.2.1', 'Льготы по уплате таможенных пошлин, предусмотренные международными договорами Республики Казахстан, подписанными до 1 января 2010 г.', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (34, '6.2', 'Льготы по уплате таможенных пошлин, предусмотренные законодательством Кыргызской Республики', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (35, '6.2.1', 'Льготы по уплате таможенных пошлин, предусмотренные международными договорами Кыргызской Республики', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (71, '6.4', 'Льготы по уплате НДС при ввозе товаров на таможенную территорию Евразийского экономического союза', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (72, '6.4.1', 'Льготы по уплате НДС, предусмотренные законодательными актами Кыргызской Республики', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (36, '3.2.2', 'Тарифная преференция в виде освобождения от уплаты таможенной пошлины в отношении товаров, происходящих и ввозимых из государств, образующих вместе с Республикой Казахстан зону свободной торговли, а также товаров, происходящих и вывозимых из Республики Казахстан в государства, образующие вместе с Республикой Казахстан зону свободной торговли', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (37, '3.2.3', 'Иные, не поименованные в подразделе 3.2, льготы по уплате таможенных пошлин', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (38, '3.3', 'Льготы по уплате акциза', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (39, '3.3.1', 'Льготы по уплате акциза, предусмотренные законодательными актами Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (40, '3.3.2', 'Льготы по уплате акциза, предусмотренные международными договорами Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (41, '3.3.3', 'Иные, не поименованные в подразделах 1.2 и 3.3, льготы по уплате акциза в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (42, '3.4', 'Льготы по уплате НДС, предусмотренные законодательством Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (43, '3.4.1', 'Льготы по уплате НДС, предусмотренные международными договорами Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (44, '3.4.2', 'Льготы по уплате НДС, предусмотренные законодательными актами Республики Казахстан', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (45, '4.1.2', 'Льготы по уплате таможенных сборов за таможенные операции, предусмотренные международными договорами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (46, '4.1.3', 'Иные, не поименованные в подразделе 4.1., льготы по уплате таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (47, '4.2', 'Льготы по уплате таможенной пошлины', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (48, '4.2.1', 'Льготы по уплате таможенных пошлин, предусмотренные законодательными актами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (49, '4.2.2', 'Льготы по уплате таможенных пошлин, предусмотренные международными договорами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (50, '4.2.3', 'Иные, не поименованные в подразделе 4.2, льготы по уплате таможенных пошлин', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (51, '4.3', 'Льготы по уплате акциза, взимаемого при ввозе подакцизных товаров на территорию Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (52, '4.3.1', 'Льготы по уплате акциза, предусмотренные законодательными актами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (53, '4.3.2', 'Льготы по уплате акциза, предусмотренные международными договорами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (54, '4.3.3', 'Иные, не поименованные в подразделах 1.2. и 4.3., льготы по уплате акциза в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (55, '4.4', 'Льготы по уплате НДС', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (56, '4.4.1', 'Льготы по уплате НДС, предусмотренные законодательными актами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (57, '4.4.2', 'Льготы по уплате НДС, предусмотренные международными договорами Российской Федерации', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (58, '4.4.3', 'Иные, не поименованные в подразделах 1.3. и 4.4., льготы по уплате НДС в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (59, '5', 'Льготы, предусмотренные законодательством Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (60, '5.1', 'Льготы по уплате таможенных сборов, предусмотренные законодательством Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (61, '5.2', 'Льготы по уплате таможенных пошлин, предусмотренные законодательством Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (62, '5.2.1', 'Льготы по уплате таможенных пошлин, предусмотренные международными договорами Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (63, '5.2.2', 'Иные, не поименованные в пункте 5.2.1 подраздела 5.2, льготы по уплате таможенных пошлин', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (64, '5.3', 'Льготы по уплате акцизов, предусмотренные законодательством Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (65, '5.4', 'Льготы по уплате НДС, предусмотренные законодательством Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (66, '5.5', 'Льготы по уплате экологического сбора, предусмотренные законодательством Республики Армения', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (67, '6', 'Льготы, предусмотренные законодательством Кыргызской Республики', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (68, '6.1', 'Льготы по уплате таможенных сборов, предусмотренные законодательством Кыргызской Республики', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (69, '6.2.2', 'Иные, не поименованные в пункте 6.2.1 подраздела 6.2, льготы по уплате таможенных пошлин', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (70, '6.3', 'Льготы по уплате акцизов, предусмотренные законодательством Кыргызской Республики', 'KG');


--
-- TOC entry 4569 (class 0 OID 18935)
-- Dependencies: 263
-- Data for Name: exemptionsfromcustomsdutyclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (1, 'ВБ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении валюты государств – членов Евразийского экономического союза, валюты третьих стран (кроме используемой для нумизматических целей), а также ценных бумаг в соответствии с законодательством государств – членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (2, 'БГ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза в качестве гуманитарной помощи и (или) в целях ликвидации последствий аварий и катастроф, стихийных бедствий', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (3, 'БТ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, кроме подакцизных (за исключением легковых автомобилей, специально предназначенных для медицинских целей), ввозимых по линии третьих стран, международных организаций, правительств в благотворительных целях и (или) признаваемых в соответствии с законодательством государств – членов Евразийского экономического союза в качестве безвозмездной помощи (содействия), в том числе технической помощи (содействия)', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (4, 'КМ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении оборудования, включая машины, механизмы, материалы, входящие в комплект поставки соответствующего оборудования, и комплектующих изделий (за исключением подакцизных), ввозимых в счет кредитов, предоставленных иностранными государствами и международными финансовыми организациями в соответствии с международными договорами государств – членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (5, 'ПС', 'Освобождение от уплаты ввозной таможенной пошлины в отношении моторных транспортных средств товарных позиций 8701, 8702, 8703, 8704, 8705 ТН ВЭД ЕАЭС, произведенных хозяйствующими субъектами государств – членов Евразийского экономического союза с применением понятия промышленная сборка, при выполнении установленных условий и критериев', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (6, 'УК', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых в качестве вклада иностранного учредителя в уставный (складочный) капитал организаций в пределах сроков, установленных учредительными документами для формирования этого капитала (за исключением освобождения, определенного кодом УФ)', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (7, 'УФ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых из третьих стран в качестве вклада учредителя в уставный (складочный) капитал (фонд) организаций в пределах сроков, установленных учредительными документами для формирования этого капитала (фонда) в порядке, предусмотренном законодательством государств-членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (8, 'РС', 'Освобождение от уплаты ввозной таможенной пошлины в отношении плавучих судов, регистрируемых в международных реестрах судов, установленных законодательством государств-членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (9, 'ПМ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении продукции морского промысла судов государств-членов Евразийского экономического союза, а также судов, арендованных (зафрахтованных) юридическими лицами и физическими лицами государств-членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (10, 'СМ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении судов рыболовных, плавучих баз и прочих судов для переработки и консервирования рыбных продуктов, морских (код 8902 00 100 0 ТН ВЭД ЕАЭС), зарегистрированных в реестре судов государства – члена Евразийского экономического союза, плавающих под флагом одного из государств – членов Евразийского экономического союза, ввозимых на таможенную территорию Евразийского экономического союза и помещаемых под таможенную процедуру выпуска для внутреннего потребления до 1 января 2018 г. включительно', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (11, 'ЧХ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, за исключением подакцизных, ввозимых в целях проведения Чемпионата мира по хоккею в 2014 году в городе Минске', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (12, 'КТ', 'Освобождение от уплаты НДС в отношении бланков книжек МДП, перемещаемых между Ассоциацией международных автомобильных перевозчиков и Международным союзом автомобильного транспорта', 'BY', '2.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (235, 'БВ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в соответствии с СРП Сахалин-2', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (13, 'НС', 'Освобождение от уплаты ввозной таможенной пошлины ввозимых на таможенную территорию Евразийского экономического союза товаров, за исключением товаров для личного пользования, в адрес одного получателя от одного отправителя по одному транспортному (перевозочному) документу, общая таможенная стоимость которых не превышает суммы, эквивалентной двумстам евро', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (14, 'ИП', 'Освобождение от уплаты ввозной таможенной пошлины в отношении технологического оборудования, комплектующих и запасных частей к нему, сырья и материалов, ввозимых для исключительного использования на территории государства-члена Евразийского экономического союза в рамках реализации инвестиционного проекта, соответствующего приоритетному виду деятельности (сектору экономики) государства-члена Евразийского экономического союза в соответствии с законодательством этого государства-члена Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (15, 'ДМ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении золота в слитках с содержанием химически чистого золота не ниже 995 долей на 1000 долей лигатурной массы (проба не менее 99,5%), серебра в слитках с содержанием химически чистого серебра не ниже 999 долей на 1000 долей лигатурной массы (проба не менее 99,9%) и платины в слитках с содержанием химически чистого металла не ниже 999,5 доли на 1000 долей лигатурной массы (проба не менее 99,95%), ввозимых центральными (национальными) банками государств-членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (16, 'ВС', 'Освобождение от уплаты ввозной таможенной пошлины в отношении гражданских пассажирских самолетов подсубпозиций 8802 40 003 5 и 8802 40 003 6 ТН ВЭД ЕАЭС, ввозимых по 31 декабря 2023 г. включительно на таможенную территорию Евразийского экономического союза в целях их использования в пределах территории государства – члена Евразийского экономического союза, в которое осуществляется ввоз этого товара, а также для перевозок между территориями государств – членов Евразийского экономического союза и (или) для международных перевозок', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (17, 'СР', 'Освобождение от уплаты ввозной таможенной пошлины в отношении гражданских пассажирских самолетов подсубпозиций 8802 40 003 5 и 8802 40 003 6 ТН ВЭД ЕАЭС, указанных в позиции с кодом ВС, ввезенных на таможенную территорию Евразийского экономического союза с применением льготы и ввозимых в течение срока их эксплуатации на таможенную территорию Евразийского экономического союза после их ремонта или технического обслуживания за пределами таможенной территории Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (18, 'АЗ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении авиационных двигателей, запасных частей и оборудования, необходимых для ремонта и (или) технического обслуживания гражданских пассажирских самолетов и (или) авиационных двигателей к ним', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (19, 'РП', 'Освобождение от уплаты ввозной или вывозной таможенной пошлины в отношении перемещаемых припасов', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (20, 'ПП', 'Таможенная пошлина не уплачивается в отношении товаров, помещаемых под таможенную процедуру, иную, чем таможенные процедуры выпуска для внутреннего потребления, временного ввоза (допуска), экспорта', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (21, 'РВ', 'Полное условное освобождение от уплаты ввозной таможенной пошлины в отношении товаров, перечень которых определен в соответствии с международными договорами, входящими в право Евразийского экономического союза, и (или) решениями Комиссии Таможенного союза (Евразийской экономической комиссии), помещаемых под таможенную процедуру временного ввоза (допуска)', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (22, 'ГГ', 'Тарифная преференция в отношении товаров, происходящих из развивающихся стран', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (23, 'НН', 'Тарифная преференция в отношении товаров, происходящих из наименее развитых стран', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (24, 'ВТ', 'Тарифная преференция в отношении товаров, происходящих из Социалистической Республики Вьетнам и ввозимых на таможенную территорию Евразийского экономического союза в соответствии с Соглашением о свободной торговле между Евразийским экономическим союзом и его государствами-членами, с одной стороны, и Социалистической Республикой Вьетнам, с другой стороны, от 29 мая 2015 года', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (25, 'ПИ', '5.2.2. Иные, не поименованные в пункте 5.2.1 подраздела 5.2, льготы по уплате таможенных пошлин', 'AM', '5.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (314, 'НИ', 'Иные, не поименованные в подразделах 1.3 и 5.4, льготы по уплате НДС', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (26, 'МД', 'Освобождение от уплаты таможенной пошлины в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза и вывозимых из нее и предназначенных для официального пользования дипломатических представительств, консульских учреждений, иных официальных представительств иностранных государств, расположенных на территориях государств – членов Евразийского экономического союза, а также для личного пользования дипломатического и административно-технического персонала этих представительств, включая членов их семей, проживающих вместе с ними', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (27, 'ОО', 'Льготы по уплате таможенной пошлины не запрашиваются', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (28, 'АС', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза для целей строительства на территории Республики Беларусь атомной электростанции и ее эксплуатации в течение гарантийного срока согласно Перечню товаров, ввозимых на таможенную территорию Таможенного союза для целей строительства атомной электростанции и ее эксплуатации в течение гарантийного срока, утверждаемому Советом Евразийской экономической комиссии', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (29, 'РЗ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении незарегистрированных лекарственных средств, крови человеческой и ее компонентов, органов и (или) тканей человека, в том числе гемопоэтических стволовых клеток и (или) костного мозга, ввозимых (ввезенных) для оказания медицинской помощи по жизненным показаниям конкретного пациента и (или) проведения неродственной трансплантации на основании заключения (разрешительного документа) либо лицензии, выданных уполномоченным государственным органом государства – члена Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (30, 'КС', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза в рамках международного сотрудничества в области исследования и использования космического пространства, в том числе оказания услуг по запуску космических аппаратов, в соответствии с перечнем, утверждаемым Евразийской экономической комиссией', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (31, 'ГВ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении гражданских грузовых самолетов подсубпозиции 8802 40 003 9 ТН ВЭД ЕАЭС с максимальной взлетной массой не менее 60 000 кг, но не более 80 000 кг, ввозимых по 31 декабря 2017 г. включительно в Республику Казахстан', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (32, 'ТВ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении турбовинтовых гражданских пассажирских самолетов, классифицируемых кодами 8802 30 000 7 и 8802 40 001 6 ТН ВЭД ЕАЭС, с количеством пассажирских мест, указанным в схеме размещения пассажиров (LOPA), одобренной уполномоченным органом, ответственным за поддержание летной годности воздушных судов, не более чем на 90 человек, ввозимых в Республику Казахстан с 1 января 2015 г. по 31 декабря 2017 г. включительно', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (33, 'ЗШ', 'Освобождение от ввозных таможенных пошлин в отношении сахара-сырца тростникового субпозиций 1701 13 и 1701 14 ТН ВЭД ЕАЭС, ввозимого в период 2010 – 2019 годов для промышленной переработки на территории Республики Казахстан', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (34, 'ВЛ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении ванадий-алюминиевой лигатуры, классифицируемой кодом 8112 92 910 0 ТН ВЭД ЕАЭС, предназначенной для производства титановых слитков, сплавов и слябов и ввозимой в Республику Казахстан в период с 1 января по 31 декабря 2017 г. включительно в объеме не более 400', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (35, 'ОТ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении оксидов титана, классифицируемых кодом 2823 00 000 0 ТН ВЭД ЕАЭС, ввозимых на территорию Республики Казахстан в период с 1 сентября 2016 г. по 31 августа 2021 г. включительно в объеме не более 40 тонн ежегодно и предназначенных для производства титановых слитков и сплавов, используемых в аэрокосмической отрасли', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (36, 'НС', 'Освобождение от уплаты НДС при ввозе товаров, за исключением товаров для личного пользования, в адрес одного получателя от одного отправителя по одному транспортному (перевозочному) документу, общая таможенная стоимость которых не превышает суммы, эквивалентной двумстам евро', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (37, 'РП', 'Освобождение от уплаты НДС в отношении перемещаемых припасов', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (315, 'ЭС', 'Льгота по уплате экологического сбора', 'AM', '5.5');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (38, 'ЗУ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, являющихся продукцией военного назначения, ввоз которых осуществляется в период 2015 – 2022 годов в Республику Армения и Кыргызскую Республику для обеспечения потребностей соответственно Вооруженных сил Республики Армения и Вооруженных сил Кыргызской Республики и аналоги которых не производятся на территориях других государств – членов Евразийского экономического союза', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (39, 'УН', 'Освобождение от уплаты ввозной таможенной пошлины в отношении ввозимых до 31 декабря 2022 г. в Республику Армения и Кыргызскую Республику в целях использования для международных перевозок и (или) внутренних перевозок по территории государства – члена Евразийского экономического союза, в которое осуществляется ввоз соответствующего товара, и (или) между территориями государств – членов Евразийского экономического союза: вертолетов гражданских с максимальной взлетной массой более 750 кг, но не более 3 175 кг, включаемых в подсубпозиции 8802 11 000 2 и 8802 11 000 3 ТН ВЭД ЕАЭСб  вертолетов гражданских с массой пустого снаряженного аппарата более 2 000 кг, но не более 5 000 кг, и максимальной взлетной массой более 4 000 кг, но не более 10 500 кг, включаемых в подсубпозицию 8802 12 000 1 ТН ВЭД ЕАЭСб  гражданских пассажирских самолетов с массой пустого снаряженного аппарата не более 2 000 кг и максимальной взлетной массой более 750 кг, включаемых в подсубпозицию 8802 20 000 1 ТН ВЭД ЕАЭСб  самолетов с массой пустого снаряженного аппарата более 60 000 кг, но не более 90 000 кг, с максимальной взлетной массой более 120 000 кг, но не более 180 000 кг, гражданских грузовых среднемагистральных, включаемых в подсубпозицию 8802 40 003 9 ТН ВЭД ЕАЭСб  самолетов с массой пустого снаряженного аппарата более 160 000 кг, гражданских грузовых широкофюзеляжных дальнемагистральных с максимальной взлетной массой не более 370 000 кг, включаемых в подсубпозицию 8802 40 009 7 ТН ВЭД ЕАЭС', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (40, 'АЭ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза для целей строительства и модернизации на территории Республики Армения атомной электростанции и ее эксплуатации в течение гарантийного срока по Перечню товаров, ввозимых на таможенную территорию Таможенного союза для целей строительства атомной электростанции и ее эксплуатации в течение гарантийного срока, утвержденному Решением Совета Евразийской экономической комиссии от 19 марта 2012 г. № 9', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (41, 'ЕШ', 'Освобождение от взимания ввозных таможенных пошлин в отношении сахара-сырца тростникового субпозиций 1701 13 и 1701 14 ТН ВЭД ЕАЭС, ввозимого в период 2015 – 2025 годов для промышленной переработки на территории Республики Армения', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (42, 'ЛЭ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на территорию Республики Армения для целей строительства третьей линии электропередачи Иран – Армения согласно перечню товаров, ввозимых на территорию Республики Армения для целей строительства третьей линии электропередачи Иран – Армения, утвержденному Решением Совета Евразийской экономической комиссии от 6 апреля 2016 г. № 24', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (43, 'НП', 'Освобождение от уплаты ввозной таможенной пошлины в отношении текстурированных нитей полипропиленовых, классифицируемых кодом 5402 34 000 0 ТН ВЭД ЕАЭС, предназначенных для производства ковров и ковровых изделий, ввозимых на территорию Республики Беларусь в период с 1 января по 31 декабря 2017 г. включительно в объеме не более 4 тыс. тонн', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (44, 'ИШ', 'Освобождение от взимания ввозных таможенных пошлин в отношении сахара-сырца тростникового субпозиций 1701 13 и 1701 14 ТН ВЭД ЕАЭС, ввозимого в течение 5 лет с даты принятия Высшим Евразийским экономическим советом решения об отмене таможенного контроля товаров и транспортных средств, перемещаемых через кыргызско-казахстанский участок государственной границы, для промышленной переработки на территории Кыргызской Республики в объеме не более 100 000 тонн в год', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (45, 'ПЛ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении ввозимых в Кыргызскую Республику в период по 31 декабря 2016 г. включительно товаров подсубпозиции 3920 10 250 0 ТН ВЭД ЕАЭС в объеме не более 820 тонн в год, товаров подсубпозиций 3920 20 210 1 и 3920 20 210 9 ТН ВЭД ЕАЭС в объеме не более 75 тонн в год и товаров подсубпозиции 3923 30 101 0 ТН ВЭД ЕАЭС в объеме не более 200 тонн в год', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (46, 'ДП', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на территорию Кыргызской Республики в 2016 году в целях строительства Дома приемов и проведения официальных мероприятий согласно перечню товаров, ввозимых на территорию Кыргызской Республики в целях строительства Дома приемов и проведения официальных мероприятий, утвержденному Решением Совета Евразийской экономической комиссии от 11 июля 2016 г. № 57', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (47, 'ОО', 'Льготы по уплате НДС не запрашиваются', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (48, 'ВБ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, ввозимых или вывозимых Национальным банком Республики Беларусь или его структурными подразделениями', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (49, 'И', 'Иные, не поименованные в подразделах 1.2 и 5.3, льготы по уплате акцизов', 'AM', '5.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (316, 'СО', 'Освобождение от уплаты таможенных сборов', 'KG', '6.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (50, 'СК', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров и транспортных средств, ввозимых резидентами Финляндской Республики на арендуемую Финляндской Республикой территорию Сайменского канала для осуществления работ, предусмотренных Договором между Российской Федерацией и Финляндской Республикой об аренде Финляндской Республикой российской части Сайменского канала и прилегающей к нему территории и об осуществлении судоходства через Сайменский канал от 27 мая 2010 года, и эксплуатации арендуемой территории', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (51, 'УХ', 'Освобождение от уплаты НДС в отношении удобрений и средств химической защиты растений', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (52, 'СЗ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении станков для судостроительной промышленности, ввозимых в Российскую Федерацию с 1 июля 2016 г. по 31 октября 2016 г. включительно для целей выполнения государственного оборонного заказа Российской Федерации, согласно перечню отдельных видов станков для судостроительной промышленности, ввозимых на территорию Российской Федерации, утвержденному Решением Совета Евразийской экономической комиссии от 9 августа 2016 г. № 64', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (53, 'ТИ', 'Иные, не поименованные в подразделе 1.1, льготы по уплате таможенных пошлин', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (54, 'Д', 'Освобождение от уплаты акциза в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза и вывозимых из неё и предназначенных для официального пользования дипломатических представительств, консульских учреждений, иных официальных представительств иностранных государств, расположенных на территориях государств-членов Евразийского экономического союза, а также для личного пользования дипломатического и административно-технического персонала этих представительств, включая членов их семей, проживающих вместе с ними', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (55, 'В', 'Полное условное освобождение от уплаты акцизов в отношении товаров, перечень которых определен в соответствии с международными договорами, входящими в право Евразийского экономического союза, и (или) решениями Комиссии Таможенного союза (Евразийской экономической комиссии), помещаемых под таможенную процедуру временного ввоза (допуска)', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (56, 'Н', 'Освобождение от уплаты акцизов в отношении ввозимых на таможенную территорию Евразийского экономического союза товаров, за исключением товаров для личного пользования, в адрес одного получателя от одного отправителя по одному транспортному (перевозочному) документу, общая таможенная стоимость которых не превышает суммы, эквивалентной двумстам евро', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (57, 'П', 'Акцизы не уплачиваются в отношении товаров, помещаемых под таможенную процедуру, иную, чем таможенные процедуры выпуска для внутреннего потребления, временного ввоза (допуска), переработки для внутреннего потребления', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (58, 'Р', 'Освобождение от уплаты акцизов в отношении перемещаемых припасов', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (59, 'О', 'Льготы по уплате акцизов не запрашиваются', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (60, 'МД', 'Освобождение от уплаты НДС в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза и вывозимых из неё и предназначенных для официального пользования дипломатических представительств, консульских учреждений, иных официальных представительств иностранных государств, расположенных на территориях государств-членов Евразийского экономического союза, а также для личного пользования дипломатического и административно-технического персонала этих представительств, включая членов их семей, проживающих вместе с ними', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (61, 'РВ', 'Полное условное освобождение от уплаты НДС в отношении товаров, перечень которых определен в соответствии с международными договорами, входящими в право Евразийского экономического союза, и (или) решениями Комиссии Таможенного союза (Евразийской экономической комиссии), помещаемых под таможенную процедуру временного ввоза (допуска)', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (62, 'ПП', 'НДС не уплачивается в отношении товаров, помещаемых под таможенную процедуру, иную, чем таможенные процедуры выпуска для внутреннего потребления, временного ввоза (допуска), переработки для внутреннего потребления', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (63, 'БГ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении ввозимых или вывозимых товаров, относящихся к иностранной безвозмездной помощи', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (64, 'БТ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении ввозимых или вывозимых товаров, относящихся к международной технической помощи', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (65, 'КТ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении бланков книжек МДП, перемещаемых между Ассоциацией международных автомобильных перевозчиков и Международным союзом автомобильного транспорта', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (66, 'КА', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении ввозимых или вывозимых бланков карнетов АТА или их частей', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (67, 'ПС', 'Освобождение от уплаты НДС в отношении племенных животных и семенных материалов', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (68, 'МИ', 'Освобождение от уплаты НДС в отношении специализированных товаров для инвалидов', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (69, 'УЧ', 'Освобождение от уплаты НДС в отношении учебных пособий, школьных принадлежностей и научных изданий', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (70, 'ВБ', 'Освобождение от уплаты НДС в отношении ценных бумаг, бланков паспортов и удостоверений личности гражданина Кыргызской Республики установленного образца, марок акцизного сбора, валюты (кроме используемой в нумизматических целях)', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (71, 'ПГ', 'Освобождение от уплаты НДС в отношении природного газа', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (72, 'НБ', 'Освобождение от уплаты НДС в отношении банковского оборудования', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (73, 'КР', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта «Кумтор»', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (74, 'СО', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в качестве основных средств', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (75, 'ЛС', 'Освобождение от уплаты НДС в отношении лекарственных средств', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (76, 'МХ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в адрес военных баз третьих стран', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (77, 'ПК', 'Освобождение от уплаты НДС в отношении специализированных товаров, ввозимых для строительства и реконструкции стекловаренной печи и конвертера (ферросплавной печи)', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (78, 'ГО', 'Освобождение от уплаты НДС в отношении научного оборудования геологических (геофизических, геодезических) экспедиций по измерению и контролю сейсмической обстановки', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (79, 'МО', 'Освобождение от уплаты НДС в отношении товаров, перемещаемых в рамках межправительственных и международных договоров', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (80, 'ТЭ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта «Модернизация тепловой электроцентрали города Бишкек» в соответствии с кредитным соглашением льготного покупательского кредита между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 11 сентября 2013 г.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (81, 'ДК', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта «Строительство линии электропередачи 500 кВ «Датка-Кемин» и подстанции 500 кВ «Кемин» в соответствии с льготным кредитным соглашением между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 5 июня 2012 г.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (82, 'ДР', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта по реабилитации двух участков дорог в Кыргызской Республике (РВС № (2012) 54 номер (242)) в соответствии с льготным кредитным соглашением между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 4 декабря 2012 г.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (83, 'ДЛ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта альтернативной автодороги Север – Юг на участках Казарман – Джалал-Абад (км 291 – 433) и Балыкчы – Арал (км 183+500 – 195+486) в соответствии с льготным кредитным соглашением между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 11 сентября 2013 г.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (84, 'КЦ', 'Освобождение от уплаты НДС в отношении ввозимых в Республику Армения культурных ценностей', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (118, 'ИС', 'Освобождение от уплаты НДС в отношении технологического оборудования (комплектующих и запасных частей к нему), сырья и материалов, предназначенных для реализации инвестиционных проектов, в том числе реализуемых в рамках заключенных инвестиционных договоров между инвестором и Республикой Беларусь', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (85, 'ДБ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта реконструкции автодороги Бишкек – Нарын – Торугарт в соответствии с кредитными соглашениями между Кыргызской Республикой и Саудовским фондом развития от 13 сентября 2011 г., Кыргызской Республикой и Кувейтским фондом арабского экономического развития от 7 сентября 2011 г. и Правительством Кыргызской Республики и Фондом развития Абу-Даби от 8 февраля 2012 г.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (86, 'ДТ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках реализации проекта реконструкции автодороги Тараз – Талас – Суусамыр в соответствии с кредитным соглашением между Правительством Кыргызской Республики и Саудовским фондом развития от 13 августа 2013 г.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (87, 'НИ', '6.4.3. Иные, не поименованные в подразделах 1.3 и 6.4, льготы по уплате НДС', 'KG', '6.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (88, 'БГ', 'Освобождение от уплаты НДС в отношении товаров, за исключением подакцизных, ввозимых в качестве гуманитарной помощи', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (89, 'БП', 'Освобождение от уплаты НДС в отношении товаров, за исключением подакцизных, ввозимых в целях благотворительной помощи по линии государств, правительств государств, международных организаций', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (90, 'ТХ', 'Освобождение от уплаты НДС в отношении товаров, за исключением подакцизных, ввозимых в целях оказания технического содействия по линии государств, правительств государств, международных организаций', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (91, 'ГР', 'Освобождение от уплаты НДС в отношении импорта товаров, осуществляемого за счет средств грантов, предоставленных по линии государств, правительств государств и международных организаций', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (92, 'НИ', '3.4.3. Иные, не поименованные в разделах 1.3. и 3.4., льготы по уплате НДС в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'KZ', '3.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (93, 'ВБ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении наличной валюты государств-членов Евразийского экономического союза, ввозимой или вывозимой центральными банками государств-членов Евразийского экономического союза, за исключением памятных монет', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (94, 'БГ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации, относящихся в соответствии с законодательством Российской Федерации к гуманитарной помощи (содействию)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (95, 'БТ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации, относящихся в соответствии с законодательством Российской Федерации к технической помощи (содействию)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (96, 'МД', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации дипломатическими представительствами, консульскими учреждениями, иными официальными представительствами иностранных государств, международными организациями, персоналом этих представительств, учреждений и организаций, а также товаров, предназначенных для личного пользования отдельных категорий иностранных лиц, пользующихся преимуществами, привилегиями и (или) иммунитетами в соответствии с международными договорами', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (97, 'КТ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении бланков книжек МДП, перемещаемых между Ассоциацией международных автомобильных перевозчиков России (АСМАП) и Международным союзом автомобильного транспорта (МСАТ)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (98, 'КА', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении бланков карнетов АТА или их частей, предназначенных для выдачи на таможенной территории Евразийского экономического союза', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (99, 'АМ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении акцизных марок, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (100, 'ЛЛ', 'Тарифная преференция в отношении товаров, происходящих и ввозимых из Сербии в рамках Соглашения о свободной торговле между Республикой Беларусь и Сербской Республикой', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (172, 'МС', 'Освобождение от уплаты таможенных пошлин в отношении товаров, ввозимых в рамках иных международных договоров Республики Казахстан', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (101, 'ВМ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации в целях демонстрации при проведении выставочно-конгрессных мероприятий с иностранным участием, авиационно-космических салонов и на иных подобных мероприятий, по решению Правительства Российской Федерации', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (102, 'МЮ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, ввозимых на территорию Российской Федерации международными организациями, их представительствами, персоналом этих организаций и представительств, а также членами их семей', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (103, 'КВ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, ввозимых или вывозимых с применением карнета АТА при условии их полного освобождения от обложения таможенными пошлинами, налогами', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (104, 'АА', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении ввозимых (ввезенных) или вывозимых (вывезенных) акцизных марок и контрольных (идентификационных) знаков', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (105, 'НС', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, таможенная стоимость которых не превышает сумму, эквивалентную 200 евро, и в отношении которых не уплачиваются таможенные пошлины, налоги', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (106, 'РП', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, перемещаемых через таможенную границу Евразийского экономического союза в качестве припасов', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (107, 'ПП', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, помещаемых под таможенные процедуры экспорта, реэкспорта, таможенного транзита, отказа в пользу государства, временного ввоза (допуска) с полным условным освобождением от уплаты таможенных пошлин, налогов, специальную таможенную процедуру, а также при временном ввозе (временном вывозе) транспортных средств международной перевозки', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (108, 'МД', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, перемещаемых для официального пользования иностранными дипломатическими и приравненными к ним представительствами, либо для личного пользования дипломатических и (или) административно-технических работников этих представительств (включая проживающих вместе с ними членов их семей), если они не являются гражданами Республики Беларусь', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (109, 'МЮ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, перемещаемых международными организациями, персоналом этих организаций', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (110, 'МВ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, перемещаемых в рамках международных договоров Республики Беларусь о воздушном сообщении', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (111, 'СБ', 'Освобождение от уплаты таможенных сборов за совершение таможенных операций в отношении товаров, ввозимых (ввезенных) и (или) вывозимых (вывезенных) в целях ликвидации последствий аварий, катастроф и стихийных бедствий', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (112, 'СИ', 'Иные, не поименованные в подразделе 2.1., льготы по уплате таможенных сборов за совершение таможенных операций', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (113, 'ОО', 'Льготы по уплате таможенных сборов за совершение таможенных операций в отношении товаров не используются', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (114, 'ВП', 'Освобождение от уплаты вывозных таможенных пошлин в соответствии с законодательством Республики Беларусь', 'BY', '2.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (115, 'МЮ', 'Освобождение от уплаты ввозной таможенной пошлины в отношении товаров, ввозимых на территорию Республики Беларусь международными организациями, их представительствами, персоналом этих организаций и представительств, а также членами их семей', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (116, 'МВ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в рамках международных договоров Республики Беларусь о воздушном сообщении', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (117, 'КТ', 'Освобождение от уплаты таможенных пошлин в отношении бланков книжек МДП, перемещаемых между Ассоциацией международных автомобильных перевозчиков и Международным союзом автомобильного транспорта', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (317, 'ОО', 'Льготы по уплате таможенных сборов не используются (не запрашиваются)', 'KG', '6.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (119, 'ЭБ', 'Тарифная преференция в виде освобождения от уплаты таможенной пошлины в отношении товаров, происходящих и ввозимых из государств, образующих вместе с Республикой Беларусь зону свободной торговли, а также товаров, происходящих и вывозимых из Республики Беларусь в государства, образующие вместе с Республикой Беларусь зону свободной торговли (за исключением тарифной преференции, определенной кодом ЛЛ)', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (120, 'ПИ', '2.2.3. Иные, не поименованные в подразделе 2.2, льготы по уплате таможенных пошлин', 'BY', '2.2.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (121, 'А', 'Освобождение от уплаты акцизов в отношении транспортных средств по перечню, утвержденному Президентом Республики Беларусь', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (122, 'Г', 'Освобождение от уплаты акцизов в отношении товаров, относящиеся к иностранной безвозмездной помощи', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (123, 'Т', 'Освобождение от уплаты акцизов в отношении товаров, приобретенных за счет и (или) получаемых (полученных) в качестве международной технической помощи', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (124, 'У', 'Освобождение от уплаты акцизов в отношении газа углеводородного сжиженного и газа природного топливного компримированного', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (125, 'Ю', 'Освобождение от уплаты акцизов отношении подакцизных товаров, перемещаемых международными организациями или межгосударственными образованиями, их представительствами на территории Республики Беларусь, персоналом этих организаций и представительств, а также членами их семей', 'BY', '2.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (126, 'И', '2.3.3. Иные, не поименованные в подразделах 1.2. и 2.3, льготы по уплате акцизов в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'BY', '2.3.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (127, 'ВБ', 'Освобождение от уплаты НДС в отношении белорусских рублей, иностранной валюты, в частности банкнот и монет, являющихся законными средствами платежа, а также ценных бумаг, акцизных марок, марок таможенного контроля, марок пошлин и сборов, уплачиваемых в соответствии с законодательством', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (128, 'БГ', 'Освобождение от уплаты НДС в отношении товаров, относящихся к иностранной безвозмездной помощи', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (129, 'БТ', 'Освобождение от уплаты НДС в отношении товаров, получаемых (полученных) в качестве международной технической помощи и (или) приобретенных за счет средств международной технической помощи, предназначенных для целей, определенных проектом (программой) международной технической помощи', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (130, 'МИ', 'Освобождение от уплаты НДС в отношении технических средств, которые не могут быть использованы иначе как для профилактики инвалидности и (или) реабилитации инвалидов', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (131, 'МЛ', 'Освобождение от уплаты НДС в отношении лекарственных средств, изделий медицинского назначения, протезно-ортопедических изделий и медицинской техники, а также сырья, материалов для их изготовления, комплектующих изделий для их производства, полуфабрикатов к ним', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (132, 'СС', 'Освобождение от уплаты НДС в отношении специально оборудованных транспортных средств для нужд скорой медицинской помощи, органов и подразделений по чрезвычайным ситуациям, аварийно-спасательных служб, органов внутренних дел', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (133, 'БС', 'Банковские и мерные слитки из драгоценных металлов, ввозимые банками для осуществления банковских операций и иными организациями для реализации их банкам', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (134, 'ГЗ', 'Освобождение от уплаты НДС в отношении технологического оборудования и запасных частей к нему, предназначенные для реализации инвестиционных проектов, финансируемых за счет внешних государственных займов (кредитов),', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (135, 'ДМ', 'Освобождение от уплаты НДС в отношении драгоценных металлов, драгоценных камней, и изделий (частей изделий) из них (коме ювелирных изделий) а также концентраты и другие промышленные отходы, лом и отходы, содержащие драгоценные и цветные металлы, ввозимые для пополнения Госфонда', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (136, 'ЕО', 'Освобождение от уплаты НДС в отношении всех видов печатных изданий, получаемых государственными библиотеками и музеями по международному книгообмену, а также кино- и видеопроизведений, ввозимых государственными кино- и видеоорганизациями в целях осуществления международных некоммерческих обменов', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (137, 'ЕХ', 'Освобождение от уплаты НДС в отношении носителей экземпляров фильмов, культурных ценностей, ввозимых организациями культуры', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (138, 'НЦ', 'Освобождение от уплаты НДС в отношении оборудования, приборов, материалов и комплектующих изделий, предназначенных для выполнения научно-исследовательских, опытно-конструкторских и опытно-технологических работ', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (139, 'ЛО', 'Освобождение от уплаты НДС в отношении ввозимых организациями, осуществляющими производство лазерно-оптической техники, товары, применяемые такими организациями в составе лазерно-оптической техники и не производимые на территории Республики Беларусь, а также оборудование и оснастка, используемые ими для производства лазерно-оптической техники', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (140, 'НЭ', 'Освобождение от уплаты НДС в отношении установок по использованию возобновляемых источников энергии', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (141, 'ПТ', 'Освобождение от уплаты НДС в отношении технологического оборудования, комплектующих и (или) запасных частей к нему, ввозимых (ввезенных) резидентами Парка высоких технологий', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (142, 'ПД', 'Применение ставки НДС в размере 10% в отношении продовольственных товаров и товаров для детей', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (143, 'ЧН', 'Освобождение от уплаты НДС в отношении товаров, ввозимых (ввезенных) в целях проведения Чемпионата мира по хоккею в 2014 году в городе Минске', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (144, 'МЮ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых международными организациями, их представительствами на территории Республики Беларусь', 'BY', '2.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (145, 'МВ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках международных договоров Республики Беларусь о воздушном сообщении', 'BY', '2.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (146, 'НИ', '2.4.3. Иные, не поименованные в подразделах 1.3. и 2.4, льготы по уплате НДС в отношении товаров, ввозимых на территорию Республики Беларусь', 'BY', '2.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (147, 'ТС', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении транспортных средств, осуществляющих регулярные международные перевозки грузов, багажа и пассажиров, а также предметов материально-технического снабжения, снаряжения, топлива, продовольствия и другого имущества, необходимых для их эксплуатации во время следования в пути, в пунктах промежуточной остановки или приобретенных за границей в связи с ликвидацией аварии (поломки) данных транспортных средств', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (148, 'СМ', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении предметов материально-технического снабжения, снаряжения, топлива, продовольствия и другого имущества, вывозимых за пределы таможенной территории Евразийского экономического союза для обеспечения производственной деятельности казахстанских или арендованных (зафрахтованных) казахстанскими лицами морских судов, ведущих морской промысел, а также продукции их промысла, ввозимой на территорию Республики Казахстан', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (149, 'ДН', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении банкнот и монет национальной и иностранной валюты (кроме банкнот и монет, представляющих собой культурно-историческую ценность), а также ценных бумаг', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (150, 'БГ', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, за исключением подакцизных, ввозимых в качестве гуманитарной помощи', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (151, 'БП', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, за исключением подакцизных (кроме легковых автомобилей, специально предназначенных для медицинских целей), ввозимых в целях благотворительной помощи по линии государств, правительств государств, международных организаций', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (152, 'ПР', 'Освобождение от уплаты таможенных пошлин в отношении товаров, ввозимых в рамках международных договоров в области предотвращения распространения ядерного оружия', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (153, 'ТХ', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, за исключением подакцизных (кроме легковых автомобилей, специально предназначенных для медицинских целей), ввозимых в целях оказания технического содействия по линии государств, правительств государств, международных организаций', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (173, 'РН', 'Освобождение от уплаты НДС в отношении предметов религиозного назначения, ввозимых религиозными объединениями, зарегистрированными в органах юстиции Республики Казахстан', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (154, 'ГР', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, приобретаемых за счет средств грантов, предоставленных по линии государств, правительств государств, а также международных организаций, определенных в соответствии с налоговым законодательством Республики Казахстан', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (155, 'ДС', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении сырья, ввозимого Национальным Банком Республики Казахстан и его филиалами, представительствами и организациями для производства денежных знаков', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (156, 'МД', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых и вывозимых для официального пользования иностранными дипломатическими и приравненными к ним представительствами, консульскими учреждениями, а также для личного пользования лицами, относящимися к дипломатическому и административно-техническому персоналу этих представительств, включая членов их семей, проживающих вместе с ними, не являющихся гражданами Республики Казахстан и освобождаемых в соответствии с международными договорами Республики Казахстан', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (157, 'МЮ', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых для международных межгосударственных и межправительственных организаций, представительств иностранных государств при них, а также для персонала этих организаций и представительств и членов их семей', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (158, 'МВ', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых в рамках международных договоров о воздушном сообщении', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (159, 'МА', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых в рамках международных договоров об автомобильном сообщении', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (160, 'ПР', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых в рамках международных договоров в области предотвращения распространения ядерного оружия', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (161, 'ВР', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении продукции военного назначения и военной техники, ввозимых в рамках международных договоров', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (162, 'МГ', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых в рамках международных договоров о сотрудничестве в области гражданской обороны, предупреждения и ликвидации чрезвычайных ситуаций', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (163, 'МС', 'Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, ввозимых в рамках иных международных договоров Республики Казахстан', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (164, 'ПП', '3.1.3. Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров, помещаемых под таможенную процедуру отказа в пользу государства', 'KZ', '3.1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (165, 'ОО', '3.1.4. Освобождение от уплаты таможенных сборов за таможенное декларирование в отношении товаров не используется (не запрашивается)', 'KZ', '3.1.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (166, 'СИ', '3.1.5. Иные, не поименованные в подразделе 3.1, льготы по уплате таможенных сборов за таможенное декларирование', 'KZ', '3.1.5');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (167, 'МЮ', 'Освобождение от уплаты таможенных пошлин в отношении товаров, ввозимых для международных межгосударственных и межправительственных организаций, представительств иностранных государств при них, а также для персонала этих организаций и представительств и членов их семей', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (168, 'МВ', 'Освобождение от уплаты таможенных пошлин в отношении товаров, ввозимых в рамках международных договоров о воздушном сообщении', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (169, 'МА', 'Освобождение от уплаты таможенных пошлин в отношении товаров, ввозимых в рамках международных договоров об автомобильном сообщении', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (170, 'ВР', 'Освобождение от уплаты таможенных пошлин в отношении продукции военного назначения и военной техники, ввозимых в рамках международных договоров', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (171, 'МГ', 'Освобождение от уплаты таможенных пошлин в отношении товаров, ввозимых в рамках международных договоров о сотрудничестве в области гражданской обороны, предупреждения и ликвидации чрезвычайных ситуаций', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (174, 'ЭК', '3.2.2. Тарифная преференция в виде освобождения от уплаты таможенной пошлины в отношении товаров, происходящих и ввозимых из государств, образующих вместе с Республикой Казахстан зону свободной торговли, а также товаров, происходящих и вывозимых из Республики Казахстан в государства, образующие вместе с Республикой Казахстан зону свободной торговли', 'KZ', '3.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (175, 'ПИ', '3.2.3. Иные, не поименованные в подразделе 3.2, льготы по уплате таможенных пошлин', 'KZ', '3.2.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (176, 'Т', 'Освобождение от уплаты акциза в отношении подакцизных товаров, необходимых для эксплуатации транспортных средств, осуществляющих международные перевозки, во время следования в пути и в пунктах промежуточной остановки', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (177, 'Ф', 'Освобождение от уплаты акциза в отношении подакцизных товаров, оказавшихся вследствие повреждения до пропуска их через таможенную границу Евразийского экономического союза не пригодными к использованию в качестве изделий и материалов', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (178, 'С', 'Освобождение от уплаты акциза в отношении спиртосодержащей продукции медицинского назначения (кроме бальзамов), зарегистрированной в соответствии с законодательством Республики Казахстан', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (179, 'Д', 'Освобождение от уплаты акциза в отношении подакцизных товаров, ввезенных для официального пользования иностранными дипломатическими и приравненными к ним представительствами, а также для личного пользования лицами из числа дипломатического и административно-технического персонала этих представительств, включая членов их семей, проживающих вместе с ними', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (180, 'П', 'Освобождение от уплаты акциза в отношении подакцизных товаров, перемещаемых через таможенную границу Евразийского экономического союза, освобождаемых на территории Республики Казахстан в рамках таможенных процедур, установленных международными договорами и актами, составляющими право Евразийского экономического союза, и (или) таможенным законодательством Республики Казахстан, за исключением таможенной процедуры выпуска для внутреннего потребления', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (181, 'М', 'Освобождение от уплаты акциза в отношении подакцизных товаров, ввозимых для международных межгосударственных и межправительственных организаций, представительств иностранных государств при них, а также для персонала этих организаций и представительств и членов их семей', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (182, 'Б', 'Освобождение от уплаты акциза в отношении товаров, ввозимых в рамках международных договоров о воздушном сообщении', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (183, 'Е', 'Освобождение от уплаты акциза в отношении товаров, ввозимых в рамках международных договоров об автомобильном сообщении', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (184, 'Ж', 'Освобождение от уплаты акциза в отношении товаров, ввозимых в рамках международных договоров в области предотвращения распространения ядерного оружия', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (185, 'З', 'Освобождение от уплаты акциза в отношении продукции военного назначения и военной техники, ввозимых в рамках международных договоров', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (186, 'Х', 'Освобождение от уплаты акциза в отношении товаров, ввозимых в рамках международных договоров о сотрудничестве в области гражданской обороны, предупреждения и ликвидации чрезвычайных ситуаций', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (187, 'Ю', 'Освобождение от уплаты акциза в отношении товаров, ввозимых в рамках иных международных договоров Республики Казахстан', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (188, 'ВН', 'Освобождение от уплаты НДС в отношении ввозимого в Республику Армения дизельного топлива', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (189, 'И', '3.3.3. Иные, не поименованные в подразделах 1.2 и 3.3, льготы по уплате акциза в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'KZ', '3.3.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (190, 'МЮ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых для международных межгосударственных и межправительственных организаций, представительств иностранных государств при них, а также для персонала этих организаций и представительств и членов их семей', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (191, 'МВ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках международных договоров о воздушном сообщении', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (192, 'МА', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках международных договоров об автомобильном сообщении', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (193, 'ПР', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках международных договоров в области предотвращения распространения ядерного оружия', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (194, 'ВР', 'Освобождение от уплаты НДС в отношении продукции военного назначения и военной техники, ввозимых в рамках международных договоров', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (195, 'МГ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в рамках международных договоров о сотрудничестве в области гражданской обороны, предупреждения и ликвидации чрезвычайных ситуаций', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (196, 'ТТ', 'Освобождение от уплаты НДС в отношении банкнот и монет национальной и иностранной валюты (кроме банкнот и монет, представляющих собой культурно-историческую ценность), а также ценных бумаг, ввозимых на территорию Республики Казахстан', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (197, 'ПЧ', 'Освобождение от уплаты НДС в отношении почтовых марок (кроме коллекционных), ввозимых на территорию Республики Казахстан', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (198, 'ДС', 'Освобождение от уплаты НДС в отношении сырья для производства денежных знаков, ввозимого Национальным Банком Республики Казахстан и его организациями', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (199, 'ФБ', 'Освобождение от уплаты НДС в отношении товаров, перемещаемых физическими лицами по нормам беспошлинного ввоза товаров, утвержденным в соответствии с регулирующими таможенные правоотношения международными договорами и актами, составляющими право Евразийского экономического союза, и (или) таможенным законодательством Республики Казахстан', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (200, 'ИЗ', 'Освобождение от уплаты НДС в отношении инвестиционного золота, импортируемого Национальным Банком Республики Казахстан', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (201, 'КД', 'Освобождение от уплаты НДС в отношении космических объектов, оборудования объектов наземной космической инфраструктуры, ввозимых участниками космической деятельности, перечень которых определен Правительством Республики Казахстан', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (202, 'ЗС', 'Освобождение от уплаты НДС в отношении импорта зарегистрированных в Государственном реестре лекарственных средств, изделий медицинского назначения и медицинской техники Республики Казахстан лекарственных средств любых форм, изделий медицинского назначения и медицинской техники', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (203, 'СН', 'Освобождение от уплаты НДС в отношении импорта не зарегистрированных в Государственном реестре лекарственных средств, изделий медицинского назначения и медицинской техники Республики Казахстан лекарственных средств любых форм, изделий медицинского назначения и медицинской техники', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (204, 'ЗГ', 'Освобождение от уплаты НДС в отношении импорта лекарственных средств любых форм, изделий медицинского назначения и медицинской техники в рамках договоров о государственных закупках', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (205, 'ГС', 'Освобождение от уплаты НДС в отношении импорта материалов, оборудования, сырья и комплектующих для производства лекарственных средств любых форм, в том числе лекарственных субстанций, изделий медицинского назначения, включая протезно-ортопедические изделия, и медицинской техники', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (206, 'СИ', '4.1.3. Иные, не поименованные в подразделе 4.1., льготы по уплате таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации', 'RU', '4.1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (207, 'ЛЖ', 'Освобождение от уплаты НДС в отношении импорта лекарственных средств, используемых (применяемых) в области ветеринарии, изделий ветеринарного назначения и ветеринарной техники, сурдотифлотехники, включая протезно-ортопедические изделия, специальных средств передвижения, предоставляемых инвалидам,  материалов, оборудования и комплектующих для производства лекарственных средств любых форм, изделий медицинского (ветеринарного) назначения, включая протезно-ортопедические изделия, и медицинской (ветеринарной) техники', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (208, 'НС', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров (за исключением товаров для личного пользования), ввозимых в Российскую Федерацию или вывозимых из Российской Федерации в адрес одного получателя от одного отправителя по одному транспортному (перевозочному) документу, общая таможенная стоимость которых не превышает суммы, эквивалентной 200 (двумстам) евро по курсу Центрального банка Российской Федерации, действующему на момент регистрации таможенной декларации таможенным органом', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (209, 'ЗМ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, предназначенных для проведения киносъемок, представлений, спектаклей и подобных мероприятий (театральных костюмов, цирковых костюмов, кинокостюмов, сценического оборудования, партитур, музыкальных инструментов и другого театрального реквизита, циркового реквизита, кинореквизита), помещаемых под таможенную процедуру временного ввоза (допуска) или таможенную процедуру временного вывоза и при их обратном вывозе (реэкспорте) или обратном ввозе (реимпорте), если в отношении таких товаров предоставляется полное условное освобождение от уплаты таможенных пошлин, налогов', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (210, 'СМ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, предназначенных для спортивных соревнований, показательных спортивных мероприятий или тренировок, помещаемых под таможенную процедуру временного ввоза (допуска) или таможенную процедуру временного вывоза и при завершении указанных процедур помещением товаров под таможенную процедуру реэкспорта и реимпорта соответственно', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (211, 'КЦ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении культурных ценностей, помещаемых под таможенную процедуру временного ввоза (допуска) или таможенную процедуру временного вывоза российскими государственными или муниципальными музеями, архивами, библиотеками, иными государственными хранилищами культурных ценностей в целях их экспонирования, а также при их обратном вывозе (реэкспорте) или обратном ввозе (реимпорте)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (212, 'ОИ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении профессионального оборудования, используемого для целей производства и выпуска средств массовой информации, помещаемого под таможенную процедуру временного вывоза, а также при его обратном ввозе (реимпорте)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (213, 'РП', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации в качестве припасов', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (214, 'СП', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, помещаемых под специальные таможенные процедуры, а также при помещении товаров под таможенные процедуры, необходимые для завершения специальной таможенной процедуры', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (215, 'РУ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, которые оказались уничтожены, безвозвратно утеряны либо повреждены вследствие аварии или действия непреодолимой силы и помещены под таможенную процедуру уничтожения', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (216, 'РТ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, помещаемых под таможенную процедуру таможенного транзита', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (217, 'УО', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении отходов (остатков), образовавшихся в результате уничтожения иностранных товаров в соответствии с таможенной процедурой уничтожения, в отношении которых не подлежат уплате таможенные пошлины, налоги', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (218, 'ОВ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, прибывших на территорию Российской Федерации, находящихся в месте прибытия либо в иной зоне таможенного контроля, расположенной в непосредственной близости от места прибытия, не помещенных под какую-либо таможенную процедуру, помещаемых под таможенную процедуру реэкспорта и убывающих с территории Российской Федерации', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (219, 'ГП', 'Освобождение от уплаты таможенных пошлин в отношении товаров, вывозимых с территории Российской Федерации в качестве гуманитарной помощи,  в целях ликвидации последствий аварий и катастроф, стихийных бедствий', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (220, 'ВА', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, временно ввозимых в Российскую Федерацию с применением карнетов АТА, в случае соблюдения условий временного ввоза товаров с применением карнетов АТА, и их обратном вывозе из Российской Федерации, а также товаров, временно вывозимых из Российской Федерации с применением карнетов АТА, в случае соблюдения условий временного вывоза товаров с применением карнетов АТА, и их обратном ввозе в Российскую Федерацию', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (221, 'ЗП', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении запасных частей и оборудования, ввозимых в Российскую Федерацию и вывозимых из Российской Федерации одновременно с транспортным средством в соответствии со статьей 349 Таможенного кодекса Таможенного союза', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (222, 'ТС', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении транспортных средств международных перевозок, в том числе выпущенных на территории Российской Федерации в соответствии с таможенной процедурой временного ввоза (допуска) или таможенной процедурой свободной таможенной зоны и в дальнейшем используемых в качестве транспортных средств международных перевозок', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (223, 'ЗК', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, ввезенных на территорию Калининградской области в соответствии с таможенной процедурой свободной таможенной зоны, и продуктов их переработки, помещаемых под таможенную процедуру выпуска для внутреннего потребления или реимпорта', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (224, 'НО', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении научных или коммерческих образцов, ввозимых в Российскую Федерацию в соответствии с таможенной процедурой временного ввоза (допуска) с полным условным освобождением от уплаты таможенных пошлин, налогов и вывозимых из Российской Федерации в соответствии с таможенной процедурой временного вывоза', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (225, 'ОС', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров в случаях, определяемых Правительством Российской Федерации', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (226, 'ОО', 'Льготы по уплате таможенных сборов за таможенные операции в отношении товаров не запрашиваются', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (227, 'МВ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, перемещаемых через таможенную границу Евразийского экономического союза в рамках международных договоров Российской Федерации о воздушном сообщении', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (228, 'МУ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, перемещаемых через таможенную границу Евразийского экономического союза, в рамках межправительственных договоров Российской Федерации об уходе за военными могилами', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (229, 'ММ', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, перемещаемых через таможенную границу Евразийского экономического союза в рамках Соглашения о международно-правовых гарантиях беспрепятственного и независимого осуществления деятельности межгосударственной телекомпании «Мир»', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (230, 'МН', 'Освобождение от уплаты таможенных сборов за таможенные операции в отношении товаров, перемещаемых через таможенную границу Евразийского экономического союза в рамках Соглашения между Правительством Российской Федерации и Правительством КНР о сотрудничестве в нефтяной сфере', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (231, 'ТП', 'Освобождение от уплаты таможенной пошлины в отношении товаров, вывозимых с территории Российской Федерации в благотворительных целях по линии государств, международных организаций, правительств, в том числе в целях оказания технической помощи (содействия)', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (232, 'СМ', 'Освобождение от уплаты таможенной пошлины в отношении предметов материально-технического снабжения и снаряжения, топлива, продовольствия и другого имущества, вывозимого за пределы территории Российской Федерации для обеспечения деятельности судов государств-членов Евразийского экономического союза и судов, арендованных (зафрактованных) юридическими лицами и физическими лицами государств-членов Евразийского экономического союза, осуществляющих рыболовство', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (233, 'МЗ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, помещенных под таможенную процедуру свободной таможенной зоны в Магаданской области Российской Федерации и вывозимых резидентами особой экономической зоны на остальную территорию Магаданской области Российской Федерации для собственных производственных нужд', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (234, 'АВ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в соответствии с Соглашением о разделе продукции (далее – СРП) Сахалин-1', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (236, 'ВВ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в соответствии с СРП Харьягинское месторождение', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (237, 'НА', 'Освобождение от уплаты вывозной таможенной пошлины в отношении товаров, полученных (произведенных) при разработке нового морского месторождения углеводородного сырья, расположенного полностью в Азовском море или на 50 и более процентов своей площади в Балтийском море, в период до 31 марта 2032 г. включительно', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (238, 'НЧ', 'Освобождение от уплаты вывозной таможенной пошлины в отношении товаров, полученных (произведенных) при разработке нового морского месторождения углеводородного сырья, расположенного на 50 и более процентов своей площади в Черном море (глубина до 100 метров включительно), Печорском или Белом море, южной части Охотского моря (южнее 55° северной широты) либо российской части (российском секторе) дна Каспийского моря, в период до 31 марта 2032 г. включительно', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (239, 'НВ', 'Освобождение от уплаты вывозной таможенной пошлины в отношении товаров, полученных (произведенных) при разработке нового морского месторождения углеводородного сырья, расположенного на 50 и более процентов своей площади в Черном море (глубина более 100 метров), северной части Охотского моря (на 55° северной широты или севернее этой широты), южной части Баренцева моря (южнее 72° северной широты), в период до 31 марта 2042 г. включительно', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (240, 'НК', 'Освобождение от уплаты вывозной таможенной пошлины в отношении товаров, полученных (произведенных) при разработке нового морского месторождения углеводородного сырья, расположенного на 50 и более процентов своей площади в Карском море, северной части Баренцева моря (на 72° северной широты и севернее этой широты), восточной Арктике (море Лаптевых, Восточно-Сибирском море, Чукотском море и Беринговом море)', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (241, 'НМ', 'Освобождение от уплаты вывозной таможенной пошлины в отношении товаров, вывозимых из Российской Федерации и полученных (произведенных) при разработке морского месторождения углеводородного сырья, при этом не являющегося новым морским месторождением углеводородного сырья в соответствии со статьей 11.1 Налогового кодекса Российской Федерации, расположенного на 50 и более процентов своей площади в южной части Охотского моря (южнее 55° северной широты), в период до 1 января 2021 г. при условии, что степень выработанности запасов каждого вида углеводородного сырья (за исключением попутного газа), добываемого на таком месторождении, по состоянию на 1 января 2015 г. составляет менее 5 процентов', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (242, 'ЛЛ', 'Тарифная преференция в отношении товаров, происходящих и ввозимых из Республики Сербии или Республики Черногории в рамках Соглашения о свободной торговле между Российской Федерацией и Союзной Республикой Югославией', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (243, 'МВ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых через границу Российской Федерации в рамках международных договоров Российской Федерации о воздушном сообщении', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (244, 'КТ', 'Освобождение от уплаты таможенных пошлин в отношении бланков книжек МДП, перемещаемых между Ассоциацией международных автомобильных перевозчиков России (АСМАП) и Международным союзом автомобильного транспорта в Женеве (МСАТ)', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (245, 'МУ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в рамках межправительственных договоров Российской Федерации об уходе за военными могилами', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (246, 'МЯ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, ввозимых в соответствии с Соглашением о ввозе материалов образовательного, научного и культурного характера от 17 июня 1950 года и Протоколом к нему от 26 ноября 1976 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (247, 'МП', 'Освобождение от уплаты таможенной пошлины в отношении товаров, ввозимых в соответствии с Соглашением об общих условиях и механизме поддержки развития производственной кооперации предприятий и отраслей государств – участников Содружества Независимых Государств от 23 декабря 1993 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (248, 'МО', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в соответствии с межправительственными договорами Российской Федерации о производственной и научно-технической кооперации предприятий оборонных отраслей промышленности', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (249, 'МЭ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в рамках Соглашения об освобождении от уплаты таможенных пошлин, налогов и выдачи специальных разрешений за провоз нормативных документов, эталонов, средств измерений и стандартных образцов, провозимых с целью поверки и метрологической аттестации, от 10 февраля 1995 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (250, 'МТ', 'Освобождение от уплаты таможенной пошлины в отношении российского природного газа, вывозимого в Турецкую Республику через акваторию Черного моря в соответствии с Соглашением между Правительством Российской Федерации и Правительством Турецкой Республики о поставках российского природного газа в Турецкую Республику через акваторию Черного моря от 15 декабря 1997 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (251, 'ММ', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых в соответствии с Соглашением между Правительством Российской Федерации и Правительством Монголии о деятельности Российско-Монгольской компании с ограниченной ответственностью «Монголросцветмет» от 25 апреля 2007 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (252, 'МН', 'Освобождение от уплаты таможенной пошлины в отношении товаров, ввозимых на территорию Российской Федерации в рамках Соглашения между Правительством Российской Федерации и Правительством Китайской Народной Республики о сотрудничестве в нефтяной сфере от 21 апреля 2009 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (253, 'ЭР', 'Тарифная преференция в виде освобождения от уплаты таможенной пошлины в отношении товаров, происходящих и ввозимых из государств, образующих вместе с Российской Федерацией зону свободной торговли (за исключением тарифной преференции, определенной кодом ЛЛ)', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (254, 'ПН', 'Освобождение от уплаты вывозной таможенной пошлины в отношении нефти и нефтепродуктов, вывозимых из Российской Федерации в государства – участники Договора о Таможенном союзе и Едином экономическом пространстве от 26 февраля 1999 года, а также в государства, образующие вместе с Российской Федерацией зону свободной торговли, если такое освобождение предусмотрено международными договорами', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (255, 'МР', 'Освобождение от уплаты таможенной пошлины в отношении товаров, перемещаемых через границу Российской Федерации в рамках Соглашения о привилегиях и иммунитетах Международной организации ИТЭР по термоядерной энергии для совместной реализации проекта ИТЭР от 21 ноября 2006 года', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (256, 'ПИ', '4.2.3. Иные, не поименованные в подразделе 4.2, льготы по уплате таможенных пошлин', 'RU', '4.2.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (257, 'Ч', 'Освобождение от уплаты акциза в отношении товаров, ввозимых в Российскую Федерацию и предназначенных для выполнения работ по СРП: - Сахалин-1,  - Сахалин-2,  - Харьягинское месторождение', 'RU', '4.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (258, 'Ю', 'Освобождение от уплаты акциза в отношении подакцизных товаров, ввозимых в Российскую Федерацию международными организациями, их представительствами на территории Российской Федерации, персоналом этих организаций и представительств, а также членами их семей', 'RU', '4.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (259, 'К', 'Освобождение от уплаты акциза в отношении подакцизных товаров, ввозимых в Российскую Федерацию в соответствии с Соглашением об общих условиях и механизме поддержки развития производственной кооперации предприятий и отраслей государств – участников Содружества Независимых Государств от 23 декабря 1993 года', 'RU', '4.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (260, 'И', '4.3.3. Иные, не поименованные в подразделах 1.2. и 4.3., льготы по уплате акциза в отношении подакцизных товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'RU', '4.3.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (261, 'ВБ', 'Освобождение от уплаты НДС в отношении валюты Российской Федерации и иностранной валюты, банкнот, являющихся законными средствами платежа (за исключением предназначенных для коллекционирования), а также ценных бумаг - акций, облигаций, сертификатов, векселей', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (262, 'БГ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в качестве гуманитарной помощи', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (263, 'БТ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в качестве технической помощи', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (264, 'ЧА', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию и предназначенных для выполнения работ по СРП: - Сахалин-1', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (265, 'ЧБ', '- Сахалин-2', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (266, 'ЧВ', '- Харьягинское месторождение', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (267, 'ТО', 'Освобождение от уплаты НДС в отношении ввозимого в Российскую Федерацию технологического оборудования (в том числе комплектующих и запасных частей к нему), аналоги которого не производятся в Российской Федерации', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (268, 'РС', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию судов, подлежащих регистрации в Российском международном реестре судов', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (269, 'ПМ', 'Освобождение от уплаты НДС в отношении ввозимой в Российскую Федерацию продукции морского промысла, выловленной и (или) переработанной рыбопромышленными предприятиями (организациями) Российской Федерации', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (270, 'ПА', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию необработанных природных алмазов', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (271, 'ПС', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию племенного крупного рогатого скота, племенных свиней, племенных овец, племенных коз, племенных лошадей, племенной птицы (племенного яйца), семени (спермы), полученного от племенных быков, племенных свиней, племенных баранов, племенных козлов, племенных жеребцов, эмбрионов, полученных от племенного крупного рогатого скота, племенных свиней, племенных овец, племенных коз, племенных лошадей', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (272, 'КО', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию всех видов печатных изданий, получаемых государственными и муниципальными библиотеками и музеями по международному книгообмену, а также произведений кинематографии, ввозимых специализированными государственными организациями в целях осуществления международных некоммерческих обменов', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (273, 'КТ', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию бланков книжек МДП, перемещаемых между Ассоциацией международных автомобильных перевозчиков России (АСМАП) и Международным союзом автомобильного транспорта в Женеве (МСАТ)', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (274, 'МУ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в рамках межправительственных договоров об уходе за военными могилами', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (275, 'МЯ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в соответствии с Соглашением о ввозе материалов образовательного, научного и культурного характера от 17 июня 1950 года и Протоколом к нему от 26 ноября 1976 года', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (276, 'А', 'Освобождение от уплаты акцизов в отношении ввозимых и вывозимых товаров, помещаемых под таможенную процедуру иную, чем таможенная процедура выпуска для внутреннего потребления', 'AM', '5.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (277, 'КЦ', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию культурных ценностей, приобретенных за счет средств федерального бюджета, бюджетов субъектов Российской Федерации и местных бюджетов, культурных ценностей, полученных в дар государственными и муниципальными учреждениями культуры, государственными и муниципальными архивами, а также культурных ценностей, передаваемых в качестве дара учреждениям, отнесенным в соответствии с законодательством Российской Федерации к особо ценным объектам культурного и национального наследия народов Российской Федерации', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (278, 'ГГ', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию технических средств, включая автомототранспорт, материалов, которые могут быть использованы исключительно для профилактики инвалидности или реабилитации инвалидов', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (279, 'ГК', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию сырья и комплектующих изделий для производства технических средств, включая автомототранспорт, которые могут быть использованы исключительно для профилактики инвалидности или реабилитации инвалидов', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (280, 'ГП', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию протезно-ортопедических изделий', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (281, 'ГС', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию сырья и материалов для изготовления протезно-ортопедических изделий и полуфабрикатов к ним', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (282, 'ГИ', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию материалов для изготовления медицинских иммунобиологических препаратов для диагностики, профилактики и (или) лечения инфекционных заболеваний', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (283, 'ХТ', 'Освобождение от уплаты НДС в отношении ввозимой в Российскую Федерацию важнейшей и жизненно необходимой медицинской техники', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (284, 'ХС', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию сырья и комплектующих изделий для производства важнейшей и жизненно необходимой медицинской техники', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (285, 'ХО', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию очков, линз и оправ для очков (за исключением солнцезащитных)', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (286, 'ХК', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию сырья и комплектующих изделий для производства линз и оправ для очков (за исключением солнцезащитных)', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (287, 'РМ', 'Освобождение от уплаты НДС в отношении ввозимых в Российскую Федерацию расходных материалов для научных исследований, аналоги которых не производятся в Российской Федерации', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (288, 'РЗ', 'Освобождение от уплаты НДС в отношении ввозимых на территорию Российской Федерации незарегистрированных лекарственных средств, предназначенных для оказания медицинской помощи по жизненным показаниям конкретных пациентов, и гемопоэтических стволовых клеток и костного мозга для проведения неродственной трансплантации', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (289, 'ЛК', 'Применение ставки НДС в размере 10% в отношении ввозимых в Российскую Федерацию периодических печатных изданий книжной продукции, связанной с образованием, наукой и культурой', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (290, 'ЛС', 'Применение ставки НДС в размере 10% в отношении ввозимых в Российскую Федерацию лекарственных средств, включая лекарственные субстанции', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (291, 'ЛМ', 'Применение ставки НДС в размере 10% в отношении ввозимых в Российскую Федерацию изделий медицинского назначения', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (292, 'ЛП', 'Применение ставки НДС в размере 10% в отношении ввозимых в Российскую Федерацию продовольственных товаров', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (293, 'ЛД', 'Применение ставки НДС в размере 10% в отношении ввозимых в Российскую Федерацию товаров для детей', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (294, 'МЮ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию международными организациями, их представительствами на территории Российской Федерации, персоналом этих организаций и представительств, а также членами их семей', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (295, 'МВ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в рамках международных договоров Российской Федерации о воздушном сообщении', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (296, 'МП', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в соответствии с Соглашением об общих условиях и механизме поддержки развития производственной кооперации предприятий и отраслей государств – участников Содружества Независимых Государств от 23 декабря 1993 года', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (297, 'МК', 'Освобождение от уплаты НДС в отношении товаров, за исключением подакцизных, ввозимых в Российскую Федерацию в рамках международного сотрудничества Российской Федерации в области исследования и использования космического пространства, а также договоров об услугах по запуску космических аппаратов', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (298, 'МЭ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в рамках Соглашения об освобождении от уплаты таможенных пошлин, налогов и выдачи специальных разрешений за провоз нормативных документов, эталонов, средств измерений и стандартных образцов, провозимых с целью поверки и метрологической аттестации, от 10 февраля 1995 года', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (299, 'МШ', 'Освобождение от уплаты НДС в отношении ввозимой в Российскую Федерацию продукции, произведенной в результате хозяйственной деятельности российских организаций на земельных участках, являющихся территорией иностранного государства с правом землепользования Российской Федерации на основании международного договора (например, Шпицберген)', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (300, 'МН', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Российскую Федерацию в рамках Соглашения между Правительством Российской Федерации и Правительством Китайской Народной Республики о сотрудничестве в нефтяной сфере от 21 апреля 2009 года', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (318, 'ЛЖ', 'Освобождение от уплаты НДС в отношении вакцин и лекарственных средств для животных', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (301, 'МР', 'Освобождение от уплаты НДС в отношении товаров, перемещаемых через границу Российской Федерации в рамках Соглашения о привилегиях и иммунитетах Международной организации ИТЭР по термоядерной энергии для совместной реализации проекта ИТЭР от 21 ноября 2006 года', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (302, 'НИ', '4.4.3. Иные, не поименованные в подразделах 1.3. и 4.4., льготы по уплате НДС в отношении товаров, ввозимых на таможенную территорию Евразийского экономического союза', 'RU', '4.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (303, 'БА', 'Освобождение от уплаты таможенных сборов в отношении товаров, ввозимых в Республику Армения в рамках гуманитарной помощи и (или) благотворительных программ', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (304, 'КЦ', 'Освобождение от уплаты таможенных сборов в отношении культурных ценностей, зарегистрированных или подлежащих регистрации в установленном порядке в Республике Армения, помещаемых под таможенные процедуры временного вывоза или временного ввоза (допуска) в целях экспонирования, реимпорта при их обратном ввозе или реэкспорта при их обратном вывозе', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (305, 'АА', 'Освобождение от уплаты таможенных сборов в отношении товаров, для которых международными договорами и актами, составляющими право Евразийского экономического союза, международными договорами и законодательными актами Республики Армения установлены льготы по уплате таможенных пошлин, налогов', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (306, 'СИ', 'Иные льготы по уплате таможенных сборов', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (307, 'ОО', 'Льготы по уплате таможенных сборов не используются (не запрашиваются)', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (308, 'МО', 'Льготы по уплате ввозных таможенных пошлин в рамках международных договоров Республики Армения, заключенных до 1 января 2015 г. (в том числе при реализации после 1 января 2015 г. программ, осуществляемых в рамках этих международных договоров), применяемые в соответствии с указанными международными договорами', 'AM', '5.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (309, 'ГН', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации программы «Армяно-индийский учебный центр информационных и коммуникационных технологий», применяемые до окончания срока ее действия в соответствии с Меморандумом о взаимопонимании между Правительством Республики Армения и Правительством Республики Индия «О создании армяно-индийского учебного центра информационных и коммуникационных технологий» от 26 июня 2009 г.', 'AM', '5.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (310, 'ДД', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации программы «Международная школа Дилижана», утвержденной Законом Республики Армения от 19 июня 2013 г., применяемые до 1 января 2018 г., за исключением транспортных средств, велосипедов, водного и воздушного транспорта', 'AM', '5.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (311, 'БА', 'Освобождение от уплаты НДС в отношении товаров, поставляемых иностранными государствами, международными межправительственными (межгосударственными) организациями, международными, иностранными и действующими в Республике Армения общественными (включая благотворительные), религиозными и иными негосударственными организациями аналогичного характера, отдельными благотворителями в рамках программ гуманитарной помощи и благотворительных программ (деятельности)', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (312, 'НГ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых на территорию Республики Армения из третьих стран налогоплательщиками, имеющими статус уполномоченного экономического оператора, или группой резидентов – плательщиков налога на прибыль, реализующих программу, одобренную Правительством Республики Армения, в случае если указанные товары вывозятся из Республики Армения (в том числе в государства – члены Евразийского экономического союза) в течение 180 календарных дней со дня, следующего за днем ввоза указанных товаров', '', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (313, 'ВГ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых на территорию Республики Армения из третьих стран налогоплательщиками, имеющими статус уполномоченного экономического оператора, или группой резидентов – плательщиков налога на прибыль, реализующих программу, одобренную Правительством Республики Армения, в случае если товары, полученные (образовавшиеся) в результате операций по переработке указанных товаров (продукты переработки), вывозятся из Республики Армения (в том числе в государства – члены Евразийского экономического союза) в течение 180 календарных дней со дня, следующего за днем ввоза указанных товаров', '', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (319, 'МО', 'Льготы по уплате ввозных таможенных пошлин, предоставленные Кыргызской Республикой в рамках международных договоров Кыргызской Республики, подписанных до 1 апреля 2015 г., применяемые в соответствии с указанными международными договорами до прекращения действия этих международных договоров', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (320, 'ТЭ', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации проекта «Модернизация тепловой электроцентрали города Бишкек», применяемые до 30 ноября 2017 г., в соответствии с кредитным соглашением льготного покупательского кредита между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 11 сентября 2013 г.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (321, 'ДК', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации проекта «Строительство линии электропередачи 500 кВ «Датка-Кемин» и подстанции 500 кВ «Кемин», применяемые до 31 декабря 2015 г., в соответствии с льготным кредитным соглашением между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 5 июня 2012 г.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (322, 'ДР', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации проекта по реабилитации двух участков дорог в Кыргызской Республике (РВС № (2012) 54 номер (242)), применяемые до 31 декабря 2017 г., в соответствии с льготным кредитным соглашением между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 4 декабря 2012 г.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (323, 'ДЛ', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации проекта альтернативной автодороги Север – Юг на участках Казарман – Джалал-Абад (км 291 – 433) и Балыкчы – Арал (км 183+500 – 195+486), применяемые до 31 декабря 2019 г., в соответствии с льготным кредитным соглашением между Правительством Кыргызской Республики и Экспортно-импортным банком Китайской Народной Республики от 11 сентября 2013 г.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (324, 'ДБ', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации проекта реконструкции автодороги Бишкек – Нарын – Торугарт, применяемые до 31 декабря 2017 г., в соответствии с кредитными соглашениями между Кыргызской Республикой и Саудовским фондом развития от 13 сентября 2011 г., Кыргызской Республикой и Кувейтским фондом арабского экономического развития от 7 сентября 2011 г. и Правительством Кыргызской Республики и Фондом развития Абу-Даби от 8 февраля 2012 г.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (325, 'ДТ', 'Льготы по уплате ввозных таможенных пошлин в рамках реализации проекта реконструкции автодороги Тараз – Талас – Суусамыр, применяемые до 31 декабря 2018 г., в соответствии с кредитным соглашением между Правительством Кыргызской Республики и Саудовским фондом развития от 13 августа 2013 г.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (326, 'КЭ', 'Тарифная преференция в виде освобождения от уплаты таможенной пошлины в отношении товаров, происходящих и ввозимых из государств, образующих вместе с Кыргызской Республикой зону свободной торговли', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (327, 'ПИ', '6.2.2. Иные, не поименованные в пункте 6.2.1 подраздела 6.2, льготы по уплате таможенных пошлин', 'KG', '6.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (328, 'А', 'Освобождение от уплаты акцизов, за исключением льгот, поименованных в подразделе 1.2', 'KG', '6.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (329, 'И', 'Иные, не поименованные в подразделах 1.2 и 6.3, льготы по уплате акцизов', 'KG', '6.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (330, 'БА', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Кыргызскую Республику в качестве гуманитарной помощи, в благотворительных целях по линии государств, правительств государств и международных организаций', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (331, 'ГР', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Кыргызскую Республику за счет безвозмездной помощи (грантов), предоставленных по линии государств, правительств государств и международных организаций', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (332, 'СБ', 'Освобождение от уплаты НДС в отношении товаров, ввозимых в Кыргызскую Республику в целях ликвидации последствий аварий и катастроф, стихийных бедствий', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (333, 'ПД', 'Освобождение от уплаты НДС в отношении детского питания', 'KG', '6.4.1');


--
-- TOC entry 4571 (class 0 OID 18943)
-- Dependencies: 265
-- Data for Name: featureofmovementofgoodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4573 (class 0 OID 18951)
-- Dependencies: 267
-- Data for Name: govcontrolsystemandtechresourceskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4575 (class 0 OID 18959)
-- Dependencies: 269
-- Data for Name: govcontrolsystemkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4577 (class 0 OID 18967)
-- Dependencies: 271
-- Data for Name: govsupportsystemkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4579 (class 0 OID 18975)
-- Dependencies: 273
-- Data for Name: incidentassessmentcodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO incidentassessmentcodeclassifier VALUES (1, '1000', 'Активация, установка или разъединение');
INSERT INTO incidentassessmentcodeclassifier VALUES (2, '1001', 'Трудности в установке');
INSERT INTO incidentassessmentcodeclassifier VALUES (3, '1002', 'Отказ активации');
INSERT INTO incidentassessmentcodeclassifier VALUES (4, '1003', 'Отказ при разъединении');
INSERT INTO incidentassessmentcodeclassifier VALUES (5, '1004', 'Преждевременная активация');
INSERT INTO incidentassessmentcodeclassifier VALUES (6, '1005', 'Задержка активации');
INSERT INTO incidentassessmentcodeclassifier VALUES (7, '1100', 'Аппаратные средства компьютера');
INSERT INTO incidentassessmentcodeclassifier VALUES (8, '1101', 'Проблема аппаратных средств компьютера');
INSERT INTO incidentassessmentcodeclassifier VALUES (9, '1102', 'Проблема сети');
INSERT INTO incidentassessmentcodeclassifier VALUES (10, '1200', 'Компьютерное программное обеспечение');
INSERT INTO incidentassessmentcodeclassifier VALUES (11, '1201', 'Проблема прикладной программы');
INSERT INTO incidentassessmentcodeclassifier VALUES (12, '1202', 'Проблема программирования');
INSERT INTO incidentassessmentcodeclassifier VALUES (13, '1300', 'Подключение или установка');
INSERT INTO incidentassessmentcodeclassifier VALUES (14, '1301', 'Проблема подключения');
INSERT INTO incidentassessmentcodeclassifier VALUES (15, '1302', 'Отключение');
INSERT INTO incidentassessmentcodeclassifier VALUES (16, '1303', 'Отказ отключения');
INSERT INTO incidentassessmentcodeclassifier VALUES (17, '1304', 'Проблема установки');
INSERT INTO incidentassessmentcodeclassifier VALUES (18, '1305', 'Ненадежное или прерывающее подключение');
INSERT INTO incidentassessmentcodeclassifier VALUES (19, '1306', 'Неправильное подключение');
INSERT INTO incidentassessmentcodeclassifier VALUES (20, '1400', 'Электричество/электроника');
INSERT INTO incidentassessmentcodeclassifier VALUES (21, '1401', 'Искрение');
INSERT INTO incidentassessmentcodeclassifier VALUES (22, '1402', 'Отказ цепи');
INSERT INTO incidentassessmentcodeclassifier VALUES (23, '1403', 'Проблема чувствительного элемента');
INSERT INTO incidentassessmentcodeclassifier VALUES (24, '1404', 'Проблема источника питания');
INSERT INTO incidentassessmentcodeclassifier VALUES (25, '1405', 'Искра');
INSERT INTO incidentassessmentcodeclassifier VALUES (26, '1500', 'Внешние условия');
INSERT INTO incidentassessmentcodeclassifier VALUES (27, '1501', 'Окружающие частицы');
INSERT INTO incidentassessmentcodeclassifier VALUES (28, '1502', 'Газы или пары');
INSERT INTO incidentassessmentcodeclassifier VALUES (29, '1503', 'Неподходящее хранение');
INSERT INTO incidentassessmentcodeclassifier VALUES (30, '1504', 'Потеря мощности');
INSERT INTO incidentassessmentcodeclassifier VALUES (31, '1600', 'Отказ имплантируемых изделий');
INSERT INTO incidentassessmentcodeclassifier VALUES (32, '1601', 'Миграция изделия или компонентов изделия');
INSERT INTO incidentassessmentcodeclassifier VALUES (33, '1602', 'Проблема, связанная с разрушением кости');
INSERT INTO incidentassessmentcodeclassifier VALUES (34, '1700', 'Несовместимость');
INSERT INTO incidentassessmentcodeclassifier VALUES (35, '1701', 'Несовместимость компонентов или аксессуаров');
INSERT INTO incidentassessmentcodeclassifier VALUES (36, '1702', 'Несовместимость на уровне "изделие-изделие"');
INSERT INTO incidentassessmentcodeclassifier VALUES (37, '1703', 'Несовместимость на уровне "пациент-изделие"');
INSERT INTO incidentassessmentcodeclassifier VALUES (38, '1800', 'Инфузия/подача');
INSERT INTO incidentassessmentcodeclassifier VALUES (39, '1801', 'Проблема, связанная с освобождением от содержимого');
INSERT INTO incidentassessmentcodeclassifier VALUES (40, '1802', 'Неправильная подача или инфузия');
INSERT INTO incidentassessmentcodeclassifier VALUES (41, '1803', 'Проблема наполнения');
INSERT INTO incidentassessmentcodeclassifier VALUES (42, '1804', 'Нет потока');
INSERT INTO incidentassessmentcodeclassifier VALUES (43, '1805', 'Чрезмерный поток');
INSERT INTO incidentassessmentcodeclassifier VALUES (44, '1806', 'Недостаточное поступление');
INSERT INTO incidentassessmentcodeclassifier VALUES (45, '1900', 'Маркировка, этикетирование и инструкция по применению');
INSERT INTO incidentassessmentcodeclassifier VALUES (46, '1901', 'Проблема инструкции по применению');
INSERT INTO incidentassessmentcodeclassifier VALUES (47, '1902', 'Проблема маркировки');
INSERT INTO incidentassessmentcodeclassifier VALUES (48, '2000', 'Материал');
INSERT INTO incidentassessmentcodeclassifier VALUES (49, '2001', 'Разрыв');
INSERT INTO incidentassessmentcodeclassifier VALUES (50, '2002', 'Растрескивание');
INSERT INTO incidentassessmentcodeclassifier VALUES (51, '2003', 'Деградация');
INSERT INTO incidentassessmentcodeclassifier VALUES (52, '2004', 'Обесцвечивание материала');
INSERT INTO incidentassessmentcodeclassifier VALUES (53, '2005', 'Фрагментация материала');
INSERT INTO incidentassessmentcodeclassifier VALUES (54, '2006', 'Перфорация материала');
INSERT INTO incidentassessmentcodeclassifier VALUES (55, '2007', 'Расслоение материала');
INSERT INTO incidentassessmentcodeclassifier VALUES (56, '2100', 'Механическая часть');
INSERT INTO incidentassessmentcodeclassifier VALUES (57, '2101', 'Несоответствующая калибровка');
INSERT INTO incidentassessmentcodeclassifier VALUES (58, '2102', 'Отсоединение изделия или компонентов изделия');
INSERT INTO incidentassessmentcodeclassifier VALUES (59, '2103', 'Смещение или перемещение');
INSERT INTO incidentassessmentcodeclassifier VALUES (60, '2104', 'Утечка');
INSERT INTO incidentassessmentcodeclassifier VALUES (61, '2105', 'Механическая помеха');
INSERT INTO incidentassessmentcodeclassifier VALUES (62, '2106', 'Проблема возврата в предназначенное положение');
INSERT INTO incidentassessmentcodeclassifier VALUES (63, '2107', 'Непредусмотренное перемещение');
INSERT INTO incidentassessmentcodeclassifier VALUES (64, '2200', 'Немеханическая часть');
INSERT INTO incidentassessmentcodeclassifier VALUES (65, '2201', 'Химическая проблема');
INSERT INTO incidentassessmentcodeclassifier VALUES (66, '2202', 'Связь или уровень передаваемого сигнала');
INSERT INTO incidentassessmentcodeclassifier VALUES (67, '2203', 'Установка');
INSERT INTO incidentassessmentcodeclassifier VALUES (68, '2204', 'Оптическая проблема');
INSERT INTO incidentassessmentcodeclassifier VALUES (69, '2205', 'Несоответствие телеметрии');
INSERT INTO incidentassessmentcodeclassifier VALUES (70, '2300', 'Прочие');
INSERT INTO incidentassessmentcodeclassifier VALUES (71, '2301', 'Прочие');
INSERT INTO incidentassessmentcodeclassifier VALUES (72, '2400', 'Проблема на выходе');
INSERT INTO incidentassessmentcodeclassifier VALUES (73, '2401', 'Неправильный выход энергии на ткани пациента');
INSERT INTO incidentassessmentcodeclassifier VALUES (74, '2500', 'Упаковка/доставка');
INSERT INTO incidentassessmentcodeclassifier VALUES (75, '2501', 'Повреждение до применения');
INSERT INTO incidentassessmentcodeclassifier VALUES (76, '2502', 'Поставка нестерильных продуктов');
INSERT INTO incidentassessmentcodeclassifier VALUES (77, '2503', 'Упаковка');
INSERT INTO incidentassessmentcodeclassifier VALUES (78, '2504', 'Загрязнение изделия во время доставки');
INSERT INTO incidentassessmentcodeclassifier VALUES (79, '2505', 'Трудности в открытии или удалении упаковочных материалов');
INSERT INTO incidentassessmentcodeclassifier VALUES (80, '2600', 'Защита');
INSERT INTO incidentassessmentcodeclassifier VALUES (81, '2601', 'Проблема системы сигнализации изделия');
INSERT INTO incidentassessmentcodeclassifier VALUES (82, '2602', 'Проблема защитной функции');
INSERT INTO incidentassessmentcodeclassifier VALUES (83, '2700', 'Температура');
INSERT INTO incidentassessmentcodeclassifier VALUES (84, '2701', 'Сожженные изделия или компоненты');
INSERT INTO incidentassessmentcodeclassifier VALUES (85, '2702', 'Пожар');
INSERT INTO incidentassessmentcodeclassifier VALUES (86, '2703', 'Пламя или искрение');
INSERT INTO incidentassessmentcodeclassifier VALUES (87, '2704', 'Недостаточное охлаждение');
INSERT INTO incidentassessmentcodeclassifier VALUES (88, '2705', 'Перегрев изделия или компонентов изделия');
INSERT INTO incidentassessmentcodeclassifier VALUES (89, '2706', 'Задымление');
INSERT INTO incidentassessmentcodeclassifier VALUES (90, '2800', 'Непредусмотренная функция');
INSERT INTO incidentassessmentcodeclassifier VALUES (91, '2801', 'Изделие отображает неправильное сообщение');
INSERT INTO incidentassessmentcodeclassifier VALUES (92, '2802', 'Повреждение сцепления или соединения');
INSERT INTO incidentassessmentcodeclassifier VALUES (93, '2803', 'Неправильная сборка');
INSERT INTO incidentassessmentcodeclassifier VALUES (94, '2804', 'Предоставление лечения не той области тела');
INSERT INTO incidentassessmentcodeclassifier VALUES (95, '2900', 'Ошибка применения');
INSERT INTO incidentassessmentcodeclassifier VALUES (96, '2901', 'Недостаточная или ненадлежащая дезинфекция и стерилизация');
INSERT INTO incidentassessmentcodeclassifier VALUES (97, '2902', 'Недостаточное обучение');
INSERT INTO incidentassessmentcodeclassifier VALUES (98, '2903', 'Проблема технического обслуживания');
INSERT INTO incidentassessmentcodeclassifier VALUES (99, '2904', 'Проблема восстановления');
INSERT INTO incidentassessmentcodeclassifier VALUES (100, '2905', 'Проблема применения изделия');
INSERT INTO incidentassessmentcodeclassifier VALUES (101, '2906', 'Неработающее изделие');


--
-- TOC entry 4581 (class 0 OID 18983)
-- Dependencies: 275
-- Data for Name: institutionaleconomysectorclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO institutionaleconomysectorclassifier VALUES (1, '1', 'Экономика в целом');
INSERT INTO institutionaleconomysectorclassifier VALUES (2, '1.1', 'Нефинансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (3, '1.1.1', 'Государственные нефинансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (4, '1.1.1.1', 'Государственные нефинансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (5, '1.1.1.1.1', 'Государственные нефинансовые корпорации – НКО*');
INSERT INTO institutionaleconomysectorclassifier VALUES (6, '1.1.1.1.2', 'Государственные нефинансовые корпорации – ОПП**');
INSERT INTO institutionaleconomysectorclassifier VALUES (7, '1.1.2', 'Национальные частные нефинансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (8, '1.1.2.1', 'Национальные частные нефинансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (9, '1.1.2.1.1', 'Национальные частные нефинансовые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (10, '1.1.2.1.2', 'Национальные частные нефинансовые корпорации – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (11, '1.1.3', 'Нефинансовые корпорации под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (12, '1.1.3.1', 'Нефинансовые корпорации под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (13, '1.1.3.1.1', 'Нефинансовые корпорации под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (14, '1.1.3.1.2', 'Нефинансовые корпорации под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (15, '1.2', 'Финансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (16, '1.2.1', 'Национальный (центральный) банк');
INSERT INTO institutionaleconomysectorclassifier VALUES (17, '1.2.2', 'Корпорации, принимающие депозиты, кроме национального (центрального) банка');
INSERT INTO institutionaleconomysectorclassifier VALUES (18, '1.2.2.1', 'Государственные корпорации, принимающие депозиты');
INSERT INTO institutionaleconomysectorclassifier VALUES (19, '1.2.2.1.1', 'Государственные корпорации, принимающие депозиты, – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (20, '1.2.2.1.2', 'Государственные корпорации, принимающие депозиты, – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (21, '1.2.2.2', 'Национальные частные корпорации, принимающие депозиты');
INSERT INTO institutionaleconomysectorclassifier VALUES (22, '1.2.2.2.1', 'Национальные частные корпорации, принимающие депозиты, – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (23, '1.2.2.2.2', 'Национальные частные корпорации, принимающие депозиты, – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (24, '1.2.2.3', 'Корпорации, принимающие депозиты, под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (25, '1.2.2.3.1', 'Корпорации, принимающие депозиты, под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (26, '1.2.2.3.2', 'Корпорации, принимающие депозиты, под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (27, '1.2.3', 'Фонды денежного рынка');
INSERT INTO institutionaleconomysectorclassifier VALUES (28, '1.2.3.1', 'Государственные фонды денежного рынка');
INSERT INTO institutionaleconomysectorclassifier VALUES (29, '1.2.3.1.1', 'Государственные фонды денежного рынка – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (30, '1.2.3.1.2', 'Государственные фонды денежного рынка – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (31, '1.2.3.2', 'Национальные частные  фонды денежного рынка');
INSERT INTO institutionaleconomysectorclassifier VALUES (32, '1.2.3.2.1', 'Национальные частные  фонды денежного рынка – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (33, '1.2.3.2.2', 'Национальные частные  фонды денежного рынка – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (34, '1.2.3.3', 'Фонды денежного рынка под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (35, '1.2.3.3.1', 'Фонды денежного рынка под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (36, '1.2.3.3.2', 'Фонды денежного рынка под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (37, '1.2.4', 'Инвестиционные фонды неденежного рынка');
INSERT INTO institutionaleconomysectorclassifier VALUES (38, '1.2.4.1', 'Государственные инвестиционные фонды неденежного рынка');
INSERT INTO institutionaleconomysectorclassifier VALUES (39, '1.2.4.1.1', 'Государственные инвестиционные фонды неденежного рынка – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (40, '1.2.4.1.2', 'Государственные инвестиционные фонды неденежного рынка – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (41, '1.2.4.2', 'Национальные частные инвестиционные фонды неденежного рынка');
INSERT INTO institutionaleconomysectorclassifier VALUES (42, '1.2.4.2.1', 'Национальные частные инвестиционные фонды неденежного рынка – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (43, '1.2.4.2.2', 'Национальные частные инвестиционные фонды неденежного рынка – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (44, '1.2.4.3', 'Инвестиционные фонды неденежного рынка под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (45, '1.2.4.3.1', 'Инвестиционные фонды неденежного рынка под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (46, '1.2.4.3.2', 'Инвестиционные фонды неденежного рынка под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (47, '1.2.5', 'Другие финансовые посредники, кроме страховых корпораций и пенсионных фондов');
INSERT INTO institutionaleconomysectorclassifier VALUES (48, '1.2.5.1', 'Другие государственные финансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (49, '1.2.5.1.1', 'Другие государственные финансовые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (50, '1.2.5.1.2', 'Другие государственные финансовые корпорации – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (51, '1.2.5.2', 'Другие национальные частные финансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (52, '1.2.5.2.1', 'Другие национальные частные финансовые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (53, '1.2.5.2.2', 'Другие национальные частные финансовые корпорации – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (54, '1.2.5.3', 'Другие финансовые корпорации под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (55, '1.2.5.3.1', 'Другие финансовые корпорации под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (56, '1.2.5.3.2', 'Другие финансовые корпорации под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (57, '1.2.6', 'Вспомогательные финансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (58, '1.2.6.1', 'Государственные вспомогательные финансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (59, '1.2.6.1.1', 'Государственные вспомогательные финансовые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (60, '1.2.6.1.2', 'Государственные вспомогательные финансовые корпорации – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (61, '1.2.6.2', 'Национальные частные вспомогательные финансовые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (62, '1.2.6.2.1', 'Национальные частные вспомогательные финансовые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (63, '1.2.6.2.2', 'Национальные частные вспомогательные финансовые корпорации  – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (64, '1.2.6.3', 'Финансовые корпорации вспомогательные под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (65, '1.2.6.3.1', 'Финансовые корпорации вспомогательные под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (66, '1.2.6.3.2', 'Финансовые корпорации вспомогательные под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (67, '1.2.7', 'Кэптивные финансовые учреждения и ростовщики');
INSERT INTO institutionaleconomysectorclassifier VALUES (68, '1.2.7.1', 'Государственные кэптивные финансовые учреждения');
INSERT INTO institutionaleconomysectorclassifier VALUES (69, '1.2.7.1.1', 'Государственные кэптивные финансовые учреждения – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (70, '1.2.7.1.2', 'Государственные кэптивные финансовые учреждения – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (71, '1.2.7.2', 'Национальные частные кэптивные финансовые учреждения');
INSERT INTO institutionaleconomysectorclassifier VALUES (72, '1.2.7.2.1', 'Национальные частные кэптивные финансовые учреждения – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (73, '1.2.7.2.2', 'Национальные частные кэптивные финансовые учреждения – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (74, '1.2.7.3', 'Кэптивные финансовые учреждения под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (75, '1.2.7.3.1', 'Кэптивные финансовые учреждения под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (76, '1.2.7.3.2', 'Кэптивные финансовые учреждения под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (77, '1.2.8', 'Страховые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (78, '1.2.8.1', 'Государственные страховые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (79, '1.2.8.1.1', 'Государственные страховые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (80, '1.2.8.1.2', 'Государственные страховые корпорации – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (81, '1.2.8.2', 'Национальные частные страховые корпорации');
INSERT INTO institutionaleconomysectorclassifier VALUES (82, '1.2.8.2.1', 'Национальные частные страховые корпорации – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (83, '1.2.8.2.2', 'Национальные частные страховые корпорации – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (84, '1.2.8.3', 'Страховые корпорации под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (85, '1.2.8.3.1', 'Страховые корпорации под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (86, '1.2.8.3.2', 'Страховые корпорации под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (87, '1.2.9', 'Пенсионные фонды');
INSERT INTO institutionaleconomysectorclassifier VALUES (88, '1.2.9.1', 'Государственные пенсионные фонды');
INSERT INTO institutionaleconomysectorclassifier VALUES (89, '1.2.9.1.1', 'Государственные пенсионные фонды – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (90, '1.2.9.1.2', 'Государственные пенсионные фонды – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (91, '1.2.9.2', 'Национальные частные пенсионные фонды');
INSERT INTO institutionaleconomysectorclassifier VALUES (92, '1.2.9.2.1', 'Национальные частные пенсионные фонды – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (93, '1.2.9.2.2', 'Национальные частные пенсионные фонды – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (94, '1.2.9.3', 'Пенсионные фонды под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (95, '1.2.9.3.1', 'Пенсионные фонды под иностранным контролем – НКО');
INSERT INTO institutionaleconomysectorclassifier VALUES (96, '1.2.9.3.2', 'Пенсионные фонды под иностранным контролем – ОПП');
INSERT INTO institutionaleconomysectorclassifier VALUES (97, '1.3', 'Государственное управление');
INSERT INTO institutionaleconomysectorclassifier VALUES (98, '1.3.1', 'Центральные органы управления (центральное правитель­ство)');
INSERT INTO institutionaleconomysectorclassifier VALUES (99, '1.3.1.1', 'Центральные органы управления (кроме фондов социального обеспечения и нерыночных НКО, контролируемых центральными органами управления)');
INSERT INTO institutionaleconomysectorclassifier VALUES (100, '1.3.1.2', 'Нерыночные НКО, контролируемые центральными органами управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (101, '1.3.2', 'Региональные органы управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (102, '1.3.2.1', 'Региональные органы управления (кроме фондов социального обеспечения и нерыночных НКО, контролируемых региональными органами управления)');
INSERT INTO institutionaleconomysectorclassifier VALUES (103, '1.3.2.2', 'Нерыночные НКО, контролируемые региональными органами управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (104, '1.3.3', 'Местные органы управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (105, '1.3.3.1', 'Местные органы управления (кроме фондов социального обеспечения и нерыночных НКО, контролируемых местными органами управления)');
INSERT INTO institutionaleconomysectorclassifier VALUES (106, '1.3.3.2', 'Нерыночные НКО, контролируемые местными органами управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (107, '1.3.4', 'Фонды государственного социального обеспечения');
INSERT INTO institutionaleconomysectorclassifier VALUES (108, '1.3.4.1', 'Фонды социального обеспечения центральных органов управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (109, '1.3.4.2', 'Фонды социального обеспечения региональных органов управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (110, '1.3.4.3', 'Фонды социального обеспечения местных органов управления');
INSERT INTO institutionaleconomysectorclassifier VALUES (111, '1.4', 'Домашние хозяйства');
INSERT INTO institutionaleconomysectorclassifier VALUES (112, '1.4.1', 'Работодатели');
INSERT INTO institutionaleconomysectorclassifier VALUES (113, '1.4.2', 'Самостоятельно занятые лица');
INSERT INTO institutionaleconomysectorclassifier VALUES (114, '1.4.3', 'Лица, работающие по найму');
INSERT INTO institutionaleconomysectorclassifier VALUES (115, '1.4.4', 'Получатели доходов от собственности и трансфертов');
INSERT INTO institutionaleconomysectorclassifier VALUES (116, '1.4.4.1', 'Получатели доходов от собственности');
INSERT INTO institutionaleconomysectorclassifier VALUES (117, '1.4.4.2', 'Получатели пенсий');
INSERT INTO institutionaleconomysectorclassifier VALUES (118, '1.4.4.3', 'Получатели других трансфертных доходов');
INSERT INTO institutionaleconomysectorclassifier VALUES (119, '1.5', 'Некоммерческие организации, обслуживающие домашние хозяйства');
INSERT INTO institutionaleconomysectorclassifier VALUES (120, '1.5.1', 'Национальные частные некоммерческие организации, обслуживающие домашние хозяйства');
INSERT INTO institutionaleconomysectorclassifier VALUES (121, '1.5.2', 'Некоммерческие организации, обслуживающие домашние хозяйства, под иностранным контролем');
INSERT INTO institutionaleconomysectorclassifier VALUES (122, '2', 'Остальной мир');
INSERT INTO institutionaleconomysectorclassifier VALUES (123, '3', 'Тест');


--
-- TOC entry 4583 (class 0 OID 18991)
-- Dependencies: 277
-- Data for Name: internatioanltransporttypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO internatioanltransporttypesclassifier VALUES (1, '100', 'Водное судно', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (2, '201', 'Паровоз', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (3, '202', 'Электровоз', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (4, '203', 'Электропоезд', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (5, '204', 'Тепловоз', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (6, '205', 'Дизель-поезд', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (7, '206', 'Путевая машина', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (8, '207', 'Вагон пассажирский', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (9, '208', 'Вагон багажный', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (10, '209', 'Вагон изотермический', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (11, '210', 'Цистерна', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (12, '211', 'Полувагон', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (13, '212', 'Платформа', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (14, '298', 'Прочий вагон', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (15, '301', 'Легковой автомобиль общего назначения', NULL, '2 Легковой автомобиль общего назначения – легковой автомобиль без специального оборудования.; 1 Легковой автомобиль – пассажирский автомобиль с числом мест для сидения не более 9, включая место водителя');
INSERT INTO internatioanltransporttypesclassifier VALUES (16, '302', 'Специальный легковой автомобиль', NULL, '1 Легковой автомобиль – пассажирский автомобиль с числом мест для сидения не более 9, включая место водителя; 3 Специальный легковой автомобиль – легковой автомобиль со специальным оборудованием. К специальному оборудованию относятся, например, таксометр, мобильная радиостанция, дополнительная световая и звуковая сигнализация и т. д. К специальным легковым автомобилям относятся, например, автомобиль скорой помощи, автомобиль для инкассации денежной выручки и перевозки ценных грузов, такси.');
INSERT INTO internatioanltransporttypesclassifier VALUES (17, '303', 'Грузовой автомобиль общего назначения', NULL, '5 Грузовой автомобиль общего назначения – грузовой автомобиль с бортовой платформой, не оборудованный средствами самопогрузки-саморазгрузки или другим специальным оборудованием.; 4 Грузовой автомобиль – автомобиль, конструкция и оборудование которого предназначены для перевозки грузов');
INSERT INTO internatioanltransporttypesclassifier VALUES (18, '304', 'Специальный грузовой автомобиль', NULL, '4 Грузовой автомобиль – автомобиль, конструкция и оборудование которого предназначены для перевозки грузов; 6 Специальный грузовой автомобиль – грузовой автомобиль, оборудованный средствами самопогрузки-саморазгрузки или другим специальным оборудованием и (или) предназначенный для перевозки грузов конкретных категорий.');
INSERT INTO internatioanltransporttypesclassifier VALUES (19, '305', 'Грузопассажирский автомобиль', NULL, '4 Грузовой автомобиль – автомобиль, конструкция и оборудование которого предназначены для перевозки грузов; 7 Грузопассажирский автомобиль – автомобиль, конструкция и оборудование которого предназначены для перевозки пассажиров и грузов.');
INSERT INTO internatioanltransporttypesclassifier VALUES (20, '306', 'Автомобиль-тягач', NULL, '8 Автомобиль-тягач – автомобиль, конструкция и оборудование которого предназначены исключительно для буксирования дорожных транспортных средств, за исключением полуприцепов.');
INSERT INTO internatioanltransporttypesclassifier VALUES (21, '307', 'Седельный тягач', NULL, '9 Седельный тягач – автомобиль, конструкция и оборудование которого предназначены для буксирования полуприцепа.');
INSERT INTO internatioanltransporttypesclassifier VALUES (22, '308', 'Пассажирский прицеп, технически допустимая максимальная масса которого не более 0,75 т', NULL, '10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).; 11 Пассажирский прицеп – прицеп, конструкция и оборудование которого предназначены для перевозки пассажиров и багажа');
INSERT INTO internatioanltransporttypesclassifier VALUES (23, '320', 'Специальный полуприцеп', NULL, '15 Полуприцеп – прицеп, конструкция которого предназначена для использования с седельным тягачом, часть полной массы которого передается на седельный тягач через седельно-сцепное устройство; 18 Специальный полуприцеп – полуприцеп, конструкция и оборудование которого предназначены для выполнения специальных рабочих функций или перевозки грузов определенных категорий.');
INSERT INTO internatioanltransporttypesclassifier VALUES (35, '321', 'Автобус общего назначения', NULL, '19 Автобус – пассажирский автомобиль с числом мест для сидения более 9, включая место водителя; 20 Автобус общего назначения – автобус, предназначенный для перевозки пассажиров и используемый в качестве общественного транспорта (по маршрутам).');
INSERT INTO internatioanltransporttypesclassifier VALUES (24, '309', 'Пассажирский прицеп, технически допустимая максимальная масса которого свыше 0,75 т, но не более 3,5 т', NULL, '11 Пассажирский прицеп – прицеп, конструкция и оборудование которого предназначены для перевозки пассажиров и багажа; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).; 10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем');
INSERT INTO internatioanltransporttypesclassifier VALUES (25, '310', 'Пассажирский прицеп, технически допустимая максимальная масса которого свыше 3,5 т, но не более 10 т', NULL, '11 Пассажирский прицеп – прицеп, конструкция и оборудование которого предназначены для перевозки пассажиров и багажа; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).; 10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем');
INSERT INTO internatioanltransporttypesclassifier VALUES (26, '311', 'Пассажирский прицеп, технически допустимая максимальная масса которого более 10 т', NULL, '11 Пассажирский прицеп – прицеп, конструкция и оборудование которого предназначены для перевозки пассажиров и багажа; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).; 10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем');
INSERT INTO internatioanltransporttypesclassifier VALUES (27, '312', 'Грузовой прицеп общего назначения', NULL, '10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем; 12 Грузовой прицеп общего назначения – прицеп с бортовой платформой открытого или закрытого типа, не оборудованный средствами самопогрузки-саморазгрузки или другим специальным оборудованием.');
INSERT INTO internatioanltransporttypesclassifier VALUES (28, '313', 'Специальный прицеп', NULL, '13 Специальный прицеп – прицеп, конструкция и оборудование которого предназначены для выполнения специальных рабочих функций или перевозки грузов определенных категорий.; 10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем');
INSERT INTO internatioanltransporttypesclassifier VALUES (29, '314', 'Караван', NULL, '10 Прицеп – транспортное средство без двигателя, предназначенное для перевозки пассажиров или грузов, вертикальная нагрузка которого передается на опорную поверхность через колеса и которое приспособлено для буксирования автомобилем; 14 Караван – прицеп, предназначенный для использования в дорожных условиях во время стоянок в качестве мобильного жилого помещения.');
INSERT INTO internatioanltransporttypesclassifier VALUES (30, '315', 'Пассажирский полуприцеп, технически допустимая максимальная масса которого не более 0,75 т', NULL, '15 Полуприцеп – прицеп, конструкция которого предназначена для использования с седельным тягачом, часть полной массы которого передается на седельный тягач через седельно-сцепное устройство; 16 Пассажирский полуприцеп – полуприцеп, конструкция и оборудование которого предназначены для перевозки людей и багажа; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).');
INSERT INTO internatioanltransporttypesclassifier VALUES (31, '316', 'Пассажирский полуприцеп, технически допустимая максимальная масса которого свыше 0,75 т, но не более 3,5 т', NULL, '24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).; 16 Пассажирский полуприцеп – полуприцеп, конструкция и оборудование которого предназначены для перевозки людей и багажа; 15 Полуприцеп – прицеп, конструкция которого предназначена для использования с седельным тягачом, часть полной массы которого передается на седельный тягач через седельно-сцепное устройство');
INSERT INTO internatioanltransporttypesclassifier VALUES (32, '317', 'Пассажирский полуприцеп, технически допустимая максимальная масса которого свыше 3,5 т, но не более 10 т', NULL, '16 Пассажирский полуприцеп – полуприцеп, конструкция и оборудование которого предназначены для перевозки людей и багажа; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).; 15 Полуприцеп – прицеп, конструкция которого предназначена для использования с седельным тягачом, часть полной массы которого передается на седельный тягач через седельно-сцепное устройство');
INSERT INTO internatioanltransporttypesclassifier VALUES (33, '318', 'Пассажирский полуприцеп, технически допустимая максимальная масса которого более 10 т', NULL, '15 Полуприцеп – прицеп, конструкция которого предназначена для использования с седельным тягачом, часть полной массы которого передается на седельный тягач через седельно-сцепное устройство; 16 Пассажирский полуприцеп – полуприцеп, конструкция и оборудование которого предназначены для перевозки людей и багажа; 24 Технически допустимая максимальная масса – установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками. В случае полуприцепов и прицепов с центрально расположенной осью (осями) под технически допустимой максимальной массой принимается статическая вертикальная нагрузка, передаваемая на грунт осью или осями максимально загруженного сцепленного с тягачом полуприцепа и прицепа с центрально расположенной осью (осями).');
INSERT INTO internatioanltransporttypesclassifier VALUES (34, '319', 'Грузовой полуприцеп общего назначения', NULL, '15 Полуприцеп – прицеп, конструкция которого предназначена для использования с седельным тягачом, часть полной массы которого передается на седельный тягач через седельно-сцепное устройство; 17 Грузовой полуприцеп общего назначения – полуприцеп с бортовой платформой закрытого или открытого типа, не оборудованный средствами самопогрузки-саморазгрузки или другим специальным оборудованием');
INSERT INTO internatioanltransporttypesclassifier VALUES (36, '322', 'Специальный автобус', NULL, '21 Специальный автобус – автобус со специальным оборудованием, предназначенный в основном для перевозки пассажиров определенных категорий или профессий. К таким автобусам относятся, например, автобус для перевозки инвалидов, катафалк.; 19 Автобус – пассажирский автомобиль с числом мест для сидения более 9, включая место водителя');
INSERT INTO internatioanltransporttypesclassifier VALUES (37, '323', 'Сочлененный автобус', NULL, '22 Сочлененный автобус – автобус, состоящий из 2 или более жестких шарнирно соединенных между собой секций так, что обеспечивается перемещение пассажиров из одной секции в другую.; 19 Автобус – пассажирский автомобиль с числом мест для сидения более 9, включая место водителя');
INSERT INTO internatioanltransporttypesclassifier VALUES (38, '324', 'Микроавтобус', NULL, '19 Автобус – пассажирский автомобиль с числом мест для сидения более 9, включая место водителя; 23 Микроавтобус – одноэтажный автобус с числом мест для сидения не более 17, включая место водителя.');
INSERT INTO internatioanltransporttypesclassifier VALUES (39, '400', 'Воздушное судно', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (40, '901', 'Контейнер', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (41, '999', 'Прочее транспортное средство', NULL, NULL);


--
-- TOC entry 4585 (class 0 OID 18999)
-- Dependencies: 279
-- Data for Name: issuersellerclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO issuersellerclassifier VALUES (1, '1', 'выполняет операции по изготовлению и реализации контрольных (идентификационных) знаков');
INSERT INTO issuersellerclassifier VALUES (2, '2', 'выполняет операции по реализации изготовленных контрольных (идентификационных) знаков');
INSERT INTO issuersellerclassifier VALUES (3, '3', 'выполняет операции по изготовлению контрольных (идентификационных) знаков');


--
-- TOC entry 4587 (class 0 OID 19007)
-- Dependencies: 281
-- Data for Name: kindidclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindidclassifier VALUES (1, '01', 'БИН');
INSERT INTO kindidclassifier VALUES (2, '02', 'ГРЮЛ');
INSERT INTO kindidclassifier VALUES (3, '03', 'ОГРН');
INSERT INTO kindidclassifier VALUES (4, '04', 'ОГРНИП');
INSERT INTO kindidclassifier VALUES (5, '05', 'ОКОГУ');
INSERT INTO kindidclassifier VALUES (6, '06', 'ОКПО');
INSERT INTO kindidclassifier VALUES (7, '07', 'ОКЮЛП');


--
-- TOC entry 4589 (class 0 OID 19015)
-- Dependencies: 283
-- Data for Name: kindofdocumentsforcustomsdeclarationchapters; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (1, '1', 'Документы, подтверждающие соблюдение запретов и ограничений');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (2, '2', 'Транспортные (перевозочные) документы');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (3, '3', 'Документы, подтверждающие совершение внешнеэкономической сделки или иные документы, подтверждающие право владения, пользования и (или) распоряжения товарами');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (4, '4', 'Коммерческие документы');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (5, '5', 'Документы на основании которых был заявлен классификационный код товара по ТН ВЭД ЕАЭС');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (6, '7', 'Документы, подтверждающие обеспечение уплаты таможенных платежей, право на льготы по уплате таможенных платежей, на применение полного или частичного освобождения от уплаты таможенных пошлин, налогов в соответствии с таможенными процедурами, либо на уменьшение базы (налоговой базы) для исчисления таможенных пошлин, налогов, либо на изменение срока уплаты таможенных пошлин, налогов, а также документы, подтверждающие применение централизованного порядка уплаты таможенных пошлин, налогов.');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (7, '8', 'Документы, предоставляемые в соответствии с условиями таможенных процедур');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (8, '9', 'Дополнительные документы, предоставляемые при таможенном декларировании товаров');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (9, '10', 'Сведения, заявляемые при таможенном декларировании ');


--
-- TOC entry 4591 (class 0 OID 19023)
-- Dependencies: 285
-- Data for Name: kindofdocumentsforcustomsdeclarationclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (1, '01011', '1', 'Лицензия на экспорт и (или) импорт товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (2, '01017', '1', 'Разрешение на экспорт и (или) импорт товаров, в отношении которых введено автоматическое лицензирование (наблюдение)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (3, '01021', '1', 'Заключение (разрешительный документ) на ввоз и (или) вывоз гражданского и служебного оружия, его основных (составных) частей и патронов к нему', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (4, '01031', '1', 'Разрешение (сертификат, удостоверение), предусмотренное Конвенцией о международной торговле видами дикой фауны и флоры, находящимися под угрозой исчезновения, от 3 марта 1973 года', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (5, '01041', '1', 'Заключение (разрешительный документ) на ввоз радиоэлектронных средств и высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (6, '01061', '1', 'Заключение (разрешительный документ) на ввоз средств защиты растений (пестицидов)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (7, '01071', '1', 'Заключение уполномоченного органа государств – членов Евразийского экономического союза на ввоз (вывоз) ядовитых веществ, не являющихся прекурсорами наркотических средств и психотропных веществ и являющихся стандартными образцами', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (8, '01072', '1', 'Заключение уполномоченного органа государств – членов Евразийского экономического союза на транзит ядовитых веществ, не являющихся прекурсорами наркотических средств и психотропных веществ через таможенную территорию Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (9, '01081', '1', 'Заключение (разрешительный документ) на ввоз лекарственных средств', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (10, '01091', '1', 'Заключение (разрешительный документ) на ввоз и (или) вывоз шифровальных (криптографических) средств', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (11, '01095', '1', 'Заключение (разрешительный документ) на ввоз и (или) вывоз специальных технических средств, предназначенных для негласного получения информации', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (12, '01101', '1', 'Заключение (разрешительный документ) на вывоз культурных ценностей, документов национальных архивных фондов и оригиналов архивных документов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (13, '01111', '1', 'Заключение (разрешительный документ) на вывоз коллекционных материалов по минералогии, палеонтологии, костей ископаемых животных', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (14, '01121', '1', 'Заключение (разрешительный документ) на вывоз диких живых животных, отдельных дикорастущих растений и дикорастущего лекарственного сырья', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (15, '01125', '1', 'Заключение (разрешительный документ) на вывоз редких и находящихся под угрозой исчезновения видов диких живых животных и дикорастущих растений, включенных в красные книги государств – членов Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (16, '01131', '1', 'Заключение (разрешительный документ) на ввоз и (или) вывоз органов и тканей человека, крови и ее компонентов, образцов биологических материалов человека', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (17, '01133', '1', 'Разрешение на реэкспорт товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (18, '01143', '1', '"Акт государственного контроля на ввоз и (или) вывоз: – драгоценных камней, – драгоценных металлов и сырьевых товаров, содержащих драгоценные металлы"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (19, '01151', '1', 'Лицензия, перечень (приложение) к лицензии на ввоз (вывоз) товаров, подлежащих экспортному контролю, выданные уполномоченным государственным органом государств-членов Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (20, '01152', '1', 'Разрешение на транзит товаров, подлежащих экспортному контролю, выданное уполномоченным государственным органом государств-членов Евразийского экономического союза в области экспортного контроля', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (21, '01153', '1', 'Разрешение (подтверждение) на ввоз (вывоз) товаров, подлежащих экспортному контролю, выданное уполномоченным государственным органом государств-членов Евразийского экономического союза в области экспортного контроля', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (22, '01154', '1', 'Заключение (идентификационное), выдаваемое в соответствии с законодательством в области экспортного контроля государств-членов Евразийского экономического союза, о непринадлежности товаров к товарам, включенным в единые списки контролируемых товаров и технологий', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (23, '01161', '1', 'Лицензия, перечень (приложение) к лицензии на ввоз (вывоз) продукции военного назначения, выданные уполномоченным государственным органом государств-членов Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (24, '01162', '1', 'Разрешение на транзит продукции военного назначения, выданное уполномоченным государственным органом государств-членов Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (25, '01163', '1', 'Заключение (идентификационное) уполномоченного государственного органа государств-членов Евразийского экономического союза о непринадлежности товаров к продукции военного назначения', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (26, '01171', '1', 'Воинский пропуск', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (27, '01181', '1', 'Перечень продукции, ввозимой (вывозимой) в рамках Межправительственных Соглашений о производственной и научно-технической кооперации предприятий оборонных отраслей промышленности', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (28, '01191', '1', 'Документ об оценке соответствия, предусмотренный техническими регламентами Евразийского экономического союза (техническими регламентами Таможенного союза), либо сертификат соответствия или декларация о соответствии, оформленные по единой форме, на продукцию (товары), включенную в единый перечень продукции, подлежащей обязательному подтверждению соответствия с выдачей сертификатов соответствия и деклараций о соответствии по единой форме, либо документ об оценке соответствия продукции (товара), предусмотренный законодательством государства – члена Евразийского экономического союза, на территории которого продукция (товар) помещается под таможенные процедуры', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (29, '01194', '1', 'Справка уполномоченного органа, подтверждающая принадлежность продукции к лекарственным средствам, товарам медицинского и ветеринарного назначения при условии их размещения на аптечных складах получателя, осуществляющего приемку, хранение, а после прохождения процедуры подтверждения соответствия – отпуск и реализацию лекарственных средств, товаров медицинского и ветеринарного назначения, и гарантию заявителя о его ответственности (для Кыргызской Республики)', 'KG', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (30, '01201', '1', 'Ветеринарный сертификат', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (31, '01202', '1', 'Разрешение на ввоз подконтрольных товаров, исходя из эпизоотического состояния стран-экспортеров, выданное должностным лицом уполномоченного органа государства - члена Евразийского экономического союза в области ветеринарии', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (32, '01203', '1', 'Разрешение на вывоз подконтрольных товаров, выданное должностным лицом уполномоченного органа государства – члена Евразийского экономического союза в области ветеринарии', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (33, '01204', '1', 'Разрешение на транзит подконтрольных товаров, исходя из эпизоотического состояния стран-экспортеров, выданное должностным лицом уполномоченного органа государства – члена Евразийского экономического союза в области ветеринарии', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (34, '01205', '1', 'Санитарно-эпидемиологическое заключение уполномоченного государственного органа государств-членов Таможенного союза (для Республики Казахстан и Российской Федерации)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (35, '01206', '1', 'Свидетельство о государственной регистрации, выданное уполномоченным органом государства – члена Евразийского экономического союза в области санитарно-эпидемиологического благополучия населения', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (36, '01207', '1', 'Фитосанитарный сертификат', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (37, '01209', '1', 'Разрешение на ввоз карантинных объектов (карантинных вредных организмов) в научно-исследовательских целях, выданное уполномоченным государственным органом государств-членов Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (38, '01210', '1', 'Документы, подтверждающие соблюдение запретов и ограничений (временных мер), введенных в Республике Армения в одностороннем порядке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (39, '01211', '1', 'Документы, подтверждающие соблюдение запретов и ограничений (временных мер), введённых в Республике Беларусь в одностороннем порядке', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (40, '01221', '1', 'Документы, подтверждающие соблюдение запретов и ограничений (временных мер), введённых в Республике Казахстан в одностороннем порядке', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (41, '01225', '1', 'Документы, подтверждающие соблюдение запретов и ограничений (временных мер), введенных в Кыргызской Республике в одностороннем порядке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (42, '01231', '1', 'Документы, подтверждающие соблюдение запретов и ограничений (временных мер), введённых в Российской Федерации в одностороннем порядке', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (43, '01241', '1', 'Сертификат (сведения о сертификате) международной схемы сертификации необработанных природных алмазов (сертификат Кимберлийского процесса)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (44, '01242', '1', 'Документы, подтверждающие сведения о производителе товаров, для целей контроля за применением специальных защитных, антидемпинговых и компенсационных мер', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (45, '01243', '1', 'Экспортный сертификат на сельскохозяйственную продукцию', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (46, '01251', '1', 'Лицензия на виды деятельности в отношении отдельных категорий товаров (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (47, '01261', '1', 'Документ (квитанция) на получение акцизных марок (учетно-контрольных знаков, знаков) (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (48, '01271', '1', 'Документ, в соответствии с которым подакцизные товары, подлежащие маркировке акцизными марками (учетно-контрольными знаками, знаками), не маркируются (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (49, '01281', '1', 'Подтверждение о фиксации продукции в единой государственной автоматизированной информационной системе учета объема производства и оборота этилового спирта, алкогольной и спиртосодержащей продукции (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (50, '01291', '1', 'Разрешение, выданное уполномоченным государственным органом государств-членов Евразийского экономического союза в отношении взрывчатых веществ промышленного назначения, источников ионизирующего излучения (для Республики Беларусь)', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (51, '01301', '1', 'Разрешение, выданное уполномоченным государственным органом государств-членов Евразийского экономического союза в отношении условно патогенных и патогенных генно-инженерных организмов (для Республики Беларусь)', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (52, '01311', '1', 'Заключение (разрешительный документ) на вывоз минерального сырья', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (53, '01321', '1', 'Заключение (разрешительный документ) на ввоз и (или) вывоз опасных отходов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (54, '01332', '1', 'Разрешение компетентного органа государства-экспортера на вывоз конкретной партии наркотических средств, психотропных веществ и их прекурсоров либо официальное уведомление этого органа о том, что указанное разрешение не требуется', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (55, '01341', '1', 'Заключение (разрешительный документ) на ввоз и (или) вывоз озоноразрушающих веществ и продукции, содержащей озоноразрушающие вещества', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (56, '01999', '1', 'Иные документы, подтверждающие соблюдение запретов и ограничений', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (57, '02011', '2', 'Коносамент', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (58, '02012', '2', 'Транспортная накладная при перевозке товаров водным транспортом', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (59, '02013', '2', 'Железнодорожная накладная', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (60, '02024', '2', 'Книжка МДП', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (61, '02025', '2', 'Карнет АТА', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (62, '02022', '2', 'Багажная квитанция', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (63, '02014', '2', 'Иные документы, предусмотренные правилами перевозки по железной дороге', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (64, '02015', '2', 'Транспортная накладная, предусмотренная Конвенцией о договоре международной дорожной перевозки грузов 1956 года', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (65, '02016', '2', 'Иная транспортная накладная, используемая при перевозке товаров автодорожным транспортом', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (66, '02017', '2', 'Авианакладная', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (67, '02018', '2', 'Транспортные документы, используемые при перемещении товаров трубопроводным транспортом или по линиям электропередачи', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (68, '02019', '2', 'Почтовая накладная', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (69, '02020', '2', 'Общая накладная при экспресс-доставке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (70, '02021', '2', 'Индивидуальная накладная при экспресс-доставке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (71, '02026', '2', 'Упаковочный лист', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (72, '02099', '2', 'Иные транспортные (перевозочные) документы', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (73, '03011', '3', 'Договор (контракт), заключенный при совершении внешнеэкономической сделки', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (74, '03012', '3', 'Документы, вносящие изменения и (или) дополнения к документу, сведения о котором указаны под кодом 03011', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (75, '03013', '3', 'Документ, подтверждающий совершение односторонней внешнеэкономической сделки', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (76, '03014', '3', 'Документы, подтверждающие право владения, пользования и (или) распоряжения товарами при отсутствии какой-либо сделки', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (77, '03021', '3', 'Документы, подтверждающие передачу прав на объекты интеллектуальной собственности (авторский, лицензионный договор, свидетельство о регистрации объекта интеллектуальной собственности, договор на использование товарного знака и тому подобные документы)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (78, '03022', '3', 'Документы, подтверждающие введение в гражданский оборот на таможенной территории Евразийского экономического союза товаров, обозначенных товарным знаком, с согласия правообладателя (дилерский, дистрибьютерский договор, письменное согласие и тому подобные документы)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (79, '08036', '8', 'Договор об оказании услуг по складированию (хранению), погрузке (разгрузке) товаров и иным грузовым операциям, связанным с хранением и подготовкой товаров к транспортировке, заключенный между владельцем декларируемого товара и резидентом портовой или логистической свободной (специальной, особой) экономической зоны', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (80, '08999', '8', 'Иные документы об обязательствах, предоставление которых предусмотрено в соответствии с условиями таможенных процедур', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (81, '09001', '9', 'Международный весовой сертификат транспортного средства, выдаваемый в соответствии с Международной конвенцией о согласовании условий проведения контроля грузов на границах, принятой в г. Женеве 21 октября 1982 года, или международный сертификат взвешивания грузовых транспортных средств, выдаваемый в соответствии с Соглашением о введении международного сертификата взвешивания грузовых транспортных средств на территориях государств-участников Содружества Независимых Государств, принятым в г. Чолпон-Ате 16 апреля 2004 года', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (82, '09002', '9', 'Разрешение на проезд автомобильного транспортного средства иностранного государства по территории государства – члена Евразийского экономического союза, выданное уполномоченным органом государства – члена Евразийского экономического союза, по территории которого будет осуществляться проезд', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (83, '09003', '9', 'Разрешение на проезд транспортного средства, максимальные весовые и (или) габаритные размеры которого превышают допустимые параметры, установленные для проезда по автомобильным дорогам общего пользования (специальное разрешение), выданное уполномоченным органом государства – члена Евразийского экономического союза, по территории которого будет осуществляться проезд', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (84, '09004', '9', 'Многостороннее разрешение на проезд автомобильного транспортного средства иностранного государства по территории государства – члена Евразийского экономического союза, выданное в рамках системы разрешений Европейской конференции министров транспорта', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (85, '09005', '9', 'Разрешение (специальное разрешение) на проезд автомобильного транспортного средства иностранного государства по территории государства – члена Евразийского экономического союза с территории или на территорию государства, не являющегося членом Евразийского экономического союза и не являющегося государством, в котором зарегистрировано это транспортное средство, выданное уполномоченным органом государства – члена Евразийского экономического союза, по территории которого будет осуществляться проезд', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (86, '09006', '9', 'Разрешение (специальное разрешение) на проезд автомобильного транспортного средства иностранного государства с опасным грузом по территории государства – члена Евразийского экономического союза, выданное уполномоченным органом государства – члена Евразийского экономического союза, по территории которого будет осуществляться проезд', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (87, '09011', '9', 'Документ, свидетельствующий о включении лица в Реестр уполномоченных экономических операторов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (88, '09013', '9', 'Транзитная декларация', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (89, '09015', '9', 'Таможенные документы иностранных государств, используемые для таможенных целей в соответствии с международными договорами в рамках Евразийского экономического союза и международными договорами Евразийского экономического союза с третьей стороной', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (90, '09016', '9', 'Документ, подтверждающий приобретение акцизных (специальных) марок для маркировки подакцизных (маркируемых) товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (91, '09017', '9', 'Источники ценовой информации, используемые для расчета скорректированной таможенной стоимости товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (92, '09018', '9', 'Декларация таможенной стоимости', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (93, '09019', '9', 'Регистрационный номер уведомления о размещении товаров в зоне таможенного контроля', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (94, '09020', '9', 'Графические материалы: фотографии товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (95, '09021', '9', 'Графические материалы: схемы, чертежи, рисунки товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (96, '09022', '9', 'Графические материалы: технические и технологические документы, каталоги', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (97, '09023', '9', 'Иные графические материалы', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (98, '09024', '9', 'Свидетельство о допущении транспортного средства международной перевозки к перевозке товаров под таможенными пломбами и печатями', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (99, '09025', '9', 'Сведения о завершении процедуры таможенного транзита', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (100, '09026', '9', 'Сведения о размещении товаров на временное хранение', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (131, '05012', '5', 'Решение таможенного органа по классификации товара в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввозимого или вывозимого в течение установленного периода времени', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (101, '03031', '3', '"Документ, подтверждающий соблюдение требований в области валютного контроля: - регистрационный номер сделки (для Республики Беларусь), - учетный номер контракта (регистрационный номер, предназначенный для обеспечения учета и отчетности по валютным операциям, присваиваемый уполномоченным банком валютному договору, предусматривающему экспорт/импорт) либо номер паспорта сделки (для Республики Казахстан), - номер паспорта сделки по внешнеторговому договору (контракту) (для Российской Федерации)"', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (102, '03998', '3', 'Документ (контракт) на недропользование (для Республики Казахстан)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (103, '03999', '3', 'Иные документы, подтверждающие право владения, пользования и (или) распоряжения товарами', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (104, '04011', '4', 'Учредительные документы', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (105, '04021', '4', 'Счет-фактура (инвойс) к договору', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (106, '04022', '4', 'Иные расчетные или коммерческие документы (в том числе кассовый или товарный чек на приобретение товаров в розничной сети)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (107, '04023', '4', 'Банковские документы (если счет-фактура оплачен в зависимости от условий внешнеторгового контракта), а также другие платежные документы, отражающие стоимость товара', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (108, '4025', '4', 'Счет-проформа к договору', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (109, '04031', '4', 'Счет-фактура (инвойс) за перевозку (транспортировку), погрузку, разгрузку или перегрузку товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (110, '04032', '4', 'Банковские или иные платежные документы по оплате транспортных расходов, отражающие стоимость перевозки (транспортировки), погрузку, разгрузку или перегрузку товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (111, '04033', '4', 'Договор по перевозке, погрузке, разгрузке или перегрузке товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (112, '04041', '4', 'Счета-фактуры (инвойсы) за оказание посреднических услуг', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (113, '04042', '4', 'Банковские или иные платежные документы за оказание посреднических услуг', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (114, '04043', '4', 'Договор об оказании посреднических услуг', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (115, '04051', '4', 'Документы о стоимости товаров и услуг, предоставленных покупателем бесплатно или по сниженным ценам для использования в связи с производством и продажей', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (116, '04061', '4', 'Счет-фактура (инвойс), содержащие сведения о платежах за использование объектов интеллектуальной собственности', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (117, '04062', '4', 'Банковские платежные документы, бухгалтерские и другие документы, содержащие сведения о платежах за использование объектов интеллектуальной собственности', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (118, '04071', '4', 'Документы (в том числе бухгалтерские) и сведения, содержащие данные о части дохода (выручки), которая прямо или косвенно причитается продавцу в результате последующей продажи, распоряжения иным способом или использования товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (119, '04081', '4', 'Счет-фактура (инвойс), содержащие сведения о стоимости упаковочных материалов и/или работ по упаковке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (120, '04082', '4', 'Банковские или иные платежные документы о стоимости упаковочных материалов и/или работ по упаковке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (121, '04083', '4', 'Договор о стоимости тары, упаковки, упаковочных материалов и работ по упаковке', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (122, '04091', '4', 'Бухгалтерская документация производителя оцениваемых товаров, содержащая сведения о расходах по изготовлению или приобретению материалов, о расходах на производство, а также на иные операции, связанные с производством ввозимых (ввезенных) товаров, коммерческие счета производителя оцениваемых товаров, составленные в соответствии с общепринятыми принципами бухгалтерского учета', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (123, '04101', '4', 'Счет – фактура (инвойс) на стоимость проектирования, разработки, инженерной, конструкторской работы, дизайна, художественного оформления, чертежей и эскизов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (124, '04102', '4', 'Банковские или иные платежные документы о стоимости проектирования, разработки, инженерной, конструкторской работы, дизайна, художественного оформления, чертежей и эскизов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (125, '04111', '4', 'Счет – фактура (инвойс) по оказанию страховых услуг', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (126, '04112', '4', 'Банковские или иные платежные документы о стоимости страховых услуг', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (127, '04113', '4', 'Страховой полис', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (128, '04115', '4', 'Договор страхования', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (129, '04121', '4', 'Котировки мировых бирж', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (130, '04999', '4', 'Иные документы и сведения, которые декларант может представить в подтверждение заявленной таможенной стоимости', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (132, '05013', '5', 'Предварительное решение по классификации товара по ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (133, '05014', '5', 'Решение таможенного органа об изменении предварительного решения по классификации товара и/или решения по классификации товара в несобранном или разобранном виде, в том числе некомплектном или незавершенном виде, ввозимого или вывозимого в течение установленного периода времени', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (134, '05019', '5', 'Подтверждение уполномоченного в области транспорта органа исполнительной власти государства – члена Евразийского экономического союза целевого назначения ввозимого товара в соответствии с примечанием 3 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (135, '10020', '10', 'Последний день срока полного условного освобождения от уплаты таможенных пошлин, налогов товаров, помещенных (помещаемых) под таможенную процедуру временного ввоза (допуска)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (136, '05020', '5', 'Подтверждение уполномоченного органа исполнительной власти, осуществляющего функции по выработке государственной политики и нормативно-правовому регулированию в сфере здравоохранения, государства – члена Евразийского экономического союза целевого назначения ввозимого товара в соответствии с примечанием 4 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (137, '05022', '5', 'Подтверждение уполномоченного органа исполнительной власти, осуществляющего функции по выработке государственной политики и нормативно-правовому регулированию в сфере промышленности, государства – члена Евразийского экономического союза целевого назначения ввозимого товара в соответствии с примечанием 5 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (138, '05023', '5', 'Документы уполномоченного органа исполнительной власти государства – члена Евразийского экономического союза, необходимые для подтверждения классификационного кода товара в соответствии с примечаниями к ТН ВЭД ЕАЭС, за исключением документов, указанных в позициях с кодами 05019, 05020, 05022, 05024 – 05028', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (139, '05024', '5', 'Подтверждение уполномоченного органа исполнительной власти, осуществляющего функции по контролю и надзору в сфере ветеринарии, карантина и защиты растений, государства – члена Евразийского экономического союза целевого назначения ввозимого товара в соответствии с примечанием 6 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (140, '05025', '5', 'Подтверждение уполномоченного органа исполнительной власти, осуществляющего функции по выработке и реализации государственной политики и нормативно-правовому регулированию в сфере топливно-энергетического комплекса государства – члена Евразийского экономического союза, совместно с уполномоченным органом исполнительной власти, осуществляющим функции по оказанию государственных услуг и управлению государственным имуществом в сфере недропользования государства – члена Евразийского экономического союза, факта добычи нефти сырой в соответствии с примечаниями 8 и 10 к ТН ВЭД ЕАЭС, факта выработки стабильного газового конденсата в соответствии с примечанием 9 к ТН ВЭД ЕАЭС, выписка из государственного баланса запасов полезных ископаемых в соответствии с примечанием 10 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (141, '05026', '5', 'Подтверждение органа исполнительной власти, уполномоченного правительством государства – члена Евразийского экономического союза, того, что ввозимый товар относится к высококачественной говядине в соответствии с примечанием 12 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (142, '05027', '5', 'Подтверждение уполномоченного органа исполнительной власти, осуществляющего функции по выработке и реализации государственной политики и нормативно-правовому регулированию в сфере обороны государства – члена Евразийского экономического союза, целевого назначения ввозимого товара в соответствии с примечанием 14 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (143, '05028', '5', 'Подтверждение уполномоченного органа исполнительной власти, осуществляющего функции по обеспечению реализации государственной политики и нормативно-правовому регулированию в сфере космической деятельности, государства – члена Евразийского экономического союза, целевого назначения ввозимого товара в соответствии с примечанием 13 к ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (144, '05031', '5', 'Уведомление о планируемых поставках (разрешение на декларирование) товара в несобранном или разобранном виде, в том числе некомплектном или незавершенном виде, поставка компонентов которого осуществляется (предполагается) различными товарными партиями в течение определенного периода времени, с указанием единого кода по ТН ВЭД ЕАЭС', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (145, '05996', '5', 'Соглашение, заключенное Министерством экономического развития Российской Федерации и российским юридическим лицом, о ввозе товаров, предназначенных для промышленной сборки моторных транспортных средств товарных позиций 8701 – 8705 ТН ВЭД ЕАЭС, их узлов и агрегатов (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (146, '05997', '5', 'Дополнительное соглашение к соглашению, заключенному Министерством экономического развития Российской Федерации и российским юридическим лицом, о ввозе товаров, предназначенных для промышленной сборки моторных транспортных средств товарных позиций 8701 – 8705 ТН ВЭД ЕАЭС, их узлов и агрегатов (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (147, '05998', '5', 'Протокол о внесении изменений в соглашение, заключенное Министерством экономического развития Российской Федерации и российским юридическим лицом, о ввозе товаров, предназначенных для промышленной сборки моторных транспортных средств товарных позиций 8701 – 8705 ТН ВЭД ЕАЭС, их узлов и агрегатов (для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (148, '05999', '5', 'Иные документы, сведения, необходимые для целей классификации товара', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (149, '06011', '6', 'Сертификат о происхождении товаров формы СТ-1', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (150, '06013', '6', 'Декларация-сертификат о происхождении товара по форме «А»', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (151, '06014', '6', 'Непреференциальный сертификат о происхождении товара общей формы', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (152, '06015', '6', 'Предварительное решение о стране происхождения товара', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (153, '06016', '6', 'Декларация о происхождении товара', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (154, '06017', '6', 'Сертификат о происхождении товара формы СТ-2', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (155, '06018', '6', 'Сертификат о происхождении товара формы EAV', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (156, '06999', '6', 'Иные документы, подтверждающие происхождение товара', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (157, '07011', '7', 'Документы, которыми установлены право на льготы по уплате таможенных платежей или иные основания для их неуплаты, либо полное или частичное освобождение от уплаты таможенных пошлин, налогов в соответствии с таможенными процедурами, либо уменьшение базы (налоговой базы) для исчисления таможенных пошлин, налогов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (158, '07012', '7', 'Документы, подтверждающие соблюдение условий для применения льгот по уплате таможенных платежей или иных оснований для их неуплаты, либо полного или частичного освобождения от уплаты таможенных пошлин, налогов в соответствии с таможенными процедурами, либо на уменьшение базы (налоговой базы) для исчисления таможенных пошлин, налогов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (159, '07013', '7', 'Соглашение о применении централизованного порядка уплаты таможенных пошлин, налогов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (160, '07021', '7', 'Решение таможенного органа о предоставлении отсрочки или рассрочки уплаты таможенных пошлин', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (161, '07022', '7', 'Решение об изменении срока уплаты налогов, взимаемых при ввозе товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (162, '07031', '7', 'Документ, подтверждающий внесение денежных средств (денег) в качестве обеспечения уплаты таможенных платежей', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (163, '07032', '7', 'Банковская гарантия', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (164, '07033', '7', 'Договор поручительства', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (165, '07034', '7', 'Договор залога имущества', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (166, '07035', '7', 'Документ, подтверждающий внесение обеспечения уплаты таможенных пошлин, налогов иным способом, установленным законодательством государств-членов Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (167, '08011', '8', 'Документ об условиях переработки на таможенной территории', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (168, '08012', '8', 'Документ об условиях переработки вне таможенной территории', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (169, '08013', '8', 'Документ об условиях переработки для внутреннего потребления', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (170, '10021', '10', 'Иные сведения, заявляемые при таможенном декларировании, если это предусмотрено таможенным законодательством Республики Беларусь', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (171, '10022', '10', 'Иные сведения, заявляемые при таможенном декларировании, если это предусмотрено таможенным законодательством Республики Казахстан', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (172, '10023', '10', 'Иные сведения, заявляемые при таможенном декларировании, если это предусмотрено таможенным законодательством Российской Федерации', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (190, '09028', '9', 'Акт ветеринарно-санитарного досмотра, оформленный должностным лицом государственного органа государства – члена Евразийского экономического союза, осуществляющим ветеринарно-санитарный контроль', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (173, '10024', '10', 'Постановление Правительства Российской Федерации от 05.05.2011 № 339 «О предоставлении из федерального бюджета субсидий на возмещение затрат по уплате ввозной таможенной пошлины и налога на добавленную стоимость, понесенных юридическими лицами, индивидуальными предпринимателями, являющимися лицами, участвующими в реализации проекта создания и обеспечения функционирования территориально обособленного комплекса (инновационного центра «Сколково»)» (только для Российской Федерации)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (174, '10041', '10', 'Заявленный срок уничтожения товаров, помещенных под таможенную процедуру уничтожения', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (175, '10042', '10', 'Заявленный срок хранения товаров на таможенном складе', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (176, '10043', '10', 'Сведения о государственной регистрации специализированной пищевой продукции или государственной регистрации пищевой продукции нового вида в соответствии с техническим регламентом Таможенного союза «О безопасности пищевой продукции» (ТР ТС 021/2011), утвержденным Решением Комиссии Таможенного союза от 9 декабря 2011 г. № 880', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (177, '10044', '10', 'Сведения о регистрационном номере декларации на товары, поданной в соответствии со статьей 193 Таможенного кодекса Таможенного союза, заявляемые в установленных случаях в таможенных документах, за исключением декларации на товары', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (178, '10050', '10', 'Сведения о включении радиоэлектронных средств и (или) высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров, в единый реестр радиоэлектронных средств и высокочастотных устройств гражданского назначения, в том числе встроенных либо входящих в состав других товаров, при ввозе которых на таможенную территорию Евразийского экономического союза не требуется представление лицензии или заключения (разрешительного документа)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (179, '10051', '10', 'Сведения о включении лекарственных средств в единый реестр зарегистрированных лекарственных средств Евразийского экономического союза, предусмотренный статьей 14 Соглашения о единых принципах и правилах обращения лекарственных средств в рамках Евразийского экономического союза от 23 декабря 2014 года, или в соответствующий государственный реестр лекарственных средств государства – члена Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (180, '10052', '10', 'Сведения о включении соответствующей нотификации в единый реестр нотификаций о характеристиках шифровальных (криптографических) средств и товаров, их содержащих', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (181, '10999', '10', 'Иные сведения, подлежащие указанию в таможенной декларации', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (182, '08014', '8', 'Заявление о вывозе товаров, помещенных под таможенную процедуру свободной таможенной зоны в Магаданской области Российской Федерации, предназначенных для собственных производственных и технологических нужд, на остальную часть территории Магаданской области', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (183, '08021', '8', 'Заключение уполномоченного государственного органа государств-членов Евразийского экономического союза о возможности, способе и месте уничтожения товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (184, '08031', '8', 'Заключение о признании товара, изготовленного (полученного) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны или таможенную процедуру свободного склада, товаром Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (185, '08032', '8', 'Заключение о признании товара, изготовленного (полученного) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны или таможенную процедуру свободного склада, не являющимся товаром Евразийского экономического союза', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (186, '08033', '8', 'Документ, свидетельствующий о включении лица в Реестр владельцев свободных складов', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (187, '08034', '8', 'Документ, удостоверяющий регистрацию лица в качестве резидента (участника) свободной (специальной, особой) экономической зоны', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (188, '08035', '8', 'Соглашение об осуществлении (ведении) деятельности на территории свободной (специальной, особой) экономической зоны (договор об условиях деятельности в свободной (специальной, особой) экономической зоне, инвестиционная декларация)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (189, '09027', '9', 'Акт возврата транспортного средства и товара, оформленный должностными лицами государственных органов государства – члена Евразийского экономического союза, осуществляющими контроль в автомобильном пункте пропуска (для Республики Казахстан)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (191, '09029', '9', 'Акт карантинного фитосанитарного контроля (надзора), оформленный должностным лицом государственного органа государства – члена Евразийского экономического союза, осуществляющим карантинный фитосанитарный контроль (надзор)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (192, '09030', '9', 'Акт санитарно-карантинного осмотра (досмотра), оформленный должностным лицом государственного органа государства – члена Евразийского экономического союза, осуществляющим санитарно-карантинный контроль (для Республики Казахстан)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (193, '09031', '9', 'Декларация на товары в отношении ранее ввезенных товаров, идентичных декларируемым товарам, заявленная таможенная стоимость которых принята таможенным органом по результатам дополнительной проверки', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (194, '09032', '9', 'Декларация о сделках с древесиной (для Российской Федерации)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (195, '09033', '9', 'Решение о внесении изменений (дополнений) в декларацию на товары (решение таможенного органа о внесении изменений и (или) дополнений в сведения, указанные в декларации на товары, по форме, утвержденной Евразийской экономической комиссией, решение таможенного органа о взыскании таможенных платежей, процентов, пеней, акт таможенной проверки) (для Республики Беларусь)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (196, '09041', '9', 'Список ввозимых без маркировки товаров, предусмотренный порядком согласования таможенным органом ввоза без маркировки товаров, подлежащих маркировке, аккредитованными в Республике Армения дипломатическими представительствами и консульскими учреждениями, а также приравненными к ним международными организациями, установленным постановлением Правительства Республики Армения от 13 июля 2017 г. N 822-н', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (197, '09999', '9', 'Иные документы, представляемые при таможенном декларировании товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (198, '10011', '10', '"Дата окончания заявленного срока временного ввоза товаров и признак продолжительности действия заявленной таможенной процедуры временного ввоза (допуска) (цифра ""1"", если срок временного ввоза составляет менее одного года, или цифра ""2"", если срок временного ввоза составляет один год и более)"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (199, '10012', '10', '"Дата окончания заявленного срока временного вывоза товаров и признак продолжительности действия заявленной таможенной процедуры временного вывоза (цифра ""1"", если срок временного вывоза составляет менее одного года, или цифра ""2"", если срок временного вывоза составляет один год и более)"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (200, '10013', '10', 'Заявленный срок переработки товаров, если декларация на товары используется в качестве документа об условиях переработки товаров', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (201, '10014', '10', 'Стоимость операций переработки товаров, помещенных под таможенную процедуру переработки товаров вне таможенной территории, в валюте государства-члена Евразийского экономического союза на территории которого декларируются продукты переработки этих товаров для их помещения под таможенную процедуру выпуска для внутреннего потребления', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (202, '10015', '10', 'Заявленный срок переработки на таможенной территории, вне таможенной территории или для внутреннего потребления, если такая переработка осуществляется на основании документа об условиях переработки', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (203, '10017', '10', '"Признак фактической продолжительности действия таможенной процедуры временного ввоза (допуска) (цифра ""1"", если срок временного ввоза составляет менее одного года, или цифра ""2"", если срок временного ввоза составляет один год и более)"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (204, '10018', '10', '"Признак фактической продолжительности действия таможенной процедуры временного вывоза (цифра ""1"", если срок временного вывоза составляет менее одного года, или цифра ""2"", если срок временного вывоза составляет один год и более)"', '', NULL);


--
-- TOC entry 4593 (class 0 OID 19031)
-- Dependencies: 287
-- Data for Name: kindoftransportandtransportationgoodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (1, '99', 'Прочие');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (2, '90', 'Транспортное средство, перемещающееся в качестве товара своим ходом');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (3, '80', 'Внутренний водный транспорт');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (4, '71', 'Трубопроводный транспорт');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (5, '50', 'Почтовое отправление');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (6, '72', 'Линии электропередачи');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (7, '40', 'Воздушный транспорт');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (8, '30', 'Автодорожный транспорт, за исключением транспортных средств, указанных под кодами 31, 32');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (9, '20', 'Железнодорожный транспорт');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (10, '31', 'Состав транспортных средств (тягач с полуприцепом или прицепом)');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (11, '10', 'Морской/речной транспорт');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (12, '32', 'Состав транспортных средств (тягач с прицепом(-ами) и полуприцепом(-ами)');


--
-- TOC entry 4595 (class 0 OID 19039)
-- Dependencies: 289
-- Data for Name: languagecodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO languagecodeclassifier VALUES (1, 'aa', 'Афарский');
INSERT INTO languagecodeclassifier VALUES (2, 'ab', 'Абхазский');
INSERT INTO languagecodeclassifier VALUES (3, 'ae', 'Авестийский');
INSERT INTO languagecodeclassifier VALUES (4, 'af', 'Африкаанс');
INSERT INTO languagecodeclassifier VALUES (5, 'ak', 'Акан');
INSERT INTO languagecodeclassifier VALUES (6, 'am', 'Амхарский');
INSERT INTO languagecodeclassifier VALUES (7, 'ar', 'Арабский');
INSERT INTO languagecodeclassifier VALUES (8, 'as', 'Ассамский');
INSERT INTO languagecodeclassifier VALUES (9, 'av', 'Аварский');
INSERT INTO languagecodeclassifier VALUES (10, 'ay', 'Аймара');
INSERT INTO languagecodeclassifier VALUES (11, 'az', 'Азербайджанский');
INSERT INTO languagecodeclassifier VALUES (12, 'ba', 'Башкирский');
INSERT INTO languagecodeclassifier VALUES (13, 'be', 'Белорусский');
INSERT INTO languagecodeclassifier VALUES (14, 'bg', 'Болгарский');
INSERT INTO languagecodeclassifier VALUES (15, 'bi', 'Бислама');
INSERT INTO languagecodeclassifier VALUES (16, 'bm', 'Бамбара');
INSERT INTO languagecodeclassifier VALUES (17, 'bn', 'Бенгальский');
INSERT INTO languagecodeclassifier VALUES (18, 'bo', 'Тибетский');
INSERT INTO languagecodeclassifier VALUES (19, 'br', 'Бретонский');
INSERT INTO languagecodeclassifier VALUES (20, 'bs', 'Боснийский');
INSERT INTO languagecodeclassifier VALUES (21, 'ca', 'Каталанский');
INSERT INTO languagecodeclassifier VALUES (22, 'ce', 'Чеченский');
INSERT INTO languagecodeclassifier VALUES (23, 'ch', 'Чаморро');
INSERT INTO languagecodeclassifier VALUES (24, 'co', 'Корсиканский');
INSERT INTO languagecodeclassifier VALUES (25, 'cs', 'Чешский');
INSERT INTO languagecodeclassifier VALUES (26, 'cu', 'Церковнославянский (Старославянский)');
INSERT INTO languagecodeclassifier VALUES (27, 'cv', 'Чувашский');
INSERT INTO languagecodeclassifier VALUES (28, 'cy', 'Валлийский');
INSERT INTO languagecodeclassifier VALUES (29, 'da', 'Датский');
INSERT INTO languagecodeclassifier VALUES (30, 'de', 'Немецкий');
INSERT INTO languagecodeclassifier VALUES (31, 'dv', 'Дивехи (Мальдивский)');
INSERT INTO languagecodeclassifier VALUES (32, 'dz', 'Дзонг-кэ');
INSERT INTO languagecodeclassifier VALUES (33, 'ee', 'Эве');
INSERT INTO languagecodeclassifier VALUES (34, 'el', 'Греческий (новогреческий)');
INSERT INTO languagecodeclassifier VALUES (35, 'en', 'Английский');
INSERT INTO languagecodeclassifier VALUES (36, 'eo', 'Эсперанто');
INSERT INTO languagecodeclassifier VALUES (37, 'es', 'Испанский');
INSERT INTO languagecodeclassifier VALUES (38, 'et', 'Эстонский');
INSERT INTO languagecodeclassifier VALUES (39, 'eu', 'Баскский');
INSERT INTO languagecodeclassifier VALUES (40, 'fa', 'Персидский');
INSERT INTO languagecodeclassifier VALUES (41, 'ff', 'Фулах');
INSERT INTO languagecodeclassifier VALUES (42, 'fi', 'Финский (Suomi)');
INSERT INTO languagecodeclassifier VALUES (43, 'fj', 'Фиджи');
INSERT INTO languagecodeclassifier VALUES (44, 'fo', 'Фарерский');
INSERT INTO languagecodeclassifier VALUES (45, 'fr', 'Французский');
INSERT INTO languagecodeclassifier VALUES (46, 'fy', 'Фризский');
INSERT INTO languagecodeclassifier VALUES (47, 'ga', 'Ирландский');
INSERT INTO languagecodeclassifier VALUES (48, 'gd', 'Гэльский');
INSERT INTO languagecodeclassifier VALUES (49, 'gl', 'Галисийский');
INSERT INTO languagecodeclassifier VALUES (50, 'gn', 'Гуарани');
INSERT INTO languagecodeclassifier VALUES (51, 'gu', 'Гуджарати');
INSERT INTO languagecodeclassifier VALUES (52, 'gv', 'Мэнский (Мэнкский)');
INSERT INTO languagecodeclassifier VALUES (53, 'ha', 'Хауса');
INSERT INTO languagecodeclassifier VALUES (54, 'he', 'Иврит');
INSERT INTO languagecodeclassifier VALUES (55, 'hi', 'Хинди');
INSERT INTO languagecodeclassifier VALUES (56, 'ho', 'Хиримоту');
INSERT INTO languagecodeclassifier VALUES (57, 'hr', 'Хорватский');
INSERT INTO languagecodeclassifier VALUES (58, 'hu', 'Венгерский');
INSERT INTO languagecodeclassifier VALUES (59, 'hy', 'Армянский');
INSERT INTO languagecodeclassifier VALUES (60, 'hz', 'Гереро');
INSERT INTO languagecodeclassifier VALUES (61, 'ia', 'Интерлингва');
INSERT INTO languagecodeclassifier VALUES (62, 'id', 'Индонезийский');
INSERT INTO languagecodeclassifier VALUES (63, 'ie', 'Интерлингве');
INSERT INTO languagecodeclassifier VALUES (64, 'ig', 'Игбо');
INSERT INTO languagecodeclassifier VALUES (65, 'ik', 'Инупиак');
INSERT INTO languagecodeclassifier VALUES (66, 'is', 'Исландский');
INSERT INTO languagecodeclassifier VALUES (67, 'it', 'Итальянский');
INSERT INTO languagecodeclassifier VALUES (68, 'iu', 'Инуктитут');
INSERT INTO languagecodeclassifier VALUES (69, 'ja', 'Японский');
INSERT INTO languagecodeclassifier VALUES (70, 'jv', 'Яванский');
INSERT INTO languagecodeclassifier VALUES (71, 'ka', 'Грузинский');
INSERT INTO languagecodeclassifier VALUES (72, 'kg', 'Конго');
INSERT INTO languagecodeclassifier VALUES (73, 'ki', 'Кикуйю');
INSERT INTO languagecodeclassifier VALUES (74, 'kj', 'Киньяма');
INSERT INTO languagecodeclassifier VALUES (75, 'kk', 'Казахский');
INSERT INTO languagecodeclassifier VALUES (76, 'kl', 'Гренландский');
INSERT INTO languagecodeclassifier VALUES (77, 'km', 'Кхмерский');
INSERT INTO languagecodeclassifier VALUES (78, 'kn', 'Каннада');
INSERT INTO languagecodeclassifier VALUES (79, 'ko', 'Корейский');
INSERT INTO languagecodeclassifier VALUES (80, 'kr', 'Канури');
INSERT INTO languagecodeclassifier VALUES (81, 'ks', 'Кашмири');
INSERT INTO languagecodeclassifier VALUES (82, 'ku', 'Курдский');
INSERT INTO languagecodeclassifier VALUES (83, 'kv', 'Коми');
INSERT INTO languagecodeclassifier VALUES (84, 'kw', 'Корнский');
INSERT INTO languagecodeclassifier VALUES (85, 'ky', 'Киргизский');
INSERT INTO languagecodeclassifier VALUES (86, 'la', 'Латинский');
INSERT INTO languagecodeclassifier VALUES (87, 'lb', 'Люксембургский');
INSERT INTO languagecodeclassifier VALUES (88, 'lg', 'Ганда');
INSERT INTO languagecodeclassifier VALUES (89, 'ln', 'Лингала');
INSERT INTO languagecodeclassifier VALUES (90, 'lo', 'Лаосский');
INSERT INTO languagecodeclassifier VALUES (91, 'lt', 'Литовский');
INSERT INTO languagecodeclassifier VALUES (92, 'lu', 'Луба-катанга');
INSERT INTO languagecodeclassifier VALUES (93, 'lv', 'Латышский');
INSERT INTO languagecodeclassifier VALUES (94, 'mg', 'Малагасийский');
INSERT INTO languagecodeclassifier VALUES (95, 'mh', 'Маршалльский');
INSERT INTO languagecodeclassifier VALUES (96, 'mi', 'Маори');
INSERT INTO languagecodeclassifier VALUES (97, 'mk', 'Македонский');
INSERT INTO languagecodeclassifier VALUES (98, 'ml', 'Малаялам');
INSERT INTO languagecodeclassifier VALUES (99, 'mn', 'Монгольский');
INSERT INTO languagecodeclassifier VALUES (100, 'mr', 'Маратхи');
INSERT INTO languagecodeclassifier VALUES (101, 'ms', 'Малайский');
INSERT INTO languagecodeclassifier VALUES (102, 'mt', 'Мальтийский');
INSERT INTO languagecodeclassifier VALUES (103, 'my', 'Бирманский');
INSERT INTO languagecodeclassifier VALUES (104, 'na', 'Науру');
INSERT INTO languagecodeclassifier VALUES (105, 'nd', 'Ндебеле северный');
INSERT INTO languagecodeclassifier VALUES (106, 'ne', 'Непальский');
INSERT INTO languagecodeclassifier VALUES (107, 'ng', 'Ндунга');
INSERT INTO languagecodeclassifier VALUES (108, 'nl', 'Нидерландский (Голландский)');
INSERT INTO languagecodeclassifier VALUES (109, 'nn', 'Нюнорск (новонорвежский)');
INSERT INTO languagecodeclassifier VALUES (110, 'no', 'Норвежский');
INSERT INTO languagecodeclassifier VALUES (111, 'nr', 'Ндебеле южный');
INSERT INTO languagecodeclassifier VALUES (112, 'nv', 'Навахо');
INSERT INTO languagecodeclassifier VALUES (113, 'ny', 'Ньянджа');
INSERT INTO languagecodeclassifier VALUES (114, 'oc', 'Окситанский');
INSERT INTO languagecodeclassifier VALUES (115, 'oj', 'Оджибве');
INSERT INTO languagecodeclassifier VALUES (116, 'om', 'Оромо');
INSERT INTO languagecodeclassifier VALUES (117, 'or', 'Ория');
INSERT INTO languagecodeclassifier VALUES (118, 'os', 'Осетинский');
INSERT INTO languagecodeclassifier VALUES (119, 'pa', 'Пенджабский');
INSERT INTO languagecodeclassifier VALUES (120, 'pi', 'Пали');
INSERT INTO languagecodeclassifier VALUES (121, 'pl', 'Польский');
INSERT INTO languagecodeclassifier VALUES (122, 'ps', 'Пушту');
INSERT INTO languagecodeclassifier VALUES (123, 'pt', 'Португальский');
INSERT INTO languagecodeclassifier VALUES (124, 'qu', 'Кечуа');
INSERT INTO languagecodeclassifier VALUES (125, 'rm', 'Ретороманский');
INSERT INTO languagecodeclassifier VALUES (126, 'rn', 'Рунди');
INSERT INTO languagecodeclassifier VALUES (127, 'ro', 'Румынский');
INSERT INTO languagecodeclassifier VALUES (128, 'ru', 'Русский');
INSERT INTO languagecodeclassifier VALUES (129, 'rw', 'Руанда');
INSERT INTO languagecodeclassifier VALUES (130, 'sa', 'Санскрит');
INSERT INTO languagecodeclassifier VALUES (131, 'sc', 'Сардинский');
INSERT INTO languagecodeclassifier VALUES (132, 'sd', 'Синдхи');
INSERT INTO languagecodeclassifier VALUES (133, 'sg', 'Санго');
INSERT INTO languagecodeclassifier VALUES (134, 'si', 'Сингальский');
INSERT INTO languagecodeclassifier VALUES (135, 'sk', 'Словацкий');
INSERT INTO languagecodeclassifier VALUES (136, 'sl', 'Словенский');
INSERT INTO languagecodeclassifier VALUES (137, 'sm', 'Самоанский');
INSERT INTO languagecodeclassifier VALUES (138, 'sn', 'Шона');
INSERT INTO languagecodeclassifier VALUES (139, 'so', 'Сомали');
INSERT INTO languagecodeclassifier VALUES (140, 'sq', 'Албанский');
INSERT INTO languagecodeclassifier VALUES (141, 'sr', 'Сербский');
INSERT INTO languagecodeclassifier VALUES (142, 'ss', 'Свази');
INSERT INTO languagecodeclassifier VALUES (143, 'st', 'Сото южный');
INSERT INTO languagecodeclassifier VALUES (144, 'su', 'Сунданский');
INSERT INTO languagecodeclassifier VALUES (145, 'sv', 'Шведский');
INSERT INTO languagecodeclassifier VALUES (146, 'sw', 'Суахили');
INSERT INTO languagecodeclassifier VALUES (147, 'ta', 'Тамильский');
INSERT INTO languagecodeclassifier VALUES (148, 'te', 'Телугу');
INSERT INTO languagecodeclassifier VALUES (149, 'tg', 'Таджикский');
INSERT INTO languagecodeclassifier VALUES (150, 'th', 'Тайский');
INSERT INTO languagecodeclassifier VALUES (151, 'ti', 'Тигринья');
INSERT INTO languagecodeclassifier VALUES (152, 'tk', 'Туркменский');
INSERT INTO languagecodeclassifier VALUES (153, 'tl', 'Тагальский');
INSERT INTO languagecodeclassifier VALUES (154, 'tn', 'Тсвана');
INSERT INTO languagecodeclassifier VALUES (155, 'to', 'Тонганский');
INSERT INTO languagecodeclassifier VALUES (156, 'tr', 'Турецкий');
INSERT INTO languagecodeclassifier VALUES (157, 'ts', 'Тсонга');
INSERT INTO languagecodeclassifier VALUES (158, 'tt', 'Татарский');
INSERT INTO languagecodeclassifier VALUES (159, 'tw', 'Тви');
INSERT INTO languagecodeclassifier VALUES (160, 'ty', 'Таитянский');
INSERT INTO languagecodeclassifier VALUES (161, 'ug', 'Уйгурский');
INSERT INTO languagecodeclassifier VALUES (162, 'uk', 'Украинский');
INSERT INTO languagecodeclassifier VALUES (163, 'ur', 'Урду');
INSERT INTO languagecodeclassifier VALUES (164, 'uz', 'Узбекский');
INSERT INTO languagecodeclassifier VALUES (165, 've', 'Венда');
INSERT INTO languagecodeclassifier VALUES (166, 'vi', 'Вьетнамский');
INSERT INTO languagecodeclassifier VALUES (167, 'vo', 'Волапюк');
INSERT INTO languagecodeclassifier VALUES (168, 'wo', 'Волоф');
INSERT INTO languagecodeclassifier VALUES (169, 'xh', 'Коса');
INSERT INTO languagecodeclassifier VALUES (170, 'yi', 'Идиш');
INSERT INTO languagecodeclassifier VALUES (171, 'yo', 'Йоруба');
INSERT INTO languagecodeclassifier VALUES (172, 'za', 'Чжуанский');
INSERT INTO languagecodeclassifier VALUES (173, 'zh', 'Китайский');
INSERT INTO languagecodeclassifier VALUES (174, 'zu', 'Зулу');


--
-- TOC entry 4597 (class 0 OID 19047)
-- Dependencies: 291
-- Data for Name: measurementunitclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO measurementunitclassifier VALUES (1, '166', 'КИЛОГРАММ', 'КГ', '');
INSERT INTO measurementunitclassifier VALUES (2, '797', 'СТО ШТУК', '100 ШТ', '');
INSERT INTO measurementunitclassifier VALUES (3, '246', '1000 КИЛОВАТТ-ЧАС', '1000 КВТ*Ч', '');
INSERT INTO measurementunitclassifier VALUES (4, '130', '1000 ЛИТРОВ', '1000 Л', '');
INSERT INTO measurementunitclassifier VALUES (5, '114', '1000 КУБИЧЕСКИХ МЕТРОВ', '1000 М3', '');
INSERT INTO measurementunitclassifier VALUES (6, '798', 'ТЫСЯЧА ШТУК', '1000 ШТ', '');
INSERT INTO measurementunitclassifier VALUES (7, '163', 'ГРАММ', 'Г', '');
INSERT INTO measurementunitclassifier VALUES (8, '306', 'ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ', 'Г Д/И', '');
INSERT INTO measurementunitclassifier VALUES (9, '162', 'МЕТРИЧЕСКИЙ КАРАТ(1КАРАТ=2*10(-4)КГ', 'КАР', '');
INSERT INTO measurementunitclassifier VALUES (10, '845', 'КИЛОГРАММ СУХОГО НА 90 % ВЕЩЕСТВА', 'КГ 90% С/В', '');
INSERT INTO measurementunitclassifier VALUES (11, '841', 'КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА', 'КГ H2O2', '');
INSERT INTO measurementunitclassifier VALUES (12, '852', 'КИЛОГРАММ ОКСИДА КАЛИЯ', 'КГ K2O', '');
INSERT INTO measurementunitclassifier VALUES (13, '859', 'КИЛОГРАММ ГИДРОКСИДА КАЛИЯ', 'КГ KOH', '');
INSERT INTO measurementunitclassifier VALUES (14, '861', 'КИЛОГРАММ АЗОТА', 'КГ N', '');
INSERT INTO measurementunitclassifier VALUES (15, '863', 'КИЛОГРАММ ГИДРОКСИДА НАТРИЯ', 'КГ NAOH', '');
INSERT INTO measurementunitclassifier VALUES (16, '865', 'КИЛОГРАММ ПЯТИОКИСИ ФОСФОРА', 'КГ P2O5', '');
INSERT INTO measurementunitclassifier VALUES (17, '867', 'КИЛОГРАММ УРАНА', 'КГ U', '');
INSERT INTO measurementunitclassifier VALUES (18, '305', 'КЮРИ', 'КИ', '');
INSERT INTO measurementunitclassifier VALUES (19, '112', 'ЛИТР', 'Л', '');
INSERT INTO measurementunitclassifier VALUES (20, '831', 'ЛИТР ЧИСТОГО (100%) СПИРТА', 'Л 100% СПИРТА', '');
INSERT INTO measurementunitclassifier VALUES (21, '6', 'МЕТР', 'М', '');
INSERT INTO measurementunitclassifier VALUES (22, '55', 'КВАДРАТНЫЙ МЕТР', 'М2', '');
INSERT INTO measurementunitclassifier VALUES (23, '113', 'КУБИЧЕСКИЙ МЕТР', 'М3', '');
INSERT INTO measurementunitclassifier VALUES (24, '715', 'ПАРА', 'ПАР', '');
INSERT INTO measurementunitclassifier VALUES (25, '185', 'ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ', 'Т ГРП', '');
INSERT INTO measurementunitclassifier VALUES (26, '796', 'ШТУКА', 'ШТ', '');


--
-- TOC entry 4599 (class 0 OID 19055)
-- Dependencies: 293
-- Data for Name: measurementunitcodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO measurementunitcodeclassifier VALUES (1, '111', 'СМ3');
INSERT INTO measurementunitcodeclassifier VALUES (2, '4', 'СМ');
INSERT INTO measurementunitcodeclassifier VALUES (3, '112a', 'ДМ3');
INSERT INTO measurementunitcodeclassifier VALUES (4, '5', 'ДМ');
INSERT INTO measurementunitcodeclassifier VALUES (5, '163', 'Г');
INSERT INTO measurementunitcodeclassifier VALUES (6, '166', 'КГ');
INSERT INTO measurementunitcodeclassifier VALUES (7, '8', 'КМ');
INSERT INTO measurementunitcodeclassifier VALUES (8, '112', 'Л');
INSERT INTO measurementunitcodeclassifier VALUES (9, '161', 'МГ');
INSERT INTO measurementunitcodeclassifier VALUES (10, '111a', 'МЛ');
INSERT INTO measurementunitcodeclassifier VALUES (11, '110', 'ММ3');
INSERT INTO measurementunitcodeclassifier VALUES (12, '3', 'ММ');
INSERT INTO measurementunitcodeclassifier VALUES (13, '113', 'М3');
INSERT INTO measurementunitcodeclassifier VALUES (14, '6', 'М');
INSERT INTO measurementunitcodeclassifier VALUES (15, '796', 'ШТ');


--
-- TOC entry 4601 (class 0 OID 19063)
-- Dependencies: 295
-- Data for Name: measuresensurecompliancecustomstransitprocedure; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (1, '00', 'Без применения меры обеспечения соблюдения таможенного транзита, за исключением случаев, указанных в позициях с кодами 07, 08, 60 – 63', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (2, '01', 'Обеспечение уплаты таможенных пошлин, налогов денежными средствами (деньгами)', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (3, '02', 'Обеспечение уплаты таможенных пошлин, налогов банковской гарантией', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (4, '03', 'Обеспечение уплаты таможенных пошлин, налогов поручительством', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (5, '04', 'Обеспечение уплаты таможенных пошлин, налогов залогом имущества', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (6, '05', 'Таможенное сопровождение должностными лицами таможенных органов', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (7, '06', 'Таможенное сопровождение иными организациями', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (8, '07', 'Перевозка товаров при таможенном декларировании уполномоченным экономическим оператором', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (9, '08', 'Перевозка товаров при таможенном декларировании таможенным перевозчиком', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (10, '09', 'Установление маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (11, '60', 'Перевозка товаров, предназначенных для официального использования дипломатическими представительствами и консульскими учреждениями иностранных государств, а также приравненными к ним по объему привилегий органами и (или) миссиями международных организаций', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (12, '61', 'Перевозка товаров, предназначенных для личного пользования, включая товары для первоначального обзаведения, членов персонала дипломатического представительства, работников консульского учреждения иностранного государства или персонала приравненных к ним по объему привилегий органов и (или) миссий международных организаций, а также проживающих вместе с ними членов их семей, если они не проживают в государстве пребывания постоянно и не являются гражданами государства пребывания', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (13, '62', 'Перевозка товаров, предназначенных для использования в культурных, научно-исследовательских целях, проведения спортивных соревнований либо подготовки к ним, ликвидации последствий стихийных бедствий, аварий, катастроф, обеспечения обороноспособности и государственной (национальной) безопасности государств – членов Евразийского экономического союза, переоснащения их вооруженных сил, защиты государственных границ государств – членов Евразийского экономического союза, использования государственными органами государств – членов Евразийского экономического союза', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (14, '63', 'Без применения меры обеспечения соблюдения таможенного транзита, если сумма подлежащих уплате таможенных пошлин, налогов и процентов не превышает сумму, эквивалентную 500 (пятистам) евро по курсу валют, действующему на день регистрации транзитной декларации', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (15, '91', 'Обеспечение уплаты таможенных пошлин, налогов денежными средствами (деньгами) с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (16, '92', 'Обеспечение уплаты таможенных пошлин, налогов банковской гарантией с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (17, '93', 'Обеспечение уплаты таможенных пошлин, налогов поручительством с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (18, '94', 'Обеспечение уплаты таможенных пошлин, налогов залогом имущества с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (19, '95', 'Таможенное сопровождение должностными лицами таможенных органов с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (20, '96', 'Таможенное сопровождение иными организациями с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (21, '97', 'Перевозка товаров при таможенном декларировании уполномоченным экономическим оператором с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (22, '98', 'Перевозка товаров при таможенном декларировании таможенным перевозчиком с установлением маршрута перевозки', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (23, 'ХХ*', 'Иные способы обеспечения уплаты таможенных пошлин, налогов', '');


--
-- TOC entry 4603 (class 0 OID 19071)
-- Dependencies: 297
-- Data for Name: nsicountry; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO nsicountry VALUES (1, 'AD', 'Андорра');
INSERT INTO nsicountry VALUES (2, 'AF', 'Афганистан');
INSERT INTO nsicountry VALUES (3, 'AG', 'Антигуа и Барбуда');
INSERT INTO nsicountry VALUES (4, 'AI', 'Ангилья');
INSERT INTO nsicountry VALUES (5, 'AL', 'Албания');
INSERT INTO nsicountry VALUES (6, 'AM', 'Армения');
INSERT INTO nsicountry VALUES (7, 'AN', 'Нидерландские Антильские острова');
INSERT INTO nsicountry VALUES (8, 'AO', 'Ангола');
INSERT INTO nsicountry VALUES (9, 'AQ', 'Антарктида');
INSERT INTO nsicountry VALUES (10, 'AR', 'Аргентина');
INSERT INTO nsicountry VALUES (11, 'AS', 'Американское Самоа');
INSERT INTO nsicountry VALUES (12, 'AT', 'Австрия');
INSERT INTO nsicountry VALUES (13, 'AU', 'Австралия');
INSERT INTO nsicountry VALUES (14, 'AW', 'Аруба');
INSERT INTO nsicountry VALUES (15, 'AX', 'Эландские острова');
INSERT INTO nsicountry VALUES (16, 'AZ', 'Азербайджан');
INSERT INTO nsicountry VALUES (17, 'BA', 'Босния и Герцеговина');
INSERT INTO nsicountry VALUES (18, 'BB', 'Барбадос');
INSERT INTO nsicountry VALUES (19, 'BD', 'Бангладеш');
INSERT INTO nsicountry VALUES (20, 'BE', 'Бельгия');
INSERT INTO nsicountry VALUES (21, 'BF', 'Буркина-Фасо');
INSERT INTO nsicountry VALUES (22, 'BG', 'Болгария');
INSERT INTO nsicountry VALUES (23, 'BH', 'Бахрейн');
INSERT INTO nsicountry VALUES (24, 'BI', 'Бурунди');
INSERT INTO nsicountry VALUES (25, 'BJ', 'Бенин');
INSERT INTO nsicountry VALUES (26, 'BL', 'Сен-Бартелеми');
INSERT INTO nsicountry VALUES (27, 'BM', 'Бермуды');
INSERT INTO nsicountry VALUES (28, 'BN', 'Бруней-Даруссалам');
INSERT INTO nsicountry VALUES (29, 'BO', 'Боливия, Многонациональное Государство');
INSERT INTO nsicountry VALUES (30, 'BQ', 'Бонэйр, Синт-Эстатиус и Саба');
INSERT INTO nsicountry VALUES (31, 'BR', 'Бразилия');
INSERT INTO nsicountry VALUES (32, 'BS', 'Багамы');
INSERT INTO nsicountry VALUES (33, 'BT', 'Бутан');
INSERT INTO nsicountry VALUES (34, 'BV', 'Остров Буве');
INSERT INTO nsicountry VALUES (35, 'BW', 'Ботсвана');
INSERT INTO nsicountry VALUES (36, 'BY', 'Беларусь');
INSERT INTO nsicountry VALUES (37, 'BZ', 'Белиз');
INSERT INTO nsicountry VALUES (38, 'CA', 'Канада');
INSERT INTO nsicountry VALUES (39, 'CC', 'Кокосовые (Килинг) острова');
INSERT INTO nsicountry VALUES (40, 'CD', 'Конго, Демократическая Республика');
INSERT INTO nsicountry VALUES (41, 'CF', 'Центрально-Африканская Республика');
INSERT INTO nsicountry VALUES (42, 'CG', 'Конго');
INSERT INTO nsicountry VALUES (43, 'CK', 'Острова Кука');
INSERT INTO nsicountry VALUES (44, 'CL', 'Чили');
INSERT INTO nsicountry VALUES (45, 'CM', 'Камерун');
INSERT INTO nsicountry VALUES (46, 'CN', 'Китай');
INSERT INTO nsicountry VALUES (47, 'CO', 'Колумбия');
INSERT INTO nsicountry VALUES (48, 'CR', 'Коста-Рика');
INSERT INTO nsicountry VALUES (49, 'CS', 'Сербия и Черногория');
INSERT INTO nsicountry VALUES (50, 'CU', 'Куба');
INSERT INTO nsicountry VALUES (51, 'CV', 'Кабо-Верде');
INSERT INTO nsicountry VALUES (52, 'CW', 'Кюрасао');
INSERT INTO nsicountry VALUES (53, 'CX', 'Остров Рождества');
INSERT INTO nsicountry VALUES (54, 'CY', 'Кипр');
INSERT INTO nsicountry VALUES (55, 'CZ', 'Чешская Республика');
INSERT INTO nsicountry VALUES (56, 'DE', 'Германия');
INSERT INTO nsicountry VALUES (57, 'DJ', 'Джибути');
INSERT INTO nsicountry VALUES (58, 'DK', 'Дания');
INSERT INTO nsicountry VALUES (59, 'DM', 'Доминика');
INSERT INTO nsicountry VALUES (60, 'DO', 'Доминиканская Республика');
INSERT INTO nsicountry VALUES (61, 'DZ', 'Алжир');
INSERT INTO nsicountry VALUES (62, 'EC', 'Эквадор');
INSERT INTO nsicountry VALUES (63, 'EE', 'Эстония');
INSERT INTO nsicountry VALUES (64, 'EG', 'Египет');
INSERT INTO nsicountry VALUES (65, 'ER', 'Эритрея');
INSERT INTO nsicountry VALUES (66, 'ET', 'Эфиопия');
INSERT INTO nsicountry VALUES (67, 'FI', 'Финляндия');
INSERT INTO nsicountry VALUES (68, 'FJ', 'Фиджи');
INSERT INTO nsicountry VALUES (69, 'FK', 'Фолклендские острова (Мальвинские)');
INSERT INTO nsicountry VALUES (70, 'FM', 'Микронезия, Федеративные Штаты');
INSERT INTO nsicountry VALUES (71, 'FO', 'Фарерские острова');
INSERT INTO nsicountry VALUES (72, 'FR', 'Франция');
INSERT INTO nsicountry VALUES (73, 'GA', 'Габон');
INSERT INTO nsicountry VALUES (74, 'GD', 'Гренада');
INSERT INTO nsicountry VALUES (75, 'GE', 'Грузия');
INSERT INTO nsicountry VALUES (76, 'GF', 'Французская Гвиана');
INSERT INTO nsicountry VALUES (77, 'GG', 'Гернси');
INSERT INTO nsicountry VALUES (78, 'GH', 'Гана');
INSERT INTO nsicountry VALUES (79, 'GI', 'Гибралтар');
INSERT INTO nsicountry VALUES (80, 'GL', 'Гренландия');
INSERT INTO nsicountry VALUES (81, 'GM', 'Гамбия');
INSERT INTO nsicountry VALUES (82, 'GN', 'Гвинея');
INSERT INTO nsicountry VALUES (83, 'GP', 'Гваделупа');
INSERT INTO nsicountry VALUES (84, 'GQ', 'Экваториальная Гвинея');
INSERT INTO nsicountry VALUES (85, 'GR', 'Греция');
INSERT INTO nsicountry VALUES (86, 'GT', 'Гватемала');
INSERT INTO nsicountry VALUES (87, 'GU', 'Гуам');
INSERT INTO nsicountry VALUES (88, 'GW', 'Гвинея-Бисау');
INSERT INTO nsicountry VALUES (89, 'GY', 'Гайана');
INSERT INTO nsicountry VALUES (90, 'HK', 'Гонконг');
INSERT INTO nsicountry VALUES (91, 'HM', 'Остров Херд и острова Макдональд');
INSERT INTO nsicountry VALUES (92, 'HN', 'Гондурас');
INSERT INTO nsicountry VALUES (93, 'HR', 'Хорватия');
INSERT INTO nsicountry VALUES (94, 'HT', 'Гаити');
INSERT INTO nsicountry VALUES (95, 'HU', 'Венгрия');
INSERT INTO nsicountry VALUES (96, 'ID', 'Индонезия');
INSERT INTO nsicountry VALUES (97, 'IE', 'Ирландия');
INSERT INTO nsicountry VALUES (98, 'IL', 'Израиль');
INSERT INTO nsicountry VALUES (99, 'IM', 'Остров Мэн');
INSERT INTO nsicountry VALUES (100, 'IN', 'Индия');
INSERT INTO nsicountry VALUES (101, 'IO', 'Британская территория в Индийском океане');
INSERT INTO nsicountry VALUES (102, 'IQ', 'Ирак');
INSERT INTO nsicountry VALUES (103, 'IR', 'Иран, Исламская Республика');
INSERT INTO nsicountry VALUES (104, 'IS', 'Исландия');
INSERT INTO nsicountry VALUES (105, 'IT', 'Италия');
INSERT INTO nsicountry VALUES (106, 'JE', 'Джерси');
INSERT INTO nsicountry VALUES (107, 'JM', 'Ямайка');
INSERT INTO nsicountry VALUES (108, 'JO', 'Иордания');
INSERT INTO nsicountry VALUES (109, 'JP', 'Япония');
INSERT INTO nsicountry VALUES (110, 'KE', 'Кения');
INSERT INTO nsicountry VALUES (111, 'KG', 'Киргизия');
INSERT INTO nsicountry VALUES (112, 'KH', 'Камбоджа');
INSERT INTO nsicountry VALUES (113, 'KI', 'Кирибати');
INSERT INTO nsicountry VALUES (114, 'KM', 'Коморы');
INSERT INTO nsicountry VALUES (115, 'KN', 'Сент-Китс и Невис');
INSERT INTO nsicountry VALUES (116, 'KP', 'Корея, Народно-Демократич. Республика');
INSERT INTO nsicountry VALUES (117, 'KR', 'Корея, Республика');
INSERT INTO nsicountry VALUES (118, 'KW', 'Кувейт');
INSERT INTO nsicountry VALUES (119, 'KY', 'Острова Кайман');
INSERT INTO nsicountry VALUES (120, 'KZ', 'Казахстан');
INSERT INTO nsicountry VALUES (121, 'LA', 'Лаосская Народно-Демократич. Республика');
INSERT INTO nsicountry VALUES (122, 'LB', 'Ливан');
INSERT INTO nsicountry VALUES (123, 'LC', 'Сент-Люсия');
INSERT INTO nsicountry VALUES (124, 'LI', 'Лихтенштейн');
INSERT INTO nsicountry VALUES (125, 'LR', 'Либерия');
INSERT INTO nsicountry VALUES (126, 'LS', 'Лесото');
INSERT INTO nsicountry VALUES (127, 'LT', 'Литва');
INSERT INTO nsicountry VALUES (128, 'LU', 'Люксембург');
INSERT INTO nsicountry VALUES (129, 'LV', 'Латвия');
INSERT INTO nsicountry VALUES (130, 'LY', 'Ливия');
INSERT INTO nsicountry VALUES (131, 'MA', 'Марокко');
INSERT INTO nsicountry VALUES (132, 'MC', 'Монако');
INSERT INTO nsicountry VALUES (133, 'MD', 'Молдова, Республика');
INSERT INTO nsicountry VALUES (134, 'ME', 'Черногория');
INSERT INTO nsicountry VALUES (135, 'MF', 'Сен-Мартен');
INSERT INTO nsicountry VALUES (136, 'MG', 'Мадагаскар');
INSERT INTO nsicountry VALUES (137, 'MH', 'Маршалловы Острова');
INSERT INTO nsicountry VALUES (138, 'MK', 'Республика Македония');
INSERT INTO nsicountry VALUES (139, 'ML', 'Мали');
INSERT INTO nsicountry VALUES (140, 'MM', 'Мьянма');
INSERT INTO nsicountry VALUES (141, 'MN', 'Монголия');
INSERT INTO nsicountry VALUES (142, 'MO', 'Макао');
INSERT INTO nsicountry VALUES (143, 'MP', 'Северные Марианские острова');
INSERT INTO nsicountry VALUES (144, 'MQ', 'Мартиника');
INSERT INTO nsicountry VALUES (145, 'MR', 'Мавритания');
INSERT INTO nsicountry VALUES (146, 'MS', 'Монтсеррат');
INSERT INTO nsicountry VALUES (147, 'MT', 'Мальта');
INSERT INTO nsicountry VALUES (148, 'MU', 'Маврикий');
INSERT INTO nsicountry VALUES (149, 'MV', 'Мальдивы');
INSERT INTO nsicountry VALUES (150, 'MW', 'Малави');
INSERT INTO nsicountry VALUES (151, 'MX', 'Мексика');
INSERT INTO nsicountry VALUES (152, 'MY', 'Малайзия');
INSERT INTO nsicountry VALUES (153, 'MZ', 'Мозамбик');
INSERT INTO nsicountry VALUES (154, 'NA', 'Намибия');
INSERT INTO nsicountry VALUES (155, 'NC', 'Новая Каледония');
INSERT INTO nsicountry VALUES (156, 'NE', 'Нигер');
INSERT INTO nsicountry VALUES (157, 'NF', 'Остров Норфолк');
INSERT INTO nsicountry VALUES (158, 'NG', 'Нигерия');
INSERT INTO nsicountry VALUES (159, 'NI', 'Никарагуа');
INSERT INTO nsicountry VALUES (160, 'NL', 'Нидерланды');
INSERT INTO nsicountry VALUES (161, 'NO', 'Норвегия');
INSERT INTO nsicountry VALUES (162, 'NP', 'Непал');
INSERT INTO nsicountry VALUES (163, 'NR', 'Науру');
INSERT INTO nsicountry VALUES (164, 'NU', 'Ниуэ');
INSERT INTO nsicountry VALUES (165, 'NZ', 'Новая Зеландия');
INSERT INTO nsicountry VALUES (166, 'OM', 'Оман');
INSERT INTO nsicountry VALUES (167, 'PA', 'Панама');
INSERT INTO nsicountry VALUES (168, 'PE', 'Перу');
INSERT INTO nsicountry VALUES (169, 'PF', 'Французская Полинезия');
INSERT INTO nsicountry VALUES (170, 'PG', 'Папуа Новая Гвинея');
INSERT INTO nsicountry VALUES (171, 'PH', 'Филиппины');
INSERT INTO nsicountry VALUES (172, 'PK', 'Пакистан');
INSERT INTO nsicountry VALUES (173, 'PL', 'Польша');
INSERT INTO nsicountry VALUES (174, 'PM', 'Сент-Пьер и Микелон');
INSERT INTO nsicountry VALUES (175, 'PN', 'Питкэрн');
INSERT INTO nsicountry VALUES (176, 'PR', 'Пуэрто-Рико');
INSERT INTO nsicountry VALUES (177, 'PS', 'Палестина, Государство');
INSERT INTO nsicountry VALUES (178, 'PT', 'Португалия');
INSERT INTO nsicountry VALUES (179, 'PW', 'Палау');
INSERT INTO nsicountry VALUES (180, 'PY', 'Парагвай');
INSERT INTO nsicountry VALUES (181, 'QA', 'Катар');
INSERT INTO nsicountry VALUES (182, 'RE', 'Реюньон');
INSERT INTO nsicountry VALUES (183, 'RO', 'Румыния');
INSERT INTO nsicountry VALUES (184, 'RS', 'Сербия');
INSERT INTO nsicountry VALUES (185, 'RU', 'Россия');
INSERT INTO nsicountry VALUES (186, 'RW', 'Руанда');
INSERT INTO nsicountry VALUES (187, 'SA', 'Саудовская Аравия');
INSERT INTO nsicountry VALUES (188, 'SH', 'Св. Елена, о. Вознесения, Тр.-да-Кунья');
INSERT INTO nsicountry VALUES (189, 'SM', 'Сан-Марино');
INSERT INTO nsicountry VALUES (190, 'SN', 'Сенегал');
INSERT INTO nsicountry VALUES (191, 'ST', 'Сан-Томе и Принсипи');
INSERT INTO nsicountry VALUES (192, 'SU', 'СССР');
INSERT INTO nsicountry VALUES (193, 'SV', 'Эль-Сальвадор');
INSERT INTO nsicountry VALUES (194, 'TD', 'Чад');
INSERT INTO nsicountry VALUES (195, 'TF', 'Французские Южные Территории');
INSERT INTO nsicountry VALUES (196, 'VA', 'Папский Престол (Гос.-город Ватикан)');
INSERT INTO nsicountry VALUES (197, 'VC', 'Сент-Винсент и Гренадины');
INSERT INTO nsicountry VALUES (198, 'WS', 'Самоа');
INSERT INTO nsicountry VALUES (199, 'YT', 'Майотта');
INSERT INTO nsicountry VALUES (200, 'AE', 'Объединенные Арабские Эмираты');
INSERT INTO nsicountry VALUES (201, 'CH', 'Швейцария');
INSERT INTO nsicountry VALUES (202, 'EH', 'Западная Сахара');
INSERT INTO nsicountry VALUES (203, 'ES', 'Испания');
INSERT INTO nsicountry VALUES (204, 'GB', 'Соединенное Королевство');
INSERT INTO nsicountry VALUES (205, 'GS', 'Южн. Джорджия и Южн. Сандвич. острова');
INSERT INTO nsicountry VALUES (206, 'LK', 'Шри-Ланка');
INSERT INTO nsicountry VALUES (207, 'SB', 'Соломоновы Острова');
INSERT INTO nsicountry VALUES (208, 'SC', 'Сейшелы');
INSERT INTO nsicountry VALUES (209, 'SD', 'Судан');
INSERT INTO nsicountry VALUES (210, 'SE', 'Швеция');
INSERT INTO nsicountry VALUES (211, 'SG', 'Сингапур');
INSERT INTO nsicountry VALUES (212, 'SI', 'Словения');
INSERT INTO nsicountry VALUES (213, 'SJ', 'Шпицберген и Ян Майен');
INSERT INTO nsicountry VALUES (214, 'SK', 'Словакия');
INSERT INTO nsicountry VALUES (215, 'SL', 'Сьерра-Леоне');
INSERT INTO nsicountry VALUES (216, 'SO', 'Сомали');
INSERT INTO nsicountry VALUES (217, 'SR', 'Суринам');
INSERT INTO nsicountry VALUES (218, 'SS', 'Южный Судан');
INSERT INTO nsicountry VALUES (219, 'SX', 'Сен-Мартен (нидерландская часть)');
INSERT INTO nsicountry VALUES (220, 'SY', 'Сирийская Арабская Республика');
INSERT INTO nsicountry VALUES (221, 'SZ', 'Свазиленд');
INSERT INTO nsicountry VALUES (222, 'TC', 'Острова Теркс и Кайкос');
INSERT INTO nsicountry VALUES (223, 'TG', 'Того');
INSERT INTO nsicountry VALUES (224, 'TH', 'Таиланд');
INSERT INTO nsicountry VALUES (225, 'TJ', 'Таджикистан');
INSERT INTO nsicountry VALUES (226, 'TK', 'Токелау');
INSERT INTO nsicountry VALUES (227, 'TL', 'Тимор-Лесте');
INSERT INTO nsicountry VALUES (228, 'TM', 'Туркмения');
INSERT INTO nsicountry VALUES (229, 'TN', 'Тунис');
INSERT INTO nsicountry VALUES (230, 'TO', 'Тонга');
INSERT INTO nsicountry VALUES (231, 'TR', 'Турция');
INSERT INTO nsicountry VALUES (232, 'TT', 'Тринидад и Тобаго');
INSERT INTO nsicountry VALUES (233, 'TV', 'Тувалу');
INSERT INTO nsicountry VALUES (234, 'TW', 'Тайвань (Китай)');
INSERT INTO nsicountry VALUES (235, 'TZ', 'Танзания, Объединенная Республика');
INSERT INTO nsicountry VALUES (236, 'UA', 'Украина');
INSERT INTO nsicountry VALUES (237, 'UG', 'Уганда');
INSERT INTO nsicountry VALUES (238, 'UM', 'Малые тихоокеан. отдален. ост-ва С.Ш.');
INSERT INTO nsicountry VALUES (239, 'US', 'Соединенные Штаты');
INSERT INTO nsicountry VALUES (240, 'UY', 'Уругвай');
INSERT INTO nsicountry VALUES (241, 'UZ', 'Узбекистан');
INSERT INTO nsicountry VALUES (242, 'VE', 'Венесуэла, Боливарианская Республика');
INSERT INTO nsicountry VALUES (243, 'VG', 'Виргинские острова, Британские');
INSERT INTO nsicountry VALUES (244, 'VI', 'Виргинские острова, США');
INSERT INTO nsicountry VALUES (245, 'VN', 'Вьетнам');
INSERT INTO nsicountry VALUES (246, 'VU', 'Вануату');
INSERT INTO nsicountry VALUES (247, 'WF', 'Уоллис и Футуна');
INSERT INTO nsicountry VALUES (248, 'YE', 'Йемен');
INSERT INTO nsicountry VALUES (249, 'ZA', 'Южная Африка');
INSERT INTO nsicountry VALUES (250, 'ZM', 'Замбия');
INSERT INTO nsicountry VALUES (251, 'ZW', 'Зимбабве');
INSERT INTO nsicountry VALUES (252, 'CI', 'Кот д''Ивуар');


--
-- TOC entry 4605 (class 0 OID 19079)
-- Dependencies: 299
-- Data for Name: objectpassedcustomcheckpointclssifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4607 (class 0 OID 19087)
-- Dependencies: 301
-- Data for Name: pharmaprodconsignmentlimitkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4609 (class 0 OID 19095)
-- Dependencies: 303
-- Data for Name: pharmaproductregistrationdocelementkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4611 (class 0 OID 19103)
-- Dependencies: 305
-- Data for Name: registrationproductdoccodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO registrationproductdoccodeclassifier VALUES (1, '1', 'Заявление ');
INSERT INTO registrationproductdoccodeclassifier VALUES (2, '10', 'Данные о маркировке и упаковке (полноцветные макеты упаковок и этикеток, текст маркировки на русском  и языках государствчленов Союза)');
INSERT INTO registrationproductdoccodeclassifier VALUES (3, '11', 'Информация о разработке и производстве: схемы процессов производства, основных стадий производства, упаковки, испытаний и процедуры выпуска конечного продукта');
INSERT INTO registrationproductdoccodeclassifier VALUES (4, '12', 'Сведения о производителе: наименование, вид деятельности, юридический адрес, форма собственности, состав руководства, перечень подразделений и дочерних компаний с  указанием  их статуса и полномочий');
INSERT INTO registrationproductdoccodeclassifier VALUES (5, '13', 'Информация о глобальном маркетинге (история изделия на мировом рынке при условии его обращения более двух лет) актуальная подробная информация об истории продаж, о рынках ( с указанием всех стран или юрисдикций), на которых изделие одобрено к продаже, включая места, где изделие можно продавать в соответствии с правилами использования незарегистрированного изделия. Указать дату сбора данных об истории изделия на мировом рынке');
INSERT INTO registrationproductdoccodeclassifier VALUES (6, '14', 'Сообщения о несчастных случаях и отзывах: список нежелательных событий/несчастных случаев, связанных с использованием изделия, и указание периода времени, на протяжении которого все это происходило; если нежелательных событий слишком много, необходимо предоставить краткие обзоры по каждому из типов событий и указать общее количество событий каждого типа, о которых поступали отчеты; список отзывов с рынка медицинских изделий и/или пояснительных уведомлений и описание подхода к рассмотрению этих проблем и их решения производителями в каждом из таких случаев; описание анализа и/или корректирующих действий, предпринятых в ответ на перечисленные выше случаи.   ');
INSERT INTO registrationproductdoccodeclassifier VALUES (7, '15', 'Список стандартов, которым соответствует медицинское изделие. В списке должны быть указаны реквизиты   документа(ов): наименование,           номер стандарта, год/версия, степень соответствия (полное        или     частичное).           В последнем случае-указание пунктов, которые не применимы к изделию. ');
INSERT INTO registrationproductdoccodeclassifier VALUES (8, '16', 'Контрольный перечень соответствия требованиям безопасности и эффективности');
INSERT INTO registrationproductdoccodeclassifier VALUES (9, '17', 'Спецификации производителя или технические условия (при наличии), которым соответствует медицинское изделие');
INSERT INTO registrationproductdoccodeclassifier VALUES (10, '18', 'Протоколы технических испытаний, проведенных в целях доказательства соответствия Общим требованиям безопасности и эффективности медицинских изделий');
INSERT INTO registrationproductdoccodeclassifier VALUES (11, '19', 'Протоколы исследований (испытаний) по оценке биологического действия медицинского изделия, проыеденных в целях доказательства соответствия Общим требованиям безопасности и эффективности медицинских изделий (для диагоностики in vitro - данные по аналитической эффективности)');
INSERT INTO registrationproductdoccodeclassifier VALUES (12, '2', 'Доверенность от производителя на право представления интересов при регистрации (при необходимости) ');
INSERT INTO registrationproductdoccodeclassifier VALUES (13, '20', 'Данные о клинических исследованиях с аутентичным переводом на русский язык результатов и выводов испытаний ');
INSERT INTO registrationproductdoccodeclassifier VALUES (14, '21', 'Отчет по анализу рисков  ');
INSERT INTO registrationproductdoccodeclassifier VALUES (15, '22', 'Данные о лекарственных средствах в составе медицинского изделия лекарственных средствах: состав, количество, данные о совместимости лекарственного средства с медицинским изделием. Данные подтверждающие регистрацию лекарственного средства в стране производителя лекарственного средства и в государствах – членах Союза');
INSERT INTO registrationproductdoccodeclassifier VALUES (16, '23', 'Данные о биологической безопасности (при наличии)');
INSERT INTO registrationproductdoccodeclassifier VALUES (17, '24', 'Данные о процедуре стерилизации, включая информацию о валидации процесса, результаты тестирования на содержание микроорганизмов (степень биологической нагрузки), пирогенности, стерильности (при необходимости) с указанием методов проведения испытаний и данные о  валидации упаковки');
INSERT INTO registrationproductdoccodeclassifier VALUES (18, '25', 'Информация о программном обеспечении (при его наличии): наименование, версия программного обеспечения, доказательства того, что версия протестирована и соответствует окончательной поставляемой версии программного обеспечения; описание программного обеспечения, включая определение тех функциональных характеристик изделия, которые контролируются с его помощью , язык программирования, аппаратную платформу, операционную систему (если применимо), использование готового стандартного программного обеспечения (если применимо). Данные о  валидации программного обеспечения ');
INSERT INTO registrationproductdoccodeclassifier VALUES (19, '26', 'Отчет об исследованиях стабильности  для изделий, имеющих срок хранения, с аутентичным переводом на русский язык результатов и выводов испытаний  ');
INSERT INTO registrationproductdoccodeclassifier VALUES (20, '27', 'Эксплуатационный документ или инструкция по применению медицинского изделия на государственном и русском языках, в том числе инструкция по применению расходных материалов и комплектующих, являющихся самостоятельными медицинскими изделиями.');
INSERT INTO registrationproductdoccodeclassifier VALUES (21, '28', 'Руководство по сервисному обслуживанию (в части комплектующих медицинского изделия) в случае  отсутствия данных в эксплуатационной документации');
INSERT INTO registrationproductdoccodeclassifier VALUES (22, '3', 'Копия разрешительного документа на право производства в странепроизводителе (при наличии) с приложением ');
INSERT INTO registrationproductdoccodeclassifier VALUES (23, '4', 'Сертификаты на систему менеджмента качества медицинских изделий на все производственные площадки, производящие регистрируемую продукцию (ИСО 13485, другие специальные сертификаты на систему качества при производстве медицинских изделий)');
INSERT INTO registrationproductdoccodeclassifier VALUES (24, '5', 'Сертификаты на систему менеджмента качества на все производственные площадки, производящие регистрируемую продукцию (ИСО 9001) ');
INSERT INTO registrationproductdoccodeclassifier VALUES (25, '6', 'Декларация о соответствии');
INSERT INTO registrationproductdoccodeclassifier VALUES (26, '7', ' Документ, удостоверяющий регистрацию в странепроизводителе (регистрационное удостоверение и/или Сертификат свободной продажи  и/или Сертификат на экспорт) (за исключением  медицинских изделий, впервые произведенных в государствах-членах Союза) с аутентичным переводом на русский язык');
INSERT INTO registrationproductdoccodeclassifier VALUES (27, '8', 'Копия документа, удостоверяющего регистрацию в других странах (при наличии) ');
INSERT INTO registrationproductdoccodeclassifier VALUES (28, '9', 'Справка на медицинское изделие с описанием области применения, назначения, краткой характеристики медицинского изделия, вариантами исполнения и комплектующими (по форме)');


--
-- TOC entry 4613 (class 0 OID 19111)
-- Dependencies: 307
-- Data for Name: registrationproductfilecodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO registrationproductfilecodeclassifier VALUES (1, '1', 'Экспертное заключение по оценке безопасности, эффективности и качества медицинского изделия при регистрации');
INSERT INTO registrationproductfilecodeclassifier VALUES (2, '10', 'Заявление на проведение экспертизы медицинского изделия');
INSERT INTO registrationproductfilecodeclassifier VALUES (3, '11', 'Заявление на проведение регистрации медицинского изделия');
INSERT INTO registrationproductfilecodeclassifier VALUES (4, '12', 'Заявление о внесении изменений в регистрационное досье медицинского изделия');
INSERT INTO registrationproductfilecodeclassifier VALUES (5, '13', 'Заявление о выдаче дубликата регистрационного удостоверения на медицинское изделие');
INSERT INTO registrationproductfilecodeclassifier VALUES (6, '14', 'Заявление об отмене (аннулировании) регистрационного удостоверения медицинского изделия');
INSERT INTO registrationproductfilecodeclassifier VALUES (7, '15', 'Подтверждение согласования (не согласования) экспертного заключения референтного государства по результатам экспертизы безопасности, эффективности и качества медицинских изделий');
INSERT INTO registrationproductfilecodeclassifier VALUES (8, '2', 'Экспертное заключение о возможности (невозможности) внесения изменений в регистрационное досье на медицинское изделие');
INSERT INTO registrationproductfilecodeclassifier VALUES (9, '3', 'Запрос заявителю о предоставлении дополнительных сведений');
INSERT INTO registrationproductfilecodeclassifier VALUES (10, '4', 'Ответ от заявителя о предоставлении дополнительных сведений');
INSERT INTO registrationproductfilecodeclassifier VALUES (11, '5', 'Запрос уполномоченного органа (экспертной организации) государства признания, направленный в уполномоченный орган референтного государства');
INSERT INTO registrationproductfilecodeclassifier VALUES (12, '6', 'Ответ уполномоченного органа (экспертной организации) референтного государства, направленный в уполномоченный орган государства государства признания');
INSERT INTO registrationproductfilecodeclassifier VALUES (13, '7', 'Замечание уполномоченного органа (экспертной организации) государства признания, направленный в уполномоченный орган референтного государства');
INSERT INTO registrationproductfilecodeclassifier VALUES (14, '8', 'Предложение уполномоченного органа (экспертной организации) государства признания, направленный в уполномоченный орган референтного государства');
INSERT INTO registrationproductfilecodeclassifier VALUES (15, '9', 'Отчет об инспекции производства');


--
-- TOC entry 4615 (class 0 OID 19119)
-- Dependencies: 309
-- Data for Name: specialsimplificationtypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO specialsimplificationtypeclassifier VALUES (1, 'A', 'временное хранение товаров в помещениях, на открытых площадках и иных территориях уполномоченного экономического оператора', NULL, NULL);
INSERT INTO specialsimplificationtypeclassifier VALUES (2, 'B', 'выпуск товаров до подачи таможенной декларации в соответствии со статьей 197 ТК ТС', NULL, NULL);
INSERT INTO specialsimplificationtypeclassifier VALUES (3, 'C', 'проведение таможенных операций связанных с выпуском товаров, в помещениях, на открытых площадках и иных территориях уполномоченного экономического оператора', NULL, NULL);
INSERT INTO specialsimplificationtypeclassifier VALUES (4, 'D', 'иные специальные упрощения, предусмотренные регулирующими таможенные правоотношения международными договорами и актами, составляющими право Евразийского экономического союза', NULL, NULL);


--
-- TOC entry 4617 (class 0 OID 19127)
-- Dependencies: 311
-- Data for Name: steeringwheelpositionclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO steeringwheelpositionclassifier VALUES (1, '10', 'справа', '2', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (2, '20', 'слева', '2', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (3, '30', 'посередине', '2', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (4, '10', 'справа', '1', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (5, '20', 'слева', '1', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (6, '30', 'посередине', '1', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (7, '10', 'справа', '3', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (8, '20', 'слева', '3', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (9, '30', 'посередине', '3', NULL, NULL);


--
-- TOC entry 4619 (class 0 OID 19135)
-- Dependencies: 313
-- Data for Name: subjectsoflawclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO subjectsoflawclassifier VALUES (1, '05', 'государство', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (2, '10', 'физическое лицо', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (3, '15', 'юридическое лицо', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (4, '20', 'субъект международного права', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (5, '25', 'субъект международного частного права', NULL, NULL);


--
-- TOC entry 4621 (class 0 OID 19143)
-- Dependencies: 315
-- Data for Name: technicalobjectkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4623 (class 0 OID 19151)
-- Dependencies: 317
-- Data for Name: termsofdeliveryclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO termsofdeliveryclassifier VALUES (1, 'EXW', 'ФРАНКО-ЗАВОД', 'Местонахождение завода', '');
INSERT INTO termsofdeliveryclassifier VALUES (2, 'FCA', 'ФРАНКО- ПЕРЕВОЗЧИК', 'Указанное место', '');
INSERT INTO termsofdeliveryclassifier VALUES (3, 'FAS', 'СВОБОДНО ВДОЛЬ БОРТА СУДНА', 'Указанный порт погрузки', '');
INSERT INTO termsofdeliveryclassifier VALUES (4, 'FOB', 'СВОБОДНО НА БОРТУ СУДНА', 'Указанный порт погрузки', '');
INSERT INTO termsofdeliveryclassifier VALUES (5, 'CFR', 'СТОИМОСТЬ И ФРАХТ', 'Указанный порт назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (6, 'CIF', 'СТОИМОСТЬ, СТРАХОВАНИЕ И ФРАХТ', 'Указанный порт назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (7, 'CPT', 'ПЕРЕВОЗКА ОПЛАЧЕНА ДО ...', 'Указанное место назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (8, 'CIP', 'ПЕРЕВОЗКА И СТРАХОВАНИЕ ОПЛАЧЕНЫ ДО ...', 'Указанное место назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (9, 'DAF', 'ФРАНКО-ГРАНИЦА', 'Указанное место', '');
INSERT INTO termsofdeliveryclassifier VALUES (10, 'DES', 'ПОСТАВКА С СУДНА', 'Указанный порт назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (11, 'DEQ', 'ПОСТАВКА С ПРИСТАНИ', 'Указанный порт назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (12, 'DDU', 'ПОСТАВКА БЕЗ ОПЛАТЫ ПОШЛИНЫ', 'Указанное место назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (13, 'DDP', 'ПОСТАВКА С ОПЛАТОЙ ПОШЛИНЫ', 'Указанное место назначения', '');
INSERT INTO termsofdeliveryclassifier VALUES (14, 'XXX', 'ИНОЕ НАИМЕНОВАНИЕ УСЛОВИЯ ПОСТАВКИ', 'Описание условий поставки, приведенное в контракте', '');
INSERT INTO termsofdeliveryclassifier VALUES (15, 'DAT', 'ПОСТАВКА НА ТЕРМИНАЛЕ', 'Указанный терминал', '');
INSERT INTO termsofdeliveryclassifier VALUES (16, 'DAP', 'ПОСТАВКА В ПУНКТЕ', 'Указанный пункт', '');


--
-- TOC entry 4625 (class 0 OID 19159)
-- Dependencies: 319
-- Data for Name: transactiontypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO transactiontypeclassifier VALUES (1, 'K', 'Передача товара по иному договору');
INSERT INTO transactiontypeclassifier VALUES (2, 'J', 'Передача возвращенного товара');
INSERT INTO transactiontypeclassifier VALUES (3, 'I', 'Передача товара в качестве безвозмездной, гуманитарной либо технической помощи, дара');
INSERT INTO transactiontypeclassifier VALUES (4, 'H', 'Передача товара по договору хранения на срок 1 год и более');
INSERT INTO transactiontypeclassifier VALUES (5, 'G', 'Передача товара по договору финансовой аренды (лизинга) на срок 1 год и более');
INSERT INTO transactiontypeclassifier VALUES (6, 'F', 'Передача товара по консигнационному соглашению');
INSERT INTO transactiontypeclassifier VALUES (7, 'E', 'Передача товара в качестве вклада в уставный фонд');
INSERT INTO transactiontypeclassifier VALUES (8, 'D', 'Передача товара после переработки');
INSERT INTO transactiontypeclassifier VALUES (9, 'C', 'Передача товара на переработку');
INSERT INTO transactiontypeclassifier VALUES (10, 'B', 'Передача товара по договору мены');
INSERT INTO transactiontypeclassifier VALUES (11, 'A', 'Передача товара по договору купли-продажи');


--
-- TOC entry 4627 (class 0 OID 19167)
-- Dependencies: 321
-- Data for Name: transportandfreightmodesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO transportandfreightmodesclassifier VALUES (1, '10', 'Морской/речной транспорт', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (2, '20', 'Железнодорожный транспорт', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (3, '30', 'Автодорожный транспорт, за исключением транспортных средств, указанных под кодами 31, 32', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (4, '31', 'Состав транспортных средств (тягач с полуприцепом или прицепом)', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (5, '32', 'Состав транспортных средств (тягач с прицепом (-ами) и полуприцепом (-ами)', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (6, '40', 'Воздушный транспорт', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (7, '50', 'Почтовое отправление', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (8, '71', 'Трубопроводный транспорт', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (9, '72', 'Линии электропередачи', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (10, '80', 'Внутренний водный транспорт', NULL, '* в том числе любое транспортное средство, перевозимое посредством указанного вида транспорта');
INSERT INTO transportandfreightmodesclassifier VALUES (11, '90', 'Транспортное средство, перемещающееся в качестве товара своим ходом', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (12, '99', 'Прочие', NULL, NULL);


--
-- TOC entry 4629 (class 0 OID 19175)
-- Dependencies: 323
-- Data for Name: userkindtimeadvincidentclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO userkindtimeadvincidentclassifier VALUES (1, '01', 'медицинский персонал');
INSERT INTO userkindtimeadvincidentclassifier VALUES (2, '02', 'пациент');
INSERT INTO userkindtimeadvincidentclassifier VALUES (3, '03', 'другое');


--
-- TOC entry 4631 (class 0 OID 19183)
-- Dependencies: 325
-- Data for Name: vehiclebodycolorclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclebodycolorclassifier VALUES (1, '1003', 'желтый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (2, '2010', 'оранжевый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (3, '3001', 'красный', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (4, '4008', 'фиолетовый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (5, '5005', 'синий', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (6, '6032', 'зеленый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (7, '7004', 'серый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (8, '8002', 'коричневый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (9, '9003', 'белый', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (10, '9004', 'черный', NULL, NULL);


--
-- TOC entry 4633 (class 0 OID 19191)
-- Dependencies: 327
-- Data for Name: vehiclebrandsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclebrandsclassifier VALUES (1, '001', 'ABARTH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (2, '002', 'ABG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (3, '003', 'AC CARS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (4, '004', 'ACERBI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (5, '005', 'ACKERMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (6, '006', 'ACTM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (7, '007', 'ACURA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (8, '008', 'ADIVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (9, '009', 'ADLY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (10, '010', 'ADR TRAILERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (11, '011', 'ADRIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (12, '012', 'AEON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (13, '013', 'AERMACCHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (14, '014', 'AJP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (15, '015', 'AJS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (16, '016', 'ALBAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (17, '017', 'ALFA ROMEO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (18, '018', 'ALI RIZA USTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (19, '019', 'ALLIGATOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (20, '020', 'ALPINA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (21, '021', 'ALPINE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (22, '022', 'AMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (23, '023', 'AMERICAN EAGLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (24, '024', 'AMMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (25, '025', 'ANKAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (26, '026', 'ANNABURGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (27, '027', 'APRILIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (28, '028', 'ARCTIC CAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (29, '029', 'ARDOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (30, '030', 'ARIEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (31, '031', 'ARO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (32, '032', 'ARQIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (33, '033', 'ARTEGA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (34, '034', 'ASCARI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (35, '035', 'ASIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (36, '036', 'ASPES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (37, '037', 'ASTON MARTIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (38, '038', 'ASTRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (39, '039', 'ATEK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (40, '040', 'ATK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (41, '041', 'ATLAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (42, '042', 'ATLAS HONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (43, '043', 'AUDI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (44, '044', 'AUSTIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (45, '045', 'AUTOSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (46, '046', 'AVIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (47, '047', 'AVTOTREIDING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (48, '048', 'BAJAJ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (49, '049', 'BALKANCAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (50, '050', 'BALTMOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (51, '051', 'BAMX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (52, '052', 'BAROSSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (53, '053', 'BARYVAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (54, '054', 'BAW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (55, '055', 'BAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (56, '056', 'BEIFANG BENCHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (57, '057', 'BEIJING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (58, '058', 'BELAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (59, '059', 'BENALU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (60, '060', 'BENELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (61, '061', 'BENNCHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (62, '062', 'BENTLEY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (63, '063', 'BERGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (64, '064', 'BETA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (65, '065', 'BIG BEAR CHOPPERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (66, '066', 'BIG DOG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (67, '067', 'BIMOTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (68, '068', 'BITTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (69, '069', 'BLATA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (70, '070', 'BMW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (71, '071', 'BOBCAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (72, '072', 'BOCKMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (73, '073', 'BODEX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (74, '074', 'BOGDAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (75, '075', 'BOMAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (76, '076', 'BOOM TRIKES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (77, '077', 'BOVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (78, '078', 'BPG RECREATIONAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (79, '079', 'BRAMMO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (80, '080', 'BRIAB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (81, '081', 'BRILLIANCE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (82, '082', 'BRISTOL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (83, '083', 'BROOKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (84, '084', 'BROSHUIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (85, '085', 'BSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (86, '086', 'BSLT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (87, '087', 'BSS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (88, '088', 'BUCCIMOTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (89, '089', 'BUELL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (90, '090', 'BUGATTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (91, '091', 'BUICK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (92, '092', 'BURG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (93, '093', 'BYD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (94, '094', 'CADILLAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (95, '095', 'CAGIVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (96, '096', 'CALIFORNIA SCOOTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (97, '097', 'CALLAWAY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (98, '098', 'CAMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (99, '099', 'CAMPTOURIST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (100, '100', 'CAN-AM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (101, '101', 'CARBODIES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (102, '102', 'CARDI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (103, '103', 'CARGOBIKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (104, '104', 'CARNEHL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (105, '105', 'CASE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (106, '106', 'CATERHAM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (107, '107', 'CATERPILLAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (108, '108', 'CCM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (109, '109', 'CECTEK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (110, '110', 'CFMOTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (111, '111', 'CH RACING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (112, '112', 'CHAMPION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (113, '113', 'CHANA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (114, '114', 'CHANG JIANG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (115, '115', 'CHANGAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (116, '116', 'CHANGFENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (117, '117', 'CHANGHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (118, '118', 'CHANGLIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (119, '119', 'CHENGGONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (120, '120', 'CHEREAU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (121, '121', 'CHERY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (122, '122', 'CHEVAL LIBERTE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (123, '123', 'CHEVROLET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (124, '124', 'CHRYSLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (125, '125', 'CIFA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (126, '126', 'CIMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (127, '127', 'CIMC SILVERGREEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (128, '128', 'CITROEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (129, '129', 'CIZETA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (130, '130', 'COBRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (131, '131', 'COGGIOLA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (132, '132', 'CPI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (133, '133', 'CRS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (134, '134', 'DACIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (135, '135', 'DADI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (136, '136', 'DAEWOO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (137, '137', 'DAF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (138, '138', 'DAIHATSU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (139, '139', 'DAIMLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (140, '140', 'DALLAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (141, '141', 'DATSUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (142, '142', 'DE TOMASO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (143, '143', 'DELOREAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (144, '144', 'DEMAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (145, '145', 'DERWAYS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (146, '146', 'DKW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (147, '147', 'DODGE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (148, '148', 'DOLL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (149, '149', 'DONGFENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (150, '150', 'DONINVEST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (151, '151', 'DONKERVOORT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (152, '152', 'DOOSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (153, '153', 'DRESSTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (154, '154', 'DYNAPAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (155, '155', 'E-MAX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (156, '156', 'E-TON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (157, '157', 'ETROPOLIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (158, '158', 'EAGLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (159, '159', 'EAGLE WING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (160, '160', 'ECOSSE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (161, '161', 'EDUARD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (162, '162', 'EFINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (163, '163', 'EIGENBAU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (164, '164', 'ELFIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (165, '165', 'ERAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (166, '166', 'EBR (ERIK BUELL RACING)', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (167, '167', 'ESPERO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (168, '168', 'EXCALIBUR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (169, '169', 'EXPLORER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (170, '170', 'FACTORY BIKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (171, '171', 'FANTIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (172, '172', 'FAUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (173, '173', 'FAW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (174, '174', 'FAYMONVILLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (175, '175', 'FELDBINDER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (176, '176', 'FERRARI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (177, '177', 'FGR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (178, '178', 'FIAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (179, '179', 'FIAT-HITACHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (180, '180', 'FIAT KOBELCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (181, '181', 'FIORI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (182, '182', 'FISCHER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (183, '183', 'FISKER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (184, '184', 'FLIEGL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (185, '185', 'FOKAMO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (186, '186', 'FORD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (187, '187', 'FOSTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (188, '188', 'FOTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (189, '189', 'FREIGHTLINER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (190, '190', 'FRUEHAUF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (191, '191', 'FSM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (192, '192', 'FSO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (193, '193', 'FUCHS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (194, '194', 'FUQI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (195, '195', 'FURUKAWA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (196, '196', 'GARELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (197, '197', 'GAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (198, '198', 'GASVI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (199, '199', 'GAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (200, '200', 'GEELY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (201, '201', 'GENERAL MOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (202, '202', 'GENERIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (203, '203', 'GENUINE SCOOTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (204, '204', 'GEO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (205, '205', 'GIANT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (206, '206', 'GIANTCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (207, '207', 'GILERA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (208, '208', 'GMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (209, '209', 'GOES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (210, '210', 'GOFA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (211, '211', 'GOLDEN DRAGON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (212, '212', 'GONOW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (213, '213', 'GOODWILL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (214, '214', 'GOVECS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (215, '215', 'GRAYADAMS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (216, '216', 'GRC MOTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (217, '217', 'GREAT WALL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (218, '218', 'GREENTRANS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (219, '219', 'GROENEWEGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (220, '220', 'GROVE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (221, '221', 'GRUNWALD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (222, '222', 'GRYPHON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (223, '223', 'GT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (224, '224', 'GUMPERT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (225, '225', 'GURLESENYIL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (226, '226', 'HAFEI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (227, '227', 'HAIMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (228, '228', 'HALLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (229, '229', 'HAMM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (230, '230', 'HANIX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (231, '231', 'HANOMAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (232, '232', 'HANWOO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (233, '233', 'HAOJIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (234, '234', 'HAPERT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (235, '235', 'HARLEY-DAVIDSON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (236, '236', 'HBM-NOBAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (237, '237', 'HDM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (238, '238', 'HEADBANGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (239, '239', 'HEALEY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (240, '240', 'HENDRICKS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (241, '241', 'HERCULES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (242, '242', 'HERO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (243, '243', 'HERO ELECTRIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (244, '244', 'HERO HONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (245, '245', 'HESKETH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (246, '246', 'HFR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (247, '247', 'HIDROMEK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (248, '248', 'HIGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (249, '249', 'HIGHLAND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (250, '250', 'HINDUSTAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (251, '251', 'HINO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (252, '252', 'HISUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (253, '253', 'HITACHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (254, '254', 'HM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (255, '255', 'HOBBS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (256, '256', 'HOLDEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (257, '257', 'HONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (258, '258', 'HONGYAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (259, '259', 'HORCH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (260, '260', 'HOREX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (261, '261', 'HOWO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (262, '262', 'HP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (263, '263', 'HP POWER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (264, '264', 'HUANDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (265, '265', 'HUANGHAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (266, '266', 'HUMBAUR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (267, '267', 'HUMMER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (268, '268', 'HUSABERG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (269, '269', 'HUSQVARNA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (270, '270', 'HYDREMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (271, '271', 'HYOSUNG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (272, '272', 'HYUNDAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (273, '273', 'IFA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (274, '274', 'IKARBUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (275, '275', 'IKARUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (276, '276', 'INDIAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (277, '277', 'INFINITI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (278, '278', 'INNOCENTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (279, '279', 'INNOSCOOTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (280, '280', 'INTERNATIONAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (281, '281', 'INTERSTATE 1', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (282, '282', 'INTREPID', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (283, '283', 'INVICTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (284, '284', 'IPV', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (285, '285', 'IRAN KHODRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (286, '286', 'IRBIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (287, '287', 'IRISBUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (288, '288', 'ISDERA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (289, '289', 'ISUZU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (290, '290', 'ITALJET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (291, '291', 'IVECO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (292, '292', 'IZH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (293, '293', 'IZUKA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (294, '294', 'JAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (295, '295', 'JAGUAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (296, '296', 'JAWA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (297, '297', 'JCB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (298, '298', 'JEEP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (299, '299', 'JELCZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (300, '300', 'JIALING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (301, '301', 'JIANGLING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (302, '302', 'JIANGNAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (303, '303', 'JIANSHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (304, '304', 'JINBEI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (305, '305', 'JINCHENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (306, '306', 'JINLUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (307, '307', 'JOHN DEERE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (308, '308', 'JOHNNY PAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (309, '309', 'JONWAY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (310, '310', 'JORDAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (311, '311', 'JRL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (312, '312', 'JUEJIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (313, '313', 'JUKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (314, '314', 'JUMBO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (315, '315', 'JYKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (316, '316', 'K2O', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (317, '317', 'KABIRDASS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (318, '318', 'KAMAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (319, '319', 'KANGDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (320, '320', 'KANUNI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (321, '321', 'KASINSKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (322, '322', 'KASSBOHRER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (323, '323', 'KATO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (324, '324', 'KAVZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (325, '325', 'KAWASAKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (326, '326', 'KEEWAY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (327, '327', 'KEL-BERG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (328, '328', 'KENWORTH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (329, '329', 'KIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (330, '330', 'KINETIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (331, '331', 'KING LONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (332, '332', 'KINROAD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (333, '333', 'KIP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (334, '334', 'KOBELCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (335, '335', 'KOGEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (336, '336', 'KOENIGSEGG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (337, '337', 'KOMATSU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (338, '338', 'KRAMER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (339, '339', 'KRAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (340, '340', 'KRONE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (341, '341', 'KRUPP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (342, '342', 'KTM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (343, '343', 'KUBOTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (344, '344', 'KUFER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (345, '345', 'KYMCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (346, '346', 'LADA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (347, '347', 'LAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (348, '348', 'LAMBERET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (349, '349', 'LAMBORGHINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (350, '350', 'LAMBRETTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (351, '351', 'LANCIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (352, '352', 'LAND ROVER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (353, '353', 'LANDWIND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (354, '354', 'LANGENDORF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (355, '355', 'LANGFELD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (356, '356', 'LATRE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (357, '357', 'LAUGE JENSEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (358, '358', 'LAVERDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (359, '359', 'LAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (360, '360', 'LDV', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (361, '361', 'LECTRIX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (362, '362', 'LEHMAN TRIKES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (363, '363', 'LEM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (364, '364', 'LEONHARDT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (365, '365', 'LEXUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (366, '366', 'LEYLAND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (367, '367', 'LIAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (368, '368', 'LIDER TRADE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (369, '369', 'LIEBHERR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (370, '370', 'LIFAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (371, '371', 'LINCOLN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (372, '372', 'LINHAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (373, '373', 'LINTRAILERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (374, '374', 'LIUGONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (375, '375', 'LML', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (376, '376', 'LOCATELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (377, '377', 'LOHIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (378, '378', 'LOHR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (379, '379', 'LONCIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (380, '380', 'LONKING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (381, '381', 'LOTUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (382, '382', 'LTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (383, '383', 'LUAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (384, '384', 'LUNA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (385, '385', 'LUXGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (386, '386', 'LYNX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (387, '387', 'MACBOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (388, '388', 'MACK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (389, '389', 'MAGIRUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (390, '390', 'MAGNI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (391, '391', 'MAHINDRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (392, '392', 'MAISONNEUVE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (393, '393', 'MALAGUTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (394, '394', 'MAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (395, '395', 'MANAC-AUTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (396, '396', 'MANITOU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (397, '397', 'MARCOPOLO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (398, '398', 'MARCOS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (399, '399', 'MARINE TURBINE TECHNOLOGIES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (400, '400', 'MARLIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (401, '401', 'MARUSSIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (402, '402', 'MARUTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (403, '403', 'MASERATI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (404, '404', 'MAVIZEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (405, '405', 'MAYBACH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (406, '406', 'MAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (407, '407', 'MAZDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (408, '408', 'MBK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (409, '409', 'MBS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (410, '410', 'MCLAREN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (411, '411', 'MEGA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (412, '412', 'MEGELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (413, '413', 'MEILLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (414, '414', 'MENCI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (415, '415', 'MERCEDES-BENZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (416, '416', 'MERCURY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (417, '417', 'MERLO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (418, '418', 'METISSE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (419, '419', 'METROCAB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (420, '420', 'METSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (421, '421', 'MEUSBURGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (422, '422', 'MG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (423, '423', 'MIDUAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (424, '424', 'MIKILON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (425, '425', 'MINELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (426, '426', 'MINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (427, '427', 'MINSK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (428, '428', 'MISSION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (429, '429', 'MITSUBISHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (430, '430', 'MITSUOKA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (431, '431', 'MODENAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (432, '432', 'MONDIAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (433, '433', 'MONTE CARLO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (434, '434', 'MONTESA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (435, '435', 'MONTRACON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (436, '436', 'MORGAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (437, '437', 'MOSKVICH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (438, '438', 'MOTO GUZZI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (439, '439', 'MOTO MORINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (440, '440', 'MOTOCZYSZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (441, '441', 'MOTORHISPANIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (442, '442', 'MUDAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (443, '443', 'MULTICAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (444, '444', 'MUZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (445, '445', 'MV AGUSTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (446, '446', 'MZKT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (447, '447', 'NARKO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (448, '448', 'NCR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (449, '449', 'NEANDER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (450, '450', 'NEOPLAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (451, '451', 'NESS MOTORCYCLES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (452, '452', 'NEW HOLLAND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (453, '453', 'NEXUS MOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (454, '454', 'NIPPONIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (455, '455', 'NISSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (456, '456', 'NOBLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (457, '457', 'NOOTEBOOM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (458, '458', 'NORDIC TANK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (459, '459', 'NORTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (460, '460', 'NYSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (461, '461', 'OK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (462, '462', 'O.ME.P.S.', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (463, '463', 'OFF MECC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (464, '464', 'OLDSMOBILE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (465, '465', 'OLTCIT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (466, '466', 'OMT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (467, '467', 'OPEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (468, '468', 'ORION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (469, '469', 'OSCA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (470, '470', 'OTOSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (471, '471', 'PACTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (472, '472', 'PAGANI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (473, '473', 'PALFINGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (474, '474', 'PANNONIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (475, '475', 'PANOZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (476, '476', 'PANTHER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (477, '477', 'PARCISA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (478, '478', 'PAYKAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (479, '479', 'PAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (480, '480', 'PERAVES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (481, '481', 'PERODUA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (482, '482', 'PETERBILT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (483, '483', 'PEUGEOT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (484, '484', 'PGO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (485, '485', 'PIAGGIO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (486, '486', 'PITSTER PRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (487, '487', 'PKW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (488, '488', 'PLYMOUTH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (489, '489', 'PNO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (490, '490', 'POLARIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (491, '491', 'POLINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (492, '492', 'POLONEZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (493, '493', 'PONSSE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (494, '494', 'PONTIAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (495, '495', 'PORSCHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (496, '496', 'POWERCAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (497, '497', 'PRAGA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (498, '498', 'PRC (PRO RACING CYCLES)', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (499, '499', 'PCW (PRECISION CYCLE WORKS)', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (500, '500', 'PREMIER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (501, '501', 'PRIM-BALL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (502, '502', 'PROTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (503, '503', 'PUCH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (504, '504', 'PUMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (505, '505', 'PUTZMEISTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (506, '506', 'QINGQI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (507, '507', 'QLINK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (508, '508', 'QOROS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (509, '509', 'QUANTYA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (510, '510', 'QVALE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (511, '511', 'RAF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (512, '512', 'RANGE ROVER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (513, '513', 'RAVI PIAGGIO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (514, '514', 'RED WING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (515, '515', 'REDNECK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (516, '516', 'RELIANT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (517, '517', 'RENAISSANCE CARS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (518, '518', 'RENAULT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (519, '519', 'RENDERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (520, '520', 'RESPO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (521, '521', 'RHINO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (522, '522', 'RIDLEY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (523, '523', 'RIEJU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (524, '524', 'RINSPEED', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (525, '525', 'ROAD HOPPER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (526, '526', 'ROBUR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (527, '527', 'ROEHR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (528, '528', 'ROHR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (529, '529', 'ROKON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (530, '530', 'ROLFO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (531, '531', 'ROLLS-ROYCE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (532, '532', 'RONART', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (533, '533', 'ROVER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (534, '534', 'ROYAL ENFIELD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (535, '535', 'RUCKER PERFORMANCE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (536, '536', 'SAAB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (537, '537', 'SACHS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (538, '538', 'SACIM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (539, '539', 'SALEEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (540, '540', 'SAMRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (541, '541', 'SAMSUNG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (542, '542', 'SAMURAI CHOPPER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (543, '543', 'SANGLAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (544, '544', 'SANTANA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (545, '545', 'SANY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (546, '546', 'SARIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (547, '547', 'SATURN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (548, '548', 'SAXON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (549, '549', 'SCANIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (550, '550', 'SCHMITZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (551, '551', 'SCHWARZMULLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (552, '552', 'SCHWINN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (553, '553', 'SCION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (554, '554', 'SCORPA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (555, '555', 'SDLG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (556, '556', 'SEAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (557, '557', 'SEAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (558, '558', 'SEM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (559, '559', 'SENKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (560, '560', 'SETRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (561, '561', 'SHAANXI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (562, '562', 'SHANTUI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (563, '563', 'SHELBY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (564, '564', 'SHENLONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (565, '565', 'SHERCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (566, '566', 'SHIFENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (567, '567', 'SHOKEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (568, '568', 'SHORELANDER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (569, '569', 'SHUANGHUAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (570, '570', 'SINOMACH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (571, '571', 'SISU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (572, '572', 'SKI-DOO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (573, '573', 'SKIF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (574, '574', 'SKODA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (575, '575', 'SKYTEAM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (576, '576', 'SMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (577, '577', 'SMART', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (578, '578', 'SOKON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (579, '579', 'SOMMER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (580, '580', 'SOUEAST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (581, '581', 'SPECTRE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (582, '582', 'SPIER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (583, '583', 'SPYKER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (584, '584', 'SSANGYONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (585, '585', 'STANDBIKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (586, '586', 'STAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (587, '587', 'STEELBEAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (588, '588', 'STEINSBERGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (589, '589', 'STELS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (590, '590', 'STEMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (591, '591', 'STILL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (592, '592', 'SUBARU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (593, '593', 'SUCKER PUNCH SALLYS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (594, '594', 'SUKIDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (595, '595', 'SUNDIRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (596, '596', 'SUNLONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (597, '597', 'SUPER MOTOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (598, '598', 'SUZUKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (599, '599', 'SYM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (600, '600', 'SYRENA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (601, '601', 'TADANO FAUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (602, '602', 'TALBOT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (603, '603', 'TARPAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (604, '604', 'TARSUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (605, '605', 'TATA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (606, '606', 'TATRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (607, '607', 'TAURAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (608, '608', 'TAURIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (609, '609', 'TAYO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (610, '610', 'TCM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (611, '611', 'TEMSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (612, '612', 'TEREX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (613, '613', 'TERRA MODENA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (614, '614', 'TESLA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (615, '615', 'TGB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (616, '616', 'TIANMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (617, '617', 'TIANYE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (618, '618', 'TIGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (619, '619', 'TIKI TREILER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (620, '620', 'TIMBERJACK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (621, '621', 'TITAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (622, '622', 'TM RACING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (623, '623', 'TOFAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (624, '624', 'TOMBERLIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (625, '625', 'TOMOS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (626, '626', 'TONAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (627, '627', 'TORGAU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (628, '628', 'TOYOTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (629, '629', 'TRABANT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (630, '630', 'TRACK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (631, '631', 'TRAIL KING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (632, '632', 'TRAILOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (633, '633', 'TRAVERTSON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (634, '634', 'TRIUMPH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (635, '635', 'TROLL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (636, '636', 'TROLZA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (637, '637', 'TSR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (638, '638', 'TURBO’S HOET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (639, '639', 'TVR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (640, '640', 'TVS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (641, '641', 'UAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (642, '642', 'UDS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (643, '643', 'UM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (644, '644', 'UNIMOG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (645, '645', 'URAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (646, '646', 'UTILITY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (647, '647', 'VALMET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (648, '648', 'VAN HOOL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (649, '649', 'VAN VEEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (650, '650', 'VAUXHALL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (651, '651', 'VAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (652, '652', 'VECTOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (653, '653', 'VECTRIX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (654, '654', 'VELI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (655, '655', 'VENTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (656, '656', 'VENTURI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (657, '657', 'VESPA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (658, '658', 'VIBERTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (659, '659', 'VIBROMAX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (660, '660', 'VICTORY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (661, '661', 'VIPER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (662, '662', 'VIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (663, '663', 'VMZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (664, '664', 'VOGELE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (665, '665', 'VOLKSWAGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (666, '666', 'VOLVO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (667, '667', 'VORTEX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (668, '668', 'VUKA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (669, '669', 'WABASH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (670, '670', 'WACKER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (671, '671', 'WAKAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (672, '672', 'WARTBURG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (673, '673', 'WESTFIELD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (674, '674', 'WIELTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (675, '675', 'WIESMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (676, '676', 'WILK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (677, '677', 'WILLIG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (678, '678', 'WIRTGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (679, '679', 'WITZCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (680, '680', 'WT MOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (681, '681', 'WULING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (682, '682', 'XCG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (683, '683', 'XCMG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (684, '684', 'XIN KAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (685, '685', 'XINGYUE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (686, '686', 'XMOTOS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (687, '687', 'YAMAHA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (688, '688', 'YANMAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (689, '689', 'YIBEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (690, '690', 'YOBYKES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (691, '691', 'YORK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (692, '692', 'YUGO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (693, '693', 'YUTONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (694, '694', 'ZANELLA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (695, '695', 'ZASLAW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (696, '696', 'ZASTAVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (697, '697', 'ZAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (698, '698', 'ZENVO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (699, '699', 'ZEST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (700, '700', 'ZHONG TONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (701, '701', 'ZIL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (702, '702', 'ZNEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (703, '703', 'ZONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (704, '704', 'ZONGSHEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (705, '705', 'ZOOMLION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (706, '706', 'ZUK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (707, '707', 'ZUNDAPP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (708, '708', 'ZX AUTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (709, '709', 'АВТОМАСТЕР', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (710, '710', 'АЛЬТЕРНА', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (711, '711', 'АМКОДОР', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (712, '712', 'БАЛТСПЕЦМАШ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (713, '713', 'БЕЛАРУС', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (714, '714', 'БЕЦЕМА', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (715, '715', 'БОГДАН-СПЕЦАВТОТЕХНИКА', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (716, '716', 'ВЗТМ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (717, '717', 'ГК СОДРУЖЕСТВО', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (718, '718', 'ГРАЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (719, '719', 'ДЕСНА', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (720, '720', 'ДЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (721, '721', 'ДИЗЕЛЬ-ТС', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (722, '722', 'ДУ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (723, '723', 'ИВАНОВЕЦ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (724, '724', 'КИРОВЕЦ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (725, '725', 'ЛТЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (726, '726', 'МАРЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (727, '727', 'МТЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (728, '728', 'НЕМАН', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (729, '729', 'НЕФАЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (730, '730', 'ПК', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (731, '731', 'ПТЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (732, '732', 'ПТК', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (733, '733', 'РОАЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (734, '734', 'РУССКАЯ МЕХАНИКА', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (735, '735', 'СЗАП', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (736, '736', 'СПЕЦПРИЦЕП', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (737, '737', 'ТАГАЗ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (738, '738', 'ТВЭКС', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (739, '739', 'ТРАНСМАШ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (740, '740', 'ТУШИНО-АВТО', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (741, '741', 'ЧСДМ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (742, '742', 'ЭО', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (743, '999', 'ПРОЧИЕ', NULL, NULL);


--
-- TOC entry 4635 (class 0 OID 19199)
-- Dependencies: 329
-- Data for Name: vehiclecategorypereaeutechnicalregulationsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (1, 'O1', 'категория O1', 'прицепы, имеющие технически допустимую максимальную массу не более 0,75 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (2, 'O1', 'категория O1', 'прицепы, имеющие технически допустимую максимальную массу не более 0,75 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (3, 'N3G', 'категория N3G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов, имеющие технически допустимую максимальную массу более 12 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (4, 'O3', 'категория O3', 'прицепы, имеющие технически допустимую максимальную массу свыше 3,5 т, но не более 10 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (5, 'O4', 'категория O4', 'прицепы, имеющие технически допустимую максимальную массу более 10 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (6, 'L7', 'категория L7', 'четырехколесное транспортное средство, иное, чем транспортное средство категории L6, масса которого без нагрузки не превышает 400 кг (550 кг для транспортного средства, предназначенного для перевозки грузов) без учета массы аккумуляторов (для электрического транспортного средства) и максимальная эффективная мощность двигателя которого не превышает 15 кВт', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (7, 'M1G', 'категория M1G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, не более 8 мест для сидения', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (8, 'M2', 'категория M2', 'транспортные средства, используемые для перевозки пассажиров, имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу не более 5 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (9, 'M2G', 'категория M2G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения, и технически допустимую максимальную массу не более 5 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (10, 'M3', 'категория M3', 'транспортные средства, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу более 5 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (11, 'M3G', 'категория M3G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу более 5 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (12, 'N1', 'категория N1', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу не более 3,5 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (13, 'N1G', 'категория N1G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу не более 3,5 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (14, 'N2', 'категория N2', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу более 3,5 т, но не более 12 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (15, 'N2G', 'категория N2G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов, имеющие технически допустимую максимальную массу свыше 3,5 т, но не более 12 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (16, 'N3', 'категория N3', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу более 12 т', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (17, 'N3G', 'категория N3G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов, имеющие технически допустимую максимальную массу более 12 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (18, 'N3G', 'категория N3G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов, имеющие технически допустимую максимальную массу более 12 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (19, 'O2', 'категория O2', 'прицепы, имеющие технически допустимую максимальную массу свыше 0,75 т, но не более 3,5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (20, 'O3', 'категория O3', 'прицепы, имеющие технически допустимую максимальную массу свыше 3,5 т, но не более 10 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (21, 'O4', 'категория O4', 'прицепы, имеющие технически допустимую максимальную массу более 10 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (22, 'L7', 'категория L7', 'четырехколесное транспортное средство, иное, чем транспортное средство категории L6, масса которого без нагрузки не превышает 400 кг (550 кг для транспортного средства, предназначенного для перевозки грузов) без учета массы аккумуляторов (для электрического транспортного средства) и максимальная эффективная мощность двигателя которого не превышает 15 кВт', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (23, 'M1', 'категория M1', 'транспортные средства, используемые для перевозки пассажиров и имеющие, помимо места водителя, не более 8 мест для сидения', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (24, 'M1G', 'категория M1G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, не более 8 мест для сидения', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (25, 'M1G', 'категория M1G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, не более 8 мест для сидения', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (26, 'M2', 'категория M2', 'транспортные средства, используемые для перевозки пассажиров, имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу не более 5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (27, 'M2', 'категория M2', 'транспортные средства, используемые для перевозки пассажиров, имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу не более 5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (28, 'M2G', 'категория M2G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения, и технически допустимую максимальную массу не более 5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (29, 'M2G', 'категория M2G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения, и технически допустимую максимальную массу не более 5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (30, 'M3', 'категория M3', 'транспортные средства, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу более 5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (31, 'M3', 'категория M3', 'транспортные средства, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу более 5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (32, 'M3G', 'категория M3G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу более 5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (33, 'M3G', 'категория M3G', 'транспортные средства повышенной проходимости, используемые для перевозки пассажиров и имеющие, помимо места водителя, более 8 мест для сидения и технически допустимую максимальную массу более 5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (34, 'N1', 'категория N1', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу не более 3,5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (35, 'N1', 'категория N1', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу не более 3,5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (36, 'N1G', 'категория N1G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу не более 3,5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (37, 'N1G', 'категория N1G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу не более 3,5 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (38, 'N2', 'категория N2', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу более 3,5 т, но не более 12 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (39, 'N2', 'категория N2', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу более 3,5 т, но не более 12 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (40, 'N2G', 'категория N2G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов, имеющие технически допустимую максимальную массу свыше 3,5 т, но не более 12 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (41, 'N2G', 'категория N2G', 'транспортные средства повышенной проходимости, предназначенные для перевозки грузов, имеющие технически допустимую максимальную массу свыше 3,5 т, но не более 12 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (42, 'N3', 'категория N3', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу более 12 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (43, 'N3', 'категория N3', 'транспортные средства, предназначенные для перевозки грузов и имеющие технически допустимую максимальную массу более 12 т', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (44, 'O2', 'категория O2', 'прицепы, имеющие технически допустимую максимальную массу свыше 0,75 т, но не более 3,5 т', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (45, 'Ra1', 'категория Ra1', 'прицепы с максимальной расчетной скоростью не более 40 км/ч, имеющие технически допустимую общую массу не более 1500 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (46, 'Ra2', 'категория Ra2', 'прицепы с максимальной расчетной скоростью не более 40 км/ч, имеющие технически допустимую общую массу свыше 1500 кг, но не более 3500 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (47, 'Ra3', 'категория Ra3', 'прицепы с максимальной расчетной скоростью более 40 км/ч, имеющие технически допустимую общую массу свыше 3500 кг, но не более 21000 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (48, 'Ra4', 'категория Ra4', 'прицепы с максимальной расчетной скоростью не более 40 км/ч, имеющие технически допустимую общую массу более 21000 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (49, 'Rb1', 'категория Rb1', 'прицепы с максимальной расчетной скоростью более 40 км/ч, имеющие технически допустимую общую массу не более 1500 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (50, 'Rb2', 'категория Rb2', 'прицепы с максимальной расчетной скоростью более 40 км/ч, имеющие технически допустимую общую массу свыше 1500 кг, но не более 3500 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (51, 'Rb4', 'категория Rb4', 'прицепы с максимальной расчетной скоростью более 40 км/ч, имеющие технически допустимую общую массу более 21000 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (52, 'RX', 'категория RX', 'прицепы к сельскохозяйственным и другим самоходным и мобильным машинам', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (53, 'T1', 'категория T1', 'колесные тракторы с максимальной расчетной скоростью не более 40 км/ч, минимальным размером колеи оси, находящейся ближе к оператору, не менее 1150 мм, снаряженной массой более 600 кг и дорожным просветом не более 1000 мм. Для тракторов с реверсивным сиденьем оператора осью, находящейся ближе к оператору, считается ось, оборудованная шинами с наибольшим диаметром', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (54, 'T2', 'категория T2', 'колесные тракторы с максимальной расчетной скоростью не более 40 км/ч, минимальным размером колеи менее 1150 мм, снаряженной массой более 600 кг и дорожным просветом не более 600 мм. Если отношение высоты центра тяжести трактора к среднему минимальному размеру колеи осей превышает 0,9, то максимальная расчетная скорость не должна превышать 30 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (55, 'T3', 'категория T3', 'колесные тракторы с максимальной расчетной скоростью не более 40 км/ч и снаряженной массой не более 600 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (56, 'T4.1', 'категория T4.1', 'высококлиренсные тракторы, предназначенные для использования при обработке высокостебельных культур (например, виноградников), характеризующиеся увеличенной высотой шасси или части шасси, благодаря чему они могут перемещаться параллельно рядам растений с возвышением над ними, с возможностью оборудования рабочими органами, которые могут быть установлены спереди, между осями, сзади или на платформе. При работе клиренс трактора превышает 1000 мм. Если отношение высоты центра тяжести трактора (при обычных шинах) к среднему минимальному размеру колеи осей превышает 0,9, то максимальная расчетная скорость не должна превышать 30 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (57, 'T4.2', 'категория T4.2', 'сверхширокие тракторы с максимальной расчетной скоростью не более 40 км/ч, характеризующиеся значительными размерами и предназначенные специально для обработки больших сельскохозяйственных площадей', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (58, 'T4.3', 'категория T4.3', 'низкоклиренсные лесохозяйственные или сельскохозяйственные тракторы с приводом на 4 колеса, сменное рабочее оборудование которых предназначено для выполнения работ в лесном или сельском хозяйстве, с несущей рамой, одним или несколькими валами отбора мощности, имеющие технически допустимую общую массу не более 10 т и отношение технически допустимой общей массы к максимальной снаряженной массе менее 2,5, с максимальной расчетной скоростью не более 40 км/ч. Высота центра тяжести трактора (при обычных шинах) – менее 850 мм', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (59, 'C2', 'категория C2', 'гусеничные тракторы с максимальной расчетной скоростью не более 40 км/ч, минимальным размером колеи менее 1150 мм, снаряженной массой более 600 кг и дорожным просветом не более 600 мм. Если отношение высоты центра тяжести трактора к среднему минимальному размеру колеи осей превышает 0,9, то максимальная расчетная скорость не должна превышать 30 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (60, 'C3', 'категория C3', 'гусеничные тракторы с максимальной расчетной скоростью не более 40 км/ч и снаряженной массой не более 600 кг', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (61, 'C4', 'категория C4', 'гусеничные тракторы специального назначения с максимальной расчетной скоростью не более 40 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (62, 'C4.1', 'категория C4.1', 'высококлиренсные гусеничные тракторы, предназначенные для использования при обработке высокостебельных культур (например, виноградников), характеризующиеся увеличенной высотой шасси или части шасси, благодаря чему они могут перемещаться параллельно рядам растений с возвышением над ними, возможностью оборудования рабочими органами, которые могут быть установлены спереди, между осями, сзади или на платформе. При работе клиренс трактора превышает 1000 мм. Если отношение высоты центра тяжести трактора (при обычных шинах) к среднему минимальному размеру колеи осей превышает 0,9, то максимальная расчетная скорость не должна превышать 30 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (63, 'C5', 'категория C5', 'гусеничные тракторы с максимальной расчетной скоростью более 40 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (64, 'L1', 'категория L1', 'двухколесное транспортное средство, максимальная конструктивная скорость которого не превышает 50 км/ч и которое характеризуется при наличии двигателя внутреннего сгорания – рабочим объемом двигателя, не превышающим 50 см3, или при наличии электродвигателя – номинальной максимальной мощностью в режиме длительной нагрузки, не превышающей 4 кВт', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (65, 'L2', 'категория L2', 'трехколесное транспортное средство с любым расположением колес, максимальная конструктивная скорость которого не превышает 50 км/ч и которое характеризуется при наличии двигателя внутреннего сгорания с принудительным зажиганием – рабочим объемом двигателя, не превышающим 50 см3, или при наличии двигателя внутреннего сгорания другого типа – максимальной эффективной мощностью, не превышающей 4 кВт, или при наличии электродвигателя – номинальной максимальной мощностью в режиме длительной нагрузки, не превышающей 4 кВт', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (66, 'T5', 'категория T5', 'колесные тракторы с максимальной расчетной скоростью более 40 км/ч', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (67, 'L3', 'категория L3', 'двухколесное транспортное средство, рабочий объем двигателя которого (при наличии двигателя внутреннего сгорания) превышает 50 см3 и (или) максимальная конструктивная скорость которого (при любом двигателе) превышает 50 км/ч', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (68, 'L4', 'категория L4', 'трехколесное транспортное средство с колесами, асимметричными по отношению к средней продольной плоскости, рабочий объем двигателя которого (при наличии двигателя внутреннего сгорания) превышает 50 см3 и (или) максимальная конструктивная скорость (при любом двигателе) превышает 50 км/ч', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (69, 'L5', 'категория L5', 'трехколесное транспортное средство с колесами, симметричными по отношению к средней продольной плоскости транспортного средства, рабочий объем двигателя которого (при наличии двигателя внутреннего сгорания) превышает 50 см3 и (или) максимальная конструктивная скорость (при любом двигателе) превышает 50 км/ч', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (70, 'L6', 'категория L6', 'четырехколесное транспортное средство, масса которого без нагрузки не превышает 350 кг без учета массы аккумуляторов (в случае электрического транспортного средства), максимальная конструктивная скорость не превышает 50 км/ч и которое характеризуется при наличии двигателя внутреннего сгорания с принудительным зажиганием – рабочим объемом двигателя, не превышающим 50 см3, или при наличии двигателя внутреннего сгорания другого типа – максимальной эффективной мощностью двигателя, не превышающей 4 кВт, или при наличии электродвигателя – номинальной максимальной мощностью двигателя в режиме длительной нагрузки, не превышающей 4 кВт', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (71, 'M1', 'категория M1', 'транспортные средства, используемые для перевозки пассажиров и имеющие, помимо места водителя, не более 8 мест для сидения', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (72, 'X', 'сельскохозяйственные и другие самоходные и мобильные машины', 'описание технической категории приведено в приложении № 2 к техническому регламенту Таможенного союза «О безопасности машин и оборудования» (ТР ТС 010/2011)', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (73, 'Rb3', 'категория Rb3', 'прицепы с максимальной расчетной скоростью более 40 км/ч, имеющие технически допустимую общую массу свыше 3500 кг, но не более 21000 кг', '3', NULL, NULL);


--
-- TOC entry 4637 (class 0 OID 19207)
-- Dependencies: 331
-- Data for Name: vehiclecategoryperviennaconventiononroadtrafficclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (1, 'A', 'категория A', 'мотоциклы', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (2, 'A1', 'категория A1', 'мотоциклы с рабочим объемом двигателя, не превышающим 125 см3, и максимальной мощностью, не превышающей 11 кВт (легкие мотоциклы)', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (3, 'B', 'категория B', 'автомобили (за исключением транспортных средств, относящихся к категории А), разрешенная максимальная масса которых не превышает 3500 кг и число сидячих мест которых, помимо сиденья водителя, не превышает 8; автомобиль категории В, сцепленный с прицепом, разрешенная максимальная масса которого не превышает 750 кг; автомобиль категории В, сцепленный с прицепом, разрешенная максимальная масса которого превышает 750 кг, но не превышает массы автомобиля без нагрузки, а общая разрешенная максимальная масса такого состава не превышает 3500 кг', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (4, 'B1', 'категория B1', 'моторизованные трициклы и квадрициклы', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (5, 'C', 'категория C', 'автомобили, за исключением относящихся к категории D, разрешенная максимальная масса которых превышает 3500 кг; автомобиль категории С, сцепленный с прицепом, разрешенная максимальная масса которого не превышает 750 кг', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (6, 'C1', 'категория C1', 'автомобили, за исключением относящихся к категории D, разрешенная максимальная масса которых превышает 3500 кг, но не превышает 7500 кг; автомобиль подкатегории С1, сцепленный с прицепом, разрешенная максимальная масса которого не превышает 750 кг', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (7, 'D', 'категория D', 'автомобили, предназначенные для перевозки пассажиров и имеющие более 8 сидячих мест, помимо сиденья водителя; автомобиль категории D, сцепленный с прицепом, разрешенная максимальная масса которого не превышает 750 кг', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (8, 'D1', 'категория D1', 'автомобили, предназначенные для перевозки пассажиров и имеющие более 8 сидячих мест, помимо сиденья водителя, но не более 16 сидячих мест, помимо сиденья водителя; автомобиль подкатегории D1, сцепленный с прицепом, разрешенная максимальная масса которого не превышает 750 кг', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (9, 'E', 'прицеп', 'прицепы', NULL, NULL);


--
-- TOC entry 4639 (class 0 OID 19215)
-- Dependencies: 333
-- Data for Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (1, 'AI', 'категория A I', 'внедорожные мототранспортные средства', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (2, 'AII', 'категория A II', 'внедорожные автотранспортные средства, разрешенная максимальная масса которых не превышает 3500 кг и число сидячих мест, которых, помимо сиденья водителя, не превышает 8', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (3, 'AIII', 'категория A III', 'внедорожные автотранспортные средства, разрешенная максимальная масса которых превышает 3 500 килограммов (за исключением относящихся к категории A IV)', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (4, 'AIV', 'категория A IV', 'внедорожные автотранспортные средства, предназначенные для перевозки пассажиров и имеющие, помимо сиденья водителя, более 8 сидячих мест', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (5, 'B', 'категория B', 'гусеничные и колесные машины с двигателем мощностью до 25,7 кВт', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (6, 'C', 'категория C', 'колесные машины с двигателем мощностью от 25,7 до 110,3 кВт', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (7, 'D', 'категория D', 'колесные машины с двигателем мощностью свыше 110,3 кВт', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (8, 'E', 'категория E', 'гусеничные машины с двигателем мощностью свыше 25,7 кВт', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (9, 'F', 'категория F', 'самоходные сельскохозяйственные машины', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (10, 'R', 'прицеп', 'транспортные средства, предназначенные для движения в составе с механическим транспортным средством. Под прицепами понимаются также полуприцепы', NULL, NULL);


--
-- TOC entry 4641 (class 0 OID 19223)
-- Dependencies: 335
-- Data for Name: vehiclechassisclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclechassisclassifier VALUES (1, '05', 'шасси транспортного средства с кабиной и двигателем', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (2, '10', 'автобусное шасси транспортного средства без кузова для автобусов рамной конструкции', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (3, '15', 'автобусное шасси транспортного средства без кузова для автобусов каркасной конструкции', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (4, '20', 'грузовое шасси транспортного средства без кабины для изготовления транспортных средств со специальной кабиной', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (5, '25', 'грузовое шасси транспортного средства с частично собранной кабиной (без задней стенки)', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (6, '30', 'шасси транспортного средства с передней частью кабины для изготовления автомобилей-домов', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (7, '35', 'передняя часть шасси транспортного средства без кабины для изготовления автомобилей-домов', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (8, '40', 'шасси прицепа', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (9, '99', 'прочее', NULL, NULL);


--
-- TOC entry 4643 (class 0 OID 19231)
-- Dependencies: 337
-- Data for Name: vehiclecomponentschassistypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecomponentschassistypesclassifier VALUES (1, '5', 'коробка передач', '1', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (2, '5', 'коробка передач', '2', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (3, '5', 'коробка передач', '3', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (4, '10', 'раздаточная коробка', '1', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (5, '10', 'раздаточная коробка', '2', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (6, '10', 'раздаточная коробка', '3', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (7, '15', 'главная передача', '1', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (8, '15', 'главная передача', '2', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (9, '15', 'главная передача', '3', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (10, '20', 'вал отбора мощности', '3', NULL, NULL);


--
-- TOC entry 4645 (class 0 OID 19239)
-- Dependencies: 339
-- Data for Name: vehicleelectricmachinetypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleelectricmachinetypeclassifier VALUES (1, '01', 'электродвигатель электромобиля (электромашины)', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (2, '02', 'электродвигатель трансмиссии', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (3, '03', 'электрогенератор трансмиссии', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (4, '04', 'обратимая электромашина', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (5, '01', 'электродвигатель электромобиля (электромашины)', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (6, '01', 'электродвигатель электромобиля (электромашины)', '3', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (7, '02', 'электродвигатель трансмиссии', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (8, '02', 'электродвигатель трансмиссии', '3', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (9, '03', 'электрогенератор трансмиссии', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (10, '03', 'электрогенератор трансмиссии', '3', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (11, '04', 'обратимая электромашина', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (12, '04', 'обратимая электромашина', '3', NULL, NULL);


--
-- TOC entry 4647 (class 0 OID 19247)
-- Dependencies: 341
-- Data for Name: vehicleelectroniccertificateissuecauseclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (1, '01', 'изготовление транспортного средства (шасси транспортного средства, самоходной машины или другого вида техники)', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (2, '02', 'ввоз транспортного средства (шасси транспортного средства, самоходной машины или другого вида техники) на таможенную территорию Евразийского экономического союза из государства, не являющегося членом Евразийского экономического союза', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (3, '03', 'оформление электронного паспорта на транспортное средство (самоходную машину или другой вид техники), зарегистрированное органом регистрации', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (4, '04', 'оформление электронного паспорта на транспортное средство (шасси транспортного средства, самоходную машину или другой вид техники) на иных основаниях', NULL, NULL);


--
-- TOC entry 4649 (class 0 OID 19255)
-- Dependencies: 343
-- Data for Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (1, '01', 'оформление электронного паспорта транспортного средства (самоходной машины или другого вида техники), зарегистрированного органом регистрации до даты начала применения электронных паспортов', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (2, '02', 'оформление электронного паспорта на транспортные средства категорий L и M1 (в соответствии с приложением № 1 к техническому регламенту Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011)), с даты выпуска которых прошло 30 лет и более, а также категорий M2, M3 и N (в соответствии с приложением № 1 к техническому регламенту Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011)), которые не предназначены для коммерческих перевозок пассажиров и грузов, с даты выпуска которых прошло 50 лет и более, с оригинальными двигателем, кузовом и рамой (при наличии), сохраненных или отреставрированных до оригинального состояния', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (3, '03', 'ввоз транспортного средства на территорию государства – члена Евразийского экономического союза, в котором в отношении технического регламента Таможенного союза «О безопасности машин и оборудования» (ТР ТС 010/2011), технического регламента Таможенного союза «О безопасности колесных транспортных средств» (ТР ТС 018/2011) или технического регламента Таможенного союза «О безопасности сельскохозяйственных и лесохозяйственных тракторов и прицепов к ним» (ТР ТС 031/2012) не применяется первый абзац пункта 3 статьи 53 Договора о Евразийском экономическом союзе от 29 мая 2014 года и не истекли сроки переходных положений указанных технических регламентов, установленные Евразийской экономической комиссией для этого государства-члена', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (4, '04', 'ввоз на таможенную территорию Евразийского экономического союза транспортного средства, принадлежащего физическому лицу, являющемуся участником национальных государственных программ по оказанию содействия добровольному переселению лиц, проживающих за рубежом, либо признанному в установленном порядке беженцем или вынужденным переселенцем, а также членам его семьи', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (5, '05', 'ввоз на таможенную территорию Евразийского экономического союза транспортного средства, принадлежащего дипломатическим представительствам и консульским учреждениям, международным (межгосударственным) организациям, пользующимся привилегиями и иммунитетами в соответствии с общепризнанными принципами и нормами международного права, сотрудникам этих представительств (учреждений, организаций), а также членам их семей', NULL, NULL);


--
-- TOC entry 4651 (class 0 OID 19263)
-- Dependencies: 345
-- Data for Name: vehicleenvironmentalclassclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleenvironmentalclassclassifier VALUES (1, '00', 'экологический класс 0', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (2, '01', 'экологический класс 1', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (3, '02', 'экологический класс 2', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (4, '03', 'экологический класс 3', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (5, '04', 'экологический класс 4', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (6, '05', 'экологический класс 5', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (7, '06', 'экологический класс 6', NULL, NULL);


--
-- TOC entry 4653 (class 0 OID 19271)
-- Dependencies: 347
-- Data for Name: vehiclefueltypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclefueltypesclassifier VALUES (1, '01', 'бензин', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (2, '02', 'дизельное топливо', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (3, '03', 'компримированный природный газ', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (4, '04', 'сжиженный природный газ', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (5, '05', 'сжиженный пропан-бутан', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (6, '06', 'водородные топливные элементы', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (7, '99', 'прочее', NULL, NULL);


--
-- TOC entry 4655 (class 0 OID 19279)
-- Dependencies: 349
-- Data for Name: vehiclemanufacturertypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclemanufacturertypeclassifier VALUES (1, '05', 'изготовитель', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (2, '10', 'представитель изготовителя', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (3, '15', 'изготовитель – сборочный завод', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (4, '20', 'изготовитель – поставщик сборочных комплектов', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (5, '05', 'изготовитель', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (6, '05', 'изготовитель', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (7, '10', 'представитель изготовителя', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (8, '10', 'представитель изготовителя', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (9, '15', 'изготовитель – сборочный завод', '3', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (10, '15', 'изготовитель – сборочный завод', '3', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (11, '20', 'изготовитель – поставщик сборочных комплектов', '3', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (12, '20', 'изготовитель – поставщик сборочных комплектов', '3', NULL, NULL);


--
-- TOC entry 4657 (class 0 OID 19287)
-- Dependencies: 351
-- Data for Name: vehiclepassportissuerkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4659 (class 0 OID 19295)
-- Dependencies: 353
-- Data for Name: vehiclepropellertypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclepropellertypesclassifier VALUES (1, '05', 'колесный движитель', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (2, '10', 'гусеничный движитель', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (3, '15', 'полугусеничный движитель', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (4, '20', 'шагающий движитель', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (5, '25', 'шнекороторный движитель', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (6, '30', 'вальцовый движитель', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (7, '99', 'прочие типы движителя', NULL, NULL);


--
-- TOC entry 4661 (class 0 OID 19303)
-- Dependencies: 355
-- Data for Name: vehicleregistrationclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleregistrationclassifier VALUES (1, '05', 'постановка на учет', NULL, NULL);
INSERT INTO vehicleregistrationclassifier VALUES (2, '10', 'снятие с учета (прекращение регистрации)', NULL, NULL);


--
-- TOC entry 4663 (class 0 OID 19311)
-- Dependencies: 357
-- Data for Name: vehiclesuspensiontypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclesuspensiontypeclassifier VALUES (1, '01', 'передняя', NULL, NULL);
INSERT INTO vehiclesuspensiontypeclassifier VALUES (2, '02', 'задняя', NULL, NULL);


--
-- TOC entry 4665 (class 0 OID 19319)
-- Dependencies: 359
-- Data for Name: vehicletechnicalcertificatetypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicletechnicalcertificatetypesclassifier VALUES (1, '1', 'паспорт транспортного средства', 'паспорт транспортного средства', NULL, NULL);
INSERT INTO vehicletechnicalcertificatetypesclassifier VALUES (2, '2', 'паспорт шасси транспортного средства', 'паспорт шасси', NULL, NULL);
INSERT INTO vehicletechnicalcertificatetypesclassifier VALUES (3, '3', 'паспорт самоходной машины или другого вида техники', 'паспорт машины', NULL, NULL);


--
-- TOC entry 4667 (class 0 OID 19327)
-- Dependencies: 361
-- Data for Name: vehicleweighttypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleweighttypeclassifier VALUES (1, '10', 'масса транспортного средства (шасси транспортного средства) в снаряженном состоянии', 'снаряженная масса транспортного средства', 'определенная изготовителем масса комплектного транспортного средства с водителем без нагрузки. Масса включает не менее 90% топлива', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (2, '10', 'масса транспортного средства (шасси транспортного средства) в снаряженном состоянии', 'снаряженная масса транспортного средства', 'определенная изготовителем масса комплектного транспортного средства с водителем без нагрузки. Масса включает не менее 90% топлива', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (3, '10', 'масса транспортного средства (шасси транспортного средства) в снаряженном состоянии', 'снаряженная масса транспортного средства', 'определенная изготовителем масса комплектного транспортного средства с водителем без нагрузки. Масса включает не менее 90% топлива', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (4, '12', 'технически допустимая максимальная масса транспортного средства (шасси транспортного средства)', 'допустимая масса транспортного средства', 'установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (5, '12', 'технически допустимая максимальная масса транспортного средства (шасси транспортного средства)', 'допустимая масса транспортного средства', 'установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (6, '12', 'технически допустимая максимальная масса транспортного средства (шасси транспортного средства)', 'допустимая масса транспортного средства', 'установленная изготовителем максимальная масса транспортного средства со снаряжением, пассажирами и грузом, обусловленная его конструкцией и заданными характеристиками', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (7, '14', 'технически допустимая максимальная масса автопоезда', 'допустимая масса автопоезда', 'установленная изготовителем максимальная суммарная масса тягача и буксируемого им полуприцепа или прицепа (прицепов) со снаряжением, пассажирами и грузом', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (8, '14', 'технически допустимая максимальная масса автопоезда', 'допустимая масса автопоезда', 'установленная изготовителем максимальная суммарная масса тягача и буксируемого им полуприцепа или прицепа (прицепов) со снаряжением, пассажирами и грузом', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (9, '14', 'технически допустимая максимальная масса автопоезда', 'допустимая масса автопоезда', 'установленная изготовителем максимальная суммарная масса тягача и буксируемого им полуприцепа или прицепа (прицепов) со снаряжением, пассажирами и грузом', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (10, '20', 'технически допустимая общая масса самоходной машины (другого вида техники) и прицепа', 'допустимая масса самоходной машины', 'технически допустимая общая масса самоходной машины (другого вида техники) и прицепа (кг)', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (11, '20', 'технически допустимая общая масса самоходной машины (другого вида техники) и прицепа', 'допустимая масса самоходной машины', 'технически допустимая общая масса самоходной машины (другого вида техники) и прицепа (кг)', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (12, '20', 'технически допустимая общая масса самоходной машины (другого вида техники) и прицепа', 'допустимая масса самоходной машины', 'технически допустимая общая масса самоходной машины (другого вида техники) и прицепа (кг)', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (13, '22', 'полезная нагрузка самоходной машины (другого вида техники)', 'полезная нагрузка самоходной машины (другого вида техники)', 'полезная нагрузка самоходной машины (другого вида техники) (кг)', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (14, '22', 'полезная нагрузка самоходной машины (другого вида техники)', 'полезная нагрузка самоходной машины (другого вида техники)', 'полезная нагрузка самоходной машины (другого вида техники) (кг)', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (15, '22', 'полезная нагрузка самоходной машины (другого вида техники)', 'полезная нагрузка самоходной машины (другого вида техники)', 'полезная нагрузка самоходной машины (другого вида техники) (кг)', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (16, '24', 'снаряженная (эксплуатационная) масса самоходной машины (другого вида техники)', 'снаряженная масса самоходной машины (другого вида техники)', 'масса самоходной машины (другого вида техники) в рабочем состоянии (кг), включая устройство защиты при опрокидывании, охлаждающую жидкость, смазочные материалы, топливо (бак, наполненный не менее чем на 90 % номинальной вместимости), инструменты и оператора', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (17, '24', 'снаряженная (эксплуатационная) масса самоходной машины (другого вида техники)', 'снаряженная масса самоходной машины (другого вида техники)', 'масса самоходной машины (другого вида техники) в рабочем состоянии (кг), включая устройство защиты при опрокидывании, охлаждающую жидкость, смазочные материалы, топливо (бак, наполненный не менее чем на 90 % номинальной вместимости), инструменты и оператора', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (18, '24', 'снаряженная (эксплуатационная) масса самоходной машины (другого вида техники)', 'снаряженная масса самоходной машины (другого вида техники)', 'масса самоходной машины (другого вида техники) в рабочем состоянии (кг), включая устройство защиты при опрокидывании, охлаждающую жидкость, смазочные материалы, топливо (бак, наполненный не менее чем на 90 % номинальной вместимости), инструменты и оператора', '3', NULL, NULL);


--
-- TOC entry 4669 (class 0 OID 19335)
-- Dependencies: 363
-- Data for Name: waypointkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4671 (class 0 OID 19343)
-- Dependencies: 365
-- Data for Name: workinghourskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4762 (class 0 OID 0)
-- Dependencies: 198
-- Name: accreditationcertificatestatusclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('accreditationcertificatestatusclassifier_id_seq', 33, true);


--
-- TOC entry 4763 (class 0 OID 0)
-- Dependencies: 200
-- Name: additionalparamsforcustomsfeesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('additionalparamsforcustomsfeesclassifier_id_seq', 26, true);


--
-- TOC entry 4764 (class 0 OID 0)
-- Dependencies: 202
-- Name: addresskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('addresskindclassifier_id_seq', 3, true);


--
-- TOC entry 4765 (class 0 OID 0)
-- Dependencies: 204
-- Name: bankidentitykindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('bankidentitykindclassifier_id_seq', 1, false);


--
-- TOC entry 4766 (class 0 OID 0)
-- Dependencies: 206
-- Name: biologicalsexclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('biologicalsexclassifier_id_seq', 1, false);


--
-- TOC entry 4767 (class 0 OID 0)
-- Dependencies: 208
-- Name: brakingsystemtypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('brakingsystemtypeclassifier_id_seq', 10, true);


--
-- TOC entry 4768 (class 0 OID 0)
-- Dependencies: 210
-- Name: businessentitytypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('businessentitytypeclassifier_id_seq', 113, true);


--
-- TOC entry 4769 (class 0 OID 0)
-- Dependencies: 212
-- Name: businessentitytypecodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('businessentitytypecodeclassifier_id_seq', 113, true);


--
-- TOC entry 4770 (class 0 OID 0)
-- Dependencies: 214
-- Name: cargolocationclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('cargolocationclassifier_id_seq', 16, true);


--
-- TOC entry 4771 (class 0 OID 0)
-- Dependencies: 216
-- Name: cargopackagekindsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('cargopackagekindsclassifier_id_seq', 364, true);


--
-- TOC entry 4772 (class 0 OID 0)
-- Dependencies: 218
-- Name: certificatioorganizationkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('certificatioorganizationkindclassifier_id_seq', 1, false);


--
-- TOC entry 4773 (class 0 OID 0)
-- Dependencies: 220
-- Name: communicationchannelclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('communicationchannelclassifier_id_seq', 6, true);


--
-- TOC entry 4774 (class 0 OID 0)
-- Dependencies: 222
-- Name: conformityassessmentdocstypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('conformityassessmentdocstypesclassifier_id_seq', 10, true);


--
-- TOC entry 4775 (class 0 OID 0)
-- Dependencies: 224
-- Name: countriesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('countriesclassifier_id_seq', 249, true);


--
-- TOC entry 4776 (class 0 OID 0)
-- Dependencies: 226
-- Name: currencyclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('currencyclassifier_id_seq', 162, true);


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 228
-- Name: customcheckpointcctvplacementclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customcheckpointcctvplacementclassifier_id_seq', 1, false);


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 230
-- Name: customcheckpointcommchannelclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customcheckpointcommchannelclassifier_id_seq', 4, true);


--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 232
-- Name: customprocesskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customprocesskindclassifier_id_seq', 18, true);


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 234
-- Name: customsconclusionsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsconclusionsclassifier_id_seq', 8, true);


--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 236
-- Name: customsfeesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesclassifier_id_seq', 283, true);


--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 238
-- Name: customsfeesclassifierchapters_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesclassifierchapters_id_seq', 55, true);


--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 240
-- Name: customsfeesfeaturesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesfeaturesclassifier_id_seq', 11, true);


--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 242
-- Name: customsfeesguaranteemethodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesguaranteemethodsclassifier_id_seq', 1, false);


--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 244
-- Name: customsfeesmethodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesmethodsclassifier_id_seq', 10, true);


--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 246
-- Name: customstransitmovementofgoodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customstransitmovementofgoodsclassifier_id_seq', 5, true);


--
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 248
-- Name: customsvalueconclusionclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsvalueconclusionclassifier_id_seq', 3, true);


--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 250
-- Name: dataformatclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('dataformatclassifier_id_seq', 1, false);


--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 252
-- Name: declarationofgoodsfeaturesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('declarationofgoodsfeaturesclassifier_id_seq', 14, true);


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 254
-- Name: definingcustomsvaluemethodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('definingcustomsvaluemethodsclassifier_id_seq', 7, true);


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 256
-- Name: docstatstatusclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('docstatstatusclassifier_id_seq', 1, false);


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 258
-- Name: documentprocessingresultcodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('documentprocessingresultcodeclassifier_id_seq', 8, true);


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 260
-- Name: electronicvehicleandchassiscertificatestatusclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('electronicvehicleandchassiscertificatestatusclassifier_id_seq', 5, true);


--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 262
-- Name: exemptionsfromcustomsdutychapters_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('exemptionsfromcustomsdutychapters_id_seq', 72, true);


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 264
-- Name: exemptionsfromcustomsdutyclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('exemptionsfromcustomsdutyclassifier_id_seq', 333, true);


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 266
-- Name: featureofmovementofgoodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('featureofmovementofgoodsclassifier_id_seq', 1, false);


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 268
-- Name: govcontrolsystemandtechresourceskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('govcontrolsystemandtechresourceskindclassifier_id_seq', 1, false);


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 270
-- Name: govcontrolsystemkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('govcontrolsystemkindclassifier_id_seq', 1, false);


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 272
-- Name: govsupportsystemkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('govsupportsystemkindclassifier_id_seq', 1, false);


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 274
-- Name: incidentassessmentcodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('incidentassessmentcodeclassifier_id_seq', 101, true);


--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 276
-- Name: institutionaleconomysectorclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('institutionaleconomysectorclassifier_id_seq', 123, true);


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 278
-- Name: internatioanltransporttypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('internatioanltransporttypesclassifier_id_seq', 41, true);


--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 280
-- Name: issuersellerclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('issuersellerclassifier_id_seq', 3, true);


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 282
-- Name: kindidclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindidclassifier_id_seq', 7, true);


--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 284
-- Name: kindofdocumentsforcustomsdeclarationchapters_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindofdocumentsforcustomsdeclarationchapters_id_seq', 9, true);


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 286
-- Name: kindofdocumentsforcustomsdeclarationclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindofdocumentsforcustomsdeclarationclassifier_id_seq', 204, true);


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 288
-- Name: kindoftransportandtransportationgoodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindoftransportandtransportationgoodsclassifier_id_seq', 12, true);


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 290
-- Name: languagecodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('languagecodeclassifier_id_seq', 174, true);


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 292
-- Name: measurementunitclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('measurementunitclassifier_id_seq', 26, true);


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 294
-- Name: measurementunitcodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('measurementunitcodeclassifier_id_seq', 15, true);


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 296
-- Name: measuresensurecompliancecustomstransitprocedure_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('measuresensurecompliancecustomstransitprocedure_id_seq', 23, true);


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 298
-- Name: nsicountry_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('nsicountry_id_seq', 252, true);


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 300
-- Name: objectpassedcustomcheckpointclssifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('objectpassedcustomcheckpointclssifier_id_seq', 1, false);


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 302
-- Name: pharmaprodconsignmentlimitkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('pharmaprodconsignmentlimitkindclassifier_id_seq', 1, false);


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 304
-- Name: pharmaproductregistrationdocelementkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('pharmaproductregistrationdocelementkindclassifier_id_seq', 1, false);


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 306
-- Name: registrationproductdoccodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('registrationproductdoccodeclassifier_id_seq', 28, true);


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 308
-- Name: registrationproductfilecodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('registrationproductfilecodeclassifier_id_seq', 15, true);


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 310
-- Name: specialsimplificationtypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('specialsimplificationtypeclassifier_id_seq', 4, true);


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 312
-- Name: steeringwheelpositionclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('steeringwheelpositionclassifier_id_seq', 9, true);


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 314
-- Name: subjectsoflawclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('subjectsoflawclassifier_id_seq', 5, true);


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 316
-- Name: technicalobjectkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('technicalobjectkindclassifier_id_seq', 1, false);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 318
-- Name: termsofdeliveryclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('termsofdeliveryclassifier_id_seq', 16, true);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 320
-- Name: transactiontypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('transactiontypeclassifier_id_seq', 11, true);


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 322
-- Name: transportandfreightmodesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('transportandfreightmodesclassifier_id_seq', 12, true);


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 324
-- Name: userkindtimeadvincidentclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('userkindtimeadvincidentclassifier_id_seq', 3, true);


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 326
-- Name: vehiclebodycolorclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclebodycolorclassifier_id_seq', 10, true);


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 328
-- Name: vehiclebrandsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclebrandsclassifier_id_seq', 743, true);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 330
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecategorypereaeutechnicalregulationsclassifier_id_seq', 73, true);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 332
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq', 9, true);


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 334
-- Name: vehiclecatperelectrontechcertificateregistrationrulescla_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecatperelectrontechcertificateregistrationrulescla_id_seq', 10, true);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 336
-- Name: vehiclechassisclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclechassisclassifier_id_seq', 9, true);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 338
-- Name: vehiclecomponentschassistypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecomponentschassistypesclassifier_id_seq', 10, true);


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 340
-- Name: vehicleelectricmachinetypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleelectricmachinetypeclassifier_id_seq', 12, true);


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 342
-- Name: vehicleelectroniccertificateissuecauseclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleelectroniccertificateissuecauseclassifier_id_seq', 4, true);


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 344
-- Name: vehicleelectroniccertificateissuecausewodocumentationsub_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleelectroniccertificateissuecausewodocumentationsub_id_seq', 5, true);


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 346
-- Name: vehicleenvironmentalclassclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleenvironmentalclassclassifier_id_seq', 7, true);


--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 348
-- Name: vehiclefueltypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclefueltypesclassifier_id_seq', 7, true);


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 350
-- Name: vehiclemanufacturertypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclemanufacturertypeclassifier_id_seq', 12, true);


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 352
-- Name: vehiclepassportissuerkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclepassportissuerkindclassifier_id_seq', 1, false);


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 354
-- Name: vehiclepropellertypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclepropellertypesclassifier_id_seq', 7, true);


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 356
-- Name: vehicleregistrationclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleregistrationclassifier_id_seq', 2, true);


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 358
-- Name: vehiclesuspensiontypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclesuspensiontypeclassifier_id_seq', 2, true);


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 360
-- Name: vehicletechnicalcertificatetypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicletechnicalcertificatetypesclassifier_id_seq', 3, true);


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 362
-- Name: vehicleweighttypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleweighttypeclassifier_id_seq', 18, true);


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 364
-- Name: waypointkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('waypointkindclassifier_id_seq', 1, false);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 366
-- Name: workinghourskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('workinghourskindclassifier_id_seq', 1, false);


--
-- TOC entry 4213 (class 2606 OID 19437)
-- Name: accreditationcertificatestatusclassifier accreditationcertificatestatusclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY accreditationcertificatestatusclassifier
    ADD CONSTRAINT accreditationcertificatestatusclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4215 (class 2606 OID 19439)
-- Name: additionalparamsforcustomsfeesclassifier additionalparamsforcustomsfeesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY additionalparamsforcustomsfeesclassifier
    ADD CONSTRAINT additionalparamsforcustomsfeesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4217 (class 2606 OID 19441)
-- Name: addresskindclassifier addresskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY addresskindclassifier
    ADD CONSTRAINT addresskindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4219 (class 2606 OID 19443)
-- Name: bankidentitykindclassifier bankidentitykindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY bankidentitykindclassifier
    ADD CONSTRAINT bankidentitykindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4221 (class 2606 OID 19445)
-- Name: biologicalsexclassifier biologicalsexclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY biologicalsexclassifier
    ADD CONSTRAINT biologicalsexclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4223 (class 2606 OID 19447)
-- Name: brakingsystemtypeclassifier brakingsystemtypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY brakingsystemtypeclassifier
    ADD CONSTRAINT brakingsystemtypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4225 (class 2606 OID 19449)
-- Name: businessentitytypeclassifier businessentitytypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypeclassifier
    ADD CONSTRAINT businessentitytypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4227 (class 2606 OID 19451)
-- Name: businessentitytypecodeclassifier businessentitytypecodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypecodeclassifier
    ADD CONSTRAINT businessentitytypecodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4229 (class 2606 OID 19453)
-- Name: cargolocationclassifier cargolocationclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargolocationclassifier
    ADD CONSTRAINT cargolocationclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4231 (class 2606 OID 19455)
-- Name: cargopackagekindsclassifier cargopackagekindsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargopackagekindsclassifier
    ADD CONSTRAINT cargopackagekindsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4233 (class 2606 OID 19457)
-- Name: certificatioorganizationkindclassifier certificatioorganizationkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY certificatioorganizationkindclassifier
    ADD CONSTRAINT certificatioorganizationkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4235 (class 2606 OID 19459)
-- Name: communicationchannelclassifier communicationchannelclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY communicationchannelclassifier
    ADD CONSTRAINT communicationchannelclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4237 (class 2606 OID 19461)
-- Name: conformityassessmentdocstypesclassifier conformityassessmentdocstypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY conformityassessmentdocstypesclassifier
    ADD CONSTRAINT conformityassessmentdocstypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4239 (class 2606 OID 19463)
-- Name: countriesclassifier countriesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY countriesclassifier
    ADD CONSTRAINT countriesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4241 (class 2606 OID 19465)
-- Name: currencyclassifier currencyclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY currencyclassifier
    ADD CONSTRAINT currencyclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4243 (class 2606 OID 19467)
-- Name: customcheckpointcctvplacementclassifier customcheckpointcctvplacementclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcctvplacementclassifier
    ADD CONSTRAINT customcheckpointcctvplacementclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4245 (class 2606 OID 19469)
-- Name: customcheckpointcommchannelclassifier customcheckpointcommchannelclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcommchannelclassifier
    ADD CONSTRAINT customcheckpointcommchannelclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4247 (class 2606 OID 19471)
-- Name: customprocesskindclassifier customprocesskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customprocesskindclassifier
    ADD CONSTRAINT customprocesskindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4249 (class 2606 OID 19473)
-- Name: customsconclusionsclassifier customsconclusionsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsconclusionsclassifier
    ADD CONSTRAINT customsconclusionsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4251 (class 2606 OID 19475)
-- Name: customsfeesclassifier customsfeesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifier
    ADD CONSTRAINT customsfeesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4253 (class 2606 OID 19477)
-- Name: customsfeesclassifierchapters customsfeesclassifierchapters_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifierchapters
    ADD CONSTRAINT customsfeesclassifierchapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4255 (class 2606 OID 19479)
-- Name: customsfeesfeaturesclassifier customsfeesfeaturesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesfeaturesclassifier
    ADD CONSTRAINT customsfeesfeaturesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 19481)
-- Name: customsfeesguaranteemethodsclassifier customsfeesguaranteemethodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesguaranteemethodsclassifier
    ADD CONSTRAINT customsfeesguaranteemethodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4259 (class 2606 OID 19483)
-- Name: customsfeesmethodsclassifier customsfeesmethodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesmethodsclassifier
    ADD CONSTRAINT customsfeesmethodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4261 (class 2606 OID 19485)
-- Name: customstransitmovementofgoodsclassifier customstransitmovementofgoodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customstransitmovementofgoodsclassifier
    ADD CONSTRAINT customstransitmovementofgoodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4263 (class 2606 OID 19487)
-- Name: customsvalueconclusionclassifier customsvalueconclusionclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsvalueconclusionclassifier
    ADD CONSTRAINT customsvalueconclusionclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4265 (class 2606 OID 19489)
-- Name: dataformatclassifier dataformatclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY dataformatclassifier
    ADD CONSTRAINT dataformatclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4267 (class 2606 OID 19491)
-- Name: declarationofgoodsfeaturesclassifier declarationofgoodsfeaturesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY declarationofgoodsfeaturesclassifier
    ADD CONSTRAINT declarationofgoodsfeaturesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4269 (class 2606 OID 19493)
-- Name: definingcustomsvaluemethodsclassifier definingcustomsvaluemethodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY definingcustomsvaluemethodsclassifier
    ADD CONSTRAINT definingcustomsvaluemethodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4271 (class 2606 OID 19495)
-- Name: docstatstatusclassifier docstatstatusclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY docstatstatusclassifier
    ADD CONSTRAINT docstatstatusclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4273 (class 2606 OID 19497)
-- Name: documentprocessingresultcodeclassifier documentprocessingresultcodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY documentprocessingresultcodeclassifier
    ADD CONSTRAINT documentprocessingresultcodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4275 (class 2606 OID 19499)
-- Name: electronicvehicleandchassiscertificatestatusclassifier electronicvehicleandchassiscertificatestatusclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY electronicvehicleandchassiscertificatestatusclassifier
    ADD CONSTRAINT electronicvehicleandchassiscertificatestatusclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4277 (class 2606 OID 19501)
-- Name: exemptionsfromcustomsdutychapters exemptionsfromcustomsdutychapters_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutychapters
    ADD CONSTRAINT exemptionsfromcustomsdutychapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4279 (class 2606 OID 19503)
-- Name: exemptionsfromcustomsdutyclassifier exemptionsfromcustomsdutyclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutyclassifier
    ADD CONSTRAINT exemptionsfromcustomsdutyclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4281 (class 2606 OID 19505)
-- Name: featureofmovementofgoodsclassifier featureofmovementofgoodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY featureofmovementofgoodsclassifier
    ADD CONSTRAINT featureofmovementofgoodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4283 (class 2606 OID 19507)
-- Name: govcontrolsystemandtechresourceskindclassifier govcontrolsystemandtechresourceskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemandtechresourceskindclassifier
    ADD CONSTRAINT govcontrolsystemandtechresourceskindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4285 (class 2606 OID 19509)
-- Name: govcontrolsystemkindclassifier govcontrolsystemkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemkindclassifier
    ADD CONSTRAINT govcontrolsystemkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4287 (class 2606 OID 19511)
-- Name: govsupportsystemkindclassifier govsupportsystemkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govsupportsystemkindclassifier
    ADD CONSTRAINT govsupportsystemkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4289 (class 2606 OID 19513)
-- Name: incidentassessmentcodeclassifier incidentassessmentcodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY incidentassessmentcodeclassifier
    ADD CONSTRAINT incidentassessmentcodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4291 (class 2606 OID 19515)
-- Name: institutionaleconomysectorclassifier institutionaleconomysectorclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY institutionaleconomysectorclassifier
    ADD CONSTRAINT institutionaleconomysectorclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4293 (class 2606 OID 19517)
-- Name: internatioanltransporttypesclassifier internatioanltransporttypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY internatioanltransporttypesclassifier
    ADD CONSTRAINT internatioanltransporttypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4295 (class 2606 OID 19519)
-- Name: issuersellerclassifier issuersellerclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY issuersellerclassifier
    ADD CONSTRAINT issuersellerclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4297 (class 2606 OID 19521)
-- Name: kindidclassifier kindidclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindidclassifier
    ADD CONSTRAINT kindidclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4299 (class 2606 OID 19523)
-- Name: kindofdocumentsforcustomsdeclarationchapters kindofdocumentsforcustomsdeclarationchapters_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationchapters
    ADD CONSTRAINT kindofdocumentsforcustomsdeclarationchapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4301 (class 2606 OID 19525)
-- Name: kindofdocumentsforcustomsdeclarationclassifier kindofdocumentsforcustomsdeclarationclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationclassifier
    ADD CONSTRAINT kindofdocumentsforcustomsdeclarationclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4303 (class 2606 OID 19527)
-- Name: kindoftransportandtransportationgoodsclassifier kindoftransportandtransportationgoodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindoftransportandtransportationgoodsclassifier
    ADD CONSTRAINT kindoftransportandtransportationgoodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 19529)
-- Name: languagecodeclassifier languagecodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY languagecodeclassifier
    ADD CONSTRAINT languagecodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4307 (class 2606 OID 19531)
-- Name: measurementunitclassifier measurementunitclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitclassifier
    ADD CONSTRAINT measurementunitclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4309 (class 2606 OID 19533)
-- Name: measurementunitcodeclassifier measurementunitcodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitcodeclassifier
    ADD CONSTRAINT measurementunitcodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4311 (class 2606 OID 19535)
-- Name: measuresensurecompliancecustomstransitprocedure measuresensurecompliancecustomstransitprocedure_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measuresensurecompliancecustomstransitprocedure
    ADD CONSTRAINT measuresensurecompliancecustomstransitprocedure_pkey PRIMARY KEY (id);


--
-- TOC entry 4313 (class 2606 OID 19537)
-- Name: nsicountry nsicountry_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY nsicountry
    ADD CONSTRAINT nsicountry_pkey PRIMARY KEY (id);


--
-- TOC entry 4315 (class 2606 OID 19539)
-- Name: objectpassedcustomcheckpointclssifier objectpassedcustomcheckpointclssifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY objectpassedcustomcheckpointclssifier
    ADD CONSTRAINT objectpassedcustomcheckpointclssifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4317 (class 2606 OID 19541)
-- Name: pharmaprodconsignmentlimitkindclassifier pharmaprodconsignmentlimitkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaprodconsignmentlimitkindclassifier
    ADD CONSTRAINT pharmaprodconsignmentlimitkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4319 (class 2606 OID 19543)
-- Name: pharmaproductregistrationdocelementkindclassifier pharmaproductregistrationdocelementkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaproductregistrationdocelementkindclassifier
    ADD CONSTRAINT pharmaproductregistrationdocelementkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4321 (class 2606 OID 19545)
-- Name: registrationproductdoccodeclassifier registrationproductdoccodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductdoccodeclassifier
    ADD CONSTRAINT registrationproductdoccodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4323 (class 2606 OID 19547)
-- Name: registrationproductfilecodeclassifier registrationproductfilecodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductfilecodeclassifier
    ADD CONSTRAINT registrationproductfilecodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4325 (class 2606 OID 19549)
-- Name: specialsimplificationtypeclassifier specialsimplificationtypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY specialsimplificationtypeclassifier
    ADD CONSTRAINT specialsimplificationtypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4327 (class 2606 OID 19551)
-- Name: steeringwheelpositionclassifier steeringwheelpositionclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY steeringwheelpositionclassifier
    ADD CONSTRAINT steeringwheelpositionclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4329 (class 2606 OID 19553)
-- Name: subjectsoflawclassifier subjectsoflawclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY subjectsoflawclassifier
    ADD CONSTRAINT subjectsoflawclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4331 (class 2606 OID 19555)
-- Name: technicalobjectkindclassifier technicalobjectkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY technicalobjectkindclassifier
    ADD CONSTRAINT technicalobjectkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4333 (class 2606 OID 19557)
-- Name: termsofdeliveryclassifier termsofdeliveryclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY termsofdeliveryclassifier
    ADD CONSTRAINT termsofdeliveryclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4335 (class 2606 OID 19559)
-- Name: transactiontypeclassifier transactiontypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transactiontypeclassifier
    ADD CONSTRAINT transactiontypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 19561)
-- Name: transportandfreightmodesclassifier transportandfreightmodesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transportandfreightmodesclassifier
    ADD CONSTRAINT transportandfreightmodesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4339 (class 2606 OID 19563)
-- Name: userkindtimeadvincidentclassifier userkindtimeadvincidentclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY userkindtimeadvincidentclassifier
    ADD CONSTRAINT userkindtimeadvincidentclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4341 (class 2606 OID 19565)
-- Name: vehiclebodycolorclassifier vehiclebodycolorclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebodycolorclassifier
    ADD CONSTRAINT vehiclebodycolorclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4343 (class 2606 OID 19567)
-- Name: vehiclebrandsclassifier vehiclebrandsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebrandsclassifier
    ADD CONSTRAINT vehiclebrandsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4345 (class 2606 OID 19569)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier vehiclecategorypereaeutechnicalregulationsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategorypereaeutechnicalregulationsclassifier
    ADD CONSTRAINT vehiclecategorypereaeutechnicalregulationsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 19571)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifier vehiclecategoryperviennaconventiononroadtrafficclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategoryperviennaconventiononroadtrafficclassifier
    ADD CONSTRAINT vehiclecategoryperviennaconventiononroadtrafficclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4349 (class 2606 OID 19573)
-- Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier vehiclecatperelectrontechcertificateregistrationrulesclass_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecatperelectrontechcertificateregistrationrulesclassifier
    ADD CONSTRAINT vehiclecatperelectrontechcertificateregistrationrulesclass_pkey PRIMARY KEY (id);


--
-- TOC entry 4351 (class 2606 OID 19575)
-- Name: vehiclechassisclassifier vehiclechassisclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclechassisclassifier
    ADD CONSTRAINT vehiclechassisclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4353 (class 2606 OID 19577)
-- Name: vehiclecomponentschassistypesclassifier vehiclecomponentschassistypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecomponentschassistypesclassifier
    ADD CONSTRAINT vehiclecomponentschassistypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4355 (class 2606 OID 19579)
-- Name: vehicleelectricmachinetypeclassifier vehicleelectricmachinetypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectricmachinetypeclassifier
    ADD CONSTRAINT vehicleelectricmachinetypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4357 (class 2606 OID 19581)
-- Name: vehicleelectroniccertificateissuecauseclassifier vehicleelectroniccertificateissuecauseclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecauseclassifier
    ADD CONSTRAINT vehicleelectroniccertificateissuecauseclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4359 (class 2606 OID 19583)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia vehicleelectroniccertificateissuecausewodocumentationsubst_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecausewodocumentationsubstantia
    ADD CONSTRAINT vehicleelectroniccertificateissuecausewodocumentationsubst_pkey PRIMARY KEY (id);


--
-- TOC entry 4361 (class 2606 OID 19585)
-- Name: vehicleenvironmentalclassclassifier vehicleenvironmentalclassclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleenvironmentalclassclassifier
    ADD CONSTRAINT vehicleenvironmentalclassclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4363 (class 2606 OID 19587)
-- Name: vehiclefueltypesclassifier vehiclefueltypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclefueltypesclassifier
    ADD CONSTRAINT vehiclefueltypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4365 (class 2606 OID 19589)
-- Name: vehiclemanufacturertypeclassifier vehiclemanufacturertypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclemanufacturertypeclassifier
    ADD CONSTRAINT vehiclemanufacturertypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4367 (class 2606 OID 19591)
-- Name: vehiclepassportissuerkindclassifier vehiclepassportissuerkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepassportissuerkindclassifier
    ADD CONSTRAINT vehiclepassportissuerkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4369 (class 2606 OID 19593)
-- Name: vehiclepropellertypesclassifier vehiclepropellertypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepropellertypesclassifier
    ADD CONSTRAINT vehiclepropellertypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4371 (class 2606 OID 19595)
-- Name: vehicleregistrationclassifier vehicleregistrationclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleregistrationclassifier
    ADD CONSTRAINT vehicleregistrationclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4373 (class 2606 OID 19597)
-- Name: vehiclesuspensiontypeclassifier vehiclesuspensiontypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclesuspensiontypeclassifier
    ADD CONSTRAINT vehiclesuspensiontypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4375 (class 2606 OID 19599)
-- Name: vehicletechnicalcertificatetypesclassifier vehicletechnicalcertificatetypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicletechnicalcertificatetypesclassifier
    ADD CONSTRAINT vehicletechnicalcertificatetypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4377 (class 2606 OID 19601)
-- Name: vehicleweighttypeclassifier vehicleweighttypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleweighttypeclassifier
    ADD CONSTRAINT vehicleweighttypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4379 (class 2606 OID 19603)
-- Name: waypointkindclassifier waypointkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY waypointkindclassifier
    ADD CONSTRAINT waypointkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4381 (class 2606 OID 19605)
-- Name: workinghourskindclassifier workinghourskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY workinghourskindclassifier
    ADD CONSTRAINT workinghourskindclassifier_pkey PRIMARY KEY (id);


-- Completed on 2018-09-18 11:02:55

--
-- PostgreSQL database dump complete
--

