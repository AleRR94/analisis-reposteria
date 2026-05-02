--Calcular el MGB por año
SELECT Año,sum(IT) AS IngresosTotales,sum(TotalCOGS) AS TotalCostos,((sum(IT)-sum(TotalCOGS))/sum(IT))*100 AS "MGB%"
FROM transacciones
GROUP BY Año;
