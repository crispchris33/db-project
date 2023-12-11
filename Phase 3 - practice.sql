SELECT 
    Payment.PaymentDate,
    Member.MemberID,
    Member.MemberFName,
    Member.MemberLName,
    SUM(Payment.Amount) AS TotalPayments
FROM Payment
INNER JOIN Member ON Payment.MemberID = Member.MemberID
WHERE MONTH(Payment.PaymentDate) = [] --add month
GROUP BY Payment.PaymentDate, Member.MemberID, Member.MemberFName, Member.MemberLName
ORDER BY Payment.PaymentDate;


--Report 4--
-- This dosent make sense if its "Group BY" month how do you list the member info. And if its "Order BY" month how do you add in sum for each month.
SELECT 
    Member.MemberID, 
    Member.MemberFName, 
    Member.MemberLName, 
    Payment.Amount, 
    Payment.PaymentType, 
    DATEPART(mm, PaymentDate) AS PaymentMonth, 
    DATEPART(yyyy, PaymentDate) AS PaymentYear
FROM Member, Payment
WHERE Member.MemberID = Payment.MemberID
ORDER BY PaymentMonth;

--this
SELECT 
    Payment.PaymentDate AS "Payment Date",
    Member.MemberID AS "Member ID",
    Member.MemberFName + ' ' + Member.MemberLName AS "Member Name",
    SUM(Payment.Amount) AS "Total Payment"
FROM Payment
INNER JOIN Member ON Payment.MemberID = Member.MemberID
WHERE MONTH(Payment.PaymentDate) = [2]
GROUP BY Payment.PaymentDate, Member.MemberID, Member.MemberFName, Member.MemberLName
ORDER BY Payment.PaymentDate;


-- Forms

--Member
INSERT INTO Member (MemberID, MemberFName, MemberLName, MemberAddress, City, MemberState, Country, Zip, Phone, MbrEmail, PreferredVacLoc, PremiereMbr) 
VALUES ([MemberID], '[MemberFName]', '[MemberLName]', '[MemberAddress]', '[City]', '[MemberState]', '[Country]', '[Zip]', '[Phone]', '[MbrEmail]', [PreferredVacLoc], [PremiereMbr]);


GROUP BY MONTH(Payment.PaymentDate), DAY(Payment.PaymentDate) 