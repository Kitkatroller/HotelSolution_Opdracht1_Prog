-- Create Address Table
CREATE TABLE Address (
    Id INT IDENTITY PRIMARY KEY,
    City NVARCHAR(255) NOT NULL,
    Street NVARCHAR(255) NOT NULL,
    PostalCode NVARCHAR(50) NOT NULL,
    HouseNumber NVARCHAR(50) NOT NULL
);

-- Create ContactInfo Table
CREATE TABLE ContactInfo (
    Id INT IDENTITY PRIMARY KEY,
    Email NVARCHAR(255),
    Phone NVARCHAR(50),
    AddressId INT,
    FOREIGN KEY (AddressId) REFERENCES Address(Id)
);

-- Create Organisator Table
CREATE TABLE Organisator (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    ContactInfoId INT,
    FOREIGN KEY (ContactInfoId) REFERENCES ContactInfo(Id)
);

-- Create Klant Table
CREATE TABLE Klant (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    ContactInfoId INT,
    FOREIGN KEY (ContactInfoId) REFERENCES ContactInfo(Id)
);

-- Create Member Table
CREATE TABLE Member (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Birthday DATE NOT NULL,
    KlantId INT,
    FOREIGN KEY (KlantId) REFERENCES Klant(Id)
);

-- Create Activiteit Table
CREATE TABLE Activiteit (
    Id INT IDENTITY PRIMARY KEY,
    Description NVARCHAR(MAX) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    Duration TIME NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Date DATETIME NOT NULL,
    AvailablePlaces INT NOT NULL,
    AdultPrice FLOAT NOT NULL,
    ChildPrice FLOAT NOT NULL,
    Discount FLOAT NOT NULL,
    OrganisatorId INT,
    FOREIGN KEY (OrganisatorId) REFERENCES Organisator(Id)
);

CREATE TABLE Inschrijving (
    Id INT IDENTITY PRIMARY KEY,
    MemberId INT,
	ActivityId INT,
    TotalPrice FLOAT NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Member(Id),
    FOREIGN KEY (ActivityId) REFERENCES Activiteit(Id)
);


ALTER TABLE Klant
ADD IsActive BIT NOT NULL DEFAULT 1;

