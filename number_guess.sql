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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    best_guess integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    frequent_games integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (44, 24, 828);
INSERT INTO public.games VALUES (45, 24, 33);
INSERT INTO public.games VALUES (46, 25, 783);
INSERT INTO public.games VALUES (47, 25, 706);
INSERT INTO public.games VALUES (48, 24, 966);
INSERT INTO public.games VALUES (49, 24, 508);
INSERT INTO public.games VALUES (50, 24, 811);
INSERT INTO public.games VALUES (51, 23, 10);
INSERT INTO public.games VALUES (52, 26, 751);
INSERT INTO public.games VALUES (53, 26, 17);
INSERT INTO public.games VALUES (54, 27, 551);
INSERT INTO public.games VALUES (55, 27, 478);
INSERT INTO public.games VALUES (56, 26, 895);
INSERT INTO public.games VALUES (57, 26, 50);
INSERT INTO public.games VALUES (58, 26, 958);
INSERT INTO public.games VALUES (59, 28, 772);
INSERT INTO public.games VALUES (60, 28, 353);
INSERT INTO public.games VALUES (61, 29, 3);
INSERT INTO public.games VALUES (62, 29, 289);
INSERT INTO public.games VALUES (63, 28, 262);
INSERT INTO public.games VALUES (64, 28, 506);
INSERT INTO public.games VALUES (65, 28, 331);
INSERT INTO public.games VALUES (66, 30, 916);
INSERT INTO public.games VALUES (67, 30, 33);
INSERT INTO public.games VALUES (68, 31, 20);
INSERT INTO public.games VALUES (69, 31, 917);
INSERT INTO public.games VALUES (70, 30, 30);
INSERT INTO public.games VALUES (71, 30, 613);
INSERT INTO public.games VALUES (72, 30, 337);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (25, 'user_1712318860057', 2);
INSERT INTO public.users VALUES (24, 'user_1712318860058', 5);
INSERT INTO public.users VALUES (23, 'ola', 2);
INSERT INTO public.users VALUES (27, 'user_1712319048602', 2);
INSERT INTO public.users VALUES (26, 'user_1712319048603', 5);
INSERT INTO public.users VALUES (29, 'user_1712319110546', 2);
INSERT INTO public.users VALUES (28, 'user_1712319110547', 5);
INSERT INTO public.users VALUES (31, 'user_1712319134727', 2);
INSERT INTO public.users VALUES (30, 'user_1712319134728', 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 72, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

