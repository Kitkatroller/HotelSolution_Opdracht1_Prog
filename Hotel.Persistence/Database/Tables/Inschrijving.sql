CREATE TABLE Inschrijving (
    Id INT IDENTITY PRIMARY KEY,
    MemberId INT,
	ActivityId INT,
    TotalPrice FLOAT NOT NULL,
    FOREIGN KEY (MemberId) REFERENCES Member(Id),
    FOREIGN KEY (ActivityId) REFERENCES Activiteit(Id)
);