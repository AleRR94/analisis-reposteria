--Calcular el Margen Bruto (MGB) por año para comparar el impacto inflacionario
WITH 'Calculos' AS (SELECT Año,sum(IT) AS IngresosTotales,sum(TotalCV) AS TotalCostos, 
--fix: corregir precisión decimal en el cálculo del MGB
	round(((sum(IT)-sum(TotalCV))/sum(IT))*100.00,2) AS Margen
FROM transacciones
GROUP BY Año)
--Convertir la columna Año a texto para que coincida con las etiquetas Suma y Diferencia
SELECT CAST(Año AS TEXT) AS Año, IngresosTotales, TotalCostos, Margen
FROM Calculos
WHERE Año IN (2024,2025)

UNION ALL
--Sumar y restar respectivamente las cantidades, exceptuando la columna Margen, en esa en vez de suma se calculó el promedio.
SELECT
'Suma/promedio Margen',
	(SELECT IngresosTotales FROM Calculos WHERE Año = '2024')+(SELECT IngresosTotales FROM Calculos WHERE Año = '2025'),
	(SELECT TotalCostos FROM Calculos WHERE Año = '2024')+(SELECT TotalCostos FROM Calculos WHERE Año = '2025'),
	round(((SELECT Margen FROM Calculos WHERE Año = '2024')+(SELECT Margen FROM Calculos WHERE Año = '2025'))/2,2)
	
UNION ALL

SELECT
'Diferencia',
	(SELECT IngresosTotales FROM Calculos WHERE Año = '2024')-(SELECT IngresosTotales FROM Calculos WHERE Año = '2025'),
	round((SELECT TotalCostos FROM Calculos WHERE Año = '2024')-(SELECT TotalCostos FROM Calculos WHERE Año = '2025'),2),
	(SELECT Margen FROM Calculos WHERE Año = '2024')-(SELECT Margen FROM Calculos WHERE Año = '2025');
