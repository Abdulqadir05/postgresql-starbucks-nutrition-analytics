-- PART 1: DATABASE SCHEMA DESIGN

-- 1. Categories Table (Beverage Category)
DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Beverages Table (Main Products)
DROP TABLE IF EXISTS beverages CASCADE;
CREATE TABLE beverages (
    beverage_id SERIAL PRIMARY KEY,
    beverage_name VARCHAR(200) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    beverage_prep VARCHAR(50),  -- Size: Short, Tall, Grande, Venti
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Nutrition Facts Table
DROP TABLE IF EXISTS nutrition_facts CASCADE;
CREATE TABLE nutrition_facts (
    nutrition_id SERIAL PRIMARY KEY,
    beverage_id INT REFERENCES beverages(beverage_id) ON DELETE CASCADE,
    calories INT DEFAULT 0,
    total_fat_g DECIMAL(5,2) DEFAULT 0,
    saturated_fat_g DECIMAL(5,2) DEFAULT 0,
    trans_fat_g DECIMAL(5,2) DEFAULT 0,
    cholesterol_mg INT DEFAULT 0,
    sodium_mg INT DEFAULT 0,
    total_carbs_g DECIMAL(6,2) DEFAULT 0,
    dietary_fiber_g DECIMAL(5,2) DEFAULT 0,
    sugars_g DECIMAL(6,2) DEFAULT 0,
    protein_g DECIMAL(5,2) DEFAULT 0,
    vitamin_a_percent INT DEFAULT 0,
    vitamin_c_percent INT DEFAULT 0,
    calcium_percent INT DEFAULT 0,
    iron_percent INT DEFAULT 0,
    caffeine_mg INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PART 2: DATA IMPORT (Cleaning & Loading)

-- First, insert categories
INSERT INTO categories (category_name) VALUES
('Coffee'),
('Classic Espresso Drinks'),
('Signature Espresso Drinks'),
('Tazo® Tea Drinks'),
('Shaken Iced Beverages'),
('Smoothies'),
('Frappuccino® Blended Coffee'),
('Frappuccino® Light Blended Coffee'),
('Frappuccino® Blended Crème');

-- Insert beverages and nutrition data

-- COFFEE Category (Category ID: 1)
INSERT INTO beverages (beverage_name, category_id, beverage_prep) VALUES
('Brewed Coffee', 1, 'Short'),
('Brewed Coffee', 1, 'Tall'),
('Brewed Coffee', 1, 'Grande'),
('Brewed Coffee', 1, 'Venti');

INSERT INTO nutrition_facts (beverage_id, calories, total_fat_g, saturated_fat_g, trans_fat_g, sodium_mg, total_carbs_g, dietary_fiber_g, sugars_g, protein_g, vitamin_a_percent, vitamin_c_percent, calcium_percent, iron_percent, caffeine_mg)
VALUES
(1, 3, 0.1, 0, 0, 0, 5, 0, 0, 0.3, 0, 0, 0, 0, 175),
(2, 4, 0.1, 0, 0, 0, 10, 0, 0, 0.5, 0, 0, 0, 0, 260),
(3, 5, 0.1, 0, 0, 0, 10, 0, 0, 1, 0, 0, 0, 0, 330),
(4, 5, 0.1, 0, 0, 0, 10, 0, 0, 1, 0, 0, 2, 0, 410);

-- CLASSIC ESPRESSO DRINKS (Category ID: 2)
INSERT INTO beverages (beverage_name, category_id, beverage_prep) VALUES
('Caffè Latte', 2, 'Short Nonfat Milk'),
('Caffè Latte', 2, 'Short 2% Milk'),
('Caffè Latte', 2, 'Short Soymilk'),
('Caffè Latte', 2, 'Tall Nonfat Milk'),
('Caffè Latte', 2, 'Tall 2% Milk'),
('Caffè Latte', 2, 'Tall Soymilk'),
('Caffè Latte', 2, 'Grande Nonfat Milk'),
('Caffè Latte', 2, 'Grande 2% Milk'),
('Caffè Latte', 2, 'Grande Soymilk'),
('Caffè Latte', 2, 'Venti Nonfat Milk'),
('Caffè Latte', 2, 'Venti 2% Milk'),
('Caffè Latte', 2, 'Venti Soymilk');

INSERT INTO nutrition_facts (beverage_id, calories, total_fat_g, saturated_fat_g, trans_fat_g, cholesterol_mg, sodium_mg, total_carbs_g, dietary_fiber_g, sugars_g, protein_g, vitamin_a_percent, vitamin_c_percent, calcium_percent, iron_percent, caffeine_mg)
VALUES
(5, 70, 0.1, 0.1, 0, 5, 75, 10, 0, 9, 6, 10, 0, 20, 0, 75),
(6, 100, 3.5, 2, 0.1, 15, 85, 10, 0, 9, 6, 10, 0, 20, 0, 75),
(7, 70, 2.5, 0.4, 0, 0, 65, 6, 1, 4, 5, 6, 0, 20, 8, 75),
(8, 100, 0.2, 0.2, 0, 5, 120, 15, 0, 14, 10, 15, 0, 30, 0, 75),
(9, 150, 6, 3, 0.2, 25, 135, 15, 0, 14, 10, 15, 0, 30, 0, 75),
(10, 110, 4.5, 0.5, 0, 0, 105, 10, 1, 6, 8, 10, 0, 30, 15, 75),
(11, 130, 0.3, 0.2, 0, 5, 150, 19, 0, 18, 13, 20, 0, 40, 0, 150),
(12, 190, 7, 3.5, 0.2, 30, 170, 19, 0, 17, 12, 20, 2, 40, 0, 150),
(13, 150, 5, 0.5, 0, 0, 130, 13, 1, 8, 10, 15, 0, 40, 15, 150),
(14, 170, 0.4, 0.3, 0, 10, 190, 25, 0, 23, 16, 30, 0, 50, 0, 150),
(15, 240, 9, 4.5, 0.3, 35, 220, 24, 0, 22, 16, 25, 2, 50, 0, 150),
(16, 190, 7, 1, 0, 0, 170, 16, 2, 11, 13, 20, 0, 50, 25, 150);

-- Continue with more beverages... (I'll add a sampling of key ones)

-- CAFFE MOCHA (Without Whipped Cream)
INSERT INTO beverages (beverage_name, category_id, beverage_prep) VALUES
('Caffè Mocha', 2, 'Short Nonfat Milk'),
('Caffè Mocha', 2, 'Short 2% Milk'),
('Caffè Mocha', 2, 'Tall Nonfat Milk'),
('Caffè Mocha', 2, 'Tall 2% Milk'),
('Caffè Mocha', 2, 'Grande Nonfat Milk'),
('Caffè Mocha', 2, 'Grande 2% Milk'),
('Caffè Mocha', 2, 'Venti Nonfat Milk'),
('Caffè Mocha', 2, 'Venti 2% Milk');

INSERT INTO nutrition_facts (beverage_id, calories, total_fat_g, saturated_fat_g, trans_fat_g, cholesterol_mg, sodium_mg, total_carbs_g, dietary_fiber_g, sugars_g, protein_g, vitamin_a_percent, vitamin_c_percent, calcium_percent, iron_percent, caffeine_mg)
VALUES
(17, 110, 1.5, 1, 0, 5, 60, 21, 1, 17, 7, 8, 0, 15, 10, 85),
(18, 130, 4, 2, 0.1, 10, 70, 21, 1, 17, 6, 8, 0, 15, 10, 85),
(19, 170, 2, 1, 0, 5, 100, 32, 1, 27, 10, 15, 0, 25, 20, 95),
(20, 200, 6, 3.5, 0.1, 20, 115, 32, 1, 26, 10, 15, 0, 25, 20, 95),
(21, 220, 2.5, 1.5, 0, 5, 125, 43, 2, 34, 13, 20, 0, 35, 25, 175),
(22, 260, 8, 4.5, 0.2, 25, 140, 42, 2, 34, 13, 15, 2, 35, 25, 175),
(23, 280, 3, 2, 0, 10, 160, 54, 2, 44, 17, 25, 0, 45, 30, 180),
(24, 340, 11, 6, 0.2, 30, 180, 53, 2, 43, 17, 20, 2, 45, 30, 180);

-- VANILLA LATTE
INSERT INTO beverages (beverage_name, category_id, beverage_prep) VALUES
('Vanilla Latte', 2, 'Grande Nonfat Milk'),
('Vanilla Latte', 2, 'Grande 2% Milk'),
('Vanilla Latte', 2, 'Venti Nonfat Milk'),
('Vanilla Latte', 2, 'Venti 2% Milk');

INSERT INTO nutrition_facts (beverage_id, calories, total_fat_g, saturated_fat_g, trans_fat_g, cholesterol_mg, sodium_mg, total_carbs_g, dietary_fiber_g, sugars_g, protein_g, vitamin_a_percent, vitamin_c_percent, calcium_percent, iron_percent, caffeine_mg)
VALUES
(25, 200, 0.3, 0.2, 0, 5, 140, 37, 0, 35, 12, 20, 0, 35, 0, 150),
(26, 250, 6, 3.5, 0.2, 25, 150, 37, 0, 35, 12, 20, 2, 35, 0, 150),
(27, 250, 0.3, 0.2, 0, 10, 180, 47, 0, 45, 15, 25, 0, 50, 0, 150),
(28, 320, 9, 4.5, 0.3, 35, 200, 46, 0, 44, 15, 25, 2, 45, 0, 150);

-- CAPPUCCINO
INSERT INTO beverages (beverage_name, category_id, beverage_prep) VALUES
('Cappuccino', 2, 'Grande Nonfat Milk'),
('Cappuccino', 2, 'Grande 2% Milk'),
('Cappuccino', 2, 'Venti Nonfat Milk'),
('Cappuccino', 2, 'Venti 2% Milk');

INSERT INTO nutrition_facts (beverage_id, calories, total_fat_g, saturated_fat_g, trans_fat_g, cholesterol_mg, sodium_mg, total_carbs_g, dietary_fiber_g, sugars_g, protein_g, vitamin_a_percent, vitamin_c_percent, calcium_percent, iron_percent, caffeine_mg)
VALUES
(29, 80, 0.2, 0.1, 0, 5, 90, 12, 0, 10, 8, 15, 0, 25, 0, 150),
(30, 120, 4, 2, 0.1, 15, 100, 12, 0, 10, 8, 10, 0, 25, 0, 150),
(31, 110, 0.2, 0.2, 0, 5, 120, 16, 0, 14, 10, 20, 0, 30, 0, 150),
(32, 150, 6, 3, 0.2, 25, 135, 16, 0, 14, 10, 15, 0, 30, 0, 150);

-- AMERICANO
INSERT INTO beverages (beverage_name, category_id, beverage_prep) VALUES
('Caffè Americano', 2, 'Short'),
('Caffè Americano', 2, 'Tall'),
('Caffè Americano', 2, 'Grande'),
('Caffè Americano', 2, 'Venti');

INSERT INTO nutrition_facts (beverage_id, calories, total_fat_g, saturated_fat_g, trans_fat_g, sodium_mg, total_carbs_g, dietary_fiber_g, sugars_g, protein_g, vitamin_a_percent, vitamin_c_percent, calcium_percent, iron_percent, caffeine_mg)
VALUES
(33, 5, 0, 0, 0, 0, 5, 1, 0, 0.4, 0, 0, 0, 0, 75),
(34, 10, 0, 0, 0, 0, 10, 2, 0, 1, 0, 0, 2, 0, 150),
(35, 15, 0, 0, 0, 0, 15, 3, 0, 1, 0, 0, 2, 0, 225),
(36, 25, 0, 0, 0, 0, 15, 4, 0, 1, 0, 0, 2, 0, 300);

-- PART 3: DATA CLEANING & VALIDATION

-- Check for NULL values
SELECT 
    'beverages' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(beverage_name) AS name_count,
    COUNT(category_id) AS category_count
FROM beverages
UNION ALL
SELECT 
    'nutrition_facts',
    COUNT(*),
    COUNT(beverage_id),
    COUNT(calories)
FROM nutrition_facts;

-- Find duplicate beverage entries
SELECT 
    beverage_name,
    beverage_prep,
    COUNT(*) AS duplicate_count
FROM beverages
GROUP BY beverage_name, beverage_prep
HAVING COUNT(*) > 1;

-- Check for missing nutrition data
SELECT 
    b.beverage_id,
    b.beverage_name,
    b.beverage_prep,
    CASE WHEN n.nutrition_id IS NULL THEN 'Missing Nutrition Data' ELSE 'OK' END AS status
FROM beverages b
LEFT JOIN nutrition_facts n ON b.beverage_id = n.beverage_id
WHERE n.nutrition_id IS NULL;

-- PART 4: BASIC VIEWS FOR REPORTING

-- View 1: Complete Beverage Information
CREATE OR REPLACE VIEW vw_beverage_nutrition AS
SELECT 
    b.beverage_id,
    b.beverage_name,
    c.category_name,
    b.beverage_prep,
    n.calories,
    n.total_fat_g,
    n.saturated_fat_g,
    n.trans_fat_g,
    n.cholesterol_mg,
    n.sodium_mg,
    n.total_carbs_g,
    n.dietary_fiber_g,
    n.sugars_g,
    n.protein_g,
    n.vitamin_a_percent,
    n.vitamin_c_percent,
    n.calcium_percent,
    n.iron_percent,
    n.caffeine_mg
FROM beverages b
JOIN categories c ON b.category_id = c.category_id
JOIN nutrition_facts n ON b.beverage_id = n.beverage_id
ORDER BY c.category_name, b.beverage_name, b.beverage_prep;

-- View 2: Low Calorie Beverages
CREATE OR REPLACE VIEW vw_low_calorie_beverages AS
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    total_fat_g,
    sugars_g,
    protein_g
FROM vw_beverage_nutrition
WHERE calories < 100
ORDER BY calories ASC;

-- View 3: High Protein Beverages
CREATE OR REPLACE VIEW vw_high_protein_beverages AS
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    protein_g,
    calories,
    sugars_g,
    ROUND((protein_g * 4.0 / calories * 100), 2) AS protein_percent_calories
FROM vw_beverage_nutrition
WHERE protein_g > 8
ORDER BY protein_g DESC;

-- View 4: Beverages by Caffeine Content
CREATE OR REPLACE VIEW vw_caffeine_ranking AS
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    caffeine_mg,
    calories,
    RANK() OVER (ORDER BY caffeine_mg DESC) AS caffeine_rank
FROM vw_beverage_nutrition
WHERE caffeine_mg > 0
ORDER BY caffeine_mg DESC;

-- View 5: Category Summary
CREATE OR REPLACE VIEW vw_category_summary AS
SELECT 
    c.category_name,
    COUNT(DISTINCT b.beverage_id) AS total_beverages,
    ROUND(AVG(n.calories), 0) AS avg_calories,
    ROUND(AVG(n.total_fat_g), 2) AS avg_fat,
    ROUND(AVG(n.sugars_g), 2) AS avg_sugar,
    ROUND(AVG(n.protein_g), 2) AS avg_protein,
    ROUND(AVG(n.caffeine_mg), 0) AS avg_caffeine,
    MIN(n.calories) AS min_calories,
    MAX(n.calories) AS max_calories
FROM categories c
LEFT JOIN beverages b ON c.category_id = b.category_id
LEFT JOIN nutrition_facts n ON b.beverage_id = n.beverage_id
GROUP BY c.category_name
ORDER BY avg_calories DESC;

-- PART 5: BUSINESS QUERIES 

-- Query 1: Top 10 Highest Calorie Beverages
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    total_fat_g,
    sugars_g
FROM vw_beverage_nutrition
ORDER BY calories DESC
LIMIT 10;

-- Query 2: Top 10 Lowest Calorie Beverages with Caffeine
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    caffeine_mg,
    sugars_g
FROM vw_beverage_nutrition
WHERE calories > 0 AND caffeine_mg > 0
ORDER BY calories ASC
LIMIT 10;

-- Query 3: Healthiest Options (Low Calorie + High Protein)
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    protein_g,
    sugars_g,
    ROUND((protein_g * 4.0 / calories * 100), 2) AS protein_efficiency
FROM vw_beverage_nutrition
WHERE calories > 0 
  AND protein_g > 0
  AND sugars_g < 20
ORDER BY protein_efficiency DESC
LIMIT 10;

-- Query 4: Sugar Bomb Alert (Highest Sugar Content)
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    sugars_g,
    calories,
    ROUND((sugars_g * 4.0 / calories * 100), 2) AS sugar_percent
FROM vw_beverage_nutrition
WHERE calories > 0
ORDER BY sugars_g DESC
LIMIT 10;

-- Query 5: Category Comparison - Average Nutrition
SELECT 
    category_name,
    COUNT(*) AS items,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(total_fat_g), 2) AS avg_fat,
    ROUND(AVG(sugars_g), 2) AS avg_sugar,
    ROUND(AVG(protein_g), 2) AS avg_protein,
    ROUND(AVG(caffeine_mg), 0) AS avg_caffeine
FROM vw_beverage_nutrition
GROUP BY category_name
ORDER BY avg_calories DESC;

-- Query 6: Milk Type Comparison (Nonfat vs 2% vs Soy)
SELECT 
    CASE 
        WHEN beverage_prep LIKE '%Nonfat%' THEN 'Nonfat'
        WHEN beverage_prep LIKE '%2%%' THEN '2%'
        WHEN beverage_prep LIKE '%Soy%' THEN 'Soy'
        ELSE 'Other'
    END AS milk_type,
    COUNT(*) AS count,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(total_fat_g), 2) AS avg_fat,
    ROUND(AVG(sugars_g), 2) AS avg_sugar,
    ROUND(AVG(protein_g), 2) AS avg_protein
FROM vw_beverage_nutrition
WHERE beverage_prep LIKE '%Nonfat%' 
   OR beverage_prep LIKE '%2%%' 
   OR beverage_prep LIKE '%Soy%'
GROUP BY milk_type
ORDER BY avg_calories;

-- Query 7: Find Best Caffeine to Calorie Ratio
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    caffeine_mg,
    calories,
    ROUND(caffeine_mg / NULLIF(calories, 0), 2) AS caffeine_per_calorie
FROM vw_beverage_nutrition
WHERE calories > 0 AND caffeine_mg > 0
ORDER BY caffeine_per_calorie DESC
LIMIT 10;

-- Query 8: Beverages with Zero Sugar but High Caffeine
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    sugars_g,
    caffeine_mg,
    calories
FROM vw_beverage_nutrition
WHERE sugars_g = 0 
  AND caffeine_mg > 100
ORDER BY caffeine_mg DESC;

-- Query 9: Seasonal Recommendations (By Nutrition Profile)
CREATE OR REPLACE VIEW vw_seasonal_recommendations AS
WITH beverage_rankings AS (
    SELECT 
        beverage_name,
        beverage_prep,
        category_name,
        calories,
        caffeine_mg,
        sugars_g,
        protein_g,
        -- Summer: Low calories, high protein, low sugar
        RANK() OVER (ORDER BY calories ASC, protein_g DESC, sugars_g ASC) AS summer_rank,
        -- Winter: Comfort drinks with moderate calories
        RANK() OVER (ORDER BY calories DESC, total_fat_g DESC, sugars_g DESC) AS winter_rank
    FROM vw_beverage_nutrition
    WHERE calories > 0
)
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    caffeine_mg,
    sugars_g,
    protein_g,
    'Summer Refreshment' AS recommendation
FROM beverage_rankings
WHERE summer_rank <= 5
UNION ALL
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    caffeine_mg,
    sugars_g,
    protein_g,
    'Winter Comfort' AS recommendation
FROM beverage_rankings
WHERE winter_rank <= 5;

-- PART 6: FUNCTIONS FOR ANALYSIS

-- Function 1: Get Beverage Nutrition by Name
CREATE OR REPLACE FUNCTION fn_get_beverage_nutrition(
    p_beverage_name VARCHAR,
    p_prep VARCHAR DEFAULT NULL
)
RETURNS TABLE(
    beverage_name VARCHAR,
    beverage_prep VARCHAR,
    category_name VARCHAR,
    calories INT,
    total_fat_g DECIMAL,
    sugars_g DECIMAL,
    protein_g DECIMAL,
    caffeine_mg INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        v.beverage_name,
        v.beverage_prep,
        v.category_name,
        v.calories,
        v.total_fat_g,
        v.sugars_g,
        v.protein_g,
        v.caffeine_mg
    FROM vw_beverage_nutrition v
    WHERE v.beverage_name ILIKE '%' || p_beverage_name || '%'
        AND (p_prep IS NULL OR v.beverage_prep ILIKE '%' || p_prep || '%')
    ORDER BY v.calories;
END;
$$ LANGUAGE plpgsql;

-- Function 2: Calculate Beverage Health Score
CREATE OR REPLACE FUNCTION fn_health_score(
    p_calories INT,
    p_sugars_g DECIMAL,
    p_protein_g DECIMAL,
    p_total_fat_g DECIMAL
)
RETURNS DECIMAL AS $$
DECLARE
    score DECIMAL;
BEGIN
    -- Health score based on:
    -- Lower calories = better (up to 30 points)
    -- Lower sugar = better (up to 30 points)
    -- Higher protein = better (up to 20 points)
    -- Lower fat = better (up to 20 points)
    score := 0;
    
    -- Calories (0-500 scale)
    score := score + GREATEST(0, 30 - (p_calories / 20));
    
    -- Sugar (0-50g scale)
    score := score + GREATEST(0, 30 - (p_sugars_g * 0.6));
    
    -- Protein (0-20g scale)
    score := score + LEAST(20, p_protein_g * 1.5);
    
    -- Fat (0-20g scale)
    score := score + GREATEST(0, 20 - (p_total_fat_g * 1.5));
    
    RETURN ROUND(score, 1);
END;
$$ LANGUAGE plpgsql;

-- Function 3: Get Recommendations Based on Calorie Budget
CREATE OR REPLACE FUNCTION fn_recommend_by_calories(
    max_calories INT DEFAULT 200,
    limit_count INT DEFAULT 10
)
RETURNS TABLE(
    beverage_name VARCHAR,
    beverage_prep VARCHAR,
    category_name VARCHAR,
    calories INT,
    protein_g DECIMAL,
    sugars_g DECIMAL,
    health_score DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        v.beverage_name,
        v.beverage_prep,
        v.category_name,
        v.calories,
        v.protein_g,
        v.sugars_g,
        fn_health_score(v.calories, v.sugars_g, v.protein_g, v.total_fat_g) AS health_score
    FROM vw_beverage_nutrition v
    WHERE v.calories <= max_calories
    ORDER BY health_score DESC, v.calories ASC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;

-- PART 7: ADVANCED ANALYTICS

-- 1. Distribution Analysis - Calories by Size
SELECT 
    CASE 
        WHEN beverage_prep LIKE '%Short%' THEN 'Short'
        WHEN beverage_prep LIKE '%Tall%' THEN 'Tall'
        WHEN beverage_prep LIKE '%Grande%' THEN 'Grande'
        WHEN beverage_prep LIKE '%Venti%' THEN 'Venti'
        ELSE 'Other'
    END AS size,
    COUNT(*) AS count,
    ROUND(AVG(calories), 0) AS avg_calories,
    MIN(calories) AS min_calories,
    MAX(calories) AS max_calories,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY calories) AS median_calories
FROM vw_beverage_nutrition
WHERE calories > 0
GROUP BY size
ORDER BY size;

-- 2. Correlation Analysis - Sugar vs Calories
SELECT 
    CORR(calories, sugars_g) AS sugar_calorie_correlation,
    CORR(calories, total_fat_g) AS fat_calorie_correlation,
    CORR(calories, protein_g) AS protein_calorie_correlation,
    CORR(calories, caffeine_mg) AS caffeine_calorie_correlation
FROM vw_beverage_nutrition
WHERE calories > 0;

-- 3. Clustering - Beverage Types by Nutrition Profile
WITH nutrition_scaled AS (
    SELECT 
        beverage_id,
        beverage_name,
        category_name,
        calories,
        total_fat_g,
        sugars_g,
        protein_g,
        caffeine_mg,
        -- Normalize values
        (calories - AVG(calories) OVER()) / STDDEV(calories) OVER() AS cal_score,
        (sugars_g - AVG(sugars_g) OVER()) / STDDEV(sugars_g) OVER() AS sugar_score,
        (protein_g - AVG(protein_g) OVER()) / STDDEV(protein_g) OVER() AS protein_score
    FROM vw_beverage_nutrition
    WHERE calories > 0
)
SELECT 
    beverage_name,
    category_name,
    calories,
    sugars_g,
    protein_g,
    CASE 
        WHEN cal_score > 1 AND sugar_score > 1 THEN 'High Calorie/Sugar'
        WHEN cal_score < -1 AND sugar_score < -1 THEN 'Low Calorie/Sugar'
        WHEN protein_score > 1 THEN 'High Protein'
        WHEN calories < 100 AND caffeine_mg > 100 THEN 'Healthy Energy'
        ELSE 'Average'
    END AS beverage_cluster
FROM nutrition_scaled
ORDER BY beverage_cluster, calories;

-- 4. Time-based Analysis - Caffeine Trends
SELECT 
    category_name,
    COUNT(*) AS beverage_count,
    ROUND(AVG(caffeine_mg), 0) AS avg_caffeine,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(caffeine_mg) / NULLIF(AVG(calories), 0), 2) AS caffeine_efficiency
FROM vw_beverage_nutrition
WHERE caffeine_mg > 0 AND calories > 0
GROUP BY category_name
HAVING COUNT(*) >= 3
ORDER BY caffeine_efficiency DESC;

-- PART 8: STORED PROCEDURES

-- Procedure: Add New Beverage
CREATE OR REPLACE PROCEDURE sp_add_beverage(
    p_beverage_name VARCHAR,
    p_category_name VARCHAR,
    p_prep VARCHAR,
    p_calories INT,
    p_total_fat DECIMAL,
    p_sugars DECIMAL,
    p_protein DECIMAL,
    p_caffeine INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_category_id INT;
    v_beverage_id INT;
BEGIN
    -- Get or create category
    SELECT category_id INTO v_category_id 
    FROM categories 
    WHERE category_name = p_category_name;
    
    IF v_category_id IS NULL THEN
        INSERT INTO categories (category_name) 
        VALUES (p_category_name) 
        RETURNING category_id INTO v_category_id;
    END IF;
    
    -- Insert beverage
    INSERT INTO beverages (beverage_name, category_id, beverage_prep)
    VALUES (p_beverage_name, v_category_id, p_prep)
    RETURNING beverage_id INTO v_beverage_id;
    
    -- Insert nutrition data
    INSERT INTO nutrition_facts (
        beverage_id, calories, total_fat_g, sugars_g, 
        protein_g, caffeine_mg
    ) VALUES (
        v_beverage_id, p_calories, p_total_fat, p_sugars, 
        p_protein, p_caffeine
    );
    
    RAISE NOTICE 'Added beverage: % (ID: %)', p_beverage_name, v_beverage_id;
END;
$$;

-- Procedure: Update Nutrition Data
CREATE OR REPLACE PROCEDURE sp_update_nutrition(
    p_beverage_id INT,
    p_calories INT DEFAULT NULL,
    p_sugars DECIMAL DEFAULT NULL,
    p_protein DECIMAL DEFAULT NULL,
    p_caffeine INT DEFAULT NULL
)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE nutrition_facts
    SET 
        calories = COALESCE(p_calories, calories),
        sugars_g = COALESCE(p_sugars, sugars_g),
        protein_g = COALESCE(p_protein, protein_g),
        caffeine_mg = COALESCE(p_caffeine, caffeine_mg),
        updated_at = CURRENT_TIMESTAMP
    WHERE beverage_id = p_beverage_id;
    
    RAISE NOTICE 'Updated nutrition for beverage ID: %', p_beverage_id;
END;
$$;

-- PART 9: TRIGGERS FOR DATA INTEGRITY

-- Trigger: Auto-update timestamp
CREATE OR REPLACE FUNCTION trg_update_timestamp_nutrition()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_nutrition_updated_at
    BEFORE UPDATE ON nutrition_facts
    FOR EACH ROW
    EXECUTE FUNCTION trg_update_timestamp_nutrition();

-- Trigger: Prevent negative values
CREATE OR REPLACE FUNCTION trg_check_nutrition_values()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.calories < 0 THEN
        RAISE EXCEPTION 'Calories cannot be negative: %', NEW.calories;
    END IF;
    IF NEW.sugars_g < 0 THEN
        RAISE EXCEPTION 'Sugar cannot be negative: %', NEW.sugars_g;
    END IF;
    IF NEW.caffeine_mg < 0 THEN
        RAISE EXCEPTION 'Caffeine cannot be negative: %', NEW.caffeine_mg;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_nutrition_values    BEFORE INSERT OR UPDATE ON nutrition_facts
    FOR EACH ROW
    EXECUTE FUNCTION trg_check_nutrition_values();

-- PART 10: DATA VALIDATION & QUALITY CHECKS

-- Check data completeness
SELECT 
    'Total Categories' AS metric, COUNT(*) FROM categories
UNION ALL
SELECT 
    'Total Beverages', COUNT(*) FROM beverages
UNION ALL
SELECT 
    'Total Nutrition Records', COUNT(*) FROM nutrition_facts
UNION ALL
SELECT 
    'Beverages without Nutrition Data', 
    COUNT(*) FROM beverages b 
    LEFT JOIN nutrition_facts n ON b.beverage_id = n.beverage_id 
    WHERE n.nutrition_id IS NULL
UNION ALL
SELECT 
    'Distinct Beverage Names', COUNT(DISTINCT beverage_name) FROM beverages;

-- Find outliers
SELECT 
    'Calories > 500' AS category,
    COUNT(*) AS count,
    ROUND(AVG(calories), 0) AS avg_value
FROM nutrition_facts 
WHERE calories > 500
UNION ALL
SELECT 
    'Sugars > 60g',
    COUNT(*),
    ROUND(AVG(sugars_g), 2)
FROM nutrition_facts 
WHERE sugars_g > 60
UNION ALL
SELECT 
    'Caffeine > 300mg',
    COUNT(*),
    ROUND(AVG(caffeine_mg), 0)
FROM nutrition_facts 
WHERE caffeine_mg > 300;

-- PART 11: SAMPLE ANALYTICAL REPORTS

-- Report 1: Nutrition Summary Report
CREATE OR REPLACE VIEW vw_nutrition_report AS
SELECT 
    'OVERALL STATISTICS' AS section,
    COUNT(*) AS total_items,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(total_fat_g), 2) AS avg_fat,
    ROUND(AVG(sugars_g), 2) AS avg_sugar,
    ROUND(AVG(protein_g), 2) AS avg_protein,
    ROUND(AVG(caffeine_mg), 0) AS avg_caffeine,
    MIN(calories) AS min_calories,
    MAX(calories) AS max_calories
FROM vw_beverage_nutrition
WHERE calories > 0
UNION ALL
SELECT 
    'BEST PROTEIN SOURCES' AS section,
    COUNT(*) AS total_items,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(total_fat_g), 2) AS avg_fat,
    ROUND(AVG(sugars_g), 2) AS avg_sugar,
    ROUND(AVG(protein_g), 2) AS avg_protein,
    ROUND(AVG(caffeine_mg), 0) AS avg_caffeine,
    MIN(calories) AS min_calories,
    MAX(calories) AS max_calories
FROM vw_beverage_nutrition
WHERE protein_g > 10
UNION ALL
SELECT 
    'LOW SUGAR OPTIONS' AS section,
    COUNT(*) AS total_items,
    ROUND(AVG(calories), 0) AS avg_calories,
    ROUND(AVG(total_fat_g), 2) AS avg_fat,
    ROUND(AVG(sugars_g), 2) AS avg_sugar,
    ROUND(AVG(protein_g), 2) AS avg_protein,
    ROUND(AVG(caffeine_mg), 0) AS avg_caffeine,
    MIN(calories) AS min_calories,
    MAX(calories) AS max_calories
FROM vw_beverage_nutrition
WHERE sugars_g < 5;

-- Report 2: Healthy Choices Guide
CREATE OR REPLACE VIEW vw_healthy_choices AS
SELECT 
    beverage_name,
    beverage_prep,
    category_name,
    calories,
    sugars_g,
    protein_g,
    total_fat_g,
    caffeine_mg,
    fn_health_score(calories, sugars_g, protein_g, total_fat_g) AS health_score,
    CASE 
        WHEN calories < 100 AND sugars_g < 10 THEN 'Best Choice'
        WHEN calories < 200 AND sugars_g < 20 THEN 'Good Choice'
        WHEN calories < 300 AND sugars_g < 30 THEN 'Okay Choice'
        ELSE 'Treat Yourself'
    END AS recommendation
FROM vw_beverage_nutrition
WHERE calories > 0
ORDER BY health_score DESC;

-- PART 12: TEST QUERIES

-- Test Function 1: Get Latte Options
SELECT * FROM fn_get_beverage_nutrition('Latte', 'Grande');

-- Test Function 2: Health Score
SELECT 
    beverage_name,
    beverage_prep,
    calories,
    sugars_g,
    protein_g,
    fn_health_score(calories, sugars_g, protein_g, total_fat_g) AS health_score
FROM vw_beverage_nutrition
WHERE calories > 0
ORDER BY health_score DESC
LIMIT 10;

-- Test Function 3: Recommendations
SELECT * FROM fn_recommend_by_calories(150, 5);

-- Test Procedure: Add a new beverage
CALL sp_add_beverage(
    'Protein Coffee', 
    'Coffee', 
    'Grande Soymilk',
    180, 
    3.5, 
    12, 
    15, 
    200
);

-- END OF PROJECT

-- Final Data Verification
SELECT 'Starbucks Database Ready!' AS status;
SELECT 
    (SELECT COUNT(*) FROM beverages) AS total_beverages,
    (SELECT COUNT(*) FROM categories) AS total_categories,
    (SELECT COUNT(*) FROM nutrition_facts) AS total_nutrition_records;

-- Show sample data
SELECT * FROM vw_healthy_choices LIMIT 10;