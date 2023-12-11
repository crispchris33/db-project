/*
Phase 3 - Group 3 - Tourism Database Report SQL Statements

McLain Martin, Matthew McNeese, Nicholas Neuman and Chris Satterfield

CIS 3400 - Database Management - Dr. Cindi Smatt

8 December, 2023
*/

--1 A - 1A loads the itinerary details
SELECT 
    Itinerary.ItineraryID,
    Itinerary.StartDate,
    Itinerary.EndDate,
    COUNT(DISTINCT Reservation.ReservationID) AS NumberOfReservations,
    SUM(Attraction.EntryFee * Reservation.NumOfVisitors) AS TotalEntryFees
FROM 
    Itinerary
JOIN 
    Reservation ON Itinerary.ItineraryID = Reservation.ItineraryID
JOIN 
    Attraction ON Reservation.AttractionID = Attraction.AttractionID
WHERE 
    Itinerary.ItineraryID = 2 --user input
GROUP BY 
    Itinerary.ItineraryID, Itinerary.StartDate, Itinerary.EndDate;

--1 B - 1B loads the reservation details by selected intinerary
SELECT 
    Reservation.ReservationID,
    Attraction.AttractionName AS ReservationName,
    Reservation.ReservationDay,
    Reservation.NumOfVisitors,
    Attraction.EntryFee AS CostPerVisit,
    (Reservation.NumOfVisitors * Attraction.EntryFee) AS TotalCostPerReservation
FROM 
    Itinerary
JOIN 
    Reservation ON Itinerary.ItineraryID = Reservation.ItineraryID
JOIN 
    Attraction ON Reservation.AttractionID = Attraction.AttractionID
WHERE 
    Itinerary.ItineraryID = 2  --user input
ORDER BY 
    Itinerary.StartDate, Attraction.AttractionName;

--2
SELECT 
    Member.MemberID, Member.MemberFName, Member.MemberLName, Payment.PaymentDate, Payment.Amount, Payment.PaymentType
FROM 
    Member, Payment
WHERE 
    Member.MemberID = Payment.MemberID;

--3
SELECT 
    Reservation.ReservationName, 
    Member.MemberFName + ' ' + Member.MemberLName AS "Member Name", 
    Attraction.AttractionName, 
    Attraction.City, 
    Employee.EmpFName + ' ' + Employee.EmpLName AS "Employee Name"
FROM 
    Reservation, Member, Attraction, Employee
WHERE 
    Attraction.City = Member.City, 
AND 
    Month(Reservation.ReservationDay),
AND 
    Day(Reservation.ReservationDay),
GROUP BY 
    ReservationName, MemberFName + ' ' + MemberLName, AttractionName, City, EmpFName, EmpLName
ORDER BY DESC;

--4
SELECT 
    Payment.PaymentDate AS "Payment Date",
    Member.MemberID AS "Member ID",
    Member.MemberFName + ' ' + Member.MemberLName AS "Member Name",
    Payment.PaymentType AS "Payment Type",
    SUM(Payment.Amount) AS "Total Payment"
FROM 
    Payment
INNER JOIN 
    Member ON Payment.MemberID = Member.MemberID
WHERE 
    MONTH(Payment.PaymentDate) = 2 --user input
GROUP BY 
    Payment.PaymentDate, Member.MemberID, Member.MemberFName, Member.MemberLName, Payment.PaymentType
ORDER BY 
    Payment.PaymentDate;
