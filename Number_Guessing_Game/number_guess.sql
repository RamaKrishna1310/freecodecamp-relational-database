--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: game_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_info (
    game_score integer NOT NULL,
    user_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.game_info OWNER TO freecodecamp;

--
-- Name: game_info_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_info_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_info_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_info_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_info_game_id_seq OWNED BY public.game_info.game_id;


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: game_info game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info ALTER COLUMN game_id SET DEFAULT nextval('public.game_info_game_id_seq'::regclass);


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: game_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_info VALUES (12, 20, 1);
INSERT INTO public.game_info VALUES (861, 21, 2);
INSERT INTO public.game_info VALUES (309, 21, 3);
INSERT INTO public.game_info VALUES (688, 22, 4);
INSERT INTO public.game_info VALUES (984, 22, 5);
INSERT INTO public.game_info VALUES (691, 21, 6);
INSERT INTO public.game_info VALUES (926, 21, 7);
INSERT INTO public.game_info VALUES (788, 21, 8);
INSERT INTO public.game_info VALUES (13, 20, 9);
INSERT INTO public.game_info VALUES (14, 20, 10);
INSERT INTO public.game_info VALUES (961, 23, 11);
INSERT INTO public.game_info VALUES (710, 23, 12);
INSERT INTO public.game_info VALUES (100, 24, 13);
INSERT INTO public.game_info VALUES (516, 24, 14);
INSERT INTO public.game_info VALUES (128, 23, 15);
INSERT INTO public.game_info VALUES (695, 23, 16);
INSERT INTO public.game_info VALUES (869, 23, 17);
INSERT INTO public.game_info VALUES (347, 25, 18);
INSERT INTO public.game_info VALUES (125, 25, 19);
INSERT INTO public.game_info VALUES (280, 26, 20);
INSERT INTO public.game_info VALUES (960, 26, 21);
INSERT INTO public.game_info VALUES (968, 25, 22);
INSERT INTO public.game_info VALUES (337, 25, 23);
INSERT INTO public.game_info VALUES (533, 25, 24);
INSERT INTO public.game_info VALUES (328, 27, 25);
INSERT INTO public.game_info VALUES (525, 27, 26);
INSERT INTO public.game_info VALUES (717, 28, 27);
INSERT INTO public.game_info VALUES (426, 28, 28);
INSERT INTO public.game_info VALUES (404, 27, 29);
INSERT INTO public.game_info VALUES (223, 27, 30);
INSERT INTO public.game_info VALUES (471, 27, 31);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (20, 'Me');
INSERT INTO public.user_info VALUES (21, 'user_1738067261217');
INSERT INTO public.user_info VALUES (22, 'user_1738067261216');
INSERT INTO public.user_info VALUES (23, 'user_1738067746986');
INSERT INTO public.user_info VALUES (24, 'user_1738067746985');
INSERT INTO public.user_info VALUES (25, 'user_1738067757488');
INSERT INTO public.user_info VALUES (26, 'user_1738067757487');
INSERT INTO public.user_info VALUES (27, 'user_1738068349819');
INSERT INTO public.user_info VALUES (28, 'user_1738068349818');


--
-- Name: game_info_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_info_game_id_seq', 31, true);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 28, true);


--
-- Name: game_info game_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_pkey PRIMARY KEY (game_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: user_info user_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_username_key UNIQUE (user_name);


--
-- Name: game_info game_info_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id);


--
-- PostgreSQL database dump complete
--

