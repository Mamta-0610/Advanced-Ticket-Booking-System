-- =====================================================
--  Advanced Booking Transaction
-- =====================================================
START TRANSACTION;

-- Lock seat and check availability
SELECT * FROM Seats
WHERE seat_id = 1
AND status = 'AVAILABLE'
FOR UPDATE;

-- Update seat status
UPDATE Seats
SET status = 'BOOKED'
WHERE seat_id = 1;

-- Insert booking record
INSERT INTO Bookings(user_id, seat_id, status)
VALUES (1,1,'CONFIRMED');

-- Save transaction
COMMIT;

-- ONLY FOR FAILURE DEMO
-- ROLLBACK;
