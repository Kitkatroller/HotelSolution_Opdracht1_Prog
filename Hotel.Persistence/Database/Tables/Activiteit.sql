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