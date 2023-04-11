SELECT AVG(distance) as sredni_dystans, COUNT(*) as liczba_przejazdzek, driver_id
FROM data.ride
WHERE pickup_address_id > 1
GROUP BY driver_id
HAVING COUNT(*) >= 1
ORDER BY AVG(distance) DESC;




SELECT * FROM data.user
RIGHT JOIN data.address ON area_id = user_id
LIMIT 5 OFFSET 5;

SELECT * FROM data.user
left join data.address ON area_id = user_id

SELECT * FROM data.user
RIGHT JOIN data.address ON area_id = user_id

SELECT * FROM data.user
inner join data.address ON area_id = user_id


SELECT * FROM data.user
full outer join data.address ON area_id = user_id


SELECT user_surname FROM data."user"
UNION
SELECT user_surname FROM data.user


SELECT user_id FROM data.user
EXCEPT
SELECT passenger_id FROM data.passenger_rating



SELECT driver_id FROM data.driver_rating
WHERE car_condition > 3
INTERSECT
SELECT driver_id FROM data.driver_rating
WHERE complying_with_regulations > 3

