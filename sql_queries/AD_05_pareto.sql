WITH utilidad_por_producto_año AS (
    -- Calcular la Utilidad Bruta de cada producto
    SELECT 
        CAST(Año AS TEXT) AS Bloque_Analisis,
        Producto, 
        SUM(IT - TotalCV) AS UB_Total
    FROM transacciones
    GROUP BY Año, Producto

    UNION ALL

    -- Combinar ambos años
    SELECT 
        'Todos' AS Bloque_Analisis,
        Producto, 
        SUM(IT - TotalCV) AS UB_Total
    FROM transacciones
    GROUP BY Producto
),

calculo_acumulado AS (
    -- Calcular los porcentajes acumulados
    SELECT 
        Bloque_Analisis,
        Producto,
        ROUND(UB_Total, 2) AS UB_Producto,
        SUM(UB_Total) OVER (PARTITION BY Bloque_Analisis ORDER BY UB_Total DESC) AS UB_Acumulada,
        SUM(UB_Total) OVER (PARTITION BY Bloque_Analisis) AS UB_Global_Bloque
    FROM utilidad_por_producto_año
),

pareto_con_porcentaje AS (
    -- Calcular el porcentaje acumulado real
    SELECT 
        Bloque_Analisis,
        Producto,
        UB_Producto,
        ROUND((UB_Acumulada / UB_Global_Bloque) * 100.00, 2) AS Porcentaje_Acumulado
    FROM calculo_acumulado
)

-- Clasificar en 3 categorías dependiendo el porcentaje acumulado de cada producto
SELECT 
    Bloque_Analisis,
    Producto,
    UB_Producto,
    Porcentaje_Acumulado,
    CASE 
        WHEN Porcentaje_Acumulado <= 80.00 THEN 'Categoría A (80% Principal)'
        WHEN Porcentaje_Acumulado <= 95.00 THEN 'Categoría B (15% Intermedio)'
        ELSE 'Categoría C (5% Baja Utilidad)'
    END AS Clasificacion_Pareto
FROM pareto_con_porcentaje
ORDER BY 
    -- Ordenar años y productos
    CASE WHEN Bloque_Analisis = '2024' THEN 1 WHEN Bloque_Analisis = '2025' THEN 2 ELSE 3 END,
    UB_Producto DESC;
