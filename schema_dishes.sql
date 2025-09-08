-- Popular mexican dishes
CREATE TABLE dishes (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    region TEXT NOT NULL -- e.g. "Oaxaca", "Puebla", etc.
);

-- Ingredients used in the dishes
-- each ingredient equivalent is based on 100g
CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    calories DECIMAL(10, 2),
    protein_100g DECIMAL(10, 2),
    fat_100g DECIMAL(10, 2),
    carbohydrates_100g DECIMAL(10, 2)
);

-- Relationship between dishes and ingredients
CREATE TABLE dish_ingredients (
    id INTEGER PRIMARY KEY,
    dish_id INTEGER,
    ingredient_id INTEGER,
    quantity_ingredient DECIMAL(10, 2), -- how many ingredientes were used
    quantity TEXT NOT NULL, -- grams, milliliters, pieces, etc.
    FOREIGN KEY (dish_id) REFERENCES dishes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);


DROP TABLE IF EXISTS dish_ingredients;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS dishes;