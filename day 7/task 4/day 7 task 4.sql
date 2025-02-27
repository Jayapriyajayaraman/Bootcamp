use bootcamp;
SELECT Country, Year, Cell_Phone_Total
FROM cellphones
WHERE (Year, Cell_Phone_Total) IN (
    (2003, 119),
    (2004, 119),
    (2005, 173),
    (2006, 192),
    (2007, 204)
)
ORDER BY Year;
