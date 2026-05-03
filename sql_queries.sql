--Calcular el Margen Bruto (MGB) por año para comparar el impacto inflacionario
SELECT Año,sum(IT) AS IngresosTotales,sum(TotalCOGS) AS TotalCostos,
--fix: corregir precisión decimal en el cálculo del MGB
round(((sum(IT)-sum(TotalCOGS))/sum(IT))*100.00,2) AS "MGB%"
FROM transacciones
GROUP BY Año;

