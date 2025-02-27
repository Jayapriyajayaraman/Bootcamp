use bootcamp;
SELECT 
    cp.Country,
    cp.Year,
    COALESCE(cp.Cell_Phone_Total, 0) AS Cell_Phone_Total,  -- Replace NULL with 0
    COALESCE(p.Pop, 0) AS Pop,  -- Replace NULL with 0
    CONCAT(
        COALESCE(cp.Cell_Phone_Total, 0), '/', FORMAT(COALESCE(p.Pop, 1), 2), ' = ', 
        ROUND(COALESCE(cp.Cell_Phone_Total, 0) / NULLIF(COALESCE(p.Pop, 1), 0), 6)
    ) AS Phones_Per_Person
FROM cellphones cp
LEFT JOIN pop p 
    ON cp.Country = p.Country 
    AND cp.Year = p.Year
ORDER BY cp.Country, cp.Year;
