CREATE TABLE Organisator (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    ContactInfoId INT,
    FOREIGN KEY (ContactInfoId) REFERENCES ContactInfo(Id)
);