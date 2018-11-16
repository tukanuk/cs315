SET LINESIZE 120

/* 1. Retrieve the names and flight numbers of all 
      customers who have taken a flight departing 
      from Windsor. 
    CUSTOMER_NAME		  FLIGH
    ------------------------- -----
    Peter Opo		  PA233
    Karen Appa		  WJ250
    Tony Appa		  WJ250
    Mariane Mooer	 WJ250  */

SELECT DISTINCT s.Customer_name, s.Flight_number 
    FROM        seat_reservation s, leg_instance l
    WHERE       l.departure_airport_code='YQG'
    AND          s.Flight_number=l.Flight_number; 

/* 2. Retrieve the flight number and flight legs of 
      all flights that have more than one leg. 
    FLIGH LEG_NUMBER
    ----- ----------
    AC275	       1
    AC275	       2
    WJ250	       1
    WJ250	       2 */

SELECT      Flight_number, Leg_number
    FROM    Flight_leg
    WHERE   Flight_number
        IN  (SELECT  flight_number
             FROM flight_leg
             WHERE Leg_number > 1);

/* For each flight, retrieve the flight number, 
   airline, flight date, and number of customers 
   in the flight.
   WJ250 WestJet 15-JAN-17 3
   AC275 AC 10-JAN0-17 1
   PA233 PA 30-JAN-17 1
   PA280 PA 20-JAN-17 1
   */
   
SELECT flight_number, airline, FDate, COUNT(Customer_name)
    FROM (
        SELECT DISTINCT f.flight_number, f.airline, l.FDate, Customer_name
        FROM    Flight f, leg_instance l, seat_reservation s
        WHERE   f.flight_number = l.flight_number
        AND     f.flight_number = s.flight_number)
    GROUP BY    flight_number, airline, FDate;

/* 4. Retrieve the name, seat number, and flight number 
      of each customer in all Air Canada flights
      Mark Black 5C AC275
      Mark Black 14B AC275 */

SELECT Customer_name, Seat_number, s.Flight_number
    FROM seat_reservation s, flight f
    WHERE s.flight_number = f.flight_number
    AND   f.Airline = 'Air Canada';

/* 5. Retrieve the names and flight numbers, departure 
      and arrival airports of all customers who did not 
      fly in a flight that is more than the first leg.
    CUSTOMER_NAME		  FLIGH DEP DEPART		      ARR ARRIVE
    ------------------------- ----- --- ------------------------- --- -------------------------
    Peter Opo		  PA233 YQG Windsor Airport	      YYZ Pearson Airport
    Chris Natta		  PA280 YYZ Pearson Airport	      YQG Windsor Airport
*/

SELECT  s.Customer_name, s.Flight_number, l.departure_airport_code,
     a.name AS Depart, l.arrival_airport_code, aa.name AS Arrive
    FROM seat_reservation s, Airport a, Airport aa, leg_instance l
    WHERE s.Flight_number 
    IN     (SELECT      Flight_number 
            FROM        Flight_leg
            GROUP BY    Flight_number
            HAVING       COUNT(Leg_number) = 1)
    AND s.Flight_number=l.Flight_number
    AND l.departure_airport_code=a.airport_code
    AND l.arrival_airport_code=aa.airport_code;