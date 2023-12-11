/*
Phase 3 - Group 3 - Tourism Database Trigger Testing Queries

McLain Martin, Matthew McNeese, Nicholas Neuman and Chris Satterfield

CIS 3400 - Database Management - Dr. Cindi Smatt

8 December, 2023

**Note - These queries are to test the implementation of the 
trigger that monitors and records create, update and delete 
events in the members table.

*/


SELECT * FROM MEMBERAUDIT;
SELECT * FROM MEMBER;

INSERT INTO Member 
    (MemberID, MemberFName, MemberLName, MemberAddress, City, MemberState, Country, Zip, Phone, MbrEmail, PreferredVacLoc, PremiereMbr) 
VALUES
    (13, 'TestF', 'TestL', '123 Test Address', 'TestCity', 'TC', 'TestCountry', '12345', '123-456-7890', 'testemail@test.com', 300, 1);

UPDATE Member
SET 
    MemberFName = 'UpdatedFirstName',
    MemberAddress = '456 Updated Address',
    City = 'UpdatedCity'
WHERE MemberID = 13;

DELETE FROM Member
WHERE MemberID = 13;