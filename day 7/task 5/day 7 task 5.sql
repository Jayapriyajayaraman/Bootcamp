show databases;
use bangalore_restaurants;
SET SQL_SAFE_UPDATES = 0;
DESC bangalore_restaurants;
UPDATE bangalore_restaurants  
SET latitude = 12.9716, longitude = 77.5946  
WHERE name = 'Burma Burma';
SELECT  
     name AS Restaurant_Name,  
     address AS Address,  
     ROUND(  
         6371 * ACOS(  
             COS(RADIANS(12.9784)) * COS(RADIANS(latitude)) *  
             COS(RADIANS(longitude) - RADIANS(77.5726)) +  
             SIN(RADIANS(12.9784)) * SIN(RADIANS(latitude))  
         ), 0  
     ) AS Distance_KM,  
     RANK() OVER (ORDER BY  
         6371 * ACOS(  
             COS(RADIANS(12.9784)) * COS(RADIANS(latitude)) *  
             COS(RADIANS(longitude) - RADIANS(77.5726)) +  
             SIN(RADIANS(12.9784)) * SIN(RADIANS(latitude))  
         ) ASC  
     ) AS Rank_Distance,  
     DENSE_RANK() OVER (ORDER BY  
         6371 * ACOS(  
             COS(RADIANS(12.9784)) * COS(RADIANS(latitude)) *  
             COS(RADIANS(longitude) - RADIANS(77.5726)) +  
             SIN(RADIANS(12.9784)) * SIN(RADIANS(latitude))  
         ) ASC  
     ) AS Dense_Rank_Distance  
 FROM bangalore_restaurants  
 WHERE latitude IS NOT NULL AND longitude IS NOT NULL  
 ORDER BY Distance_KM ASC  
 LIMIT 10;
 
