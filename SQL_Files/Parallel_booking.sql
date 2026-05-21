-- =====================================================
-- Q3. Parallel Booking Handling
-- =====================================================
START TRANSACTION;

-- Select available seat
SELECT seat_id FROM Seats
WHERE status = 'AVAILABLE'
LIMIT 1
FOR UPDATE SKIP LOCKED;

-- Book next available seat
UPDATE Seats
SET status = 'BOOKED'
WHERE seat_id = 2;

-- Insert booking record
INSERT INTO Bookings(user_id, seat_id, status)
VALUES (1,2,'CONFIRMED');

COMMIT;


-- ==========================================
-- CHECK Q3 OUTPUT
-- ==========================================
SELECT * FROM Seats;
SELECT * FROM Bookings;
