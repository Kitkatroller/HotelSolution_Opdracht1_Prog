﻿CREATE TABLE Klant (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    ContactInfoId INT,
    FOREIGN KEY (ContactInfoId) REFERENCES ContactInfo(Id),
    IsActive BIT NOT NULL DEFAULT 1
);