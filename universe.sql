--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    meaning text NOT NULL,
    genitive character varying(20) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    constellation_family character varying(20) NOT NULL,
    hemisphere character varying(20) NOT NULL,
    stars_with_planets integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_seen_with_naked_eye boolean NOT NULL,
    type character varying(20) NOT NULL,
    number_of_stars_in_billion integer NOT NULL,
    origin_of_name text NOT NULL,
    constellation_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_planet_in_km bigint NOT NULL,
    orbital_period_in_days integer,
    orbital_velocity_in_km_per_second numeric(4,2),
    eccentricity_of_orbit numeric(4,3),
    magnitude numeric(4,2) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_exoplanet boolean NOT NULL,
    planet_type character varying(20) NOT NULL,
    orbital_radius_in_au numeric(4,2) NOT NULL,
    orbital_period_in_days integer NOT NULL,
    eponym text NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_type character varying(6) NOT NULL,
    confirmed_planets integer NOT NULL,
    stellar_temperature_in_k integer NOT NULL,
    visual_magnitude numeric(4,2) NOT NULL,
    historical_names text NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Daughter of Cepheus', 'Andromedae', 'And', 'Perseus', 'Northern', 19);
INSERT INTO public.constellation VALUES (2, 'Ara', 'Altar', 'Arae', 'Ara', 'Hercules', 'Southern', 7);
INSERT INTO public.constellation VALUES (3, 'Cancer', 'Crab', 'Cancri', 'Cnc', 'Zodiacal', 'Northern', 10);
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 'Great Bear', 'Ursae Majoris', 'UMa', 'Ursa Major', 'Northern', 21);
INSERT INTO public.constellation VALUES (5, 'Sagittarius', 'Archer', 'Sagittarii', 'Sgr', 'Zodiacal', 'Southern', 22);
INSERT INTO public.constellation VALUES (6, 'Virgo', 'Virgin', 'Virginis', 'Vir', 'Zodiacal', 'Southern', 32);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', true, 'barred spiral', 1000, 'Andromeda gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 1);
INSERT INTO public.galaxy VALUES (2, 'Bode''s Galaxy', true, 'spiral', 250, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 4);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', false, 'starburst', 30, 'Appears similar in shape to a cigar.', 4);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', false, 'spiral', 1000, 'Similar in appearance to a pinwheel toy.', 4);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', false, 'spiral', 100, 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits.', 4);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', true, 'barred spiral', 400, 'The appearance from Earth of the galaxy, a band of light.', 5);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', false, 'lenticular', 100, 'Similar in appearance to a sombrero.', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, 27, 1.03, 0.055, -12.74, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9380, 0, 2.14, 0.010, 11.80, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 1, 1.36, 0.000, 12.90, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1070000, 7, 10.88, 0.002, 4.60, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1880000, 17, 8.21, 0.007, 5.65, 5);
INSERT INTO public.moon VALUES (6, 'Io', 421600000000, 2, 17.34, 0.004, 5.00, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 670900, 5, 13.74, 0.009, 5.30, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1221850, 16, 5.58, 0.029, 8.28, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 527040, 5, 8.49, 0.001, 9.70, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3561300, 79, 79.33, 0.028, 11.90, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 377400, 3, 10.03, 0.002, 10.40, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 294660, 2, 11.36, 0.000, 10.20, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 238020, 1, 12.64, 0.005, 11.70, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 185520, 1, 14.32, 0.020, 12.90, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 1481000, 21, 5.07, 0.104, 14.19, 6);
INSERT INTO public.moon VALUES (16, 'Titania', 435840, 9, 3.65, 0.002, 13.73, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 582600, 13, 3.15, 0.001, 13.94, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 265970, 4, 4.67, 0.005, 14.81, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 191240, 3, 5.52, 0.003, 14.16, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 354800, 6, 4.39, 0.000, 13.47, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Terrestrial', 0.40, 88, 'Mercury is named after the Roman messenger god.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Terrestrial', 0.70, 225, 'Venus is named after the Roman goddess of love and peace.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', false, 'Terrestrial', 1.00, 365, 'Earth comes from the Old English words ''eor(th)e'' and ''ertha'' which simply means the ground.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Terrestrial', 1.50, 687, 'Mars is named after Roman god of war.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Gas Giant', 5.20, 4333, 'Jupiter is named after the king of the Roman gods.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Gas Giant', 9.50, 10759, 'Saturn is named after the Roman god of agriculture.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Ice Giant', 19.80, 30687, 'Uranus is named after the Greek god of the sky.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Ice Giant', 30.00, 60190, 'Neptune is named after the Roman god of the sea.', 1);
INSERT INTO public.planet VALUES (9, 'Spe', true, 'Gas Giant', 0.83, 186, '"Hope" (Latin)', 2);
INSERT INTO public.planet VALUES (10, 'Arkas', true, 'Gas Giant', 0.81, 184, 'Son of Zeus and Callistus in Greek myth.', 3);
INSERT INTO public.planet VALUES (11, 'Taphao Thong', true, 'Gas Giant', 2.10, 1078, 'Thai folktale character', 4);
INSERT INTO public.planet VALUES (12, 'Taphao Kaew', true, 'Gas Giant', 3.60, 2391, 'Thai folktale character', 4);
INSERT INTO public.planet VALUES (13, 'Galileo', true, 'Gas Giant', 0.11, 15, 'Italian astronomer', 5);
INSERT INTO public.planet VALUES (14, 'Brahe', true, 'Gas Giant', 0.24, 44, 'Danish astronomer', 5);
INSERT INTO public.planet VALUES (15, 'Lipperhey', true, 'Gas Giant', 5.96, 4825, 'Dutch lensmaker', 5);
INSERT INTO public.planet VALUES (16, 'Janssen', true, 'Super Earth', 0.02, 1, 'Dutch astronomer', 5);
INSERT INTO public.planet VALUES (17, 'Harriot', true, 'Gas Giant', 0.77, 260, 'English astronomer', 5);
INSERT INTO public.planet VALUES (18, 'Quijote', true, 'Gas Giant', 1.50, 643, 'Character from Don Qixote', 6);
INSERT INTO public.planet VALUES (19, 'Dulcinea', true, 'Gas Giant', 4.17, 4206, 'Character from Don Quixote', 6);
INSERT INTO public.planet VALUES (20, 'Rocinante', true, 'Neptune-like', 0.09, 10, 'Character from Don Quixote', 6);
INSERT INTO public.planet VALUES (21, 'Sancho', true, 'Gas Giant', 0.93, 308, 'Character from Don Quixote', 6);
INSERT INTO public.planet VALUES (22, 'Saffar', true, 'Gas Giant', 0.06, 5, 'Muslim astronomer', 7);
INSERT INTO public.planet VALUES (23, 'Samh', true, 'Gas Giant', 0.83, 241, 'Muslim astronomer', 7);
INSERT INTO public.planet VALUES (24, 'Majriti', true, 'Gas Giant', 2.51, 1276, 'Muslim astronomer', 7);
INSERT INTO public.planet VALUES (25, 'Draugr', true, 'Terrestrial', 0.19, 25, 'Norse myth', 8);
INSERT INTO public.planet VALUES (26, 'Poltergeist', true, 'Super Earth', 0.36, 67, '"noisy ghost" (in German)', 8);
INSERT INTO public.planet VALUES (27, 'Phobetor', true, 'Super Earth', 0.46, 98, 'Greek myth', 8);
INSERT INTO public.planet VALUES (28, 'Drukyul', true, 'Gas Giant', 2.99, 1800, 'Native name of Bhutan', 9);
INSERT INTO public.planet VALUES (29, 'Mastika', true, 'Gas Giant', 0.04, 3, '"gem/jewel" in Malay', 10);
INSERT INTO public.planet VALUES (30, 'Caleuche', true, 'Gas Giant', 1.33, 641, 'Ghost ship from the Chilote mythology of Southern Chile', 11);
INSERT INTO public.planet VALUES (31, 'Toge', true, 'Gas Giant', 1.85, 956, '"earring" in the Ewe language', 12);
INSERT INTO public.planet VALUES (32, 'Lete', true, 'Gas Giant', 0.05, 4, 'Italian spelling of Lethe, the underworld river of fog from Greek mythology', 13);
INSERT INTO public.planet VALUES (33, 'Staburags', true, 'Gas Giant', 0.07, 6, 'Rock with symbolic meaning from Latvian poem Staburags un Liesma', 14);
INSERT INTO public.planet VALUES (34, 'Nachtwacht', true, 'Gas Giant', 0.05, 4, 'Nachtwacht, painted by Rembrandt', 15);
INSERT INTO public.planet VALUES (35, 'Albmi', true, 'Gas Giant', 0.07, 6, '"sky" in the Northern Sami language', 16);
INSERT INTO public.planet VALUES (36, 'Sumajmajta', true, 'Gas Giant', 1.88, 842, 'Character from Way to the Sun by Peruvian writer Abraham Valdelomar', 17);
INSERT INTO public.planet VALUES (37, 'Teberda', true, 'Gas Giant', 0.04, 3, 'Teberda River in the Dombay region of Russia', 18);
INSERT INTO public.planet VALUES (38, 'Dopere', true, 'Gas Giant', 1.59, 564, 'North Senegalese area containing the water source of Belel', 19);
INSERT INTO public.planet VALUES (39, 'Isagel', true, 'Gas Giant', 0.08, 7, 'Character from Aniara by Swedish poet Harry Martinson', 20);
INSERT INTO public.planet VALUES (40, 'Eiger', true, 'Gas Giant', 0.09, 11, 'Prominent peak in the Bernese Alps', 21);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 8, 5772, -26.70, 'According to the Oxford English Dictionary, the word sun comes from many sources, including the Latin sol. Sol is the personification of the Sun and a god in ancient Roman religion.', 1, NULL);
INSERT INTO public.star VALUES (2, 'Veritate', 'K', 1, 4813, 5.22, 'Latin for ''where there is truth''.', 1, 1);
INSERT INTO public.star VALUES (3, 'Intercrus', 'K', 1, 4753, 5.40, 'Intercrus means ''between the legs'' in Latin, referring the star''s position in the constellation Ursa Major.', 1, 4);
INSERT INTO public.star VALUES (4, 'Chalawan', 'G', 3, 5880, 5.04, 'Named after Chalawan, a mythological crocodile king from a Thai folktale.', 1, 4);
INSERT INTO public.star VALUES (5, 'Copernicus', 'K', 5, 5292, 5.96, 'In honor of the astronomer Nicolaus Copernicus.', 1, 3);
INSERT INTO public.star VALUES (6, 'Cervantes', 'G', 4, 5761, 5.12, 'Named after Miguel de Cervantes Saavedra, the Spanish author of El Ingenioso Hidalgo Don Quixote de la Mancha (Don Quixote).', 1, 2);
INSERT INTO public.star VALUES (7, 'Titawin', 'F', 3, 6154, 4.10, 'Named after the settlement in northern Morocco and UNESCO World Heritage Site now known as the medina (old town) of Tetouan.', 1, 1);
INSERT INTO public.star VALUES (8, 'Lich', 'Pulsar', 3, 28856, 12.20, 'A neutron star and pulsar with planets. A lich is a fictional undead creature known for controlling other undead creatures with magic.', 1, 6);
INSERT INTO public.star VALUES (9, 'Gakyid', 'K', 1, 4952, 8.24, 'Bhutan proposal; means happiness.', 1, 3);
INSERT INTO public.star VALUES (10, 'Gumala', 'F', 1, 6260, 6.25, 'Brunei proposal; a Malay language word referring to a magical stone found in snakes or dragons.', 1, 5);
INSERT INTO public.star VALUES (11, 'Pincoya', 'K', 1, 4684, 9.83, 'Chilean proposal; named after Pincoya, a female water spirit from local mythology.', 1, 5);
INSERT INTO public.star VALUES (12, 'Sika', 'G', 1, 5781, 7.84, 'Ghanaian proposal; means ''gold'' in the Ewe language.', 1, 5);
INSERT INTO public.star VALUES (13, 'Flegetonte', 'K', 1, 5291, 8.07, 'Italian proposal. Named after Phlegethon, an underworld river of fire in Greek mythology in the poem Divina Commedia (The Divine Comedy) by Dante Alighieri.', 1, 6);
INSERT INTO public.star VALUES (14, 'Liesma', 'K', 1, 5600, 8.05, 'Latvian proposal; means ''fire'' and is the name of a character in the poem Staburags un Liesma.', 1, 4);
INSERT INTO public.star VALUES (15, 'Sterrennacht', 'F', 1, 6570, 10.47, 'Dutch proposal; named after The Starry Night by Vincent van Gogh.', 1, 1);
INSERT INTO public.star VALUES (16, 'Nasti', 'G', 2, 5767, 8.20, 'Norwegian proposal; means ''star'' in the Sami language.', 1, 4);
INSERT INTO public.star VALUES (17, 'Inquill', 'G', 1, 5900, 6.67, 'Peruvian proposal; a character in the story Way to the Sun by Abraham Valdelomar.', 1, 2);
INSERT INTO public.star VALUES (18, 'Dombay', 'K', 1, 5224, 11.58, 'Russian proposal; named after the Dombay resort region in the North Caucasus.', 1, 4);
INSERT INTO public.star VALUES (19, 'Belel', 'K', 1, 4945, 7.55, 'Senegalese proposal; a rare source of water in the North.', 1, 5);
INSERT INTO public.star VALUES (20, 'Aniara', 'A', 1, 5054, 2.50, 'Swedish proposal; name of a spaceship in Aniara, the eponymous poem by Harry Martinson.', 1, 4);
INSERT INTO public.star VALUES (21, 'Monch', 'K', 1, 5330, 8.05, 'Swiss proposal; named after Monch, a prominent Alpine peak in Switzerland.', 1, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 40, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

