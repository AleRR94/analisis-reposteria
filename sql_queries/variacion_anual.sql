WITH VariaciónAnual AS (
-- Separar los ingresos y costos de cada año en columnas independientes.
    SELECT 
        SUM(CASE WHEN Año = 2024 THEN IT ELSE 0 END) AS Ingresos_2024,
        SUM(CASE WHEN Año = 2025 THEN IT ELSE 0 END) AS Ingresos_2025,
        SUM(CASE WHEN Año = 2024 THEN TotalCV ELSE 0 END) AS Costos_2024,
        SUM(CASE WHEN Año = 2025 THEN TotalCV ELSE 0 END) AS Costos_2025
    FROM transacciones
)
SELECT 
-- Calcular la Utilidad Bruta de cada año.
    (Ingresos_2024 - Costos_2024) AS UB_2024,
    (Ingresos_2025 - Costos_2025) AS UB_2025,
    
-- Variación Absoluta en dinero ($)
    ((Ingresos_2025 - Costos_2025) - (Ingresos_2024 - Costos_2024)) AS Variación_Absoluta_Pesos,
    
-- Variación Porcentual Anual (%) con truco decimal para SQLite
    ROUND(
        ((Ingresos_2025 - Costos_2025) - (Ingresos_2024 - Costos_2024)) * 100.0 / 
        (Ingresos_2024 - Costos_2024), 
        2
    ) AS Variación_Porcentual_Anual
FROM VariaciónAnual;
