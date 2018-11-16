CREATE TABLE SalesRep
    (SRid       NUMBER(4) NOT NULL,
     SRname     VARCHAR2(15),
     SRage      NUMBER(2), 
     Salary     NUMBER(8,2),
     PRIMARY KEY(SRid) );

CREATE TABLE SalesArea
    (Arid       NUMBER(4) NOT NULL,
     Aname      VARCHAR2(15),
     budget     NUMBER(10,2),
     managerID  NUMBER(4),
     PRIMARY KEY(Arid),
     FOREIGN KEY (managerID) REFERENCES SalesRep (SRid) );

CREATE TABLE WorksIn
    (SRid       NUMBER(4) NOT NULL,
     Arid       NUMBER(4) NOT NULL,
     Hours      NUMBER(3,1),
     PRIMARY KEY(SRid, Arid),
     FOREIGN KEY (SRid) REFERENCES SalesRep (SRid),
     FOREIGN KEY (Arid) REFERENCES SalesArea (Arid) );

INSERT INTO SalesRep VALUES (1111, 'John Smith', 22, 2000.60);
COMMIT;

INSERT INTO SalesRep VALUES (1, 'Ben Davidson', 38, 1000.25);
INSERT INTO SalesRep VALUES (2, 'Jane Doe', 24, 1100.56);
INSERT INTO SalesRep VALUES (3, 'Sara Smith', 44, 1200.43);
INSERT INTO SalesRep VALUES (4, 'Fred Fox', 19, 2300.58);
COMMIT;

INSERT INTO SalesArea VALUES (1, 'North', 10000.41, 1);
INSERT INTO SalesArea VALUES (2, 'East', 11000.19, 3);
INSERT INTO SalesArea VALUES (3, 'Far East', 12000.54, 2);
INSERT INTO SalesArea VALUES (4, 'North East', 9000.11, 4);
COMMIT;

INSERT INTO WorksIn VALUES (1, 2, 40);
INSERT INTO WorksIn VALUES (3, 1, 22);
INSERT INTO WorksIn VALUES (2, 4, 35);
INSERT INTO WorksIn VALUES (4, 3, 50);
COMMIT;

select * from cat;

select * from SalesRep;

