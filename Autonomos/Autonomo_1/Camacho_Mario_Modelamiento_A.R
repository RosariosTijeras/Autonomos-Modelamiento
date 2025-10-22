# MODELAMIENTO

# ====================
# CARGA DE LIBRERIAS
# ====================
library(ggplot2)
library(dplyr)
library(ggpubr)
library(gridExtra)
library(plotly)
library(htmlwidgets)
# =============================================================================
# 1. CARGA Y EXPLORACIÓN DEL DATASET MTCARS
# =============================================================================

# Cargar el dataset
data(mtcars)
# Visualiza la informacion
head(mtcars)
# Lectura de datos (tipo de dato)
glimpse(mtcars)
# Resumen de informacion estadistico
summary(mtcars)
# verificar valors NA
sum(is.na(mtcars))

# Nombre de las variables
cat("Variables disponibles:", names(mtcars), "\n\n")
# Información sobre las variables (ayuda)
help(mtcars)

# Descripción de las variables principales
cat("
Variables del dataset mtcars:
1 mpg: Millas por galón (Miles per gallon)
2 cyl: Número de cilindros
3 disp: Desplazamiento (cubic inches)
4 hp: Caballos de fuerza (Horse power)
5 drat: Relación del eje trasero
6 wt: Peso (1000 lbs)
7 qsec: Tiempo en 1/4 de milla
8 vs: Motor (0 = V-shaped, 1 = straight)
9 am: Transmisión (0 = automática, 1 = manual)
10 gear: Número de marchas hacia adelante
11 carb: Número de carburadores
")


# Estadísticas de las variables de interés
cat("Variable dependiente: mpg (millas por galón)\n")
summary(mtcars$mpg)
cat("\nVariable independiente: wt (peso en 1000 lbs)\n")
summary(mtcars$wt)

# Visualización inicial de los datos a ser estudiados
cat("\n=== PRIMERAS 10 OBSERVACIONES ===\n")
print(head(mtcars[, c("mpg", "wt")], 10))

# =============================================================================
# 2. ANÁLISIS EXPLORATORIO Y VISUALIZACIÓN
# =============================================================================

# Gráfico de dispersión inicial
cat("\n=== CREANDO GRÁFICOS EXPLORATORIOS INTERACTIVOS ===\n")

# Preparar datos con nombres de vehículos
mtcars_with_names <- mtcars
mtcars_with_names$car_name <- rownames(mtcars)

# 1. Gráfico de dispersión interactivo principal
plot1_interactive <- plot_ly(
  data = mtcars_with_names,
  x = ~wt,
  y = ~mpg,
  type = 'scatter',
  mode = 'markers',
  marker = list(
    size = 12,
    color = ~mpg,
    colorscale = 'Viridis',
    showscale = TRUE,
    colorbar = list(title = "MPG"),
    line = list(color = 'white', width = 1)
  ),
  text = ~paste(
    '<b>Vehículo:</b>', car_name,
    '<br><b>Peso:</b>', round(wt, 2), '1000 lbs',
    '<br><b>Rendimiento:</b>', round(mpg, 2), 'mpg',
    '<br><b>Cilindros:</b>', cyl,
    '<br><b>HP:</b>', hp
  ),
  hoverinfo = 'text'
) %>%
  layout(
    title = list(
      text = '<b>Relación entre Peso y Rendimiento del Vehículo</b><br><sub>Dataset mtcars - Análisis Exploratorio</sub>',
      font = list(size = 18)
    ),
    xaxis = list(
      title = '<b>Peso (1000 lbs)</b>',
      gridcolor = 'rgba(128,128,128,0.2)',
      showgrid = TRUE,
      zeroline = FALSE
    ),
    yaxis = list(
      title = '<b>Rendimiento (Millas por galón)</b>',
      gridcolor = 'rgba(128,128,128,0.2)',
      showgrid = TRUE,
      zeroline = FALSE
    ),
    plot_bgcolor = 'rgba(240,240,240,0.5)',
    paper_bgcolor = 'white',
    hovermode = 'closest',
    font = list(family = "Arial, sans-serif")
  )

print(plot1_interactive)

# 2. Histograma interactivo de MPG
hist1_interactive <- plot_ly(
  x = ~mtcars$mpg,
  type = 'histogram',
  nbinsx = 10,
  marker = list(
    color = 'rgba(58, 139, 201, 0.7)',
    line = list(color = 'rgba(58, 139, 201, 1)', width = 2)
  ),
  name = 'MPG'
) %>%
  layout(
    title = list(
      text = '<b>Distribución del Rendimiento (MPG)</b>',
      font = list(size = 16)
    ),
    xaxis = list(title = '<b>Millas por galón</b>'),
    yaxis = list(title = '<b>Frecuencia</b>'),
    bargap = 0.1,
    plot_bgcolor = 'rgba(240,240,240,0.5)',
    paper_bgcolor = 'white'
  )

# 3. Histograma interactivo de Peso
hist2_interactive <- plot_ly(
  x = ~mtcars$wt,
  type = 'histogram',
  nbinsx = 10,
  marker = list(
    color = 'rgba(100, 200, 102, 0.7)',
    line = list(color = 'rgba(100, 200, 102, 1)', width = 2)
  ),
  name = 'Peso'
) %>%
  layout(
    title = list(
      text = '<b>Distribución del Peso (WT)</b>',
      font = list(size = 16)
    ),
    xaxis = list(title = '<b>Peso (1000 lbs)</b>'),
    yaxis = list(title = '<b>Frecuencia</b>'),
    bargap = 0.1,
    plot_bgcolor = 'rgba(240,240,240,0.5)',
    paper_bgcolor = 'white'
  )

# 4. Boxplot interactivo combinado
boxplot_combined <- plot_ly() %>%
  add_trace(
    y = ~mtcars$mpg,
    type = 'box',
    name = 'Rendimiento (MPG)',
    marker = list(color = 'rgba(58, 139, 201, 0.7)'),
    boxmean = 'sd'
  ) %>%
  add_trace(
    y = ~mtcars$wt,
    type = 'box',
    name = 'Peso (1000 lbs)',
    marker = list(color = 'rgba(100, 200, 102, 0.7)'),
    boxmean = 'sd'
  ) %>%
  layout(
    title = list(
      text = '<b>Comparación de Distribuciones</b><br><sub>Boxplots con Media y Desviación Estándar</sub>',
      font = list(size = 16)
    ),
    yaxis = list(title = '<b>Valores</b>'),
    plot_bgcolor = 'rgba(240,240,240,0.5)',
    paper_bgcolor = 'white',
    showlegend = TRUE
  )
# Mostrar gráficos interactivos
cat("\n✓ Gráfico de dispersión creado\n")
print(hist1_interactive)
cat("\n✓ Histograma MPG creado\n")
print(hist2_interactive)
cat("\n✓ Histograma Peso creado\n")
print(boxplot_combined)
cat("\n✓ Boxplots combinados creados\n")


# =============================================================================
# 3. Test de Shapiro-Wilk para normalidad
# =============================================================================

cat("Test de Shapiro-Wilk para mpg (rendimiento):\n")
shapiro_mpg <- shapiro.test(mtcars$mpg)
print(shapiro_mpg)

cat("\nTest de Shapiro-Wilk para wt (peso):\n")
shapiro_wt <- shapiro.test(mtcars$wt)
print(shapiro_wt)

# Interpretación
cat("\nINTERPRETACIÓN DE LAS PRUEBAS DE NORMALIDAD:\n")
if (shapiro_mpg$p.value > 0.05) {
  cat("- MPG: Los datos siguen una distribución normal (p > 0.05)\n")
} else {
  cat("- MPG: Los datos NO siguen una distribución normal (p ≤ 0.05)\n")
}

if (shapiro_wt$p.value > 0.05) {
  cat("- WT: Los datos siguen una distribución normal (p > 0.05)\n")
} else {
  cat("- WT: Los datos NO siguen una distribución normal (p ≤ 0.05)\n")
}

# Gráficos Q-Q para evaluar normalidad visualmente
par(mfrow = c(2, 2))
qqnorm(mtcars$mpg, main = "Q-Q Plot: Rendimiento (mpg)")
qqline(mtcars$mpg, col = "red")

qqnorm(mtcars$wt, main = "Q-Q Plot: Peso (wt)")
qqline(mtcars$wt, col = "red")

# =============================================================================
# 4. CORRELACIÓN DE PEARSON
# =============================================================================

cat("\n=== ANÁLISIS DE CORRELACIÓN DE PEARSON ===\n")

# Calcular correlación de Pearson
correlacion <- cor.test(mtcars$wt, mtcars$mpg, method = "pearson")
print(correlacion)

cat("\nINTERPRETACIÓN DE LA CORRELACIÓN:\n")
cat("Coeficiente de correlación (r):", round(correlacion$estimate, 4), "\n")
cat("Valor p:", round(correlacion$p.value, 6), "\n")

# Interpretación de la fuerza de la correlación
r_value <- abs(correlacion$estimate)
if (r_value >= 0.8) {
  fuerza <- "muy fuerte"
} else if (r_value >= 0.6) {
  fuerza <- "fuerte"
} else if (r_value >= 0.4) {
  fuerza <- "moderada"
} else if (r_value >= 0.2) {
  fuerza <- "débil"
} else {
  fuerza <- "muy débil"
}

direccion <- ifelse(correlacion$estimate < 0, "negativa", "positiva")
cat("La correlación es", fuerza, "y", direccion, "\n")

if (correlacion$p.value < 0.05) {
  cat("La correlación es estadísticamente significativa (p < 0.05)\n")
} else {
  cat("La correlación NO es estadísticamente significativa (p ≥ 0.05)\n")
}

# =============================================================================
# 5. MODELO DE REGRESIÓN LINEAL SIMPLE
# =============================================================================

cat("\n=== MODELO DE REGRESIÓN LINEAL SIMPLE ===\n")

# Ajustar el modelo de regresión lineal
modelo <- lm(mpg ~ wt, data = mtcars)

# Resumen del modelo
cat("RESUMEN DEL MODELO:\n")
summary(modelo)

# Extraer coeficientes
coeficientes <- coef(modelo)
intercepto <- coeficientes[1]
pendiente <- coeficientes[2]

cat("\n=== ECUACIÓN DE LA RECTA ===\n")
cat("Y = β₀ + β₁X\n")
cat("mpg =", round(intercepto, 4), "+", round(pendiente, 4), "* wt\n")
cat("Rendimiento =", round(intercepto, 4), "+", round(pendiente, 4), "* Peso\n")

# =============================================================================
# 6. EVALUACIÓN DEL MODELO
# =============================================================================

cat("\n=== EVALUACIÓN DEL MODELO ===\n")

# R-cuadrado
r_cuadrado <- summary(modelo)$r.squared
r_cuadrado_adj <- summary(modelo)$adj.r.squared

cat("R² (coeficiente de determinación):", round(r_cuadrado, 4), "\n")
cat("R² ajustado:", round(r_cuadrado_adj, 4), "\n")
cat("El modelo explica el", round(r_cuadrado * 100, 2), "% de la variabilidad en el rendimiento\n")

# Significancia del modelo
cat("\nSIGNIFICANCIA DEL MODELO:\n")
modelo_summary <- summary(modelo)
f_stat <- modelo_summary$fstatistic
p_value_modelo <- pf(f_stat[1], f_stat[2], f_stat[3], lower.tail = FALSE)
cat("Estadístico F:", round(f_stat[1], 4), "\n")
cat("Valor p del modelo:", format(p_value_modelo, scientific = TRUE), "\n")

if (p_value_modelo < 0.05) {
  cat("El modelo es estadísticamente significativo (p < 0.05)\n")
} else {
  cat("El modelo NO es estadísticamente significativo (p ≥ 0.05)\n")
}

# =============================================================================
# 7. DIAGNÓSTICO DEL MODELO
# =============================================================================

cat("\n=== DIAGNÓSTICO DEL MODELO ===\n")

# Gráficos de diagnóstico
par(mfrow = c(2, 2))
plot(modelo)

# Análisis de residuos
residuos <- residuals(modelo)
valores_ajustados <- fitted(modelo)

# Test de normalidad de residuos
cat("Test de normalidad de residuos:\n")
shapiro_residuos <- shapiro.test(residuos)
print(shapiro_residuos)

# Test de homocedasticidad (Breusch-Pagan)
if (!require(lmtest)) {
  install.packages("lmtest")
  library(lmtest)
}

cat("\nTest de homocedasticidad (Breusch-Pagan):\n")
bp_test <- bptest(modelo)
print(bp_test)

# =============================================================================
# 8. PREDICCIONES Y RESPUESTA A LA PREGUNTA
# =============================================================================

cat("\n=== PREDICCIONES Y RESPUESTA A LA PREGUNTA ===\n")

# Predicción para un vehículo sin carga (peso mínimo observado)
peso_sin_carga <- 0  # Peso teórico sin carga
peso_min_observado <- min(mtcars$wt)
peso_max_observado <- max(mtcars$wt)

cat("Rango de pesos observados:", round(peso_min_observado, 3), "a", round(peso_max_observado, 3), "miles de libras\n")

# Predicción para peso = 0 (extrapolación)
rendimiento_sin_carga <- predict(modelo, newdata = data.frame(wt = peso_sin_carga))
cat("Rendimiento predicho sin carga (wt = 0):", round(rendimiento_sin_carga, 2), "mpg\n")

# Predicción para el peso mínimo observado
rendimiento_peso_min <- predict(modelo, newdata = data.frame(wt = peso_min_observado))
cat("Rendimiento predicho para peso mínimo observado (wt =", round(peso_min_observado, 3), "):", 
    round(rendimiento_peso_min, 2), "mpg\n")

# Intervalos de confianza para las predicciones
ic_sin_carga <- predict(modelo, newdata = data.frame(wt = peso_sin_carga), 
                        interval = "confidence", level = 0.95)
cat("Intervalo de confianza 95% para peso sin carga:", 
    round(ic_sin_carga[2], 2), "-", round(ic_sin_carga[3], 2), "mpg\n")

# =============================================================================
# 9. GRÁFICO FINAL CON LÍNEA DE REGRESIÓN
# =============================================================================

cat("\n=== GRÁFICO FINAL INTERACTIVO CON REGRESIÓN ===\n")

# Calcular valores ajustados y residuos
mtcars_with_names$fitted <- fitted(modelo)
mtcars_with_names$residuals <- residuals(modelo)

# Crear línea de regresión
x_range <- seq(min(mtcars$wt), max(mtcars$wt), length.out = 100)
y_pred <- predict(modelo, newdata = data.frame(wt = x_range))

# Intervalos de confianza
pred_interval <- predict(modelo, 
                         newdata = data.frame(wt = x_range), 
                         interval = "confidence", 
                         level = 0.95)

# Gráfico final con regresión
plot_final_interactive <- plot_ly() %>%
  # Intervalos de confianza
  add_ribbons(
    x = x_range,
    ymin = pred_interval[, "lwr"],
    ymax = pred_interval[, "upr"],
    fillcolor = 'rgba(255, 100, 100, 0.2)',
    line = list(color = 'transparent'),
    name = 'IC 95%',
    showlegend = TRUE
  ) %>%
  # Línea de regresión
  add_lines(
    x = x_range,
    y = y_pred,
    line = list(color = 'red', width = 3),
    name = paste0('Y = ', round(intercepto, 2), ' + ', round(pendiente, 2), 'X')
  ) %>%
  # Puntos observados
  add_markers(
    data = mtcars_with_names,
    x = ~wt,
    y = ~mpg,
    marker = list(
      size = 12,
      color = ~abs(residuals),
      colorscale = 'RdYlGn',
      reversescale = TRUE,
      showscale = TRUE,
      colorbar = list(title = "Magnitud<br>Residuo"),
      line = list(color = 'white', width = 1.5)
    ),
    text = ~paste(
      '<b>Vehículo:</b>', car_name,
      '<br><b>Peso:</b>', round(wt, 2), '1000 lbs',
      '<br><b>MPG Observado:</b>', round(mpg, 2),
      '<br><b>MPG Predicho:</b>', round(fitted, 2),
      '<br><b>Residuo:</b>', round(residuals, 2),
      '<br><b>Cilindros:</b>', cyl,
      '<br><b>HP:</b>', hp
    ),
    hoverinfo = 'text',
    name = 'Datos Observados'
  ) %>%
  layout(
    title = list(
      text = paste0(
        '<b>Modelo de Regresión Lineal: Peso vs Rendimiento</b><br>',
        '<sub>Y = ', round(intercepto, 2), ' + ', round(pendiente, 2), 'X</sub><br>',
        '<sub>R² = ', round(r_cuadrado, 4), ' | p < 0.001 | n = 32</sub>'
      ),
      font = list(size = 18)
    ),
    xaxis = list(
      title = '<b>Peso del Vehículo (1000 lbs)</b>',
      gridcolor = 'rgba(128,128,128,0.2)',
      showgrid = TRUE,
      zeroline = FALSE
    ),
    yaxis = list(
      title = '<b>Rendimiento (Millas por galón)</b>',
      gridcolor = 'rgba(128,128,128,0.2)',
      showgrid = TRUE,
      zeroline = FALSE
    ),
    plot_bgcolor = 'rgba(240,240,240,0.5)',
    paper_bgcolor = 'white',
    hovermode = 'closest',
    showlegend = TRUE,
    legend = list(
      x = 0.02,
      y = 0.98,
      bgcolor = 'rgba(255,255,255,0.8)',
      bordercolor = 'rgba(0,0,0,0.2)',
      borderwidth = 1
    ),
    font = list(family = "Arial, sans-serif")
  )

print(plot_final_interactive)
cat("\n✓ Gráfico de regresión interactivo creado\n")

# Gráfico de residuos interactivo
residuals_plot <- plot_ly() %>%
  add_markers(
    data = mtcars_with_names,
    x = ~fitted,
    y = ~residuals,
    marker = list(
      size = 10,
      color = ~abs(residuals),
      colorscale = 'Reds',
      showscale = TRUE,
      colorbar = list(title = "|Residuo|"),
      line = list(color = 'white', width = 1)
    ),
    text = ~paste(
      '<b>Vehículo:</b>', car_name,
      '<br><b>Valor Ajustado:</b>', round(fitted, 2),
      '<br><b>Residuo:</b>', round(residuals, 2)
    ),
    hoverinfo = 'text'
  ) %>%
  add_lines(
    x = range(mtcars_with_names$fitted),
    y = c(0, 0),
    line = list(color = 'red', dash = 'dash', width = 2),
    showlegend = FALSE
  ) %>%
  layout(
    title = list(
      text = '<b>Análisis de Residuos</b><br><sub>Diagnóstico del Modelo</sub>',
      font = list(size = 16)
    ),
    xaxis = list(title = '<b>Valores Ajustados</b>'),
    yaxis = list(title = '<b>Residuos</b>'),
    plot_bgcolor = 'rgba(240,240,240,0.5)',
    paper_bgcolor = 'white',
    hovermode = 'closest'
  )

print(residuals_plot)
cat("\n✓ Gráfico de residuos creado\n")

