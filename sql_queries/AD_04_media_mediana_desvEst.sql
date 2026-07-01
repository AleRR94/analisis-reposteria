-- Ordenar y numerar para las medianas y las desviaciones
WITH filas_ordenadas AS (
    SELECT 
        Año,
        IT,
        TotalCV,
        ROUND(IT - TotalCV, 2) AS UB,
        ROW_NUMBER() OVER (PARTITION BY Año ORDER BY IT) AS fila_it,
        ROW_NUMBER() OVER (PARTITION BY Año ORDER BY TotalCV) AS fila_cv,
        ROW_NUMBER() OVER (PARTITION BY Año ORDER BY (IT - TotalCV)) AS fila_ub,
        COUNT(*) OVER (PARTITION BY Año) AS total_filas,
        
        -- Componentes para la fórmula poblacional de Ingresos
        SUM(IT) OVER (PARTITION BY Año) AS suma_it,
        SUM(IT * IT) OVER (PARTITION BY Año) AS suma_it_cuadrado,

        -- Componentes para la fórmula poblacional de Utilidad Bruta (UB)
        SUM(IT - TotalCV) OVER (PARTITION BY Año) AS suma_ub,
        SUM((IT - TotalCV) * (IT - TotalCV)) OVER (PARTITION BY Año) AS suma_ub_cuadrado
    FROM transacciones
),

-- CTE de Promedios, medianas y desviaciones
metricas_calculadas AS (
    SELECT 
        Año,
        ROUND(AVG(IT), 2) AS Promedio_Ingresos,
        ROUND(AVG(TotalCV), 2) AS Promedio_Costos,
        ROUND(AVG(IT - TotalCV), 2) AS Promedio_UB,
        
        ROUND(AVG(CASE WHEN fila_it BETWEEN total_filas / 2.0 AND (total_filas / 2.0) + 1 THEN IT END), 2) AS Mediana_Ingresos,
        ROUND(AVG(CASE WHEN fila_cv BETWEEN total_filas / 2.0 AND (total_filas / 2.0) + 1 THEN TotalCV END), 2) AS Mediana_TotalCV,
        ROUND(AVG(CASE WHEN fila_ub BETWEEN total_filas / 2.0 AND (total_filas / 2.0) + 1 THEN UB END), 2) AS Mediana_UB,
        
        -- Desviación Estándar Poblacional de Ingresos Totales (IT)
        ROUND(POWER(
            (MAX(suma_it_cuadrado) - (MAX(suma_it) * MAX(suma_it)) / MAX(total_filas)) / MAX(total_filas), 
            0.5
        ), 2) AS Desv_Estandar_IT,

        -- Desviación Estándar Poblacional de Utilidad Bruta (UB)
        ROUND(POWER(
            (MAX(suma_ub_cuadrado) - (MAX(suma_ub) * MAX(suma_ub)) / MAX(total_filas)) / MAX(total_filas), 
            0.5
        ), 2) AS Desv_Estandar_UB
    FROM filas_ordenadas
    GROUP BY Año
)

SELECT 
    CAST(Año AS TEXT) AS Año,
    Promedio_Ingresos,
    Promedio_Costos,
    Promedio_UB,
    Mediana_Ingresos,
    Mediana_TotalCV,
    Mediana_UB,
    Desv_Estandar_IT,
    Desv_Estandar_UB
FROM metricas_calculadas
WHERE Año IN (2024, 2025)

UNION ALL

-- Cálculo de variaciones
SELECT 
    'Variación' AS Año,
    ROUND(((m25.Promedio_Ingresos - m24.Promedio_Ingresos) / m24.Promedio_Ingresos) * 100.00, 2) AS Var_Prom_Ingresos,
    ROUND(((m25.Promedio_Costos - m24.Promedio_Costos) / m24.Promedio_Costos) * 100.00, 2) AS Var_Prom_Costos,
    ROUND(((m25.Promedio_UB - m24.Promedio_UB) / m24.Promedio_UB) * 100.00, 2) AS Var_Prom_UB,
    ROUND(((m25.Mediana_Ingresos - m24.Mediana_Ingresos) / m24.Mediana_Ingresos) * 100.00, 2) AS Var_Med_Ingresos,
    ROUND(((m25.Mediana_TotalCV - m24.Mediana_TotalCV) / m24.Mediana_TotalCV) * 100.00, 2) AS Var_Med_Costos,
    ROUND(((m25.Mediana_UB - m24.Mediana_UB) / m24.Mediana_UB) * 100.00, 2) AS Var_Med_UB,
    ROUND(((m25.Desv_Estandar_IT - m24.Desv_Estandar_IT) / m24.Desv_Estandar_IT) * 100.00, 2) AS Var_Desv_IT,
    ROUND(((m25.Desv_Estandar_UB - m24.Desv_Estandar_UB) / m24.Desv_Estandar_UB) * 100.00, 2) AS Var_Desv_UB 
FROM (SELECT * FROM metricas_calculadas WHERE Año = 2024) m24
CROSS JOIN (SELECT * FROM metricas_calculadas WHERE Año = 2025) m25;
