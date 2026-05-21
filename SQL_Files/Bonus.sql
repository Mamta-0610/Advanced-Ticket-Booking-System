-- =====================================================
--  Bonus Challenge
-- =====================================================

-- Add lock time column
ALTER TABLE Seats
ADD COLUMN locked_at DATETIME;


-- Store lock time
UPDATE Seats
SET status = 'BOOKED',
    locked_at = NOW()
WHERE seat_id = 1;


-- Auto release after 5 minutes
UPDATE Seats
SET status = 'AVAILABLE',
    locked_at = NULL
WHERE status = 'BOOKED'
AND locked_at IS NOT NULL
AND TIMESTAMPDIFF(MINUTE, locked_at, NOW()) > 5;


-- Waiting Queue Table
CREATE TABLE WaitingQueue (
    queue_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    trip_id INT,
    request_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert into waiting queue
INSERT INTO WaitingQueue(user_id, trip_id)
VALUES (1,1);


-- ==========================================
-- CHECK OUTPUT
-- ==========================================
SELECT * FROM WaitingQueue;



-- ==========================================
-- FINAL OUTPUT CHECK
-- ==========================================
SELECT * FROM Users;
SELECT * FROM Trips;
SELECT * FROM Seats;
SELECT * FROM Bookings;
SELECT * FROM WaitingQueue;
