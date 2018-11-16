/* (a) Retrieve the customer names and flight number of 
       all 2-leg flyers (customers who have flights with 
       2 legs in all their flights).
    CUSTOMER_NAME		  FLIGH
    ------------------------- -----
    Mark Black		  AC275
    Karen Appa		  WJ250
    Tony Appa		  WJ250 */

SELECT DISTINCT s.Customer_name, s.Flight_number
    FROM    Seat_Reservation s
    WHERE EXISTS (SELECT *
                    FROM flight_leg f
                    WHERE s.Flight_number = f.Flight_number
                       AND f.Leg_number=2);

/* b) Retrieve the customer names and flight number of 
      all customers who do not have any 2-leg flight in 
      any of their flights.
    CUSTOMER_NAME		  FLIGH
    ------------------------- -----
    Peter Opo		  PA233
    Chris Natta		  PA280 */

SELECT DISTINCT s.Customer_name, s.Flight_number
    FROM Seat_Reservation s
    WHERE NOT EXISTS (SELECT * 
                        FROM flight_leg f
                        WHERE s.Flight_number = f.Flight_number
                           AND f.Leg_number = 2);