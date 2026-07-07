WITH metricas_producto AS (
    SELECT 
        Año,
		ID,
        Producto,
        -- Calcular la cantidad total de unidades vendidas
        SUM(CantidadVendida) AS Cantidad_Vendida, 
        
        -- Calcular la Utilidad Bruta Total de ese producto
        SUM(IT - TotalCV) AS UB_Total,
        
        -- Calcular el Margen de Utilidad Bruta Porcentual
        ROUND((SUM(IT - TotalCV) / SUM(IT)) * 100.00, 2) AS Margen_UB
    FROM transacciones
    GROUP BY Año, ID, Producto
),

promedios_globales AS (
    SELECT 
        *,
        -- El promedio general de unidades vendidas del año se usará como punto de referencia
        AVG(Cantidad_Vendida) OVER (PARTITION BY Año) AS Promedio_Unidades_Año
    FROM metricas_producto
)

SELECT 
    Año,
	ID,
    Producto,
    Cantidad_Vendida,
    Margen_UB,
    
    -- Semáforo de prodcutos, se toma en cuenta el Margen y las unidades vendidas
    CASE 
        -- Color rojo: Margen de Utilidad Bruta <= 45% o ventas menores de la mitad del promedio de ventas
        WHEN Margen_UB < 45.00 OR Cantidad_Vendida < (Promedio_Unidades_Año * 0.5) 
            THEN '🔴 Crítico (Revisar Costos o Rotación)'
            
        -- Color verde: Margen de Utilidad Bruta >=60% y ventas mayores al promedio de ventas
        WHEN Margen_UB >= 60.00 AND Cantidad_Vendida >= Promedio_Unidades_Año 
            THEN '🟢 Excelente (Alta Rentabilidad y Ventas)'
            
        -- Color amarillo: Margen de UB >45% y ventas mayores al promedio de ventas o a la mitad del promedio de ventas, 
		-- o bien, margen >60% pero con ventas menores al promedio de ventas pero mayores a la mitad del promedio de ventas
        ELSE '🟡 Estable / Alerta (Monitorear Estrategia)'
    END AS Semaforo_Estado

FROM promedios_globales
ORDER BY Año, Cantidad_Vendida DESC;
