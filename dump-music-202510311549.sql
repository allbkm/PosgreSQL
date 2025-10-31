--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-10-31 15:49:06 +04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 18106)
-- Name: album_performers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album_performers (
    albumid integer NOT NULL,
    performerid integer NOT NULL
);


ALTER TABLE public.album_performers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18100)
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    albumid integer NOT NULL,
    name character varying(300) NOT NULL,
    year integer
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18099)
-- Name: albums_albumid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_albumid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.albums_albumid_seq OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 222
-- Name: albums_albumid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_albumid_seq OWNED BY public.albums.albumid;


--
-- TOC entry 229 (class 1259 OID 18144)
-- Name: compilation_tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compilation_tracks (
    compilationid integer NOT NULL,
    trackid integer NOT NULL
);


ALTER TABLE public.compilation_tracks OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18137)
-- Name: compilations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compilations (
    compilationid integer NOT NULL,
    name character varying(300) NOT NULL,
    release_year integer,
    CONSTRAINT compilations_release_year_check CHECK ((release_year >= 1900))
);


ALTER TABLE public.compilations OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18136)
-- Name: compilations_compilationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compilations_compilationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compilations_compilationid_seq OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 227
-- Name: compilations_compilationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compilations_compilationid_seq OWNED BY public.compilations.compilationid;


--
-- TOC entry 218 (class 1259 OID 18069)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genreid integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18068)
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_genreid_seq OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 217
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- TOC entry 221 (class 1259 OID 18084)
-- Name: performer_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performer_genres (
    performerid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE public.performer_genres OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18078)
-- Name: performers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performers (
    performerid integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.performers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18077)
-- Name: performers_performerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.performers_performerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.performers_performerid_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 219
-- Name: performers_performerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.performers_performerid_seq OWNED BY public.performers.performerid;


--
-- TOC entry 226 (class 1259 OID 18122)
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    trackid integer NOT NULL,
    name character varying(500) NOT NULL,
    albumid integer NOT NULL,
    duration integer,
    CONSTRAINT tracks_duration_check CHECK ((duration > 0))
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18121)
-- Name: tracks_trackid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_trackid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tracks_trackid_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 225
-- Name: tracks_trackid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_trackid_seq OWNED BY public.tracks.trackid;


--
-- TOC entry 3310 (class 2604 OID 18103)
-- Name: albums albumid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN albumid SET DEFAULT nextval('public.albums_albumid_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 18140)
-- Name: compilations compilationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilations ALTER COLUMN compilationid SET DEFAULT nextval('public.compilations_compilationid_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 18072)
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 18081)
-- Name: performers performerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers ALTER COLUMN performerid SET DEFAULT nextval('public.performers_performerid_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 18125)
-- Name: tracks trackid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN trackid SET DEFAULT nextval('public.tracks_trackid_seq'::regclass);


--
-- TOC entry 3492 (class 0 OID 18106)
-- Dependencies: 224
-- Data for Name: album_performers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album_performers (albumid, performerid) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	3
\.


--
-- TOC entry 3491 (class 0 OID 18100)
-- Dependencies: 223
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (albumid, name, year) FROM stdin;
1	Альбом_1	1990
2	Альбом_2	2005
3	Альбом_3	2020
4	Альбом_4	2010
5	Альбом_5	2019
6	Альбом_6	2018
7	Альбом_7	2020
\.


--
-- TOC entry 3497 (class 0 OID 18144)
-- Dependencies: 229
-- Data for Name: compilation_tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compilation_tracks (compilationid, trackid) FROM stdin;
1	7
2	2
5	3
4	4
5	5
6	6
5	1
\.


--
-- TOC entry 3496 (class 0 OID 18137)
-- Dependencies: 228
-- Data for Name: compilations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compilations (compilationid, name, release_year) FROM stdin;
1	Сборник_1	2014
2	Сборник_2	2018
3	Сборник_3	2016
4	Сборник_4	2019
5	Сборник_5	2020
6	Сборник_6	2019
\.


--
-- TOC entry 3486 (class 0 OID 18069)
-- Dependencies: 218
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (genreid, name) FROM stdin;
1	Рок
2	Блюз
3	Джаз
\.


--
-- TOC entry 3489 (class 0 OID 18084)
-- Dependencies: 221
-- Data for Name: performer_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.performer_genres (performerid, genreid) FROM stdin;
1	1
2	2
3	3
4	1
5	2
6	3
\.


--
-- TOC entry 3488 (class 0 OID 18078)
-- Dependencies: 220
-- Data for Name: performers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.performers (performerid, name) FROM stdin;
1	Александр Копытов
2	Виктор Цой
3	Игорь Дакота
4	Евгений Маргулис
5	Bob
6	Jhon
\.


--
-- TOC entry 3494 (class 0 OID 18122)
-- Dependencies: 226
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (trackid, name, albumid, duration) FROM stdin;
1	Track_1	1	3
2	Track_2	2	2
3	Track_3	3	4
4	Track_4	4	5
5	Track_5	1	2
6	Track_6	2	4
7	My Word	3	5
\.


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 222
-- Name: albums_albumid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_albumid_seq', 1, false);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 227
-- Name: compilations_compilationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compilations_compilationid_seq', 1, false);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 217
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genreid_seq', 1, false);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 219
-- Name: performers_performerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.performers_performerid_seq', 1, false);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 225
-- Name: tracks_trackid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_trackid_seq', 1, false);


--
-- TOC entry 3326 (class 2606 OID 18110)
-- Name: album_performers album_performers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_performers
    ADD CONSTRAINT album_performers_pkey PRIMARY KEY (albumid, performerid);


--
-- TOC entry 3324 (class 2606 OID 18105)
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (albumid);


--
-- TOC entry 3332 (class 2606 OID 18148)
-- Name: compilation_tracks compilation_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_tracks
    ADD CONSTRAINT compilation_tracks_pkey PRIMARY KEY (compilationid, trackid);


--
-- TOC entry 3330 (class 2606 OID 18143)
-- Name: compilations compilations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilations
    ADD CONSTRAINT compilations_pkey PRIMARY KEY (compilationid);


--
-- TOC entry 3316 (class 2606 OID 18076)
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- TOC entry 3318 (class 2606 OID 18074)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 3322 (class 2606 OID 18088)
-- Name: performer_genres performer_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performer_genres
    ADD CONSTRAINT performer_genres_pkey PRIMARY KEY (performerid, genreid);


--
-- TOC entry 3320 (class 2606 OID 18083)
-- Name: performers performers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_pkey PRIMARY KEY (performerid);


--
-- TOC entry 3328 (class 2606 OID 18130)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (trackid);


--
-- TOC entry 3335 (class 2606 OID 18111)
-- Name: album_performers album_performers_albumid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_performers
    ADD CONSTRAINT album_performers_albumid_fkey FOREIGN KEY (albumid) REFERENCES public.albums(albumid) ON DELETE CASCADE;


--
-- TOC entry 3336 (class 2606 OID 18116)
-- Name: album_performers album_performers_performerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_performers
    ADD CONSTRAINT album_performers_performerid_fkey FOREIGN KEY (performerid) REFERENCES public.performers(performerid) ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 18149)
-- Name: compilation_tracks compilation_tracks_compilationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_tracks
    ADD CONSTRAINT compilation_tracks_compilationid_fkey FOREIGN KEY (compilationid) REFERENCES public.compilations(compilationid) ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 18154)
-- Name: compilation_tracks compilation_tracks_trackid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_tracks
    ADD CONSTRAINT compilation_tracks_trackid_fkey FOREIGN KEY (trackid) REFERENCES public.tracks(trackid) ON DELETE CASCADE;


--
-- TOC entry 3333 (class 2606 OID 18094)
-- Name: performer_genres performer_genres_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performer_genres
    ADD CONSTRAINT performer_genres_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(genreid) ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 18089)
-- Name: performer_genres performer_genres_performerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performer_genres
    ADD CONSTRAINT performer_genres_performerid_fkey FOREIGN KEY (performerid) REFERENCES public.performers(performerid) ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 18131)
-- Name: tracks tracks_albumid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_albumid_fkey FOREIGN KEY (albumid) REFERENCES public.albums(albumid) ON DELETE CASCADE;


-- Completed on 2025-10-31 15:49:06 +04

--
-- PostgreSQL database dump complete
--

