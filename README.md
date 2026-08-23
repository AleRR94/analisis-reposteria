# Análisis financiero de causa raíz sobre la erosión de márgenes en un negocio de repostería artesanal

## 📌 Descripción del Proyecto
En este proyecto se evalúa la salud financiera y la rentabilidad real de un negocio pequeño de repostería artesanal que estuvo expuesto a presiones inflacionarias. A través de un enfoque analítico híbrido, se procesaron miles de transacciones utilizando **SQL** (SQLite) para el minado, limpieza y consolidación de transacciones, **Python** para el análisis de dispersión y volatilidad estadística, **Google Sheets** para la validación financiera y, por último, **Tableau** para el diseño de un *dashboard* interactivo.

## Meta SMART:
Este negocio no ha tenido actividad desde octubre de 2025 debido a una reubicación geográfica. El objetivo es que durante el **primer trimestre** de **reactivación operativa**, se alcance un **Margen Bruto** mínimo del **65%**, esto, a través de una **reingeniería** de las **recetas** y una **actualización dinámica** de los **precios**.

## 🗺️ Metodología y Fases del Análisis

### 📊 1. Análisis Descriptivo (Google Sheets, SQL y Python)
* **Enfoque Cuantitativo:** Consolidación de transacciones históricas calculando medias, medianas y desviaciones estándar poblacionales anualizadas para medir la tendencia central del negocio.
* **Análisis de Volatilidad (Python):** Cálculo del Coeficiente de Variación (CV) y diseño de gráficos de dispersión para evaluar la estabilidad y el riesgo en el volumen de ventas por receta.

### 🔍 2. Análisis Diagnóstico (Google Sheets, SQL y Tableau)
* **Segmentación de Catálogo:** Implementación del Análisis de Pareto (80/20) para identificar las recetas clave que sostienen la utilidad bruta del negocio.
* **Monitoreo de Alertas:** Diseño de una Matriz de Semáforo condicional basada en los umbrales financieros de la industria de alimentos (60% de margen mínimo) para detectar productos críticos.

### 🎛️ 3. Análisis de Sensibilidad (Visualización | Tableau)
* **Simulación de Escenarios:** Construcción de un tablero interactivo con parámetros deslizables para estresar la relación Precio-Costo y evaluar el impacto macroeconómico (inflación) en tiempo real.

### 🎯 4. Análisis Prescriptivo (Conclusiones de Negocio)
* **Plan de Acción:** Diagnóstico final de causa raíz sobre la erosión del 3.69% anual del margen bruto y formulación de estrategias para la reestructuración de precios y retención de productos estrella hacia la Meta SMART.


## 📊 *Dashboard* Interactivo (Tableau)
<img width="1920" height="1032" alt="2026-08-09 (4)" src="https://github.com/user-attachments/assets/20d5f770-1bcb-4c2b-8599-66ac5afb4aa5" />
👉 [**Haz clic aquí para interactuar con el Dashboard en Tableau Public**](https://public.tableau.com/views/Anlisisfinancierodecausarazsobrelaerosindemrgenesenunnegociodereposteraartesanal/Dashboard1?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


## 🎯 Preguntas de Negocio y Objetivos Analíticos
Este proyecto busca responder a tres preguntas críticas sobre la erosión de márgenes, resolviéndolas mediante objetivos técnicos específicos:

* **1. Evaluación de Rentabilidad**
  * *Pregunta:* ¿Qué productos mantuvieron la *rentabilidad* del negocio?
  * *Enfoque Técnico:* **Análisis de Pareto (80/20)** en GoogleSheets, SQL y Tableau para identificar a los productos estrella históricos.
  
* **2. Análisis del Efecto Inflacionario**
  * *Pregunta:* ¿El nulo aumento de los *precios de venta* fue la única causa de la disminución del *margen de ganancia bruto*?
  * *Enfoque Técnico:* **Análisis de Sensibilidad interactivo** con parámetros en Tableau para estresar la relación Precio-Costo de forma aislada.

* **3. Reingeniería del Catálogo**
  * *Pregunta:* ¿Qué recetas necesitan una *reestructuración*?
  * *Enfoque Técnico:* **Matriz de Semáforo** en SQL cruzando volumen de venta con margen bruto mínimo de repostería (60%).

## 🎯 Conclusiones Generales e Insights de Causa Raíz

Tras consolidar el análisis descriptivo, estadístico y la simulación interactiva, se determinaron los siguientes hallazgos estratégicos para el negocio:

* **Causa Raíz de la Erosión:** Se concluye que la erosión del **3.69% anual** del Margen de Ganancia Bruta se debió estrictamente al impacto de la **inflación acelerada sobre los insumos** combinado con una estrategia de precios de venta fijos. Queda descartada cualquier tipo de deficiencia operativa interna.
* **Hallazgos Clave:**
  * El negocio es estructuralmente estable; bastaba con aplicar un ajuste del **10% en el precio de venta** para mantener el Margen Bruto por encima del umbral del 60%.
  * La utilidad bruta total depende fuertemente del **62.5% de los productos** (Categoría A de Pareto), exigiendo acciones inmediatas de blindaje y retención para estos productos en el catálogo.
  * Se identificaron productos críticos que requieren reestructuración inmediata en sus costos de preparación o volumen de ventas (como los IDs 3829 y 3830, cuyas caídas drásticas afectaron el flujo).
  * A través del cálculo del Coeficiente de Variación en Python, se detectó que los **Muffins de Yogurt** presentaron el mayor índice de inestabilidad en sus ventas semanales. Aunque es el producto líder en ingresos y rentabilidad, se reveló una **alta dependencia financiera y operativa** del negocio hacia un solo producto. Alguna caída drástica en este producto impactaría de manera directa e intensa el flujo de caja global, por lo que se necesita una **estrategia de diversificación** para mitigar este **riesgo de concentración**.

* **Propuesta Estratégica:** 
  Para alcanzar el objetivo del **65% de Margen Bruto**, no basta con empujar el volumen de venta. Se requiere implementar un monitoreo constante sobre la merma, optimizar el abastecimiento estratégico de insumos clave y asegurar que cualquier variación inflacionaria futura se refleje de manera dinámica en el precio final al consumidor.


### 🖊️ Matriz FODA
Los **análisis cuantitativos** llevados a cabo en este proyecto, permiten traducir estas **variables numéricas** en un **panorama estratégico**. En seguida se muestra la **matriz FODA**, la cual sintetiza los hallazgos en la base de datos los cuales serán la base para el **plan de acción** y el **relanzamiento comercial**.

<img width="1156" height="475" alt="2026-08-12" src="https://github.com/user-attachments/assets/d58573cf-1ff5-4844-83bb-10a047e20db1" />



### 📝 Metodología

* **Unificación de medidas**. Se homogenizaron las métricas para asegurar una comparación objetiva en ambos años.
  
* **Auditoría de datos**. Se detectaron valores nulos y se completaron con la información correspondiente, asegurando que los cálculos sean precisos.
  
* **Unión de datos**. Se vincularon listas de precios antiguos y nuevos para crear una visión completa del historial del  negocio.

* **Modelado**.  Se creó una tabla maestra la cual es un motor de escenarios dinámicos para el análisis de sensibilidad.

### 🔡 Glosario
* CV:       Costo de Ventas
* ETL:      Extract, Transform, Load
* GO:       Gastos Operacionales
* ID:       Identificación de productos
* IT:       Ingresos Totales
* MGB:      Margen de Ganancia Bruta
* MixVtas$: Mix Ventas Ingresos Totales
* MixVtasQ: Mix Ventas Cantidad
* MU:       Margen Unitario
* SMV: Sales Mix Variance
* TotalCV: Total Costo de Ventas
* UB: Utilidad bruta
* UN: Utilidad Neta
* UO: Utilidad Operativa
* VariaciónMoM: Variación Month over Month
* VariaciónWoW: Variación Week over Week
* VariaciónYoY: Variación Year over Year

															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
															
