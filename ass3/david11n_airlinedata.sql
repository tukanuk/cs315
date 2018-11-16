INSERT INTO AIRPORT (Airport_code, Name, City, State)
        SELECT 'YYZ', 'Pearson Airport', 'Toronto', 'ON' FROM dual UNION ALL
        SELECT 'YTZ', 'Island Airpot', 'Toronto', 'ON' FROM dual UNION ALL
        SELECT 'YQT', 'Thunder Bay Airport', 'Thunder Bay', 'ON' FROM dual UNION ALL
        SELECT 'YQG', 'Windsor Airport', 'Windsor', 'ON' FROM dual UNION ALL
        SELECT 'YYC', 'Calgary Airport', 'Calgary', 'ON' FROM dual; 

INSERT INTO FLIGHT (Flight_number, Airline, Weekdays)
    SELECT 'WJ250', 'WestJet', 3 FROM dual UNION ALL
    SELECT 'WJ261', 'WestJet', 4 FROM dual UNION ALL
    SELECT 'AC275', 'Air Canada', 2 FROM dual UNION ALL
    SELECT 'AC300', 'Air Canada', 3 FROM dual UNION ALL
    SELECT 'AC320', 'Air Canada', 2 FROM dual UNION ALL
    SELECT 'PA233', 'Porter Airline', 5 FROM dual UNION ALL
    SELECT 'PA280', 'Porter Airline', 4 FROM dual;

INSERT INTO FLIGHT_LEG (Flight_number, Leg_number, Departure_airport_code, Scheduled_departure_time, 
    Arrival_airport_code, Scheduled_arrival_time)
    SELECT 'WJ250', 1, 'YQG', '08:00', 'YYZ', '09:00' FROM dual UNION ALL
    SELECT 'WJ250', 2, 'YYZ', '12:00', 'YYC', '17:00' FROM dual UNION ALL
    SELECT 'AC275', 1, 'YQT', '10:00', 'YYZ', '11:00' FROM dual UNION ALL
    SELECT 'AC275', 2, 'YYZ', '13:00', 'YQG', '14:00' FROM dual UNION ALL
    SELECT 'PA233', 1, 'YQG', '16:00', 'YYZ', '17:00' FROM dual UNION ALL
    SELECT 'PA280', 1, 'YYZ', '11:00', 'YQG', '12:00' FROM dual;

INSERT INTO LEG_INSTANCE (Flight_number, Leg_number, FDate, Num_available_seats, Airplane_id, Departure_airport_code,
    Departure_time, Arrival_airport_code, Arrival_time)
    SELECT 'WJ250', 1, '15-JAN-17', 200, 'Boeing_777', 'YQG', '8:00', 'YYZ', '8:50' FROM dual UNION ALL
    SELECT 'WJ250', 2, '15-JAN-17', 200, 'Boeing_777', 'YYZ', '12:30', 'YYC', '16:50' FROM dual UNION ALL
    SELECT 'AC275', 1, '10-JAN-17', 60, 'Airbus_200', 'YQT', '10:00', 'YYZ', '11:00' FROM dual UNION ALL
    SELECT 'AC275', 2, '10-JAN-17', 60, 'Airbus_200', 'YYZ', '13:00', 'YQG', '14:00' FROM dual UNION ALL
    SELECT 'PA233', 1, '30-JAN-17', 120, 'Boeing_737', 'YQG', '16:00', 'YYZ', '17:00' FROM dual UNION ALL
    SELECT 'PA280', 1, '20-JAN-17', 120, 'Boeing_737', 'YYZ', '11:00', 'YQG', '12:00' FROM dual;

INSERT INTO FARE (Flight_number, Fare_code, Amount, Restrictions)
    SELECT 'WJ250', 'F1', 250.00, 'None' FROM dual UNION ALL
    SELECT 'WJ250', 'F2', 350.00, 'None' FROM dual UNION ALL
    SELECT 'AC275', 'F1', 275.00, 'Non-refundable' FROM dual UNION ALL
    SELECT 'AC275', 'F2', 300.00, 'Non-refundable' FROM dual UNION ALL
    SELECT 'PA233', 'F3', 150.00, 'None' FROM dual UNION ALL
    SELECT 'PA280', 'F3', 150.00, 'None' FROM dual;

INSERT INTO SEAT_RESERVATION (Flight_number, Leg_number, FDate, Seat_number, Customer_name, Customer_phone)
    SELECT 'WJ250', 1, '15-JAN-17', '20A', 'Mariane Mooer', '519-253-3000' FROM dual UNION ALL
    SELECT 'WJ250', 2, '15-JAN-17', '13D', 'Mariane Mooer', '519-253-3000' FROM dual UNION ALL
    SELECT 'WJ250', 1, '15-JAN-17', '6A', 'Tony Appa', '226-253-4000' FROM dual UNION ALL
    SELECT 'WJ250', 2, '15-JAN-17', '7D', 'Tony Appa', '226-253-4000' FROM dual UNION ALL
    SELECT 'WJ250', 1, '15-JAN-17', '6B', 'Karen Appa', '226-253-4000' FROM dual UNION ALL
    SELECT 'WJ250', 2, '15-JAN-17', '7C', 'Karen Appa', '226-253-4000' FROM dual UNION ALL
    SELECT 'AC275', 1, '10-JAN-17', '5C', 'Mark Black', '226-212-5341' FROM dual UNION ALL
    SELECT 'AC275', 2, '10-JAN-17', '14B', 'Mark Black', '226-212-5341' FROM dual UNION ALL
    SELECT 'PA233', 1, '30-JAN-17', '5A', 'Peter Opo', '519-444-1234' FROM dual UNION ALL
    SELECT 'PA280', 1, '20-JAN-17', '16D', 'Chris Natta', '226-123-5555' FROM dual;