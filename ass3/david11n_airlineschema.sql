CREATE TABLE AIRPORT
    (Airport_code   VARCHAR2(3),
     Name           VARCHAR2(25),
     City           VARCHAR2(15),
     STATE          VARCHAR2(2),
     PRIMARY KEY(Airport_Code) );

CREATE TABLE FLIGHT
    (Flight_number  VARCHAR2(5),
     Airline        VARCHAR2(15),
     Weekdays       NUMBER(1),
     PRIMARY KEY(Flight_Number) );

CREATE TABLE FLIGHT_LEG
    (Flight_number  VARCHAR2(5),
     Leg_number     NUMBER(2),
     Departure_airport_code     VARCHAR2(3),
     Scheduled_departure_time   VARCHAR2(5),
     Arrival_airport_code       VARCHAR2(3),
     Scheduled_arrival_time     VARCHAR2(5),
     PRIMARY KEY (Flight_number, Leg_number),
     FOREIGN KEY (Flight_number) REFERENCES FLIGHT (Flight_number),
     FOREIGN KEY (Departure_airport_code) REFERENCES AIRPORT (Airport_code),
     FOREIGN KEY (Arrival_airport_code) REFERENCES AIRPORT (Airport_code) );

CREATE TABLE LEG_INSTANCE
    (Flight_number  VARCHAR2(5),
     Leg_number     NUMBER(2),
     FDate          DATE,
     Num_available_seats    NUMBER(3),
     Airplane_id    VARCHAR2(15),
     Departure_airport_code VARCHAR2(3),
     Departure_time VARCHAR2(5),
     Arrival_airport_code   VARCHAR2(3),
     Arrival_time   VARCHAR2(5),
     PRIMARY KEY(Flight_number, Leg_number, FDate),
     FOREIGN KEY (Flight_number, Leg_number) REFERENCES  FLIGHT_LEG (Flight_number, Leg_number),
     FOREIGN KEY (Departure_airport_code) REFERENCES AIRPORT (Airport_code),
     FOREIGN KEY (Arrival_airport_code) REFERENCES AIRPORT (Airport_code) );

CREATE TABLE FARE
    (Flight_number  VARCHAR2(5),
     Fare_code      VARCHAR2(2),
     Amount         Number(6,2),
     Restrictions   VARCHAR2(20),
     PRIMARY KEY (Flight_number, Fare_code),
     FOREIGN KEY (Flight_number) REFERENCES FLIGHT (Flight_number) );

CREATE TABLE SEAT_RESERVATION
    (Flight_number  VARCHAR2(5),
     Leg_number     NUMBER(2),
     FDate          DATE,
     Seat_number    VARCHAR2(4),
     Customer_name  VARCHAR2(25),
     Customer_phone VARCHAR2(12),
     PRIMARY KEY (Flight_number, Leg_number, FDate, Seat_number),
     FOREIGN KEY (Flight_number, Leg_number, FDate) REFERENCES LEG_INSTANCE (Flight_number, Leg_number, FDate)
     );