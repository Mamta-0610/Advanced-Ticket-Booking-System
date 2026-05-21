=====================================================
-- Deadlock Simulation
-- =====================================================

-- ==========================================
-- TAB 1 : EXECUTE FIRST
-- ==========================================
START TRANSACTION;

SELECT * FROM Seats
WHERE seat_id = 1
FOR UPDATE;


-- ==========================================
-- TAB 2 : EXECUTE SECOND
-- ==========================================
START TRANSACTION;

SELECT * FROM Seats
WHERE seat_id = 2
FOR UPDATE;


-- ==========================================
-- TAB 1 : EXECUTE THIRD
-- ==========================================
SELECT * FROM Seats
WHERE seat_id = 2
FOR UPDATE;


-- ==========================================
-- TAB 2 : EXECUTE FOURTH
-- ==========================================
SELECT * FROM Seats
WHERE seat_id = 1
FOR UPDATE;

-- DEADLOCK ERROR WILL COME

-- AFTER DEADLOCK
ROLLBACK;
