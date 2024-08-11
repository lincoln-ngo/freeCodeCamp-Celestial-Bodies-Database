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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    local_group boolean,
    galaxy_type_id integer NOT NULL,
    visible_with_naked_eye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    diameter numeric,
    has_atmosphere boolean,
    orbital_period_days numeric,
    planet_id integer,
    planet character varying
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_sun numeric,
    length_of_year numeric,
    habitable_zone boolean,
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    galaxy character varying,
    star_type character varying,
    year_of_discovery integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, true, 1, false);
INSERT INTO public.galaxy VALUES ('Cigar', 3, false, 1, false);
INSERT INTO public.galaxy VALUES ('Sombrero', 5, false, 4, false);
INSERT INTO public.galaxy VALUES ('Whirlpool', 6, false, 1, false);
INSERT INTO public.galaxy VALUES ('Triangulum', 4, true, 1, false);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, true, 1, true);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'flat, rotating disks with spiral arms');
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 'smooth, oval shapes');
INSERT INTO public.galaxy_type VALUES (3, 'active', 'extremely bright centres');
INSERT INTO public.galaxy_type VALUES (4, 'lenticular', 'transitional type between spiral and elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, false, 27.3, 3, 'Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 22, false, 0.32, 4, 'Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 12.6, false, 1.26, 4, 'Mars');
INSERT INTO public.moon VALUES (4, 'Titan', 5150, true, 15.95, 6, 'Saturn');
INSERT INTO public.moon VALUES (5, 'Enceladus', 504, true, 1.37, 6, 'Saturn');
INSERT INTO public.moon VALUES (6, 'Hyperion', 270, false, 21.28, 6, 'Saturn');
INSERT INTO public.moon VALUES (7, 'Prometheus', 147, false, 0.63, 6, 'Saturn');
INSERT INTO public.moon VALUES (8, 'Pandora', 84, false, 0.63, 6, 'Saturn');
INSERT INTO public.moon VALUES (9, 'Ganymede', 5262, true, 7.15, 5, 'Jupiter');
INSERT INTO public.moon VALUES (10, 'Callisto', 4820, true, 16.69, 5, 'Jupiter');
INSERT INTO public.moon VALUES (11, 'Io', 3643, true, 1.77, 5, 'Jupiter');
INSERT INTO public.moon VALUES (12, 'Europa', 3122, true, 3.55, 5, 'Jupiter');
INSERT INTO public.moon VALUES (13, 'Miranda', 472, false, 1.41, 7, 'Uranus');
INSERT INTO public.moon VALUES (14, 'Ariel', 1158, false, 2.52, 7, 'Uranus');
INSERT INTO public.moon VALUES (15, 'Umbriel', 1169, false, 4.14, 7, 'Uranus');
INSERT INTO public.moon VALUES (16, 'Titania', 1578, false, 8.71, 7, 'Uranus');
INSERT INTO public.moon VALUES (17, 'Oberon', 1523, false, 13.46, 7, 'Uranus');
INSERT INTO public.moon VALUES (18, 'Triton', 2707, true, 5.88, 8, 'Neptune');
INSERT INTO public.moon VALUES (19, 'Despina', 150, false, 0.33, 8, 'Neptune');
INSERT INTO public.moon VALUES (20, 'Galatea', 204, false, 0.41, 8, 'Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 150, 365, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108, 225, true, 1, 0);
INSERT INTO public.planet VALUES (1, 'Mercury', 58, 88, false, 1, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 228, 687, true, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 779, 4333, false, 1, 95);
INSERT INTO public.planet VALUES (7, 'Uranus', 2873, 30687, false, 1, 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 4495, 60190, false, 1, 16);
INSERT INTO public.planet VALUES (6, 'Saturn', 1434, 10759, false, 1, 146);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 127.5, 289, true, 2, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 156, 385, true, 3, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-16b', 105, 229, false, 4, NULL);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 3.2, 1.1, false, 5, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Milky Way', 'G-type main sequence', NULL);
INSERT INTO public.star VALUES (2, 'Kepler-22', 1, 'Milky Way', 'G-type main sequence', 2011);
INSERT INTO public.star VALUES (3, 'Kepler-452', 1, 'Milky Way', 'G-type main sequence', 2015);
INSERT INTO public.star VALUES (4, 'Kepler-16', 1, 'Milky Way', 'Binary', 2011);
INSERT INTO public.star VALUES (5, 'WASP-12', 1, 'Milky Way', 'F-type main sequence', 2008);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'Milky Way', 'Blue supergiant', NULL);


--
-- Name: galaxy_type galaxy_id_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_id_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_fk FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- PostgreSQL database dump complete
--

