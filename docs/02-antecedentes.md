# 🔬 Antecedentes y Estado del Arte

---

## La Transición hacia el Paradigma Agéntico en Ingeniería de Software

Las metodologías de desarrollo tradicionales han dependido históricamente de la sincronización y el consenso humano. Frameworks como Scrum gestionan la latencia comunicacional mediante ciclos de dos a cuatro semanas, mientras que XP asegura la calidad del código fuente a través de la integración continua y el *Pair Programming*.

Sin embargo, la integración de modelos fundacionales entrenados en código fuente ha alterado la dinámica de producción en tres ejes críticos:

---

### 1. El Fenómeno del *Vibe Coding*

La delegación desestructurada de tareas a agentes conversacionales genera prototipos funcionales rápidos, pero adolece de:

- Falta de contratos formales
- Nula verificabilidad
- Fragilidad ante casos de borde

```mermaid
graph LR
    A[Historia de Usuario] -->|"Delegación sin estructura"| B[Agente IA]
    B -->|"Código sin contrato"| C[Prototipo Frágil]
    C -->|"Falla en producción"| D[Deuda Técnica Acelerada]

    style D fill:#fee2e2,stroke:#ef4444
```

---

### 2. El Problema de la Deriva Arquitectónica (*Architectural Drift*)

Al no operar bajo restricciones deterministas, los LLMs tienden a:

- **Mutar contratos existentes** para resolver fallos locales de compilación
- **Reescribir esquemas de base de datos** sin autorización
- **Asumir dependencias inexistentes** para satisfacer el test inmediato

```mermaid
sequenceDiagram
    participant H as 🧑 Humano
    participant IA as 🤖 IA (sin restricciones)
    participant DB as 🗄️ Base de Datos

    H->>IA: "Corrige el error de compilación"
    IA->>DB: Altera esquema DDL sin consultar
    IA->>H: "Listo, el test pasa"
    H->>DB: ¡Esquema comprometido!
    Note over DB: Deriva Arquitectónica 🚨
```

---

### 3. Costos y Cuellos de Botella de Inferencia

El uso irrestricto de APIs comerciales en la nube genera inviabilidad financiera en ciclos iterativos de compilación, mientras que la inferencia local sin control de contexto colapsa la memoria física (*KV Cache overflow*) de las estaciones de trabajo de los desarrolladores.

```mermaid
xychart-beta
    title "Costo acumulado de tokens (compilación iterativa sin H-AXP)"
    x-axis ["Sprint 1", "Sprint 2", "Sprint 3", "Sprint 4", "Sprint 5"]
    y-axis "Tokens consumidos (miles)" 0 --> 500
    line [20, 80, 180, 320, 490]
```

---

## Respuesta de H-AXP a la Brecha Epistemológica

H-AXP responde a esta brecha combinando:

| Origen | Contribución |
|---|---|
| **Extreme Programming (XP)** | Disciplina técnica clásica: TDD, Pair Programming, Diseño Simple, Integración Continua |
| **Scrum** | Marco de gestión: Sprints, Product Owner, Backlog, Ceremonias |
| **Topología moderna de IA** | Inferencia híbrida: modelos de frontera en nube + modelos locales especializados |

```mermaid
venn
    title Fundamentos de H-AXP
    A["Extreme Programming\n(Rigor técnico)"]
    B["Scrum\n(Gestión ágil)"]
    C["IA Agéntica\n(Inferencia híbrida)"]
    AB["H-AXP\n(Síntesis)"]
```

> ⚠️ *Nota:* El diagrama Venn es ilustrativo. Mermaid no soporta diagramas Venn nativamente; se puede reemplazar con un diagrama de flujo equivalente.

---

← [Anterior: Introducción](01-introduccion.md) | [Siguiente: Marco de Evaluación →](03-marco-evaluacion.md)
