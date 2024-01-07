CREATE TABLE ContactInfo (
    Id INT IDENTITY PRIMARY KEY,
    Email NVARCHAR(255),
    Phone NVARCHAR(50),
    AddressId INT,
    FOREIGN KEY (AddressId) REFERENCES Address(Id)
);