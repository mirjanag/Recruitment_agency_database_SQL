/*** MIRJANA GRKOVSKA 27 - 08 - 2020
Recruitment agency DB consisting of 7 tables: 
companies, vacancies, training programmes, job market events, candidates, resumes, and matches ***/

DROP DATABASE IF EXISTS recruitment_agency;
CREATE DATABASE recruitment_agency;
USE recruitment_agency;

CREATE TABLE companies (company_id INT, company_name VARCHAR (50) NOT NULL, sector VARCHAR (50),
PRIMARY KEY (company_id));
INSERT INTO companies (company_id, company_name, sector)
VALUES
(4123, 'Setex', 'tech'),
(5345, 'Saldy', 'NGO'),
(6371, 'Boux', 'NGO'),
(7567, 'Delta', 'finance'),
(8789, 'Gamma', 'finance'),
(8103, 'Omega', 'tech'),
(7198, 'Alfa Electronics', 'tech'),
(6224, 'Drummy', 'music'),
(5249, 'IN', 'music'),
(4986, 'Living', 'music'),
(3611, 'Loopy', 'tech'),
(2765, 'PAU Eduction', 'education'),
(1344, 'Hotel Granada', 'hospitality'),
(2545, 'Restaurant Goa', 'hospitality'),
(3585, 'Restaurant Cous', 'hospitality');
SELECT * FROM companies;

CREATE TABLE vacancies (position_id INT, title VARCHAR (50) NOT NULL, sector VARCHAR (50), salary INT, period_availability VARCHAR (50), company_id INT, 
PRIMARY KEY (position_id),
FOREIGN KEY (company_id) REFERENCES companies(company_id));
INSERT INTO vacancies (position_id, title, sector, salary, period_availability, company_id)
VALUES
(1234, 'data analyst', 'tech', 46000, 'immediately', 4123),
(1235, 'data scientist', 'tech', 76000, '1 month', 4123),
(1236, 'data manager', 'tech', 96000, '2 months', 4123),
(1237, 'junior software engeneering', 'tech', 50000, '1 month', 8103),
(1238, 'senior software engeneering', 'tech', 70000, 'immediately', 3611),
(1239, 'quantitaive analyst', 'tech', 47000, 'immediately', 3611),
(1240, 'researcher', 'education', 43000, 'immediately', 2765),
(1241, 'assistant social researcher', 'NGO', 30000, 'immediately', 5345),
(1242, 'the happiness hero', 'NGO', 40000, 'immediately', 6371),
(1243, 'producer', 'NGO', 42000, '1 month', 6224),
(1244, 'waiter', 'hospitality', 28000, '2 months', 2545),
(1245, 'receptionist', 'hospitality', 31000, '2 months', 1344);
SELECT * FROM vacancies;

CREATE TABLE training_programmes (training_code VARCHAR (20), training_title VARCHAR (20) NOT NULL, sector VARCHAR (20), price INT NOT NULL, provider_id INT NOT NULL,
PRIMARY KEY (training_code),
FOREIGN KEY (provider_id) REFERENCES companies(company_id));
INSERT INTO training_programmes (training_code, training_title, sector, price, provider_id)
VALUES 
('FIN001', 'Bootcamp Finance ', 'finance', 8000, 7567),
('FIN002', 'Dive into Finance', 'finance', 10500, 8789),
('TECH347', 'Bootcamp Coding', 'tech', 12000, 7198),
('TECH467', 'Web Development', 'tech', 7800, 4123),
('TECH709', 'Data Science', 'tech', 8300, 3611),
('EDU799', 'Reseach Methods', 'education', 6900, 2765);
SELECT * FROM training_programmes;


CREATE TABLE job_market_events (event_id INT, event_name VARCHAR (20) NOT NULL, date_event DATE NOT NULL, orginiser_id INT, location VARCHAR (20),
PRIMARY KEY (event_id),
FOREIGN KEY (orginiser_id) REFERENCES companies(company_id));
INSERT INTO job_market_events (event_id, event_name, date_event, orginiser_id, location) 
VALUES 
(987, 'European Job Market', '2020-08-30', 5345, 'London'),
(435, 'Speed Recuirtment',  '2020-12-03', 8789, 'Manchester'),
(766, 'Meet the Employers',  '2020-11-17', 7567, 'Brighton'),
(899, 'UK Job Market', '2020-12-23', 3611, 'Surrey'),
(112, 'Gradute Job Market', '2020-09-01', 2765, 'Bristol'),
(226, 'Hiring', '2020-10-10', 5249,'Kent');
SELECT * FROM job_market_events;

CREATE TABLE candidates
(person_id INTEGER primary key, person_name VARCHAR(50) NOT NULL, person_last_name VARCHAR(50) NOT NULL, location VARCHAR(50), years_experience INTEGER, highest_education VARCHAR(50), availability VARCHAR(50), salary_expectation integer NOT NULL, preffered_sector VARCHAR(50) NOT NULL, contact VARCHAR (50));
INSERT INTO candidates (person_id, person_name, person_last_name, location, years_experience, highest_education, availability, salary_expectation, preffered_sector, contact)
VALUES 
(121, 'Maria', 'Smith','Surrey', 5, 'Masters', 'immediately', 42000, 'finance', 'ms@gmail.com'),
(122, 'Nick', 'Bright', 'London', 20, 'Bachelor', '1 month', '75000', 'tech', 'nb@gmail.com'),
(123, 'Aiste', 'Colun', 'Manchester', 1, 'Bachelor', 'immediately', 30000, 'NGO', 'ac@gmail.com'),
(124, 'Alex', 'White', 'Bristol', 0, 'Secondary_School', 'immediately', 25000, 'music', 'aw@gmail.com'),
(125, 'Bill', 'Taylor', 'Brighton', 4, 'PhD', '3 months', 380000, 'education', 'bt@gmail.com'),
(126, 'Almira', 'Gross', 'London', 3, 'Bachelor', 'immediately', 35000, 'government', 'ag@gmail.com'),
(127, 'Luke', 'Harding',  'Bristol', 35, 'Bachelor', 'immediately', 75000, 'finance', 'lh@gmail.com'),
(128, 'Laura', 'Jacon', 'Kent', 26, 'Masters', 'immediately', 82000, 'finance', 'lj@yahoo.com'),
(129, 'Nicola', 'Mill', 'London', 40, 'Secondary School', '1 month', '55000', 'tech', 'nimi@yahoo.com'),
(130, 'Richard', 'Embery',  'London', 10, 'Secondary School', 'immediately', 33000, 'music', 'rm@yahoo.com'),
(131, 'Emily', 'Smith', 'Bristol', 18, 'Masters', '2 months', 52000, 'finance', 'smithe@yahoo.com'),
(132, 'Ruth', 'Matt',  'Surrey', 3, 'Bachelor', '1 month', '34000', 'tech', 'nimi@yahoo.com'),
(133, 'Oli', 'Minser',  'London', 20, 'Masters', '2 months', 30000, 'NGO', 'omi@yahoo.com'),
(134, 'Jamie', 'Parsons',  'Manchester', 26, 'Secondary_School', 'immediately', 45000, 'music', 'jamipar@yahoo.com'),
(135, 'Betty', 'Till',  'Kent', 4, 'Bachelor', '1 month', 35000, 'NGO', 'biti@yahoo.com'),
(136, 'Alfonso', 'Cortez', 'London', 1, 'Secondary_School', '1 month', 22000, 'NGO', 'ac@yahoo.com'),
(137, 'Lilly', 'Thaler', 'Manchester', 4, 'Masters', 'immediately', 38000, 'finance', 'lt@yahoo.com'),
(138, 'Sophie', 'Lee', 'London', 26, 'Bachelor', '1 month', 52000, 'finance', 'sl@yahoo.com'),
(139, 'Pete', 'Szaszeck', 'Brighton', 40, 'Secondary_School', '1 month', '55000', 'music', 'pz@yahoo.com'),
(140, 'Ronald', 'Robe', 'London', 17, 'Bachelor', '2 months', 83000, 'finance', 'rr@yahoo.com');
SELECT * FROM candidates;

CREATE TABLE resumes
(resume_id INTEGER primary key, uploaded DATE, last_update DATE, candidate_id INT NOT NULL,
FOREIGN KEY (candidate_id) REFERENCES candidates(person_id));
INSERT INTO resumes (resume_id, uploaded, last_update, candidate_id)
VALUES 
(500, STR_TO_DATE('12-01-2020', '%d-%m-%Y'), STR_TO_DATE('06-05-2020', '%d-%m-%Y'), 130),
(501, STR_TO_DATE('05-05-2020', '%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 129),
(502, STR_TO_DATE('05-08-2019', '%d-%m-%Y'), STR_TO_DATE('13-07-2020','%d-%m-%Y'), 128),
(503, STR_TO_DATE('25-02-2020', '%d-%m-%Y'), null, 126),
(504, STR_TO_DATE('03-03-2020','%d-%m-%Y'), STR_TO_DATE('07-04-2020','%d-%m-%Y'), 124),
(505, STR_TO_DATE('13-07-2019','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 121),
(506, STR_TO_DATE('14-12-2019','%d-%m-%Y'), null, 122),
(507, STR_TO_DATE('30-05-2020','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 123),
(508, STR_TO_DATE('28-11-2019','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 125),
(509, STR_TO_DATE('13-07-2019','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 127),
(510, STR_TO_DATE('09-08-2020','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 124),
(511, STR_TO_DATE('11-09-2019','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 121),
(512, STR_TO_DATE('24-03-2019','%d-%m-%Y'), null, 122),
(513, STR_TO_DATE('18-08-2020','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 131),
(514, STR_TO_DATE('16-06-2019','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 132),
(515, STR_TO_DATE('30-11-2019','%d-%m-%Y'), null, 133),
(516, STR_TO_DATE('24-07-2020','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 134),
(517, STR_TO_DATE('19-09-2020','%d-%m-%Y'), null, 135),
(518, STR_TO_DATE('29-11-2019','%d-%m-%Y'), STR_TO_DATE('15-09-2020','%d-%m-%Y'), 136),
(519, STR_TO_DATE('05-12-2019','%d-%m-%Y'), STR_TO_DATE('19-08-2020','%d-%m-%Y'), 137),
(520, STR_TO_DATE('16-05-2020','%d-%m-%Y'), STR_TO_DATE('15-08-2020','%d-%m-%Y'), 138),
(521, STR_TO_DATE('25-01-2020','%d-%m-%Y'), null, 139),
(522, STR_TO_DATE('18-04-2000','%d-%m-%Y'), STR_TO_DATE('7-08-2020','%d-%m-%Y'), 140);
SELECT * FROM resumes; 


CREATE TABLE matches
(person_id INT, resume_id INT, company_id INT, position_id INT, event_id INT, training_code VARCHAR (20), current_status VARCHAR (50),
FOREIGN KEY (person_id) REFERENCES candidates(person_id), 
FOREIGN KEY (resume_id) REFERENCES resumes (resume_id),
FOREIGN KEY (company_id) REFERENCES companies (company_id),
FOREIGN KEY (event_id) REFERENCES job_market_events (event_id), 
FOREIGN KEY (position_id) REFERENCES vacancies (position_id),
FOREIGN KEY (training_code) REFERENCES training_programmes (training_code));
INSERT INTO matches (person_id, resume_id, company_id, position_id, training_code, event_id, current_status)
VALUES 
(122, 512, 4123, 1235, null, null, 'application under review'),
(123, 507, 5345, 1241, 'EDU799', null, 'assessment in progress'),
(136, 518, 5345, 1241,  null, 987, 'assessment in progress'),
(135, 517, 6371, 1242, null, null, 'refrences check'),
(125, 508, 2765, 1240, null, 899, 'application under review'),
(132, 514, 4123, 1234, 'TECH467', null, 'assessment in progress'),  
(132, 514, 3611, 1239, 'TECH467', null, 'application under review'),
(129, 501, 8103, 1237, 'TECH347', 766, 'refrences check');
SELECT * FROM matches; 

-- ✓ 1. Create relational DB of your choice with minimum 5 tables -> recrutiment agency DB with 7 tables

-- ✓ 2. Set Primary and Foreign Key constraints to create relations between the tables -> done

-- ✓ 3. Using any type of the joins create a view that combines multiple tables in a logical way
-- Join 4 tables to show the vacancies (alongisde their salaries and companies) for which potential candidates are found and show the status of the recruitment process
SELECT v.title, v.salary, c.company_name, can.person_name, can.person_last_name, m.current_status
FROM vacancies v
	RIGHT JOIN matches m ON v.position_id = m.position_id
	RIGHT JOIN companies c ON  v.company_id = c.company_id
    RIGHT JOIN candidates can ON  m.person_id = can.person_id
    WHERE current_status IS NOT null order by salary;
    
-- 4. ✓ In your database, create a stored function that can be applied to a query in your DB
-- Label the candidates' level of expertise based on their experience
DROP FUNCTION IF EXISTS expertise_level;
DELIMITER //
CREATE FUNCTION expertise_level (years_experience 
	INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE expertise_level VARCHAR(20);

    IF years_experience > 3 THEN
		SET expertise_level = 'Begginer';
    ELSEIF (years_experience >= 3 AND 
			expertise_level <= 8) THEN
        SET expertise_level = 'Senior';
    ELSEIF years_experience < 8 THEN
        SET expertise_level = 'Expert';
    END IF;
    return (expertise_level);
END//
DELIMITER ;
SELECT person_name, expertise_level(years_experience) FROM candidates order by person_name;

-- 5. ✓ Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- a. Find the name, city and contact details of each candidate, who have not updated their CV, but are matched with an employeer  
SELECT person_name,location, contact FROM candidates WHERE person_id IN 
	(SELECT person_id FROM matches WHERE resume_id IN 
		(SELECT resume_id FROM resumes WHERE last_update IS NULL));
-- b. Find the full name, and background details of the candidates who are signed up for a training course
SELECT person_name, person_last_name, highest_education, years_experience FROM candidates
WHERE person_id IN (SELECT person_id FROM matches WHERE training_code IS NOT NULL);

-- ✓ 6. Create DB diagram where all table relations are shown -> Done

-- ✓ 7. In your database, create a stored procedure and demonstrate how it runs
-- a.count the number of vacancies with salaries above 60000
DELIMITER //
CREATE PROCEDURE count_wellpaid_jobs ()
BEGIN
    SELECT COUNT(*) AS Count_Well_Paid_Jobs FROM vacancies WHERE salary > 60000;
END//
DELIMITER ;
CALL count_wellpaid_jobs ()
-- b.) max salary for a vacancy in a particular sector
-- DROP PROCEDURE maxsalaries;
Delimiter //
 CREATE PROCEDURE maxsalaries (IN sector VARCHAR(20), OUT salaries INT)
       BEGIN
         SELECT MAX(salary) INTO salaries FROM recruitment_agency.vacancies WHERE vacancies.sector = sector;
       END//
Delimiter ;
CALL maxsalaries('tech', @salaries); -- the vacancy with highest salary offered in the tech sector
SELECT @salaries;
CALL maxsalaries('education', @salaries); -- the vacancy with highest salary offered in the education sector
SELECT @salaries;
CALL maxsalaries('hospitality', @salaries); -- the vacancy with highest salary offered in the hospitality sector
SELECT @salaries;

-- ✓ 8. In your database, create a trigger and demonstrate how it runs
-- validate candidates's email
DELIMITER //
CREATE TRIGGER `email_validate_insert`
	BEFORE INSERT
	ON `candidates`
	FOR EACH ROW
BEGIN
	IF NEW.`contact` NOT LIKE '%_@%_.__%' THEN
		SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = '[table: candidates] - `contact` column is not valid';
	END IF;
END//
DELIMITER ;
-- test the triger
INSERT INTO candidates (person_id, person_name, person_last_name, location, years_experience, highest_education, availability, salary_expectation, preffered_sector, contact)
VALUES 
(185, 'Maya', 'Soloh','London', 5, 'PhD', '1 month', 6200, 'tech', 'mayasolohcom');

-- ✓ 9. In your database, create an event and demonstrate how it runs
-- At the start of the new year, increase salary expecation by 5% to account for inflation
CREATE EVENT increase_salary 
ON SCHEDULE AT '2021-01-01 00:00:00' DO UPDATE candidates
    SET salary_expecation = salary_expecation * 1.05;

-- 10. ✓ Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.
-- show the details about the job markets events and the current vacancies available by the orginser
CREATE OR REPLACE VIEW view_events AS
    SELECT j.date_event, j.event_name, j.location, c.company_name, v.title
    FROM job_market_events j, companies c, vacancies v
	WHERE j.orginiser_id = c.company_id AND v.company_id = c.company_id ORDER BY date_event;
SELECT * FROM view_events;
-- a. how many days are left to the events
SELECT event_name, date_event - current_date() FROM  view_events;
-- b.) show the job event taking place in London
SELECT event_name FROM view_events WHERE location = 'London';

-- ✓ 11. Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis
-- a. Find the average preffered salary by sector, where the average salary is above 30000
SELECT avg(salary_expectation), preffered_sector FROM candidates group by preffered_sector HAVING avg(salary_expectation) > 30000;
-- b. Find the number of vacancies by sector, but ignore the sector if it has 1 available position only -> ✓
SELECT count(title), sector FROM vacancies group by sector HAVING count(title) > 1;

