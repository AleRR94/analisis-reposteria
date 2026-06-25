-- Calcular media de los Ingresos Totales y el TotalCV
WITH promedio AS (
    SELECT 
        Año,
        ROUND(AVG(IT), 2) AS Ingresos_promedio,
        ROUND(AVG(TotalCV), 2) AS Costos_promedio
    FROM transacciones
    GROUP BY Año
)

-- Calcular Utilidad bruta por años (UB)
SELECT 
    CAST(Año AS TEXT) AS Año,
    Ingresos_promedio,
    Costos_promedio,
    (Ingresos_promedio - Costos_promedio) AS UB
FROM promedio
WHERE Año IN (2024, 2025)

UNION ALL

-- Calcular la variación
SELECT 
    'Variación' AS Año,
    -- Variación Ingresos
    round(((p25.Ingresos_promedio - p24.Ingresos_promedio) / p24.Ingresos_promedio) * 100.00,2),
    
    -- Variación Costos
    round(((p25.Costos_promedio - p24.Costos_promedio) / p24.Costos_promedio) * 100.00,2),
    
    -- Variación Utilidad Bruta (UB)
    round((((p25.Ingresos_promedio - p25.Costos_promedio) - (p24.Ingresos_promedio - p24.Costos_promedio)) 
    / (p24.Ingresos_promedio - p24.Costos_promedio)) * 100.00,2)

-- Crear dos versiones de la CTE para juntarlas
FROM (SELECT * FROM promedio WHERE Año = 2024) p24
CROSS JOIN (SELECT * FROM promedio WHERE Año = 2025) p25;
