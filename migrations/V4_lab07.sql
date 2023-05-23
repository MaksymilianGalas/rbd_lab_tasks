CREATE VIEW driver_ratings_avg AS
SELECT driver_id, AVG(skills) AS avg_skills, AVG(car_condition) AS avg_car_condition, AVG(complying_with_regulations) AS avg_compliance
FROM driver_rating
GROUP BY driver_id;



CREATE INDEX idx_passenger_user_id ON data.passenger (user_id);



CREATE OR REPLACE PROCEDURE calculate_payment_amount(ride_id INT)
AS $$
BEGIN
    UPDATE data.payment
    SET value = 5.0 + (SELECT distance * 2.5 FROM data.ride WHERE ride_id = calculate_payment_amount.ride_id)
    WHERE payment_id = ride_id;

    RAISE NOTICE 'Payment amount for ride_id % updated.', ride_id;
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION get_driver_info(driver_id INT)
RETURNS TABLE (
    driver_name VARCHAR(100),
    car_brand VARCHAR(100),
    car_model VARCHAR(100)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT u.user_name, c.brand, c.model
    FROM data.driver d
    JOIN data."user" u ON u.user_id = d.user_id
    JOIN data.driver_car dc ON dc.driver_id = d.driver_id
    JOIN data.car c ON c.car_id = dc.car_id
    WHERE d.driver_id = get_driver_info.driver_id;
END;
$$ LANGUAGE plpgsql;



