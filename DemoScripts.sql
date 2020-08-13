USE WebProject;

-- Make a reservation
INSERT INTO reservations (
	userID,
    hotelID,
    numBeds,
    startDate,
    endDate
)
VALUES
(
	(SELECT id
     FROM users
     WHERE name = 'john'),
	(SELECT id
	 FROM hotels
	 WHERE name = 'celadon'),
      2,
      '02/18/20',
      '02/23/20',
      '02/23/20'
);

-- Also have to update many rooms are left after someone makes a reservation 
UPDATE hotels
SET bedsTwoAvailable = 2
WHERE name = 'celadon';

-- Show a user's reservations
SELECT hotels.name, 
	   reservations.numBeds, 
       reservations.startDate,
       reservations.endDate
FROM hotels, reservations
WHERE userID = (SELECT id
                FROM users
                WHERE name = 'john');
                
-- Get the landmarks by the hotel
SELECT name
FROM landmarks
WHERE id IN (SELECT landmarkID
			 FROM nearbyLandmarks
             WHERE hotelID = (SELECT id
                              FROM hotels
                              WHERE name = 'celadon')); 
                
-- Show a pokemon
SELECT *
FROM pokemon
WHERE name = 'Charizard';