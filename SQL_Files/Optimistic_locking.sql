-- =====================================================
-- Optimistic Locking
-- =====================================================
UPDATE Seats
SET status = 'BOOKED',
    version = version + 1
WHERE seat_id = 3
AND version = 0;


-- ==========================================
-- CHECK  OUTPUT
-- ==========================================
SELECT * FROM Seats;
