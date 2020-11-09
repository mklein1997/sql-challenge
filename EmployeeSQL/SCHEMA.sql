--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2020-11-09 16:32:16 EST

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
-- TOC entry 203 (class 1259 OID 16931)
-- Name: dep_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dep_employee (
    employeeid integer NOT NULL,
    depid character varying(30)
);


ALTER TABLE public.dep_employee OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16952)
-- Name: dep_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dep_manager (
    depid character varying(30),
    employeeid integer
);


ALTER TABLE public.dep_manager OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16926)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    depid character varying(30) NOT NULL,
    depname character varying(30)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16911)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employeeid integer NOT NULL,
    depid character varying(30),
    birthday character varying(30),
    firstname character varying(20),
    lastname character varying(30),
    sex character varying(2),
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16965)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    employeeid integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16906)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    titleid character varying(10) NOT NULL,
    title character varying(30)
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 3140 (class 2606 OID 16930)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (depid);


--
-- TOC entry 3138 (class 2606 OID 16915)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);


--
-- TOC entry 3136 (class 2606 OID 16910)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (titleid);


--
-- TOC entry 3142 (class 2606 OID 16939)
-- Name: dep_employee dep_employee_depid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dep_employee
    ADD CONSTRAINT dep_employee_depid_fkey FOREIGN KEY (depid) REFERENCES public.departments(depid);


--
-- TOC entry 3141 (class 2606 OID 16934)
-- Name: dep_employee dep_employee_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dep_employee
    ADD CONSTRAINT dep_employee_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);


--
-- TOC entry 3143 (class 2606 OID 16955)
-- Name: dep_manager dep_manager_depid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dep_manager
    ADD CONSTRAINT dep_manager_depid_fkey FOREIGN KEY (depid) REFERENCES public.departments(depid);


--
-- TOC entry 3144 (class 2606 OID 16960)
-- Name: dep_manager dep_manager_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dep_manager
    ADD CONSTRAINT dep_manager_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);


--
-- TOC entry 3145 (class 2606 OID 16968)
-- Name: salaries salaries_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);


-- Completed on 2020-11-09 16:32:16 EST

--
-- PostgreSQL database dump complete
--

