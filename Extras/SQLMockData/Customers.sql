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
