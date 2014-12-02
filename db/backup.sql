--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bills; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE bills (
    id integer NOT NULL,
    bill_id character varying(255),
    bill_uri character varying(255),
    title character varying(255),
    sponsor_uri character varying(255),
    introduced_date date,
    cosponsors character varying(255),
    committees character varying(255),
    latest_major_action_date date,
    latest_major_action text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    body text,
    summary text
);


ALTER TABLE public.bills OWNER TO frank;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: frank
--

CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_id_seq OWNER TO frank;

--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frank
--

ALTER SEQUENCE bills_id_seq OWNED BY bills.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE districts (
    id integer NOT NULL,
    state character varying(255),
    district_number character varying(255),
    zip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.districts OWNER TO frank;

--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: frank
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_id_seq OWNER TO frank;

--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frank
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- Name: rep_votes; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE rep_votes (
    id integer NOT NULL,
    rep_id integer,
    bill_id integer,
    vote character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rep_votes OWNER TO frank;

--
-- Name: rep_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: frank
--

CREATE SEQUENCE rep_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rep_votes_id_seq OWNER TO frank;

--
-- Name: rep_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frank
--

ALTER SEQUENCE rep_votes_id_seq OWNED BY rep_votes.id;


--
-- Name: reps; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE reps (
    id integer NOT NULL,
    nyt_id character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    rep_url character varying(255),
    role character varying(255),
    gender character varying(255),
    party character varying(255),
    twitter_id character varying(255),
    youtube_id character varying(255),
    seniority integer,
    next_election date,
    govtrack_id character varying(255),
    state character varying(255),
    district_number character varying(255),
    start_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.reps OWNER TO frank;

--
-- Name: reps_id_seq; Type: SEQUENCE; Schema: public; Owner: frank
--

CREATE SEQUENCE reps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reps_id_seq OWNER TO frank;

--
-- Name: reps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frank
--

ALTER SEQUENCE reps_id_seq OWNED BY reps.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO frank;

--
-- Name: user_polls; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE user_polls (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    bill_id integer,
    user_zip character varying(255),
    user_vote character varying(255)
);


ALTER TABLE public.user_polls OWNER TO frank;

--
-- Name: user_polls_id_seq; Type: SEQUENCE; Schema: public; Owner: frank
--

CREATE SEQUENCE user_polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_polls_id_seq OWNER TO frank;

--
-- Name: user_polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frank
--

ALTER SEQUENCE user_polls_id_seq OWNED BY user_polls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: frank; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    zip integer
);


ALTER TABLE public.users OWNER TO frank;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: frank
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO frank;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frank
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frank
--

ALTER TABLE ONLY bills ALTER COLUMN id SET DEFAULT nextval('bills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frank
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frank
--

ALTER TABLE ONLY rep_votes ALTER COLUMN id SET DEFAULT nextval('rep_votes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frank
--

ALTER TABLE ONLY reps ALTER COLUMN id SET DEFAULT nextval('reps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frank
--

ALTER TABLE ONLY user_polls ALTER COLUMN id SET DEFAULT nextval('user_polls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frank
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY bills (id, bill_id, bill_uri, title, sponsor_uri, introduced_date, cosponsors, committees, latest_major_action_date, latest_major_action, created_at, updated_at, body, summary) FROM stdin;
\.


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frank
--

SELECT pg_catalog.setval('bills_id_seq', 1, false);


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY districts (id, state, district_number, zip, created_at, updated_at) FROM stdin;
\.


--
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frank
--

SELECT pg_catalog.setval('districts_id_seq', 1, false);


--
-- Data for Name: rep_votes; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY rep_votes (id, rep_id, bill_id, vote, created_at, updated_at) FROM stdin;
\.


--
-- Name: rep_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frank
--

SELECT pg_catalog.setval('rep_votes_id_seq', 1, false);


--
-- Data for Name: reps; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY reps (id, nyt_id, first_name, last_name, rep_url, role, gender, party, twitter_id, youtube_id, seniority, next_election, govtrack_id, state, district_number, start_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: reps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frank
--

SELECT pg_catalog.setval('reps_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY schema_migrations (version) FROM stdin;
20141018222810
20141018223832
20141020184139
20141024011126
20141104015355
20141107163247
20141108171243
20141108203239
20141108205653
20141120015924
20141122210117
\.


--
-- Data for Name: user_polls; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY user_polls (id, created_at, updated_at, user_id, bill_id, user_zip, user_vote) FROM stdin;
\.


--
-- Name: user_polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frank
--

SELECT pg_catalog.setval('user_polls_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: frank
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, zip) FROM stdin;
1	fv42wid@yahoo.com	$2a$10$SUw93fHKnwcIx1SVTrqO/uzbOMDvbqZv682pHSUh0QrJFNwmJHJha	\N	\N	\N	1	2014-11-28 04:22:32.395467	2014-11-28 04:22:32.395467	127.0.0.1	127.0.0.1	2014-11-28 04:22:32.3624	2014-11-28 04:22:32.397647	19063
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frank
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: bills_pkey; Type: CONSTRAINT; Schema: public; Owner: frank; Tablespace: 
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: frank; Tablespace: 
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: rep_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: frank; Tablespace: 
--

ALTER TABLE ONLY rep_votes
    ADD CONSTRAINT rep_votes_pkey PRIMARY KEY (id);


--
-- Name: reps_pkey; Type: CONSTRAINT; Schema: public; Owner: frank; Tablespace: 
--

ALTER TABLE ONLY reps
    ADD CONSTRAINT reps_pkey PRIMARY KEY (id);


--
-- Name: user_polls_pkey; Type: CONSTRAINT; Schema: public; Owner: frank; Tablespace: 
--

ALTER TABLE ONLY user_polls
    ADD CONSTRAINT user_polls_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: frank; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: frank; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: frank; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: frank; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

