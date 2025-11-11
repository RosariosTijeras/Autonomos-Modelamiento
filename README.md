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
Este proyecto es para fines académicos de la Universidad Nacional de Chimborazo.

---

**¡Éxito en los trabajos! 🚀**
