SELECT AVG(distance) as sredni_dystans, COUNT(*) as liczba_przejazdzek, driver_id
FROM data.ride
WHERE pickup_address_id > 1
GROUP BY driver_id
HAVING COUNT(*) >= 1
ORDER BY AVG(distance) DESC;
