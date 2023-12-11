--1
SELECT MemberLName, MemberFName
FROM Member
ORDER BY MemberLName ASC, MemberFName ASC;

--2
SELECT Attraction.AttractionName, AttractionCategory.Category
FROM Attraction
INNER JOIN AttractionCategory ON Attraction.Category = AttractionCategory.CategoryID
ORDER BY AttractionCategory.Category ASC;

--3
SELECT 
    Attraction.AttractionName AS "Attraction Name", 
    Attraction.AttractionAddress AS "Attraction Address",
    Location.City AS "City",
    Location.LocationState AS "Location State",
    Location.Country AS "Country"
FROM Location, Attraction
WHERE Location.City = Attraction.City
ORDER BY Country, City;

--4
SELECT Reservation.ReservationID, Reservation.ReservationName, Attraction.AttractionName, Reservation.ReservationDay, Employee.EmpFName + ' ' + Employee.EmpLName AS EmployeeName
FROM Reservation
INNER JOIN Employee ON Reservation.EmployeeID = Employee.EmployeeID
INNER JOIN Attraction ON Reservation.AttractionID = Attraction.AttractionID
WHERE Reservation.OpenStatus = 0
ORDER BY Reservation.ReservationID;

--5
SELECT Reservation.ReservationID, Reservation.EmployeeID, Attraction.AttractionName, Reservation.ReservationDay, Reservation.NumOfVisitors, Reservation.ReservationName
FROM Reservation
INNER JOIN Attraction ON Reservation.AttractionID = Attraction.AttractionID
ORDER BY Reservation.ReservationDay;

--6
SELECT 
    MemberID AS "Member ID", 
    MemberFName AS "Member First Name",
    MemberLName AS "Member Last Name",
    MemberAddress AS "Member Address",
    City AS "Member City",
    MemberState AS "Member State",
    Country AS "Member Country",
    Zip AS "Member ZIP",
    Phone AS "Member Phone",
    MbrEmail AS "Member Email"
FROM Member
WHERE PremiereMbr = 1;

--7
SELECT Attraction.AttractionName, Location.City, Location.LocationState, Location.Country
FROM Attraction, Location
WHERE Category = 'C4' AND Attraction.LocationID = Location.LocationID
ORDER BY City ASC;

--8
Select Attraction.City, Location.CityInformation as 'City Information', Attraction.AttractionName as 'Attraction', AttractionCategory.Category
From Attraction JOIN Location on Location.City = Attraction.City 
Join AttractionCategory on AttractionCategory.CategoryID = Attraction.Category
Where Attraction.City = 'Nashville'
Order by AttractionCategory.Category ASC;

--9
Select Member.MemberFName + ' ' + Member.MemberLName as 'Member', Review.Rating, Review.Comment
From Member Join Review on Review.MemberID = Member.MemberID
Where Review.Rating >= 3
Order by Member.MemberLName ASC, Review.Rating DESC;

--10
Select Top 5 Attraction.AttractionName as 'Attraction', Attraction.City, Attraction.EntryFee as 'Entry Fee'
From Attraction JOIN Reservation on Reservation.AttractionID = Attraction.AttractionID
Order By Attraction.AttractionName ASC;

--11
SELECT Member.MemberID, Member.MemberFName, Member.MemberLName, Payment.PaymentDate, DATEADD(year, 1, PaymentDate) AS ExpirationDate
FROM Member, Payment
WHERE Member.MemberID = Payment.MemberID;

--12
SELECT 
    Member.MemberFName + ' ' + Member.MemberLName as "Member Name",
    Attraction.AttractionName,
    Reservation.ReservationDay,
    Reservation.NumOfVisitors,
    Attraction.City, 
    Attraction.EntryFee,
    Reservation.NumOfVisitors * Attraction.EntryFee AS "Total Entry Fee"
FROM 
    Reservation
    INNER JOIN Attraction ON Reservation.AttractionID = Attraction.AttractionID
    INNER JOIN Itinerary ON Reservation.ItineraryID = Itinerary.ItineraryID
    INNER JOIN Member ON Itinerary.MemberID = Member.MemberID
ORDER BY 
    Reservation.ReservationDay;