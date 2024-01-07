-- Insert Customer 1
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ghent', 'Main Street', '9000', '1');
DECLARE @AddressId1 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family1@example.com', '0123456789', @AddressId1);
DECLARE @ContactInfoId1 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Johnsons', @ContactInfoId1);
DECLARE @CustomerId1 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('John Johnson', '1980-01-01', @CustomerId1);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Jane Johnson', '1982-02-02', @CustomerId1);

-- Insert Customer 2
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Brussels', 'Second Street', '1000', '2');
DECLARE @AddressId2 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family2@example.com', '0234567890', @AddressId2);
DECLARE @ContactInfoId2 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Smiths', @ContactInfoId2);
DECLARE @CustomerId2 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Alice Smith', '1990-03-03', @CustomerId2);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Bob Smith', '1992-04-04', @CustomerId2);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Charlie Smith', '1994-05-05', @CustomerId2);

-- Customer 3
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Antwerp', 'Third Avenue', '2000', '3');
DECLARE @AddressId3 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family3@example.com', '0334567890', @AddressId3);
DECLARE @ContactInfoId3 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Adams Family', @ContactInfoId3);
DECLARE @CustomerId3 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Alice Adams', '1975-06-01', @CustomerId3);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Alex Adams', '1978-07-02', @CustomerId3);

-- Customer 4
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Leuven', 'Fourth Lane', '3000', '4');
DECLARE @AddressId4 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family4@example.com', '0444567890', @AddressId4);
DECLARE @ContactInfoId4 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Baker Family', @ContactInfoId4);
DECLARE @CustomerId4 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Brian Baker', '1980-08-03', @CustomerId4);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Brenda Baker', '1983-09-04', @CustomerId4);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Benjamin Baker', '2010-10-05', @CustomerId4);

-- Customer 6
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Bruges', 'Fifth Street', '8000', '5');
DECLARE @AddressId6 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family6@example.com', '0555567890', @AddressId6);
DECLARE @ContactInfoId6 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Carter Family', @ContactInfoId6);
DECLARE @CustomerId6 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Carl Carter', '1985-11-06', @CustomerId6);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Cathy Carter', '1988-12-07', @CustomerId6);

-- Customer 7
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Liege', 'Sixth Road', '4000', '6');
DECLARE @AddressId7 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family7@example.com', '0666667890', @AddressId7);
DECLARE @ContactInfoId7 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Davis Family', @ContactInfoId7);
DECLARE @CustomerId7 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('David Davis', '1990-01-08', @CustomerId7);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Diana Davis', '1992-02-09', @CustomerId7);

-- Customer 8
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Namur', 'Seventh Ave', '5000', '7');
DECLARE @AddressId8 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family8@example.com', '0777777890', @AddressId8);
DECLARE @ContactInfoId8 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Evans Family', @ContactInfoId8);
DECLARE @CustomerId8 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Evan Evans', '1995-03-10', @CustomerId8);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Elsa Evans', '1997-04-11', @CustomerId8);

-- Customer 9
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Mons', 'Eighth Boulevard', '7000', '8');
DECLARE @AddressId9 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family9@example.com', '0888887890', @AddressId9);
DECLARE @ContactInfoId9 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Fisher Family', @ContactInfoId9);
DECLARE @CustomerId9 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Fiona Fisher', '1989-05-12', @CustomerId9);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Fred Fisher', '1991-06-13', @CustomerId9);

-- Customer 10
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Aalst', 'Ninth Lane', '9300', '9');
DECLARE @AddressId10 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family10@example.com', '0999997890', @AddressId10);
DECLARE @ContactInfoId10 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Gray Family', @ContactInfoId10);
DECLARE @CustomerId10 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Gary Gray', '1975-07-14', @CustomerId10);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Gina Gray', '1978-08-15', @CustomerId10);

-- Customer 11
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Kortrijk', 'Tenth Street', '8500', '10');
DECLARE @AddressId11 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family11@example.com', '1010107890', @AddressId11);
DECLARE @ContactInfoId11 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Hill Family', @ContactInfoId11);
DECLARE @CustomerId11 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Hannah Hill', '1980-09-16', @CustomerId11);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Howard Hill', '1983-10-17', @CustomerId11);

-- Customer 12
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Mechelen', 'Eleventh Avenue', '2800', '11');
DECLARE @AddressId12 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family12@example.com', '1212127890', @AddressId12);
DECLARE @ContactInfoId12 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Irvine Family', @ContactInfoId12);
DECLARE @CustomerId12 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Ian Irvine', '1986-11-18', @CustomerId12);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Isla Irvine', '1989-12-19', @CustomerId12);

-- Customer 13
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ostend', 'Twelfth Road', '8400', '12');
DECLARE @AddressId13 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family13@example.com', '1313137890', @AddressId13);
DECLARE @ContactInfoId13 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Jones Family', @ContactInfoId13);
DECLARE @CustomerId13 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Jack Jones', '1990-01-20', @CustomerId13);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Julia Jones', '1992-02-21', @CustomerId13);

-- Customer 14
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Genk', 'Thirteenth Blvd', '3600', '13');
DECLARE @AddressId14 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family14@example.com', '1414147890', @AddressId14);
DECLARE @ContactInfoId14 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The King Family', @ContactInfoId14);
DECLARE @CustomerId14 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Kevin King', '1993-03-22', @CustomerId14);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Kelly King', '1995-04-23', @CustomerId14);

-- Customer 15
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Hasselt', 'Fourteenth Lane', '3500', '14');
DECLARE @AddressId15 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family15@example.com', '1515157890', @AddressId15);
DECLARE @ContactInfoId15 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Lambert Family', @ContactInfoId15);
DECLARE @CustomerId15 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Lucas Lambert', '1987-05-24', @CustomerId15);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Linda Lambert', '1990-06-25', @CustomerId15);

-- Customer 16
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('La Louvière', 'Fifteenth Way', '7100', '15');
DECLARE @AddressId16 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family16@example.com', '1616167890', @AddressId16);
DECLARE @ContactInfoId16 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Murray Family', @ContactInfoId16);
DECLARE @CustomerId16 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Michael Murray', '1975-07-26', @CustomerId16);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Michelle Murray', '1980-08-27', @CustomerId16);

-- Customer 17
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Sint-Niklaas', 'Sixteenth Avenue', '9100', '16');
DECLARE @AddressId17 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family17@example.com', '1717177890', @AddressId17);
DECLARE @ContactInfoId17 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Newman Family', @ContactInfoId17);
DECLARE @CustomerId17 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Nathan Newman', '1985-09-28', @CustomerId17);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Natalie Newman', '1988-10-29', @CustomerId17);

-- Customer 18
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Turnhout', 'Seventeenth Street', '2300', '17');
DECLARE @AddressId18 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family18@example.com', '1818187890', @AddressId18);
DECLARE @ContactInfoId18 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Olson Family', @ContactInfoId18);
DECLARE @CustomerId18 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Oliver Olson', '1991-11-30', @CustomerId18);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Olivia Olson', '1994-12-31', @CustomerId18);

-- Customer 19
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Verviers', 'Eighteenth Avenue', '4800', '18');
DECLARE @AddressId19 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family19@example.com', '1919197890', @AddressId19);
DECLARE @ContactInfoId19 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Patterson Family', @ContactInfoId19);
DECLARE @CustomerId19 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Patrick Patterson', '1982-01-01', @CustomerId19);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Paula Patterson', '1985-02-02', @CustomerId19);

-- Customer 20
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Roeselare', 'Nineteenth Road', '8800', '19');
DECLARE @AddressId20 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family20@example.com', '2020207890', @AddressId20);
DECLARE @ContactInfoId20 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Quinn Family', @ContactInfoId20);
DECLARE @CustomerId20 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Quincy Quinn', '1986-03-03', @CustomerId20);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Quinn Quinn', '1989-04-04', @CustomerId20);

-- Customer 21
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Tournai', 'Twentieth Lane', '7500', '20');
DECLARE @AddressId21 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family21@example.com', '2121217890', @AddressId21);
DECLARE @ContactInfoId21 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Rivera Family', @ContactInfoId21);
DECLARE @CustomerId21 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Rachel Rivera', '1975-05-05', @CustomerId21);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Ray Rivera', '1978-06-06', @CustomerId21);

-- Customer 22
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Waregem', 'Twenty-First Boulevard', '8790', '21');
DECLARE @AddressId22 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family22@example.com', '2222227890', @AddressId22);
DECLARE @ContactInfoId22 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Sanchez Family', @ContactInfoId22);
DECLARE @CustomerId22 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Samuel Sanchez', '1981-07-07', @CustomerId22);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Sara Sanchez', '1984-08-08', @CustomerId22);

-- Customer 23
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Wavre', 'Twenty-Second Street', '1300', '22');
DECLARE @AddressId23 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family23@example.com', '2323237890', @AddressId23);
DECLARE @ContactInfoId23 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Thompson Family', @ContactInfoId23);
DECLARE @CustomerId23 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Thomas Thompson', '1979-09-09', @CustomerId23);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Tina Thompson', '1982-10-10', @CustomerId23);

-- Customer 24
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ypres', 'Twenty-Third Avenue', '8900', '23');
DECLARE @AddressId24 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family24@example.com', '2424247890', @AddressId24);
DECLARE @ContactInfoId24 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Underwood Family', @ContactInfoId24);
DECLARE @CustomerId24 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Ulysses Underwood', '1983-11-11', @CustomerId24);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Uma Underwood', '1986-12-12', @CustomerId24);

-- Customer 25
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Zaventem', 'Twenty-Fourth Street', '1930', '24');
DECLARE @AddressId25 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family25@example.com', '2525257890', @AddressId25);
DECLARE @ContactInfoId25 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Vincent Family', @ContactInfoId25);
DECLARE @CustomerId25 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Victor Vincent', '1984-01-13', @CustomerId25);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Violet Vincent', '1987-02-14', @CustomerId25);

-- Customer 26
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Waterloo', 'Twenty-Fifth Avenue', '1410', '25');
DECLARE @AddressId26 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family26@example.com', '2626267890', @AddressId26);
DECLARE @ContactInfoId26 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Wilson Family', @ContactInfoId26);
DECLARE @CustomerId26 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Wendy Wilson', '1988-03-15', @CustomerId26);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Walter Wilson', '1991-04-16', @CustomerId26);

-- Customer 27
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Vilvoorde', 'Twenty-Sixth Lane', '1800', '26');
DECLARE @AddressId27 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family27@example.com', '2727277890', @AddressId27);
DECLARE @ContactInfoId27 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Young Family', @ContactInfoId27);
DECLARE @CustomerId27 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Yvonne Young', '1979-05-17', @CustomerId27);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Yuri Young', '1982-06-18', @CustomerId27);

-- Customer 28
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Tienen', 'Twenty-Seventh Boulevard', '3300', '27');
DECLARE @AddressId28 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family28@example.com', '2828287890', @AddressId28);
DECLARE @ContactInfoId28 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Xavier Family', @ContactInfoId28);
DECLARE @CustomerId28 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Xander Xavier', '1990-07-19', @CustomerId28);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Xenia Xavier', '1993-08-20', @CustomerId28);

-- Customer 29
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Seraing', 'Twenty-Eighth Street', '4100', '28');
DECLARE @AddressId29 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family29@example.com', '2929297890', @AddressId29);
DECLARE @ContactInfoId29 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Younger Family', @ContactInfoId29);
DECLARE @CustomerId29 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Yasmine Younger', '1994-09-21', @CustomerId29);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Yosef Younger', '1997-10-22', @CustomerId29);

-- Customer 30
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ronse', 'Twenty-Ninth Avenue', '9600', '29');
DECLARE @AddressId30 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family30@example.com', '3030307890', @AddressId30);
DECLARE @ContactInfoId30 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Zimmerman Family', @ContactInfoId30);
DECLARE @CustomerId30 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Zachary Zimmerman', '1985-11-23', @CustomerId30);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Zoe Zimmerman', '1988-12-24', @CustomerId30);

-- Customer 31
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Lokeren', 'Thirtieth Street', '9160', '30');
DECLARE @AddressId31 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family31@example.com', '3131317890', @AddressId31);
DECLARE @ContactInfoId31 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Armstrong Family', @ContactInfoId31);
DECLARE @CustomerId31 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Arthur Armstrong', '1991-01-25', @CustomerId31);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Angela Armstrong', '1994-02-26', @CustomerId31);

-- Customer 32
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Geel', 'Thirty-First Avenue', '2440', '31');
DECLARE @AddressId32 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family32@example.com', '3232327890', @AddressId32);
DECLARE @ContactInfoId32 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Brooks Family', @ContactInfoId32);
DECLARE @CustomerId32 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Brandon Brooks', '1992-03-27', @CustomerId32);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Brianna Brooks', '1995-04-28', @CustomerId32);

-- Customer 33
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Herstal', 'Thirty-Second Lane', '4040', '32');
DECLARE @AddressId33 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family33@example.com', '3333337890', @AddressId33);
DECLARE @ContactInfoId33 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Coleman Family', @ContactInfoId33);
DECLARE @CustomerId33 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Caleb Coleman', '1993-05-29', @CustomerId33);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Claire Coleman', '1996-06-30', @CustomerId33);

-- Customer 34
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Halle', 'Thirty-Third Boulevard', '1500', '33');
DECLARE @AddressId34 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family34@example.com', '3434347890', @AddressId34);
DECLARE @ContactInfoId34 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Duncan Family', @ContactInfoId34);
DECLARE @CustomerId34 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Derek Duncan', '1994-07-31', @CustomerId34);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Danielle Duncan', '1997-08-01', @CustomerId34);

-- Customer 35
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Maasmechelen', 'Thirty-Fourth Street', '3630', '34');
DECLARE @AddressId35 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family35@example.com', '3535357890', @AddressId35);
DECLARE @ContactInfoId35 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Edwards Family', @ContactInfoId35);
DECLARE @CustomerId35 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Ethan Edwards', '1995-09-02', @CustomerId35);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Emma Edwards', '1998-10-03', @CustomerId35);

-- Customer 36
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Mol', 'Thirty-Fifth Avenue', '2400', '35');
DECLARE @AddressId36 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family36@example.com', '3636367890', @AddressId36);
DECLARE @ContactInfoId36 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Fisher Family', @ContactInfoId36);
DECLARE @CustomerId36 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Frank Fisher', '1996-11-04', @CustomerId36);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Fiona Fisher', '1999-12-05', @CustomerId36);

-- Customer 37
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Oudenaarde', 'Thirty-Sixth Lane', '9700', '36');
DECLARE @AddressId37 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family37@example.com', '3737377890', @AddressId37);
DECLARE @ContactInfoId37 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Green Family', @ContactInfoId37);
DECLARE @CustomerId37 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('George Green', '1997-01-06', @CustomerId37);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Grace Green', '2000-02-07', @CustomerId37);

-- Customer 38
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Peer', 'Thirty-Seventh Boulevard', '3990', '37');
DECLARE @AddressId38 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family38@example.com', '3838387890', @AddressId38);
DECLARE @ContactInfoId38 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Harris Family', @ContactInfoId38);
DECLARE @CustomerId38 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Henry Harris', '1998-03-08', @CustomerId38);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Helen Harris', '2001-04-09', @CustomerId38);

-- Customer 39
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Tongeren', 'Thirty-Eighth Street', '3700', '38');
DECLARE @AddressId39 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family39@example.com', '3939397890', @AddressId39);
DECLARE @ContactInfoId39 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Irving Family', @ContactInfoId39);
DECLARE @CustomerId39 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Isaac Irving', '1999-05-10', @CustomerId39);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Ivy Irving', '2002-06-11', @CustomerId39);

-- Customer 40
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Willebroek', 'Thirty-Ninth Avenue', '2830', '39');
DECLARE @AddressId40 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family40@example.com', '4040407890', @AddressId40);
DECLARE @ContactInfoId40 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Jackson Family', @ContactInfoId40);
DECLARE @CustomerId40 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Jacob Jackson', '2000-07-12', @CustomerId40);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Julia Jackson', '2003-08-13', @CustomerId40);

-- Customer 41
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Bilzen', 'Fortieth Lane', '3740', '40');
DECLARE @AddressId41 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family41@example.com', '4141417890', @AddressId41);
DECLARE @ContactInfoId41 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Keller Family', @ContactInfoId41);
DECLARE @CustomerId41 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Kyle Keller', '2001-09-14', @CustomerId41);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Kara Keller', '2004-10-15', @CustomerId41);

-- Customer 42
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Boom', 'Forty-First Boulevard', '2850', '41');
DECLARE @AddressId42 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family42@example.com', '4242427890', @AddressId42);
DECLARE @ContactInfoId42 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Lawson Family', @ContactInfoId42);
DECLARE @CustomerId42 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Leo Lawson', '2002-11-16', @CustomerId42);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Lily Lawson', '2005-12-17', @CustomerId42);

-- Customer 43
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Dendermonde', 'Forty-Second Street', '9200', '42');
DECLARE @AddressId43 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family43@example.com', '4343437890', @AddressId43);
DECLARE @ContactInfoId43 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Morgan Family', @ContactInfoId43);
DECLARE @CustomerId43 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Miles Morgan', '2003-01-18', @CustomerId43);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Mia Morgan', '2006-02-19', @CustomerId43);

-- Customer 44
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ninove', 'Forty-Third Avenue', '9400', '43');
DECLARE @AddressId44 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family44@example.com', '4444447890', @AddressId44);
DECLARE @ContactInfoId44 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Newman Family', @ContactInfoId44);
DECLARE @CustomerId44 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Nolan Newman', '2004-03-20', @CustomerId44);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Nora Newman', '2007-04-21', @CustomerId44);

-- Customer 45
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Izegem', 'Forty-Fourth Lane', '8870', '44');
DECLARE @AddressId45 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family45@example.com', '4545457890', @AddressId45);
DECLARE @ContactInfoId45 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Owens Family', @ContactInfoId45);
DECLARE @CustomerId45 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Oscar Owens', '2005-05-22', @CustomerId45);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Olivia Owens', '2008-06-23', @CustomerId45);

-- Customer 46
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Lommel', 'Forty-Fifth Boulevard', '3920', '45');
DECLARE @AddressId46 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family46@example.com', '4646467890', @AddressId46);
DECLARE @ContactInfoId46 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Peterson Family', @ContactInfoId46);
DECLARE @CustomerId46 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Peter Peterson', '2006-07-24', @CustomerId46);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Pamela Peterson', '2009-08-25', @CustomerId46);

-- Customer 47
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Aarschot', 'Forty-Sixth Street', '3200', '46');
DECLARE @AddressId47 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family47@example.com', '4747477890', @AddressId47);
DECLARE @ContactInfoId47 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Quinn Family', @ContactInfoId47);
DECLARE @CustomerId47 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Quincy Quinn', '2007-09-26', @CustomerId47);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Queenie Quinn', '2010-10-27', @CustomerId47);

-- Customer 48
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Harelbeke', 'Forty-Seventh Avenue', '8530', '47');
DECLARE @AddressId48 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family48@example.com', '4848487890', @AddressId48);
DECLARE @ContactInfoId48 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Robinson Family', @ContactInfoId48);
DECLARE @CustomerId48 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Ryan Robinson', '2008-11-28', @CustomerId48);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Rachel Robinson', '2011-12-29', @CustomerId48);

-- Customer 49
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Menen', 'Forty-Eighth Lane', '8930', '48');
DECLARE @AddressId49 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family49@example.com', '4949497890', @AddressId49);
DECLARE @ContactInfoId49 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Stevenson Family', @ContactInfoId49);
DECLARE @CustomerId49 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Scott Stevenson', '2009-01-30', @CustomerId49);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Sophie Stevenson', '2012-02-31', @CustomerId49);

-- Customer 50
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Wevelgem', 'Forty-Ninth Boulevard', '8560', '49');
DECLARE @AddressId50 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('family50@example.com', '5050507890', @AddressId50);
DECLARE @ContactInfoId50 INT = SCOPE_IDENTITY();
INSERT INTO Klant (Name, ContactInfoId) VALUES ('The Taylor Family', @ContactInfoId50);
DECLARE @CustomerId50 INT = SCOPE_IDENTITY();
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Tyler Taylor', '2010-03-01', @CustomerId50);
INSERT INTO Member (Name, Birthday, KlantId) VALUES ('Tara Taylor', '2013-04-02', @CustomerId50);
