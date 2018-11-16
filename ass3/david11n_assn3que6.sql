/* 6. Specify the following 5 queries on the COMPANY 
      relational database schema shown in Figure 5.5, 
      using the relational operators discussed in 
      chapter 8. Also show the result of each query 
      as it would apply to the database state of 
      Figure 5.6. (Total for que 6 is 10 marks)*/

/* (i) List the names of employees who have a dependent 
       with the same first name as themselves. */

SELECT e.fname, e.lname
    FROM employee e, dependent d
    WHERE e.ssn = d.essn
    AND   e.fname = d.dependent_name;

/*    emp_dep <- (EMPLOYEE ⨝<Ssn=Essn> DEPENDANT ) 
   same_name <- 𝝈<fname=dependant_name>(emp_dep)
       result <- 𝜋<fname, lname>(same_name)

    no rows selected */


/* (ii) Find the names of employees that are directly 
        supervised by 'James Borg'. */

SELECT e.fname, e.lname
    FROM employee e
    WHERE e.super_ssn = m.ssn
    AND    m.fname = 'James'
    AND    m.lname = 'Borg';

SELECT e.fname, e.lname
    FROM employee e
    WHERE e.super_ssn 
        IN (SELECT m.ssn
              FROM employee m
              WHERE m.fname='James'
                AND m.lname='Borg');

/* Borg_ssn <- 𝜋<ssn>(𝝈<fname='James' AND lname='Borg'>(EMPLOYEE))
   Borg_emp <- (Employee ⨝<Super_ssn = Ssn> Borg_ssn)
    Result  <-  𝜋<fname, lname>(Borg_emp)

   FNAME		     LNAME
   -------------------- --------------------
   Franklin           Wong
   Jennifer           Wallace 
*/

/* (iii) For each project, list the project name and 
         the total hours per week (by all employees) 
         spent on that project. */

SELECT pname, hours
    FROM project, works_on
    WHERE pnumber = pno
    AND hours IN (select pno, sum(hours)
                  FROM works_on
                  GROUP BY pno);

/*     Pno_Hours <- 𝞀(Pno, Hours)(Pno 𝒥 SUM Hours (WORKS_ON)) 
   Project_Hours <- (PROJECT ⨝<Pnumber=pno> Pno_Hours) 
          Result <- 𝜋<Pname, Hours> (Project_Hours) 
          
    PNAME		         HOURS
    -------------------- --------------------
    ProductX             52.2
    ProductY             37.5
    ProductZ             50
    Computerization      55
    Reorginization       25
    Newbenefits         55 */


/* (iv) Retrieve the names of employees who work on 
        every project. */
SELECT fname, lname
    FROM employee, project, works_on
    WHERE (select count(pno)
            FROM works_on
            GROUP BY essn)

/*      num_projects <- 𝞀(tProjects)(𝒥 COUNT Pname (PROJECT))
    emp_num_projects <- 𝞀(Essn, eProjects)(Essn 𝒥 COUNT Pno (WORKS_ON))
        emp_projects <- (EMPLOYEE ⨝<Ssn=Essn> emp_num_projects)
            emp_allp <- 𝝈<eProjects=num_projects> (emp_projects)
              result <- 𝜋<fname, lname>(emp_allp)

    no rows selected
*/

/* (v) Retrieve the maximum salary of all female 
       employees. Solution 6: (10 marks) */

SELECT max(salary)
FROM employee
WHERE sex='F';

/* female_emp <- 𝝈<SEX='F'>(EMPLOYEE)
        result <- 𝞀(Max_Salary)(𝒥 MAX salary (female_emp))
*/