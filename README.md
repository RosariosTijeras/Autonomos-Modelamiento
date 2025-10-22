# 📚 Trabajos Autónomos - Modelamiento

**Materia:** Modelamiento
**Docente:** Estalin Mejia H.
**Carrera:** Ciencia de Datos e IA
**Semestre:** Tercero
**Universidad Nacional de Chimborazo**

---

## 👥 Equipo de Trabajo

- Alisson Atupaña
- Mario Camacho
- Lenin Lopez

---

## 📁 Estructura del Proyecto

```
Autonomos/
│
├── .gitignore                 # Archivos ignorados por Git
├── README.md                  # Este archivo
│
├── Autonomo 1/                # Primer trabajo autónomo
│
├── Autonomo 2/                # Segundo trabajo autónomo
│   ├── LaTeX/
│   ├── R_Notebooks/
│   └── Graficos/
│
├── Autonomo 3/                # Tercer trabajo autónomo
│   ├── LaTeX/
│   ├── R_Notebooks/
│   └── Graficos/
│
├── Autonomo 4/                # Cuarto trabajo autónomo
│   ├── LaTeX/
│   ├── R_Notebooks/
│   └── Graficos/
│
├── Autonomo 5/                # Quinto trabajo autónomo
│   ├── LaTeX/
│   ├── R_Notebooks/
│   └── Graficos/
│
└── Autonomo 6/                # Sexto trabajo autónomo
    ├── LaTeX/
    ├── R_Notebooks/
    └── Graficos/
```

---

## 🚀 Inicio Rápido

### Prerrequisitos

Asegúrate de tener instalado:

- **Git**: Para control de versiones
- **VS Code**: Editor de código
- **R**: Lenguaje de programación estadística
- **Jupyter**: Para notebooks interactivos
- **LaTeX**: Distribución completa (TeX Live, MiKTeX, etc.)

### Extensiones Recomendadas para VS Code

```json
{
  "LaTeX Workshop": "james-yu.latex-workshop",
  "R": "reditorsupport.r",
  "Jupyter": "ms-toolsai.jupyter",
  "GitLens": "eamodio.gitlens",
  "Spanish - Code Spell Checker": "streetsidesoftware.code-spell-checker-spanish"
}
```

### Clonar el Repositorio

```bash
git clone <url-del-repositorio>
cd Autonomos
```

---

## 💻 Flujo de Trabajo con Git

### 1️⃣ **Configuración Inicial (Solo una vez)**

```bash
# Configurar tu identidad en Git
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email@ejemplo.com"
```

### 2️⃣ **Antes de Empezar a Trabajar**

Siempre actualiza tu copia local antes de empezar:

```bash
# Obtener los últimos cambios del repositorio
git pull origin main
```

### 3️⃣ **Durante el Trabajo**

```bash
# Ver qué archivos has modificado
git status

# Añadir archivos específicos al área de preparación
git add "Autonomo 2/LaTeX/main.tex"
git add "Autonomo 2/R_Notebooks/analisis.ipynb"

# O añadir todos los cambios (¡cuidado!)
git add .

# Hacer commit con un mensaje descriptivo
git commit -m "Añade análisis descriptivo en Autónomo 2"
```

### 4️⃣ **Subir tus Cambios**

```bash
# Subir tus cambios al repositorio remoto
git push origin main
```

### 5️⃣ **En Caso de Conflictos**

Si dos personas editan el mismo archivo:

```bash
# Intenta hacer pull
git pull origin main

# Si hay conflictos, Git te lo indicará
# Abre los archivos en conflicto en VS Code
# VS Code te mostrará las diferencias y opciones para resolver

# Después de resolver conflictos:
git add <archivos-resueltos>
git commit -m "Resuelve conflictos en <archivo>"
git push origin main
```

---

## 🤝 Recomendaciones para Trabajo Colaborativo

### ✅ **Buenas Prácticas**

1. **Comunicación constante**
   - Usa WhatsApp/Telegram para coordinar quién trabaja en qué
   - Avisa cuando empieces a trabajar en un archivo
   - Avisa cuando termines y hagas push

2. **Commits frecuentes y descriptivos**
   - ✅ Bueno: `"Añade sección de metodología en Autónomo 3"`
   - ✅ Bueno: `"Corrige error en cálculo de regresión lineal"`
   - ❌ Malo: `"cambios"`, `"update"`, `"asdf"`

3. **División del trabajo**
   - **Opción 1 - Por secciones**: Cada persona trabaja en secciones diferentes del mismo documento
   - **Opción 2 - Por roles**:
     - Persona A: Análisis en R
     - Persona B: Redacción en LaTeX
     - Persona C: Gráficos y revisión
   - **Opción 3 - Por turnos**: Trabajan en orden, uno después del otro

4. **Sincronización regular**
   - Haz `git pull` ANTES de empezar a trabajar
   - Haz `git push` DESPUÉS de terminar tu sesión de trabajo
   - Idealmente, sincroniza cada 30-60 minutos si están trabajando simultáneamente

5. **Uso de ramas (Avanzado - Opcional)**
   ```bash
   # Crear una rama para tu trabajo
   git checkout -b feature/mario-analisis-descriptivo

   # Trabajar en tu rama
   git add .
   git commit -m "Tu trabajo"
   git push origin feature/mario-analisis-descriptivo

   # Luego, en GitHub, crear un Pull Request para fusionar
   ```

### 🚫 **Evitar**

- ❌ No editar el mismo archivo al mismo tiempo sin coordinarse
- ❌ No hacer push sin antes hacer pull
- ❌ No ignorar los conflictos (resolverlos inmediatamente)
- ❌ No subir archivos grandes innecesarios (PDFs de compilación, datasets muy grandes)
- ❌ No hacer commits con código que no funciona o que rompe la compilación

### 📋 **Plantilla de Sesión de Trabajo**

```bash
# 1. INICIO - Actualizar
git pull origin main

# 2. TRABAJO - Editar archivos en VS Code
# ... trabajar en tus archivos ...

# 3. VERIFICAR - Comprobar que todo compila
# - LaTeX: Compilar main.tex
# - R: Ejecutar todas las celdas del notebook

# 4. GUARDAR - Commit
git status
git add <archivos-modificados>
git commit -m "Descripción clara de los cambios"

# 5. SUBIR - Push
git push origin main
```

---

## 📝 Trabajar con LaTeX

### Compilación

Los archivos de compilación de LaTeX se generan automáticamente en la carpeta `build/` dentro de cada `LaTeX/` gracias a la configuración de VS Code.

### Compilar un Documento

1. Abre `main.tex` en VS Code
2. Presiona `Ctrl + Alt + B` (Windows/Linux) o `Cmd + Alt + B` (Mac)
3. O haz clic derecho → "Build LaTeX Project"

El PDF final se generará en la carpeta `LaTeX/`.

### Formato APA v7

Todos los trabajos deben seguir el formato APA v7. La plantilla base ya está configurada con:
- Márgenes de 1 pulgada (2.54 cm)
- Doble espaciado
- Encabezados con número de página
- Portada con información institucional
- Gestión automática de referencias

---

## 📊 Trabajar con R y Jupyter

### Abrir un Notebook

1. Navega a `Autonomo X/R_Notebooks/`
2. Abre el archivo `.ipynb`
3. Selecciona el kernel de R
4. Ejecuta las celdas con `Shift + Enter`

### Exportar Gráficos

```R
# Guardar un gráfico en la carpeta Graficos
ggsave("../Graficos/grafico_nombre.png", width = 10, height = 6, dpi = 300)
```

### Instalar Paquetes

```R
# En el notebook
install.packages("nombre_paquete")
library(nombre_paquete)
```

---

## 🔧 Configuración de VS Code

El archivo `.vscode/settings.json` está configurado para:

- **LaTeX**: Genera archivos de compilación en carpeta `build/`
- **Formateo automático** para LaTeX
- **Integración con Git**

No necesitas configurar nada manualmente, todo está listo para usar.

---

## 📚 Recursos Útiles

### Git y GitHub

- [Guía de Git en Español](https://git-scm.com/book/es/v2)
- [GitHub Docs](https://docs.github.com/es)
- [Visualizador de Git](https://git-school.github.io/visualizing-git/)

### LaTeX

- [Overleaf Documentation](https://www.overleaf.com/learn)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [APA Style Guide](https://apastyle.apa.org/)

### R

- [R for Data Science](https://r4ds.hadley.nz/)
- [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
- [ggplot2 Documentation](https://ggplot2.tidyverse.org/)

---

## 🆘 Solución de Problemas Comunes

### Problema: "Permission Denied" al hacer push

**Solución:**
```bash
# Configurar credenciales
git config --global credential.helper store
git push origin main
# Ingresa tu usuario y token de GitHub
```

### Problema: Conflictos de Merge

**Solución:**
1. Abre el archivo en conflicto en VS Code
2. Verás marcadores como `<<<<<<< HEAD`
3. Elige qué cambios mantener
4. Elimina los marcadores
5. Guarda, haz commit y push

### Problema: LaTeX no compila

**Solución:**
1. Verifica que todos los paquetes estén instalados
2. Revisa el archivo `.log` en la carpeta `build/`
3. Asegúrate de que las rutas de imágenes sean correctas
4. Ejecuta `biber` si usas bibliografía

### Problema: Kernel de R no aparece en Jupyter

**Solución:**
```R
# En una terminal de R
install.packages('IRkernel')
IRkernel::installspec(user = TRUE)
```

---

## 📞 Contacto y Coordinación

Para dudas o coordinación del trabajo:
- **Grupo de WhatsApp/Telegram**: [Enlace al grupo]
- **Issues en GitHub**: Para reportar problemas técnicos
- **Reuniones**: [Definir horario de reuniones semanales]

---

## 📅 Cronograma de Entregas

| Autónomo | Fecha Entrega | Estado | Responsable Principal |
|----------|---------------|--------|----------------------|
| 1        | [Fecha]       | ✅ Completado | Equipo |
| 2        | [Fecha]       | 🔄 En progreso | [Nombre] |
| 3        | [Fecha]       | ⏳ Pendiente | [Nombre] |
| 4        | [Fecha]       | ⏳ Pendiente | [Nombre] |
| 5        | [Fecha]       | ⏳ Pendiente | [Nombre] |
| 6        | [Fecha]       | ⏳ Pendiente | [Nombre] |

---

## 📄 Licencia

Este proyecto es para fines académicos de la Universidad Nacional de Chimborazo.

---

**¡Éxito en los trabajos! 🚀**
