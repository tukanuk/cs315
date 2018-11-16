/* (a) Insert a new airport <'YTT', ‘Tintin Airport’, ‘Tintin’, 'ON'> 
       in the database. */
INSERT INTO airport
    VALUES ('YTT', 'Tintin Airport', 'Tintin', 'ON');

/* (b) Change the Customer_phone of customer ‘Tony Appa’ 
       to 519-253-4001.*/

UPDATE seat_reservation
    SET Customer_phone='519-253-4001'  
    WHERE Customer_name='Tony Appa';

/* (c) Insert a new flight <'AC331,'Air Canada', 2>.*/

INSERT INTO flight
    VALUES ('AC331', 'Air Canada', 2);

/* (d) Delete all reservation records for the customer 
       whose name is 'Mariane Mooer '.*/
DELETE FROM seat_reservation
    WHERE Customer_name='Mariane Mooer';

SELECT * FROM airport;
SELECT * FROM seat_reservation;
SELECT * FROM flight;