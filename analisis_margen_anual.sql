--Calcular el Margen Bruto (MGB) por año para comparar el impacto inflacionario
WITH 'Calculos' AS (SELECT Año,sum(IT) AS IngresosTotales,sum(TotalCOGS) AS TotalCostos, 
--fix: corregir precisión decimal en el cálculo del MGB
	round(((sum(IT)-sum(TotalCOGS))/sum(IT))*100.00,2) AS Margen
FROM transacciones
GROUP BY Año)
--Convertir la columna Añe a texto para que coincida con las etiquetas Suma y Diferencia
SELECT CAST(Año AS TEXT) AS Año, IngresosTotales, TotalCostos, Margen
FROM Calculos
WHERE Año IN (2024,2025)

UNION ALL
--Sumar y restar respectivamente las cantidades
SELECT
'Suma',
	(SELECT IngresosTotales FROM Calculos WHERE Año = '2024')+(SELECT IngresosTotales FROM Calculos WHERE Año = '2025'),
	(SELECT TotalCostos FROM Calculos WHERE Año = '2024')+(SELECT TotalCostos FROM Calculos WHERE Año = '2025'),
	(SELECT Margen FROM Calculos WHERE Año = '2024')+(SELECT Margen FROM Calculos WHERE Año = '2025')
	
UNION ALL

SELECT
'Diferencia',
	(SELECT IngresosTotales FROM Calculos WHERE Año = '2024')-(SELECT IngresosTotales FROM Calculos WHERE Año = '2025'),
	(SELECT TotalCostos FROM Calculos WHERE Año = '2024')-(SELECT TotalCostos FROM Calculos WHERE Año = '2025'),
	(SELECT Margen FROM Calculos WHERE Año = '2024')-(SELECT Margen FROM Calculos WHERE Año = '2025');
