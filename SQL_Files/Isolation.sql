-- =====================================================
--  Isolation Level Analysis
-- =====================================================

-- READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT * FROM Seats
WHERE seat_id = 1;

COMMIT;


-- SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT * FROM Seats
WHERE seat_id = 1;

COMMIT;

