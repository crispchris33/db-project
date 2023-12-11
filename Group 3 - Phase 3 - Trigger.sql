/*
Phase 3 - Group 3 - Tourism Database Audit Table Creation and Trigger 

McLain Martin, Matthew McNeese, Nicholas Neuman and Chris Satterfield

CIS 3400 - Database Management - Dr. Cindi Smatt

8 December, 2023
*/

--create memeber audit table
CREATE TABLE MemberAudit (
    AuditID INT IDENTITY(1,1) NOT NULL UNIQUE,
    MemberID INT,
    ChangeDate DATETIME DEFAULT GETDATE(),
    TypeOfChange VARCHAR(10)
    CONSTRAINT pk_MemberAudit_AuditID PRIMARY KEY (AuditID)
);

-- member audit trigger
CREATE TRIGGER trigger_member_audit
ON Member
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

-- insert
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO MemberAudit(MemberID, TypeOfChange)
        SELECT MemberID, 'INSERT'
        FROM inserted;
    END

-- delete
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO MemberAudit(MemberID, TypeOfChange)
        SELECT MemberID, 'DELETE'
        FROM deleted;
    END

-- update
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO MemberAudit(MemberID, TypeOfChange)
        SELECT MemberID, 'UPDATE'
        FROM inserted;
    END
END
