--
-- PostgreSQL database dump
--

\restrict q3QYqHgL4gLFtIBooqZrE07mIs1w82hjDx6y4joVNyaaB4LWhabCQxTR5Jami2C

-- Dumped from database version 17.12 (Debian 17.12-1.pgdg13+1)
-- Dumped by pg_dump version 17.12 (Debian 17.12-1.pgdg13+1)

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
-- Name: predictions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.predictions (
    id integer NOT NULL,
    study_hours double precision NOT NULL,
    attendance double precision NOT NULL,
    previous_grade double precision NOT NULL,
    predicted_pass integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: predictions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.predictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: predictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.predictions_id_seq OWNED BY public.predictions.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    study_hours double precision NOT NULL,
    attendance double precision NOT NULL,
    previous_grade double precision NOT NULL,
    passed integer NOT NULL
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: predictions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.predictions ALTER COLUMN id SET DEFAULT nextval('public.predictions_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students (id, study_hours, attendance, previous_grade, passed) FROM stdin;
1	2	60	45	0
2	5	85	75	1
3	1	40	30	0
4	7	95	90	1
5	4	75	65	1
6	3	55	50	0
7	6	90	80	1
8	2	50	40	0
9	8	98	95	1
10	5	80	70	1
11	7.3	79.5	90.1	1
12	8.3	49.4	64.1	1
13	4.2	77.8	38.7	0
14	7.5	52.4	26.9	0
15	6.9	68.1	93.2	1
16	2.1	34	91.7	1
17	4.3	91.3	31.8	0
18	6	95.6	42	1
19	2.5	74.9	56.6	0
20	2	85.1	26.3	0
21	4.7	39.3	67.2	0
22	5.7	68.1	25.2	0
23	3.7	77.9	28.8	0
24	4.6	73.8	79.1	1
25	4.2	60.8	72.1	1
26	2	72.8	80.1	1
27	8.4	87	27.7	0
28	8.5	42.5	95.5	1
29	2.3	63.1	86	1
30	7.8	77.6	37.6	0
31	2.8	50.9	91.1	1
32	1.3	99.6	55.3	1
33	7.7	90.9	68	1
34	4.8	54.1	69.1	1
35	2.8	97.8	49.7	0
36	6	61.2	58.1	0
37	5.8	34.3	49.9	0
38	3.8	87.8	73.9	1
39	9.1	72	22.1	0
40	4.8	79	54.5	1
41	2.5	68.5	77.6	1
42	8.7	52.6	73.1	1
43	9.7	75.4	75.3	1
44	5.4	84.2	91.3	1
45	1.5	82.4	79.5	1
46	4	55.4	44.7	0
47	5.2	79.2	59.9	1
48	4.7	69.8	79.2	1
49	10	94.6	58	1
50	3	78.9	44.1	0
51	3.8	46.4	98.4	1
52	9.5	62.6	45.8	1
53	2	70	85.3	1
54	8.4	83.1	73.1	1
55	2.4	46.9	49.1	0
56	8.4	94.1	24.8	0
57	3.7	39.9	99.8	1
58	8.3	75.1	48.9	1
59	9.2	37.5	38.8	0
60	3.6	47.2	38.4	0
61	1.1	49.7	43.5	0
62	7.5	31.6	78.3	1
63	1.9	37.8	43	0
64	2.8	95.8	39.8	0
65	6.2	45.3	37.4	0
66	6.9	56.6	78.2	1
67	6	66.6	80.1	1
68	3.4	58.7	72.6	1
69	9.9	44.5	48.1	0
70	2.6	34.3	92.3	1
71	5.1	88	51.5	1
72	6.9	35.5	52.7	0
73	5.2	60.5	71.5	1
74	7.7	84.7	23.4	0
75	6.4	57.5	76.9	1
76	4.7	64.7	50.9	0
77	9.2	85.2	20.3	0
78	8.7	53.3	33.7	0
79	1.2	54.1	78.3	0
80	1.4	49.2	25.3	0
81	2.3	32.5	27.2	0
82	1.6	80.3	23.8	0
83	6.2	42.7	40.2	0
84	4.7	54	45.7	0
85	2.2	66.8	61.8	0
86	3.4	95.7	39.5	0
87	7.6	37.8	22.9	0
88	1.5	92.1	37.6	0
89	1.9	48.3	85.6	1
90	3.1	35.1	92.5	1
91	4.2	82.3	66.6	1
92	9.1	37.3	35.7	0
93	9.8	79.9	52.4	1
94	6.9	80.2	34.1	0
95	9.5	66.4	68.5	1
96	8.6	58	60.4	1
97	5.4	63.7	89	1
98	2.9	68	81.2	1
99	5.1	40	75.5	0
100	6.7	78	42.5	0
101	6.7	62.2	68.4	1
102	3.9	58.6	63.2	0
103	1.7	47.6	97	1
104	4.4	96.8	59.9	1
105	4.2	65.4	94.2	1
106	9.8	93.2	72.8	1
107	9.7	60.9	26.6	0
108	5.4	78.7	22.7	0
109	3.7	80.4	24.2	0
110	8.7	68.6	83.2	1
111	2.1	37.3	65.1	0
112	9	82.1	33.6	0
113	3.9	79.9	68.7	1
114	8.1	65.7	68.6	1
115	6.8	94.1	73.5	1
116	3.4	71	21.9	0
117	8	54	79.9	1
118	2	55.4	78.3	0
119	5.3	58.5	73	1
120	5.5	90.1	50	1
121	9.9	38.5	78.6	1
122	4.9	41.7	74.8	0
123	9.9	99.2	60.9	1
124	4.6	55.2	35.8	0
125	5.4	30.4	27.7	0
126	8.3	32.2	84.1	1
127	4.9	94.1	76.8	1
128	5.9	59.9	40.8	0
129	8.1	72.4	20.6	0
130	2.9	72.8	20.8	0
131	8.4	84.1	20.4	0
132	7.2	32.6	75	1
133	9.7	80	33.1	0
134	6.7	77.9	50.4	1
135	9.2	65.2	78.4	1
136	2.7	83.4	70.3	1
137	8.7	98.2	92.5	1
138	3.2	36.1	48.4	0
139	6.9	71	29.2	0
140	3.5	82.5	66.4	1
141	4.2	63.3	97.7	1
142	2.8	78.3	55.6	0
143	10	30.5	54.9	0
144	5.6	61.1	34.8	0
145	5.1	99.1	55.5	1
146	2.8	86.8	72.4	1
147	5.4	36.9	56.4	0
148	1.2	55.8	24.4	0
149	9.9	32.4	31.9	0
150	1.8	44.5	64.1	0
151	6.4	61.8	98.3	1
152	7.7	42.7	90.5	1
153	5.1	92.7	27.1	0
154	1	65.5	66.9	0
155	3.3	40.1	52.1	0
156	7.9	58.8	75.5	1
157	7.4	30.6	51.1	0
158	6.7	58.1	90.5	1
159	1.1	55.3	63	0
160	4.6	78.4	58.2	1
161	4	68.5	35.9	0
162	8.5	87.2	37.3	1
163	1.8	52.8	30.9	0
164	8.7	51.2	93.2	1
165	5.7	94	60.7	1
166	6.8	30.4	31	0
167	7.7	33.8	52.6	0
168	6.7	30	92.6	1
169	8.1	80.3	98.2	1
170	6	82.1	86.1	1
171	8.1	76.2	83.1	1
172	4.3	32.3	62.2	0
173	3.4	58	98.6	1
174	2.1	45.4	29.5	0
175	5.4	64.2	75.6	1
176	9.9	39.4	54.2	0
177	5.8	45.9	42.8	0
178	4.2	48.3	42.7	0
179	1.6	44.8	28.5	0
180	5.2	99.5	95.8	1
181	5.6	65.9	63.6	1
182	8.4	60.3	21.1	0
183	1.2	31.6	20.7	0
184	9.9	62.6	90.3	1
185	6.3	33.7	31.5	0
186	4.7	51.3	91.9	1
187	7.7	50.9	61.3	1
188	9.8	81.4	90.3	1
189	8.6	32.9	41.1	0
190	8.4	42.7	43.7	0
191	7.7	77.2	34.6	0
192	2.2	30.6	96.5	1
193	8.1	55.4	70.2	1
194	3.2	32.8	97.2	1
195	2.5	40.4	77	0
196	4.5	65.4	78.1	1
197	9.7	87.2	89.3	1
198	6.2	35.9	84.3	1
199	7.1	88.3	47.9	1
200	1.5	89.2	62.2	1
201	8.3	42.4	90.6	1
202	4.1	79.4	89.4	1
203	3.8	94.1	82.3	1
204	5.5	69.8	54.1	0
205	1.8	73.8	45	0
206	7.4	51.6	20.8	0
207	7.4	44.8	32	0
208	9.5	50.4	45.9	0
209	8.2	93.5	32.4	1
210	6.6	66.6	28.7	0
\.


--
-- Name: predictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.predictions_id_seq', 7, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 210, true);


--
-- Name: predictions predictions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict q3QYqHgL4gLFtIBooqZrE07mIs1w82hjDx6y4joVNyaaB4LWhabCQxTR5Jami2C

