--Location

CREATE TABLE Location (
	LocationID INT NOT NULL UNIQUE,
	City VARCHAR(20),
	LocationState Char (2),
	Country VARCHAR(15),
	CityInformation VARCHAR(300),
	CONSTRAINT pk_Location_LocationID PRIMARY KEY (LocationID)
);


--Member

CREATE TABLE Member (
    MemberID INT NOT NULL UNIQUE,
	MemberFName VARCHAR(20),
	MemberLName VARCHAR(20),
	MemberAddress VARCHAR(100),
	City VARCHAR(20),
	MemberState Char (2),
    Country VARCHAR(15),
    Zip VARCHAR(10),
    Phone CHAR(20),
    MbrEmail VARCHAR (40) UNIQUE,
    PreferredVacLoc INT,
    PremiereMbr BIT NOT NULL,
	CONSTRAINT pk_Member_MemberID PRIMARY KEY (MemberID),
	CONSTRAINT fk_Member_PreferredVacLoc FOREIGN KEY (PreferredVacLoc) REFERENCES Location(LocationID)
);


--Employee

CREATE TABLE Employee (
    EmployeeID INT NOT NULL UNIQUE,
    EmpFName VARCHAR(20),
    EmpLName VARCHAR(20),
    EmpEmail VARCHAR(40) UNIQUE,
    EmpPhone CHAR(20),
    EmpCity VARCHAR(20),
    EmpState CHAR(2),
    EmpCountry VARCHAR(15),
    CONSTRAINT pk_Employee_EmployeeID PRIMARY KEY (EmployeeID)
);


--Payment

CREATE table Payment (
    PaymentID Int NOT NULL UNIQUE,
    MemberID Int NOT NULL,
    Amount decimal (9,2),
    PaymentType Varchar (15),
    PaymentDate Date,
    CONSTRAINT pk_Payment_PaymentID PRIMARY KEY (PaymentID),
    CONSTRAINT fk_Payment_MemberID FOREIGN KEY(MemberID) REFERENCES Member (MemberID)
);


--Attraction Category

CREATE TABLE AttractionCategory (
  CategoryID Varchar(3) NOT NULL UNIQUE,
  Category Varchar(30),
  OpenDate Date,
  CloseDate Date,
  CONSTRAINT pk_AttractionCategory_CategoryID PRIMARY KEY (CategoryID)
);


--Attraction

CREATE TABLE Attraction (
    AttractionID INT NOT NULL UNIQUE,
    AttractionName VARCHAR(100),
    AttractionAddress VARCHAR(100),
    City VARCHAR(20),
    Zip VARCHAR(10),
    LocationID INT NOT NULL,
    Phone CHAR(20),
    Category VARCHAR(3) NOT NULL,
    Website VARCHAR(200),
    EntryFee DECIMAL(9, 2),
    CONSTRAINT pk_Attraction_AttractionID PRIMARY KEY (AttractionID),
    CONSTRAINT fk_Attraction_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    CONSTRAINT fk_Attraction_Category FOREIGN KEY (Category) REFERENCES AttractionCategory(CategoryID)
);


--Itinerary

CREATE table Itinerary(
    ItineraryID Int NOT NULL UNIQUE,
    MemberID Int NOT NULL,
    StartDate Date,
    EndDate Date,
    CONSTRAINT pk_Itinerary_ItineraryId PRIMARY KEY (ItineraryID),
    CONSTRAINT fk_Itinerary_MemberID FOREIGN KEY (MemberID) REFERENCES Member (MemberID)
);


--Reservation

CREATE TABLE Reservation (
    ReservationID INT NOT NULL UNIQUE,
    EmployeeID INT NOT NULL,
    AttractionID INT NOT NULL,
    ReservationDay DATE,
    NumOfVisitors INT,
    ReservationName VARCHAR(20),
    ItineraryID INT NOT NULL,
    OpenStatus BIT,
    CONSTRAINT pk_Reservation_ReservationID PRIMARY KEY (ReservationID),
    CONSTRAINT fk_Reservation_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    CONSTRAINT fk_Reservation_AttractionID FOREIGN KEY (AttractionID) REFERENCES Attraction(AttractionID),
    CONSTRAINT fk_Reservation_ItineraryID FOREIGN KEY (ItineraryID) REFERENCES Itinerary(ItineraryID)
);


--Review

CREATE TABLE Review (
    ReviewID INT NOT NULL UNIQUE,
    MemberID INT NOT NULL,
    AttractionID INT NOT NULL,
    Comment Varchar(300),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    CONSTRAINT pk_Review_ReviewID PRIMARY KEY (ReviewID),
    CONSTRAINT fk_Review_MemberID FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    CONSTRAINT fk_Review_AttractionID FOREIGN KEY (AttractionID) REFERENCES Attraction(AttractionID)
);


--Location Insert

--** Additonal data is added to this table due to matching member preferred vacation location data.

INSERT INTO Location (LocationID, City, LocationState, Country, CityInformation) VALUES
	(300, 'Dublin', null, 'Ireland', 'Looking for great things to do in Dublin? Plan a Dublin city break this year and discover the top things to do - the best Dublin hotels, tourist attractions, pubs, bars, restaurants, day trips in Dublin and more! Dublin, capital of the Republic of Ireland'),
	(500, 'London', null, 'England', 'London, England''s capital, set on the River Thames, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ''Big Ben'' clock tower and Westminster Abbey, site of British monarch'),
	(800, 'Paris', null, 'France', 'Paris, France"s capital, is a major European city and a global center for art, fashion, gastronomy and culture.'),
	(900, 'Chicago', 'IL', 'United States', 'The Windy City, Chicago is known for food and fun.'),
	(1000, 'Nashville', 'TN', 'United States', 'Nashville is the Music City, a burgeoning metropolis known for country music.'),
	(1200, 'New York', 'NY', 'United States', 'New York is the largest city in the United States, and a cultural melting point.'),
	(1300, 'Los Angeles', 'CA', 'United States', 'Los Angeles is the fashion and entertainment capital of the US west coast.');


--Member Insert

INSERT INTO Member 
    (MemberID, MemberFName, MemberLName, MemberAddress, City, MemberState, Country, Zip, Phone, MbrEmail, PreferredVacLoc, PremiereMbr) 
VALUES
    (1, 'Mary', 'Hart', '255 Amherst Lane', 'Amherst', 'MA', 'USA', '01003', '413-897-6543', 'mhart@amherstlane.com', 500, 1),
	(2, 'Charles', 'Montgomery', '10 Charlotte Road', 'Austin', 'TX', 'USA', '78610', '521-555-6666', 'gotexas@test.com', 300, 0),
	(3, 'Jorge', 'Calhoun', '5068 Orlando Court', 'Orlando', 'FL', 'USA', '32801', '786-321-8912', 'jcalhoun@monstermail.com', 300, 1),
	(4, 'Emily', 'Sharp', '424 Stanbeck Place', 'Bradenton', 'FL', 'USA', '34204', '941-234-0152', 'sharpland@csharp.com', 300, 0),
	(5, 'Thomas', 'Smith', '21 Thompson Lane', 'Cleveland', 'OH', 'USA', '44107', '424-852-9525', 'tsmitty@smithfamilyrocks.com', 1000, 0),
	(6, 'Mark', 'Lewis', '2502 Seaworthy Drive', 'Atlanta', 'GA', 'USA', '30345', '770-982-1314', 'marlew@lakta.net', 500, 1),
	(7, 'Julie', 'Jacobs', '425 Madison Park Drive', 'Nashville', 'TN', 'USA', '37218', '615-952-2532', 'queenj@soundstuff.com', 300, 1),
	(8, 'Terry', 'Stewart', '5226 University Drive', 'Plano', 'TX', 'USA', '75023', '252-232-1157', 'stewbaby@planethane.net', 800, 1),
	(9, 'Donald', 'Parker', '6811 Calista Road', 'Carlsbad', 'CA', 'USA', '92008', '442-957-5322', 'parkhere@cccaltat.com', 900, 1),
	(10, 'Samuel', 'Dear', '6262 Lakeland Drive', 'Techny', 'IL', 'USA', '60082', '606-522-6690', 'sdear@aolmailx.com', 1200, 0),
	(11, 'Alise', 'Jankovic', '375 10th St NE', 'Washington', 'DC', 'USA', '20004', '202-851-2522', 'alisej@uwad.edu', 500, 0),
    (12, 'Sebastien', 'Toms', '2525 North Main Street', 'San Jose', 'CA', 'USA', '95115', '902-559-9115', 'sebtom@sebserver.com', 1300, 0);


--Employee Insert

INSERT INTO Employee (EmployeeID, EmpFName, EmpLName, EmpEmail, EmpPhone, EmpCity, EmpState, EmpCountry) VALUES
(1, 'David', 'Convoy', 'dconvoy@carolstravel.com', '888-543-8932', 'Miami', 'FL', 'USA'),
(2, 'John', 'Davidson', 'jdavidson@carolstravel.com', '888-702-5912', 'Miami', 'FL', 'USA'),
(3, 'Emily', 'Sharp', 'esharp@carolstravel.com', '020775095022', 'London', NULL, 'England'),
(4, 'Jerry', 'Hallowell', 'jhallowell@carolstravel.com', '888-702-5912', 'Miami', 'FL', 'USA'),
(5, 'Teresa', 'Wright-Maven', 'twright@caroltravel.com', '888-702-5912', 'Miami', 'FL', 'USA'),
(6, 'Edward', 'Hirsch', 'ehirsch@carolstravel.com', '020782321540', 'London', NULL, 'England');


--Payment Insert

INSERT INTO Payment (PaymentID, MemberID, Amount, PaymentType, PaymentDate) VALUES
(1, 1, 60.00, 'Visa', '2022-02-01'),
(2, 3, 60.00, 'Visa', '2023-02-01'),
(3, 6, 60.00, 'Check', '2023-04-22'),
(4, 7, 60.00, 'Visa', '2023-05-01'),
(5, 8, 60.00, 'Mastercard', '2023-08-01'),
(6, 9, 60.00, 'Visa', '2023-11-01');


--AttractionCategory Insert

INSERT INTO AttractionCategory (CategoryID, Category, OpenDate, CloseDate) VALUES
('C1', 'Art', '2023-01-01', '2023-12-31'),
('C2', 'Fashion', '2023-03-01', '2023-11-30'),
('C3', 'Food', '2023-01-01', '2023-12-31'),
('C4', 'Museum', '2023-01-01', '2023-12-31'),
('C5', 'Music', '2023-01-01', '2023-12-31'),
('C6', 'Performance/Entertainment', '2023-01-01', '2023-12-31'),
('C7', 'Sporting Events', '2023-03-01', '2023-11-30'),
('C8', 'Statues and Monuments', '2023-03-01', '2023-11-30'),
('C9', 'Tours', '2023-01-01', '2023-12-31');


--Attraction Insert

INSERT INTO Attraction 
    (AttractionID, AttractionName, AttractionAddress, City, Zip, LocationID, Phone, Category, Website, EntryFee) 
VALUES
(2, 'Louvre Museum', '4 Place du Louvre', 'Paris', '75001', 800, '+33 1 40 20 50 50', 'C4', 'http://www.louvre.fr/en', 16.71),
(4, 'London Eye', 'South Bank of the River Thames, London Borough of Lambeth', 'London', 'SE1 7PB', 500, NULL, 'C8', 'http://www.visitlondon.com/things-to-do/place/282783-coca-cola-london-eye', 29.99),
(6, 'National Gallery', 'Trafalgar Square', 'London', 'WC2N 5DN', 500, NULL, 'C1', NULL, 0.00),
(13, 'Los Angeles County Museum of Art', '5905 Wilshire Blvd', 'Los Angeles', '90036', 1300, '1-323-857-6000', 'C1', 'http://www.lacma.org/', 15.00),
(14, 'Dodger Stadium', '1000 Elysian Park Ave', 'Los Angeles', '90012', 1300, '1-323-224-1507', 'C7', 'http://losangeles.dodgers.mlb.com/la/ballpark/index.jsp', 0.00),
(15, 'Hollywood Sign', 'Griffith Park', 'Los Angeles', '90027', 1300, NULL, 'C8', 'hollywoodsign.org', 0.00),
(28, 'Bridgestone Arena', '501 Broadway', 'Nashville', '37203', 1000, '1 615-770-2000', 'C7', 'http://predators.nhl.com/', 0.00),
(32, 'Coyote Ugly Saloon', '154 Second Avenue', 'Nashville', '37201', 1000, '615-254-8459', 'C6', 'coyoteuglysaloon.com', 15.00),
(33, 'Ryman Auditorium', '116 Fifth Ave. N', 'Nashville', '37219', 1000, '615-458-8700', 'C8', NULL, 12.00),
(47, 'The Bean (Cloud Gate)', '201 E Randolph St', 'Chicago', '60601', 900, '312-565-8000', 'C1', 'http://www.chicagotraveler.com/cloud-gate-chicago', 0.00),
(55, 'Broadway in Chicago', '163 East Chestnut St', 'Chicago', '60611', 900, '800-775-2000', 'C6', 'http://broadwayinchicago.com/', 25.00),
(57, 'Metro Chicago', '3730 N Clark St', 'Chicago', '60613', 900, '773-549-4140', 'C5', 'http://metrochicago.com/', 0.00),
(58, 'Statue of Liberty', 'Liberty Island', 'New York', '10004', 1200, '(212) 363-3200', 'C8', 'http://www.nsp.gov', 26.00),
(65, 'Fendi', '598 Madison Ave', 'New York', '10022', 1200, '(212) 897-2244', 'C2', 'http://www.fendi.com', 0.00),
(66, 'National Gallery of Ireland', 'Merrion Sq. W', 'Dublin', 'D2', 300, '353 1661 5133', 'C1', 'www.nationalgallery.ie', 5.00),
(72, 'Eiffel Tower', '5 Avenue Anatole France', 'Paris', '75007', 800, '33892701239', 'C8', 'http://www.toureiffel.paris/', 26.00),
(75, 'Tour de France', 'Around France', 'Paris', '75007', 800, NULL, 'C7', 'http://en.parisinfo.com', 0.00);


--Itinerary Insert

INSERT INTO Itinerary (ItineraryID, MemberID, StartDate, EndDate) VALUES
(2, 1, '2023-09-01', '2023-09-10'),
(3, 3, '2022-07-29', '2022-08-03'),
(5, 9, '2022-08-30', '2022-09-07'),
(6, 1, '2023-08-01', '2023-08-05'),
(7, 6, '2023-05-25', '2023-06-03'),
(8, 8, '2023-11-20', '2023-11-28'),
(9, 7, '2023-12-10', '2023-12-15');

--Reservation Insert

INSERT INTO Reservation 
    (ReservationID, EmployeeID, AttractionID, ReservationDay, NumOfVisitors, ReservationName, ItineraryID, OpenStatus) 
VALUES
(5, 3, 15, '2023-09-07', 3, 'Mary1', 2, 1),
(6, 3, 14, '2023-09-08', 3, 'Mary2', 2, 1),
(7, 3, 13, '2023-09-09', 3, 'Mary3', 2, 1),
(1, 1, 66, '2022-08-01', 3, 'Jorge', 3, 1),
(2, 2, 58, '2022-09-01', 2, 'Donald', 5, 1),
(9, 1, 2, '2023-08-02', 2, 'Hart', 6, 1),
(3, 1, 32, '2023-06-01', 2, 'Lewis', 7, 1),
(10, 4, 4, '2023-11-22', 5, 'ParisAdventure1', 8, 0),
(11, 4, 72, '2023-11-23', 5, 'ParisAdventure2', 8, 0),
(12, 4, 75, '2023-11-24', 5, 'ParisAdventure3', 8, 0),
(13, 2, 65, '2023-12-14', 4, 'NY-NY', 9, 0);


--Review Insert

INSERT INTO Review (ReviewID, MemberID, AttractionID, Comment, Rating) VALUES
(2, 3, 65, 'Absolutely Beautiful, its in the middle of the shopping district as well! It''s a must see', 5),
(3, 1, 4, 'Really amazing, especially at night.', 5),
(4, 6, 14, 'Love those Dodgers.', 4),
(5, 7, 66, 'Very cool! Lots of history.', 5),
(6, 2, 58, 'Touristy - be sure to ask for a guided tour.', 3),
(7, 4, 2, 'Best Museum in Paris', 5),
(8, 4, 2, 'Massive museum. Allot as much time as possible.', 5),
(9, 8, 66, 'Boring like most museums', 2),
(10, 2, 32, 'Excellent!', 4),
(11, 7, 4, 'Best view in London', 4),
(12, 4, 75, 'Hundreds of stores and boutiques', 5);