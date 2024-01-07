﻿CREATE TABLE Member (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Birthday DATE NOT NULL,
    KlantId INT,
    FOREIGN KEY (KlantId) REFERENCES Klant(Id)
);