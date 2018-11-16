/* a. Retrieve the names of all employees who work in 
      the department that has the employee with the 
      lowest salary among all employees. */

SELECT e.Fname, e.Lname
    FROM employee e
    WHERE Salary < ALL 
        (SELECT Salary
         FROM employee);
/* b. Retrieve the names of all employees whose 
      supervisor’s supervisor has '333445555' 
      for Ssn.*/

SELECT Fname, Lname
    FROM employee
    WHERE Super_ssn 
        (SELECT ssn 
         FROM employee
         WHERE Super_Ssn='333445555');

select e.fname, e.Lname
    from employee e, employee m
    where e.super_ssn = m.ssn
    and m.super_ssn='333445555';

CREATE TABLE EMPLOYEE
    (Fname   VARCHAR2(20),
     Lname           VARCHAR2(20),
     Ssn           VARCHAR2(15),
     Super_Ssn           VARCHAR2(15),
     PRIMARY KEY(Ssn) );

INSERT INTO EMPLOYEE
    SELECT 'Ben', 'Davidson', '123456789', '987654321' FROM dual UNION ALL
    SELECT 'Michelle', 'Davidson', '136856489', '123456789' FROM dual UNION ALL
    SELECT 'Julietta', 'Davidson', '987654321', '333445555' FROM dual UNION ALL
    SELECT 'Jonah', 'Davidson', '333445555', '136856489' FROM dual;


/* c. Retrieve the names of employees who make at least 
      $10,000 more than the employee who is paid the
      least in the company. */

SELECT fname, lname 
    FROM employee
    WHERE (salary - 10000) > (SELECT MIN(Salary)
                               FROM employee);
SELECT fname, lname
    FROM employee
    WHERE (salary - 10000) > ALL (
        SELECT salary
            FROM employee
            WHERE salary <= ALL (SELECT salary
                                    FROM employee) );
