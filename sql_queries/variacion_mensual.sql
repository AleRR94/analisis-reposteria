-- Dividir los gastos por mes y año para calcular la Variación Porcentual mensual
WITH 'UB' AS (SELECT Año,Mes,sum(IT) AS IngresosTotales,sum(TotalCV)AS TotalCostos,((sum(IT))-(sum(TotalCV)))AS UtilidadBruta
FROM transacciones
GROUP BY Año,Mes)
-- Colocar la columna UB_Anterior para poder calcular más fácil la variación mensual entre ambas columnas.
SELECT Año, Mes, UtilidadBruta AS UB_Actual,
LAG(UtilidadBruta, 1) OVER (ORDER BY Año, Mes) AS UB_Anterior,
ROUND((UtilidadBruta - LAG(UtilidadBruta, 1) OVER (ORDER BY Año, Mes))/ LAG(UtilidadBruta, 1) OVER (ORDER BY Año, Mes) * 100.0, 2) AS Variación_Porcentual
FROM UB; 
