CREATE TABLE company.employee (
  emp_id INT,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
); 

        
CREATE TABLE company.branch (
  branch_id INT,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE
 );
 
 
 CREATE TABLE company.client (
  client_id INT,
  client_name VARCHAR(40),
  branch_id INT
);

CREATE TABLE company.works_with (
  emp_id INT,
  client_id INT,
  total_sales INT 
);

CREATE TABLE company.branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40) 
);


  INSERT INTO company.employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
  INSERT INTO company.branch VALUES(1, 'Corporate', 100, '2006-02-09');
  UPDATE company.employee
  SET branch_id = 1
  WHERE emp_id = 100;    
INSERT INTO company.employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
INSERT INTO company.employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
INSERT INTO company.branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE company.employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO company.employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
									(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2),
									(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);


INSERT INTO company.employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
INSERT INTO company.branch VALUES(3, 'Stamford', 106, '1998-02-13');
UPDATE company.employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO company.employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
								   (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

select *from company.employee;
select *from company.branch;

insert into company.branch values (4, 'Buffalo', NULL,NULL);



INSERT INTO company.branch_supplier VALUES(2, 'Hammer Mill', 'Paper'),
										  (2, 'Uni-ball', 'Writing Utensils'),
										  (3, 'Patriot Paper', 'Paper'),
										  (2, 'J.T. Forms', 'Custom Forms'),
                                          (3, 'Uni-ball', 'Writing Utensils'),
                                          (3, 'Hammer Mill', 'Paper'),
                                          (3, 'Stamford Lables', 'Custom Forms');

select *from company.branch_supplier;

INSERT INTO company.client VALUES(400, 'Dunmore Highschool', 2),
								 (401, 'Lackawana Country', 2),
                                 (402, 'FedEx', 3),
                                 (403, 'John Daly Law, LLC', 3),
                                 (404, 'Scranton Whitepages', 2),
                                 (405, 'Times Newspaper', 3),
                                 (406, 'FedEx', 2);

select *from company.client;



-- WORKS_WITH
INSERT INTO company.works_with VALUES(105, 400, 55000),
							 (102, 401, 267000),
                             (108, 402, 22500),
                             (107, 403, 5000),
                             (108, 403, 12000),
                             (105, 404, 33000),
                             (107, 405, 26000),
                             (102, 406, 15000),
                             (105, 406, 130000);
                             
select *from company.works_with;




select *from company.employee
order by salary,  first_name, sex;

select *from company.employee
where branch_id = 3;

select *from company.employee
where sex = 'F';


-- LIMIT (selecting TOP)
select * from company.employee
order by emp_id
limit 5;


-- AS (Aliases)
select first_name As forename, last_name AS surname from company.employee
order by first_name;


-- distinct
select DISTINCT first_name
from company.employee
LIMIT 5;


-- functions---> COUNT 
select count(emp_id) As total_employee
from company.employee;



-- SUM FUNCTION
select SUM(salary) AS total_Salary
from company.employee;


-- COUNT FUNCTION
select count(emp_id) As total_employee
from company.employee
where sex = 'F' AND  birth_day > '1970-01-01';

select *from company.employee
where  birth_day > '1970-01-01' AND sex = 'F';


-- AVG function 
select avg(Salary) AS Avg_Salary
from company.employee
where sex = 'M';


select COUNT(sex) 
from company.employee
group by sex;


select SUM( total_sales) ,emp_id
from company.works_with
group by emp_id;




-- joins
select company.employee.emp_id, company.employee.first_name, company.employee.last_name, company.branch.branch_name
from company.employee
join company.branch ON company.employee.emp_id = company.branch.mgr_id;


-- Nested Queries
select employee.first_name, employee.last_name
from company.employee
where employee.emp_id IN(
select works_with.emp_id from company.works_with
where works_with.total_sales > 30000);


-- using nested query  finding clients who are handeled by micheal scotts
select client.client_name 
from company.client
where client.branch_id = (
select branch.branch_id
from company.branch
where branch.mgr_id = 102); 

-- using joins.
SELECT
  teams.team_name AS team_name , projects.project_name AS project_name FROM teams
INNER JOIN matches
  ON teams.id = matches.team_id
INNER JOIN matches
  ON matches.project_id = projects.id
ORDER BY teams.id;



select company.branch.branch_name, company.branch.branch_id
-- COUNT(company.client.client_id) AS Clients
from company.employee AS employee1
inner join company.branch ON
	 company.employee.emp_id =  company.branch.mgr_id        
Inner join company.employee AS employee2
	ON  company.client.branch_id = company.branch.mgr_id  
   -- group by company.client.client_id;












                                    
