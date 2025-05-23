# Note: This is a same file as previous only we add create view because this field use in company to anaylze records.

use rapido;



# Query 1: Reterive all successfull bookings:
CREATE VIEW rapido.successful3_bookings AS
SELECT *
FROM rapido.bookings
WHERE Booking_Status = 'Success';

SELECT * FROM rapido.successful3_bookings;




# Query 2: Find the Average ride distance for each vechile type:
CREATE VIEW rapido.avg_ride_distance_by_vehicle AS
SELECT 
    Vehicle_Type, 
    AVG(Ride_Distance) AS Avg_Ride_Distance
FROM rapido.bookings
GROUP BY Vehicle_Type;

SELECT * FROM rapido.avg_ride_distance_by_vehicle;



# Query 3: Get the total numbers of canceled rides by customers 
CREATE VIEW rapido.total_customer_canceled_rides AS
SELECT COUNT(*) AS canceled_by_customer
FROM rapido.bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM rapido.total_customer_canceled_rides;





# Query 4: List the top 5 customers who booked the highest numbers of rides:
CREATE VIEW rapido.top_5_customers_by_rides AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM rapido.bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

SELECT * FROM rapido.top_5_customers_by_rides;




# Query 5: Get the number of rides canceled by drivers due to personal and car-related issues.
CREATE VIEW rapido.driver_canceled_personal_car AS
SELECT COUNT(*) AS canceled_by_driver_issue
FROM rapido.bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM rapido.driver_canceled_personal_car;




# Query 6: Find the maximun and minimum driver rating for Prime Sedan bookings 
CREATE VIEW rapido.prime_sedan_rating_range AS
SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM rapido.bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM rapido.prime_sedan_rating_range;



# Query 7: Retrieve all rides where payment was made using UPI.
CREATE VIEW rapido.upi_payment_rides AS
SELECT * 
FROM rapido.bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM rapido.upi_payment_rides;



# Query 8: Find the Average customer rating per vechile type:
CREATE VIEW rapido.avg_customer_rating_by_vehicle AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM rapido.bookings
GROUP BY Vehicle_Type;

SELECT * FROM rapido.avg_customer_rating_by_vehicle;



# Query 9: Calculate the total booking value of rides completed successfully.
CREATE VIEW rapido.incomplete_rides_with_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM rapido.bookings
WHERE Incomplete_Rides = 'Yes';



# Query 10: List all incomplete rides along with the reason.
SELECT * FROM rapido.incomplete_rides_with_reason;
CREATE VIEW rapido.total_successful_booking_value AS
SELECT SUM(Booking_Value) AS total_successful_value
FROM rapido.bookings
WHERE Booking_Status = 'Success';

SELECT * FROM rapido.total_successful_booking_value;