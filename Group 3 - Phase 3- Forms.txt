/*
Phase 3 - Group 3 - Tourism Database Form SQL Statements

McLain Martin, Matthew McNeese, Nicholas Neuman and Chris Satterfield

CIS 3400 - Database Management - Dr. Cindi Smatt

8 December, 2023
*/

--Location
SELECT
    LocationID,
    City,
    LocationState,
    Country,
    CityInformation
FROM Location;

--Member
SELECT
    MemberID,
    MemberFName,
    MemberLName,
    MemberAddress,
    City,
    MemberState,
    Country,
    Zip,
    Phone,
    MbrEmail,
    PreferredVacLoc,
    PremiereMbr
FROM Member;

--Employee
SELECT
    EmployeeID,
    EmpFName,
    EmpLName,
    EmpEmail,
    EmpPhone,
    EmpCity,
    EmpState,
    EmpCountry
FROM Employee;

--Payment
SELECT
    PaymentID,
    MemberID,
    Amount,
    PaymentType,
    PaymentDate
FROM Payment;

--Attraction Category
SELECT
    CategoryID,
    Category,
    OpenDate,
    CloseDate
FROM AttractionCategory;

--Attraction
SELECT
    AttractionID,
    AttractionName,
    AttractionAddress,
    City,
    Zip,
    LocationID,
    Phone,
    Category,
    Website,
    EntryFee
FROM Attraction;

--Itinerary
SELECT
    ItineraryID,
    MemberID,
    StartDate,
    EndDate
FROM Itinerary;

--Reservation
SELECT
    ReservationID,
    EmployeeID,
    AttractionID,
    ReservationDay,
    NumOfVisitors,
    ReservationName,
    ItineraryID,
    OpenStatus
FROM Reservation;

--Review
SELECT
    ReviewID,
    MemberID,
    AttractionID,
    Comment,
    Rating
FROM Review;