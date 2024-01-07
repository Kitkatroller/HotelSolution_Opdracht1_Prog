-- Organisator 1
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Brussels', 'First Lane', '1000', '101');
DECLARE @AddressId1 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator1@example.com', '0102030405', @AddressId1);
DECLARE @ContactInfoId1 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventCorp', @ContactInfoId1);

-- Organisator 2
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Antwerp', 'Second Avenue', '2000', '202');
DECLARE @AddressId2 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator2@example.com', '0203040506', @AddressId2);
DECLARE @ContactInfoId2 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('FestiveEvents', @ContactInfoId2);

-- Organisator 3
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ghent', 'Third Street', '9000', '303');
DECLARE @AddressId3 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator3@example.com', '0304050607', @AddressId3);
DECLARE @ContactInfoId3 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('GalaOrg', @ContactInfoId3);

-- Organisator 4
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Leuven', 'Fourth Road', '3000', '404');
DECLARE @AddressId4 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator4@example.com', '0405060708', @AddressId4);
DECLARE @ContactInfoId4 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventMasters', @ContactInfoId4);

-- Organisator 5
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Liege', 'Fifth Blvd', '4000', '505');
DECLARE @AddressId5 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator5@example.com', '0506070809', @AddressId5);
DECLARE @ContactInfoId5 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('CelebrateNow', @ContactInfoId5);

-- Organisator 6
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Bruges', 'Sixth Street', '8000', '601');
DECLARE @AddressId6 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator6@example.com', '0607080901', @AddressId6);
DECLARE @ContactInfoId6 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('PartyPlanners', @ContactInfoId6);

-- Organisator 7
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Namur', 'Seventh Lane', '5000', '702');
DECLARE @AddressId7 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator7@example.com', '0708090102', @AddressId7);
DECLARE @ContactInfoId7 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventElite', @ContactInfoId7);

-- Organisator 8
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Mons', 'Eighth Avenue', '7000', '803');
DECLARE @AddressId8 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator8@example.com', '0809010203', @AddressId8);
DECLARE @ContactInfoId8 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('FiestaFolk', @ContactInfoId8);

-- Organisator 9
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Aalst', 'Ninth Road', '9300', '904');
DECLARE @AddressId9 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator9@example.com', '0901020304', @AddressId9);
DECLARE @ContactInfoId9 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('GatherGreat', @ContactInfoId9);

-- Organisator 10
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Kortrijk', 'Tenth Blvd', '8500', '1005');
DECLARE @AddressId10 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator10@example.com', '0102030405', @AddressId10);
DECLARE @ContactInfoId10 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventSphere', @ContactInfoId10);

-- Organisator 11
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Hasselt', 'Eleventh Street', '3500', '1101');
DECLARE @AddressId11 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator11@example.com', '1102030405', @AddressId11);
DECLARE @ContactInfoId11 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('MingleMasters', @ContactInfoId11);

-- Organisator 12
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Mechelen', 'Twelfth Lane', '2800', '1202');
DECLARE @AddressId12 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator12@example.com', '1203040506', @AddressId12);
DECLARE @ContactInfoId12 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventHorizon', @ContactInfoId12);

-- Organisator 13
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Genk', 'Thirteenth Avenue', '3600', '1303');
DECLARE @AddressId13 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator13@example.com', '1304050607', @AddressId13);
DECLARE @ContactInfoId13 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('FestivityFocus', @ContactInfoId13);

-- Organisator 14
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('La Louvière', 'Fourteenth Road', '7100', '1404');
DECLARE @AddressId14 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator14@example.com', '1405060708', @AddressId14);
DECLARE @ContactInfoId14 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('CelebrationCentral', @ContactInfoId14);

-- Organisator 15
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Sint-Niklaas', 'Fifteenth Blvd', '9100', '1505');
DECLARE @AddressId15 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator15@example.com', '1506070809', @AddressId15);
DECLARE @ContactInfoId15 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('GalaGurus', @ContactInfoId15);

-- Organisator 16
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Turnhout', 'Sixteenth Street', '2300', '1601');
DECLARE @AddressId16 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator16@example.com', '1607080901', @AddressId16);
DECLARE @ContactInfoId16 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventExcel', @ContactInfoId16);

-- Organisator 17
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Verviers', 'Seventeenth Lane', '4800', '1702');
DECLARE @AddressId17 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator17@example.com', '1708090102', @AddressId17);
DECLARE @ContactInfoId17 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('OccasionOrg', @ContactInfoId17);

-- Organisator 18
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Roeselare', 'Eighteenth Avenue', '8800', '1803');
DECLARE @AddressId18 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator18@example.com', '1809010203', @AddressId18);
DECLARE @ContactInfoId18 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('GalaGenius', @ContactInfoId18);

-- Organisator 19
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Tournai', 'Nineteenth Road', '7500', '1904');
DECLARE @AddressId19 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator19@example.com', '1901020304', @AddressId19);
DECLARE @ContactInfoId19 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('FestiveFiesta', @ContactInfoId19);

-- Organisator 20
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Waregem', 'Twentieth Blvd', '8790', '2005');
DECLARE @AddressId20 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator20@example.com', '2002030405', @AddressId20);
DECLARE @ContactInfoId20 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventEpic', @ContactInfoId20);

-- Organisator 21
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Wavre', 'Twenty-First Street', '1300', '2101');
DECLARE @AddressId21 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator21@example.com', '2103040506', @AddressId21);
DECLARE @ContactInfoId21 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('MegaEvents', @ContactInfoId21);

-- Organisator 22
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Ypres', 'Twenty-Second Lane', '8900', '2202');
DECLARE @AddressId22 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator22@example.com', '2204050607', @AddressId22);
DECLARE @ContactInfoId22 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('CelebrationCrew', @ContactInfoId22);

-- Organisator 23
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Zaventem', 'Twenty-Third Avenue', '1930', '2303');
DECLARE @AddressId23 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator23@example.com', '2305060708', @AddressId23);
DECLARE @ContactInfoId23 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventElevate', @ContactInfoId23);

-- Organisator 24
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Waterloo', 'Twenty-Fourth Road', '1410', '2404');
DECLARE @AddressId24 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator24@example.com', '2406070809', @AddressId24);
DECLARE @ContactInfoId24 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('FestiveFrontiers', @ContactInfoId24);

-- Organisator 25
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Vilvoorde', 'Twenty-Fifth Blvd', '1800', '2505');
DECLARE @AddressId25 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator25@example.com', '2507080910', @AddressId25);
DECLARE @ContactInfoId25 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('GalaGurus', @ContactInfoId25);

-- Organisator 26
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Lokeren', 'Twenty-Sixth Street', '9160', '2601');
DECLARE @AddressId26 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator26@example.com', '2608090102', @AddressId26);
DECLARE @ContactInfoId26 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventHorizonPro', @ContactInfoId26);

-- Organisator 27
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Geel', 'Twenty-Seventh Lane', '2440', '2702');
DECLARE @AddressId27 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator27@example.com', '2709010203', @AddressId27);
DECLARE @ContactInfoId27 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('FestiveFlair', @ContactInfoId27);

-- Organisator 28
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Herstal', 'Twenty-Eighth Avenue', '4040', '2803');
DECLARE @AddressId28 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator28@example.com', '2801020304', @AddressId28);
DECLARE @ContactInfoId28 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('OccasionExperts', @ContactInfoId28);

-- Organisator 29
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Halle', 'Twenty-Ninth Road', '1500', '2904');
DECLARE @AddressId29 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator29@example.com', '2902030405', @AddressId29);
DECLARE @ContactInfoId29 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('GalaGenie', @ContactInfoId29);

-- Organisator 30
INSERT INTO Address (City, Street, PostalCode, HouseNumber) VALUES ('Maasmechelen', 'Thirtieth Blvd', '3630', '3005');
DECLARE @AddressId30 INT = SCOPE_IDENTITY();
INSERT INTO ContactInfo (Email, Phone, AddressId) VALUES ('organisator30@example.com', '3003040506', @AddressId30);
DECLARE @ContactInfoId30 INT = SCOPE_IDENTITY();
INSERT INTO Organisator (Name, ContactInfoId) VALUES ('EventEssentials', @ContactInfoId30);
