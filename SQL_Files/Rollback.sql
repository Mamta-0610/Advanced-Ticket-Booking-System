--=====================================================
--  Failure & Rollback Handling
-- =====================================================
START TRANSACTION;

-- Lock seat
SELECT * FROM Seats
WHERE seat_id = 3
FOR UPDATE;

-- Book seat
UPDATE Seats
SET status = 'BOOKED'
WHERE seat_id = 3;

-- Payment failed
ROLLBACK;


-- ==========================================
-- CHECK Q6 OUTPUT
-- ==========================================
SELECT * FROM Seats;
