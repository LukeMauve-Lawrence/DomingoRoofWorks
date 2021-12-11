# DomingoRoofWorks
##### Table of Contents  
[Queries](#queries)   
[Migration to Azure](#migration)  
[Table Creates](#creates)  
[Table Inserts](#inserts)  
 



<a name="queries"/>

## Queries
#### Select all the job cards and which employees have worked on them.
```
SELECT J.*, E.Employee_No, E.First_Name, E.Last_Name
FROM JOBCARD J, EMPLOYEE E, JOBCARD_EMPLOYEE JE
WHERE (J.Job_Card_No = JE.Job_Card_No) AND (E.Employee_No = JE.Employee_No);
```

### Select the materials that have been used on job cards of type ‘Full Conversion’.
```
SELECT CONCAT(MU.Amount_Used, ' x ', M.Material_Name) "Materials", JT.Job_Type
FROM MATERIAL M, JOB_TYPE JT, MATERIALS_USED MU, JOBCARD J, ORDERS O
WHERE (M.Material_ID = MU.Material_ID) AND (J.Job_Card_No = MU.Job_Card_No)
AND (O.Orders_ID = J.Orders_ID) AND (O.Job_Type_ID = JT.Job_Type_ID)
AND (JT.Job_Type = 'Full Conversion')
ORDER BY J.Job_Card_No;
```

### Write a query that selects all the job cards that Chris Byne has worked on.
```
SELECT J.*, E.First_Name, E.Last_Name
FROM JOBCARD J, JOBCARD_EMPLOYEE JE, EMPLOYEE E
WHERE (J.Job_Card_No = JE.Job_Card_No) AND (E.Employee_No = JE.Employee_No)
AND (E.First_Name = 'Chris') AND (E.Last_Name = 'Byne');
```

### Write a query that shows all job cards that have taken place in addresses that contain ‘0001’ or ‘0002’.
```
SELECT J.*, A.*
FROM JOBCARD J, CUSTOMER C, INVOICE I, ADDRESS_INFO A
WHERE (J.Job_Card_No = I.Job_Card_No) AND (C.Customer_ID = I.Customer_ID)
AND (C.Address_ID = A.Address_ID) AND 
((A.Postal_Code = '0002') OR (A.Postal_Code = '0001'));
```

### Write a query that counts the number of jobs that have used electrical wiring.
```
SELECT COUNT(M.Material_Name) "Number of jobs that have used electrical wiring."
FROM JOBCARD J, MATERIAL M, MATERIALS_USED MU
WHERE (J.Job_Card_No = MU.Job_Card_No) AND (MU.Material_ID = M.Material_ID)
AND (M.Material_Name = 'Metres of standard electrical wiring');
```

### Write a query that produces the output that could be used to prepare an invoice. This should include a calculation for VAT charged on a job card (calculated at 14% of total cost of the job card).
```
SELECT J.Job_Card_No, CONCAT(C.First_Name, ' ', C.Last_Name, ', ', A.City, ', ', A.Postal_Code, ', ', A.Street_Address, ', ',  A.Suburb) "Customer Details", JT.Job_Type,
SUBSTRING(
        (
            SELECT ', '+ E.Employee_No + ' ' + E.First_Name + ' ' + E.Last_Name AS [text()]
            FROM EMPLOYEE E, JOBCARD_EMPLOYEE JE
            WHERE (E.Employee_No = JE.Employee_No) AND (JE.Job_Card_No = J.Job_Card_No)
            ORDER BY J.Job_Card_No
            FOR XML PATH ('')
        ), 2, 1000) [Employees Allocated], 
SUBSTRING(
        (
            SELECT ', '+ CAST(MU.Amount_Used AS VARCHAR)+' x '+ CAST(M.Material_Name AS VARCHAR)  AS [text()]
            FROM MATERIAL M, MATERIALS_USED MU
            WHERE (M.Material_ID = MU.Material_ID) AND (MU.Job_Card_No = J.Job_Card_No)
            ORDER BY J.Job_Card_No
            FOR XML PATH ('')
        ), 2, 1000) [Equipment/Materials], 
CONCAT('R', JT.Daily_Rate) "Daily Rate", J.No_of_Days, 
CONCAT('R', (JT.Daily_Rate * J.No_of_Days)) "Subtotal", CONCAT('R', CAST(ROUND((((JT.Daily_Rate * J.No_of_Days) * 14) / 100), 2, 0) AS DECIMAL(18,2))) "VAT @14%", 
CONCAT('R', ((JT.Daily_Rate * J.No_of_Days) + CAST(ROUND((((JT.Daily_Rate * J.No_of_Days) * 14) / 100), 2, 0) AS DECIMAL(18,2)))) "Total"
FROM JOBCARD J, CUSTOMER C, ADDRESS_INFO A, JOB_TYPE JT,  ORDERS O, QUOTATION Q
WHERE (A.Address_ID = C.Address_ID) AND (C.Customer_ID = Q.Customer_ID) AND (Q.Quotation_No = O.Quotation_No) AND (O.Job_Type_ID = JT.Job_Type_ID) AND (J.Orders_ID = O.Orders_ID)
ORDER BY J.Job_Card_No;
```

### Update the daily rate of pay for a Full Conversion to R1 440.00.
```
UPDATE JOB_TYPE
SET Daily_Rate = 1440
WHERE (Job_Type = 'Full Conversion');
```


<a name="migration"/>

## Migration of the database to the Windows Azure Online Platform
```

```

<a name="creates"/>
 
## Table Creates
```
CREATE TABLE ADDRESS_INFO (
Address_ID CHAR(5),
Street_Address VARCHAR(255) NOT NULL,
Suburb VARCHAR(255) NOT NULL,
City VARCHAR(255) NOT NULL,
Postal_Code VARCHAR(10) NOT NULL,
CONSTRAINT PK_ADDRESS_INFO PRIMARY KEY (Address_ID)
);

CREATE TABLE CUSTOMER (
Customer_ID CHAR(5),
First_Name VARCHAR(255) NOT NULL,
Last_Name VARCHAR(255) NOT NULL,
Address_ID CHAR(5),
Email VARCHAR(255) NOT NULL,
Phone_Number CHAR(10) NOT NULL,
CONSTRAINT PK_CUSTOMER PRIMARY KEY (Customer_ID),
CONSTRAINT FK_CUSTOMER_ADDRESS_INFO FOREIGN KEY (Address_ID) REFERENCES ADDRESS_INFO(Address_ID)
);

CREATE TABLE SUPPLIER (
Supplier_ID CHAR(5),
Supplier_Name VARCHAR(255) NOT NULL,
Address_ID CHAR(5),
Email VARCHAR(255) NOT NULL,
Phone_Number CHAR(10) NOT NULL,
CONSTRAINT PK_SUPPLIER PRIMARY KEY (Supplier_ID),
CONSTRAINT FK_SUPPLIER_ADDRESS_INFO FOREIGN KEY (Address_ID) REFERENCES ADDRESS_INFO(Address_ID)
);

CREATE TABLE EMPLOYEE (
Employee_No CHAR(6),
First_Name VARCHAR(255) NOT NULL,
Last_Name VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Phone_Number CHAR(10) NOT NULL,
Address_ID CHAR(5),
CONSTRAINT PK_EMPLOYEE PRIMARY KEY (Employee_No),
CONSTRAINT FK_EMPLOYEE_ADDRESS_INFO FOREIGN KEY (Address_ID) REFERENCES ADDRESS_INFO(Address_ID)
);

CREATE TABLE JOB_TYPE (
Job_Type_ID CHAR(5),
Job_Type VARCHAR(255) NOT NULL,
Daily_Rate DECIMAL(9,2) NOT NULL,
CONSTRAINT PK_JOB_TYPE PRIMARY KEY (Job_Type_ID)
);

CREATE TABLE QUOTATION (
Quotation_No CHAR(5),
Customer_ID CHAR(5),
Job_Type_ID CHAR(5),
Estimated_Price INT NOT NULL,
Estimated_No_of_Days INT NOT NULL,
CONSTRAINT PK_QUOTATION PRIMARY KEY (Quotation_No),
CONSTRAINT FK_QUOTATION_JOB_TYPE FOREIGN KEY (Job_Type_ID) REFERENCES JOB_TYPE(Job_Type_ID),
CONSTRAINT FK_QUOTATION_CUSTOMER FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

CREATE TABLE ORDERS (
Orders_ID CHAR(5),
Quotation_No CHAR(5),
Job_Type_ID CHAR(5),
CONSTRAINT PK_ORDERS PRIMARY KEY (Orders_ID),
CONSTRAINT FK_ORDERS_JOB_TYPE FOREIGN KEY (Job_Type_ID) REFERENCES JOB_TYPE(Job_Type_ID),
CONSTRAINT FK_ORDERS_QUOTATION FOREIGN KEY (Quotation_No) REFERENCES QUOTATION(Quotation_No)
);

CREATE TABLE JOBCARD (
Job_Card_No CHAR(5),
No_of_Days INT NOT NULL,
Orders_ID CHAR(5),
CONSTRAINT PK_JOBCARD PRIMARY KEY (Job_Card_No),
CONSTRAINT FK_JOBCARD_ORDERS FOREIGN KEY (Orders_ID) REFERENCES ORDERS(Orders_ID)
);

CREATE TABLE JOBCARD_EMPLOYEE (
Job_Card_No CHAR(5),
Employee_No CHAR(6),
CONSTRAINT PK_JOBCARD_EMPLOYEE PRIMARY KEY (Job_Card_No, Employee_No),
CONSTRAINT FK_JOBCARD_EMPLOYEE_EMPLOYEE FOREIGN KEY (Employee_No) REFERENCES EMPLOYEE(Employee_No),
CONSTRAINT FK_JOBCARD_EMPLOYEE_JOBCARD FOREIGN KEY (Job_Card_No) REFERENCES JOBCARD(Job_Card_No)
);

CREATE TABLE MATERIAL (
Material_ID CHAR(5),
Material_Name VARCHAR(255) NOT NULL,
Material_Description VARCHAR(255) NOT NULL,
Material_Price DECIMAL(9,2) NOT NULL,
Supplier_ID CHAR(5),
CONSTRAINT PK_MATERIAL PRIMARY KEY (Material_ID),
CONSTRAINT FK_MATERIAL_SUPPLIER FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER(Supplier_ID)
);

CREATE TABLE EQUIPMENT (
Equipment_ID CHAR(5),
Equipment_Name VARCHAR(255) NOT NULL,
Equipment_Description VARCHAR(255) NOT NULL,
Equipment_Price DECIMAL(9,2) NOT NULL,
Supplier_ID CHAR(5),
CONSTRAINT PK_Equipment PRIMARY KEY (Equipment_ID),
CONSTRAINT FK_Equipment_SUPPLIER FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER(Supplier_ID)
);

CREATE TABLE MATERIALS_USED (
Material_ID CHAR(5),
Job_Card_No CHAR(5),
Amount_Used INT NOT NULL,
CONSTRAINT PK_MATERIALS_USED PRIMARY KEY (Material_ID, Job_Card_No),
CONSTRAINT FK_MATERIALS_USED_JOBCARD FOREIGN KEY (Job_Card_No) REFERENCES JOBCARD(Job_Card_No),
CONSTRAINT FK_MATERIALS_USED_MATERIAL FOREIGN KEY (Material_ID) REFERENCES MATERIAL(Material_ID)
);

CREATE TABLE EQUIPMENT_USED (
Equipment_ID CHAR(5),
Job_Card_No CHAR(5),
Amount_Used INT NOT NULL,
CONSTRAINT PK_EQUIPMENT_USED PRIMARY KEY (Equipment_ID, Job_Card_No),
CONSTRAINT FK_EQUIPMENT_USED_JOBCARD FOREIGN KEY (Job_Card_No) REFERENCES JOBCARD(Job_Card_No),
CONSTRAINT FK_EQUIPMENT_USED_EQUIPMENT FOREIGN KEY (Equipment_ID) REFERENCES EQUIPMENT(Equipment_ID)
);

CREATE TABLE INVOICE (
Invoice_ID CHAR(5),
Job_Card_No CHAR(5),
Customer_ID CHAR(5),
Price DECIMAL(9,2) NOT NULL,
CONSTRAINT PK_INVOICE PRIMARY KEY (Invoice_ID),
CONSTRAINT FK_INVOICE_JOBCARD FOREIGN KEY (Job_Card_No) REFERENCES JOBCARD(Job_Card_No),
CONSTRAINT FK_INVOICE_CUSTOMER FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);
```

<a name="inserts"/>

## Table Inserts
```
INSERT INTO ADDRESS_INFO VALUES
('A001', '3 Leos Place', '457 Church Str', 'PRETORIA', '0002'),
('A002', '408 Oubos', '368 Prinsloo Street', 'PRETORIA', '0001'),
('A003', '206 Albertros', '269 Stead Avenue', 'PRETORIA', '0186'),
('A004', 'A201 Ocerton', '269 Debouvlrde Str', 'PRETORIA', '0002'),
('A005', '11 Luttig Court 289', 'MALTZAN Str', 'PRETORIA', '0001'),
('A006', '876 Silverstone', '1182 CEBINIA Str', 'PRETORIA', '0082'),
('A007', '503 Hamilton Gardens', '337 Visagie Str', 'PRETORIA', '0001'),
('A008', '10 Silville', '614 Jasmyn Str', 'PRETORIA', '0184'),
('A009', '34 Northberg', '307 FEORA East', 'PRETORIA-WEST', '0183'),
('A010', '701 Monticchico Flat', '251 Jacob Mare Str', 'PRETORIA', '0002'),
('A011', '7 Fish Eagle Park', 'Noordhoek', 'CAPE TOWN', '7975'),
('A012', '13 Yellow Wood Road', 'Rondebosch', 'CAPE TOWN', '7975'),
('A013', '76 Whale Road', 'Sandton', 'JOHANNESBURG', '8800'),
('A014', '83 Panorama Rd', 'Rooihuiskraal', 'PRETORIA', '0514'),
('A015', '8 Kalksteen Ave', 'Zwartkop', 'PRETORIA', '0523'),
('A016', '2 Aspen Cres', 'Centurion Central', 'PRETORIA', '0651'),
('A017', '7 Johannes Dr', 'Hennopspark', 'PRETORIA', '0221'),
('A018', '99 Fontein Rd', 'Rooihuiskraal', 'PRETORIA', '0124');

INSERT INTO CUSTOMER VALUES
('C001', 'Tendai', 'Ndoro', 'A001', 'tendaindoro@gmail.com', '0835556666'),
('C002', 'Donald', 'Puttingh', 'A002', 'donaldputtingh@gmail.com', '0724352526'),
('C003', 'Tracy', 'Samson', 'A003', 'tracysamson@gmail.com', '0627778888'),
('C004', 'Jacob', 'Smith', 'A004', 'jacobsmith85@yahoo.com', '0835656544'),
('C005', 'Thato', 'Molepo', 'A005', 'thatomolepo@yahoo.com', '0728138813'),
('C006', 'Dakalo', 'Mudau', 'A006', 'dakalomudau@gmail.com', '0641415162'),
('C007', 'Sfiso', 'Myeni', 'A007', 'sfisomyeni@gmail.com', '0723252345'),
('C008', 'Ricardo', 'Keyl', 'A008', 'ricardokeyl@yahoo.com', '0631235344'),
('C009', 'Smallboy', 'Mtshali', 'A009', 'smallboymtshali@gmail.com', '0541521542'),
('C010', 'Wilson', 'Jansen', 'A010', 'wilsonjansen@gmail.com', '0821781187');

INSERT INTO SUPPLIER VALUES
('S001', 'Builders Warehouse', 'A011', 'manager@builderswarehouse.com', '0217860099'),
('S002', 'BUCO', 'A012', 'manager@buco.com', '0218889999'),
('S003', 'Penny Pinchers', 'A013', 'manager@pennypinchers.com', '0217778888');

INSERT INTO EMPLOYEE VALUES
('EMP100', 'Albert', 'Malose', 'am@gmail.com', '0834525435', 'A014'),
('EMP920', 'Chris', 'Byne', 'cb@yahoo.com', '0721523346', 'A015'),
('EMP010', 'John', 'Hendriks', 'johnhen@gmail.com', '0631532432', 'A016'),
('EMP771', 'Smallboy', 'Modipa', 'smallboy95@yahoo.com', '0741234632', 'A017'),
('EMP681', 'Stanley', 'Jacobs', 'stantheman@gmail.com', '0511325340', 'A018');

INSERT INTO JOB_TYPE VALUES
('JT001', 'Full Conversion', 1200),
('JT002', 'Semi Conversion', 1080),
('JT003', 'Floor Boarding', 900);

INSERT INTO QUOTATION VALUES
('Q001', 'C001', 'JT001', 7200, 6),
('Q002', 'C002', 'JT002', 2160, 2),
('Q003', 'C003', 'JT003', 900, 1),
('Q004', 'C004', 'JT001', 8400, 7),
('Q005', 'C005', 'JT002', 3240, 3),
('Q006', 'C006', 'JT001', 8400, 7),
('Q007', 'C007', 'JT001', 8400, 7),
('Q008', 'C008', 'JT002', 1080, 1),
('Q009', 'C009', 'JT002', 2160, 2),
('Q010', 'C010', 'JT003', 1800, 2);

INSERT INTO ORDERS VALUES
('OD001', 'Q001', 'JT001'),
('OD002', 'Q002', 'JT002'),
('OD003', 'Q003', 'JT003'),
('OD004', 'Q004', 'JT001'),
('OD005', 'Q005', 'JT002'),
('OD006', 'Q006', 'JT001'),
('OD007', 'Q007', 'JT001'),
('OD008', 'Q008', 'JT002'),
('OD009', 'Q009', 'JT002'),
('OD010', 'Q010', 'JT003');

INSERT INTO JOBCARD VALUES
('11000', '7', 'OD001'),
('10478', '2', 'OD002'),
('14253', '2', 'OD003'),
('11258', '8', 'OD004'),
('12058', '3', 'OD005'),
('13697', '7', 'OD006'),
('10211', '7', 'OD007'),
('10471', '2', 'OD008'),
('13521', '3', 'OD009'),
('10102', '2', 'OD010');

INSERT INTO JOBCARD_EMPLOYEE VALUES
('11000', 'EMP100'),
('11000', 'EMP920'),
('11000', 'EMP010'),
('10478', 'EMP920'),
('14253', 'EMP771'),
('11258', 'EMP681'),
('11258', 'EMP010'),
('11258', 'EMP771'),
('12058', 'EMP681');

INSERT INTO MATERIAL VALUES
('M001', 'Standard floor boards', 'Wooden panels for flooring solutions', 159.90 , 'S002'),
('M002', 'Power points', 'Electrical outlets to give access to power', 49.99 , 'S001'),
('M003', 'Metres of standard electrical wiring', 'Copper wiring used to transport power', 25.00 , 'S003'),
('M004', 'Standard stairs pack', 'Pack used to create staircase', 399.90 , 'S002');

INSERT INTO EQUIPMENT VALUES
('EQ001', 'Drill', 'Tool used for making round holes or driving fasteners', 1999.00 , 'S003'),
('EQ002', 'Hammer', 'Tool swung to deliver impact to a small area', 69.99 , 'S001'),
('EQ003', 'Screwdriver', 'Tool used for screwing and unscrewing screws', 32.40 , 'S002'),
('EQ004', 'Paintbrush', 'Tool used to paint objects', 49.99 , 'S001');

INSERT INTO MATERIALS_USED VALUES
('M001', '11000', 90),
('M002', '11000', 3),
('M003', '11000', 20),
('M004', '11000', 1),
('M001', '10478', 50),
('M002', '10478', 1),
('M003', '10478', 10),
('M001', '14253', 40),
('M001', '11258', 80),
('M002', '11258', 3),
('M003', '11258', 20),
('M004', '11258', 1),
('M001', '12058', 60),
('M002', '12058', 2),
('M003', '12058', 15),
('M001', '13697', 80),
('M002', '13697', 4),
('M003', '13697', 40),
('M004', '13697', 1),
('M001', '10211', 100),
('M002', '10211', 5),
('M003', '10211', 30),
('M004', '10211', 1),
('M001', '10471', 40),
('M002', '10471', 1),
('M003', '10471', 8),
('M001', '13521', 65),
('M002', '13521', 3),
('M003', '13521', 18),
('M001', '10102', 70);

INSERT INTO EQUIPMENT_USED VALUES
('EQ002', '11000', 3),
('EQ001', '11000', 1),
('EQ003', '11000', 3),
('EQ003', '10478', 2),
('EQ003', '10478', 4),
('EQ003', '10478', 7),
('EQ003', '13697', 1),
('EQ003', '13697', 2),
('EQ002', '14253', 3),
('EQ002', '11258', 5),
('EQ001', '11258', 1),
('EQ001', '12058', 1),
('EQ002', '10211', 3),
('EQ001', '10471', 1),
('EQ001', '13521', 1),
('EQ001', '10102', 1);

INSERT INTO INVOICE VALUES
('IN001', '11000', 'C001', 8400),
('IN002', '10478', 'C002', 2160),
('IN003', '14253', 'C003', 1800),
('IN004', '11258', 'C004', 9600),
('IN005', '12058', 'C005', 3240),
('IN006', '13697', 'C006', 8400),
('IN007', '10211', 'C007', 8400),
('IN008', '10471', 'C008', 2160),
('IN009', '13521', 'C009', 3240),
('IN010', '10102', 'C010', 1800);
```
