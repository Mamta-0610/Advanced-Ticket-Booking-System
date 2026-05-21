-- ==========================================
-- USERS TABLE
-- ==========================================
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);


-- ==========================================
-- TRIPS TABLE
-- ==========================================
CREATE TABLE Trips (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    source VARCHAR(100),
    destination VARCHAR(100),
    trip_time DATETIME
);


-- ==========================================
-- SEATS TABLE
-- ==========================================
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    seat_number INT,
    status ENUM('AVAILABLE','BOOKED') DEFAULT 'AVAILABLE',
    version INT DEFAULT 0,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);


-- ==========================================
-- BOOKINGS TABLE
-- ==========================================
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    seat_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('CONFIRMED','FAILED'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);


-- ==========================================
-- INSERT SAMPLE DATA
-- ==========================================
INSERT INTO Users(name,email)
VALUES ('Rahul','rahul@gmail.com');

INSERT INTO Trips(source,destination,trip_time)
VALUES ('Delhi','Mumbai',NOW());

INSERT INTO Seats(trip_id,seat_number)
VALUES (1,1),(1,2),(1,3);

-- ==========================================
-- CHECK Q1 OUTPUT
-- ==========================================
SHOW TABLES;
DESC Users;
DESC Trips;
DESC Seats;
DESC Bookings;
