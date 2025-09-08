-- add a new dish
-- each dish is equivalent of 1 serving
INSERT INTO dishes (name, region) VALUES
('Tacos al Pastor', 'Ciudad de Mexico');


-- add ingredients for the new dish
-- each ingredient equivalent is based on 100g
INSERT INTO ingredients (name, calories, protein_100g, fat_100g, carbohydrates_100g) VALUES
('Carne de Cerdo', 271,27.3,17.0,0),
('Tortilla de Maiz', 218,5.7,2.9,44.6),
('Piña', 48,0.5,0.1,12.6),
('Cebolla', 42,0.9,0.1,10.1),
('Cilantro', 23,2.1,0.5,3.7);

-- add the quantity used for each ingredient
-- add the ingredient_id that was inserted by the primary key on ingredient table
INSERT INTO dish_ingredients (dish_id, ingredient_id, quantity_ingredient, quantity) VALUES
(1,1,100, 'grams'),
(1,2,30, 'grams'),
(1,3,10, 'grams'),
(1,4,5, 'grams'),
(1,5,5, 'grams');

-- In case i need to see all the data in the tables
SELECT * from dishes
SELECT * from ingredients;
SELECT * from dish_ingredients;

-- get all ingredients for a specific dish or region
SELECT i.name AS ingredient_name, di.quantity_ingredient, di.quantity
FROM dish_ingredients di
JOIN dishes d ON di.dish_id = d.id
JOIN ingredients i ON di.ingredient_id = i.id
WHERE d.name = '';

-- calculate all nutritional information by each dish
-- each dish is equivalent of 1 serving
SELECT d.name As dish_name,
round(sum(di.quantity_ingredient * i.calories / 100), 2) AS total_calories,
round(sum(di.quantity_ingredient/100 * i.protein_100g), 2) AS total_protein_gr,
round(sum(di.quantity_ingredient/100 * i.fat_100g), 2) AS total_fat_gr,
round(sum(di.quantity_ingredient/100 * i.carbohydrates_100g), 2) AS total_carbohydrates_gr
FROM dish_ingredients di
JOIN dishes d ON di.dish_id = d.id
JOIN ingredients i ON di.ingredient_id = i.id
GROUP BY d.name;

-- in case i need to delete all values in a table
DELETE FROM dishes;
DELETE FROM ingredients;
DELETE FROM dish_ingredients;

