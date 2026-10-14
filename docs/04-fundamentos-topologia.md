# 🏗️ Fundamentos y Topología de H-AXP

---

## Redefinición del Equipo de Desarrollo

El marco H-AXP redefine la asignación de recursos al tratar a los Modelos de Lenguaje Grande (LLMs) y entornos basados en agentes como Claude Code o Cursor **no como meras herramientas de autocompletado, sino como actores de primera clase dentro del equipo SCRUM**.

Para evitar la regresión técnica asociada al *Vibe Coding*, H-AXP impone restricciones de diseño simple y Test-Driven Development (TDD) propias de Extreme Programming.

---

## Los Cuatro Axiomas del Framework H-AXP

Toda iteración bajo esta metodología se rige en cuatro principios inmutables diseñados para proteger la integridad del sistema y optimizar el consumo de recursos computacionales, memoria y tokens.

```mermaid
graph TD
    subgraph AXIOMAS["Axiomas H-AXP"]
        A1["1️⃣ Soberanía Humana\nHuman-in-the-Loop\nIA propone · Humano autoriza"]
        A2["2️⃣ CONTRACT-FIRST\nNingún código sin contrato previo\nFail-First TDD obligatorio"]
        A3["3️⃣ Zero-Token Iteration\nCompilación/test solo en local\nNube reservada para arquitectura"]
        A4["4️⃣ Diseño Simple\nRefactorización algorítmica forzada\nEliminar duplicidad y verbosidad"]
    end

    style A1 fill:#dbeafe,stroke:#3b82f6
    style A2 fill:#fef9c3,stroke:#ca8a04
    style A3 fill:#dcfce7,stroke:#22c55e
    style A4 fill:#fce7f3,stroke:#ec4899
```

### Axioma 1: Soberanía Humana y Arbitraje (Human-in-the-Loop / HITL)

La IA propone, estructura y codifica; el humano **orquesta, valida los criterios de aceptación y autoriza la integración al tronco principal**. El humano asume el rol de revisor crítico, no de tipógrafo.

### Axioma 2: Desacoplamiento CONTRACT-FIRST

Ningún agente de implementación debe escribir lógica de negocio ejecutable sin un contrato previo. Todo desarrollo inicia con:
1. Definición estricta de **esquemas de base de datos** (DDL)
2. **Firmas de interfaces** inmutables y esqueletos compilables (*Canonical Stubs*)
3. **Suite de pruebas unitarias** que inicialmente falla por aserción empírica (Fail-First)

### Axioma 3: Zero-Token Iteration

El ciclo de ensayo y error (sintaxis, compilación, ejecución de tests) se delega **exclusivamente** a modelos de inferencia local diseñados para operar con costo marginal cero. Los modelos fundacionales en la nube se reservan para planificación arquitectónica y auditoría de seguridad.

### Axioma 4: Diseño Simple Restringido

El código generado por IA tiende a la verbosidad y a la sobreingeniería especulativa. H-AXP impone la refactorización algorítmica forzada para:
- Eliminar la duplicidad (DRY) y violaciones de responsabilidad única (SRP)
- Reducir el uso de memoria y tiempo de ejecución (optimización Big O)
- Maximizar la legibilidad mitigando la complejidad ciclomática ($\mathcal{M} \le 10$) y cognitiva ($\mathcal{C}_{cog} \le 12$)

---

## Topología del Equipo: Los Nodos Simbióticos

La interacción no es conversacional, sino basada en el **intercambio de artefactos estructurados** (código, pruebas, esquemas). Cada nodo es un binomio Humano + IA que extiende el principio de *Pair Programming* de XP a todas las capas del ciclo de vida del software.

```mermaid
graph TB
    subgraph NODO_PRODUCTO["🎯 NODO DE PRODUCTO Y GOBERNANZA"]
        PO["Product Owner / Scrum Manager\n• Liderazgo estratégico\n• Gestión del presupuesto de tokens\n• Control de hitos de entrega"]
        CLI["Cliente\n• Define las reglas de negocio\n• Redacta Historias de Usuario con el PO"]
        IA_PO["IA Asistente\n• Mapea dependencias\n• Estima complejidad de User Stories\n• Detecta ambigüedades"]
    end

    subgraph NODO_ARQ["🏛️ NODO ARQUITECTÓNICO (Capa Nube)"]
        TL["Tech Lead + Arquitecto de Dominio\n• Traduce User Stories a contratos técnicos\n• Define esquemas DDL\n• Establece firmas de interfaces y stubs"]
        IA_NUBE["IA Frontera (High-Reasoning)\n• Modela UML, esquemas SQL, suites TDD (Pública y Sombra)\n• NO genera código ejecutable"]
    end

    subgraph NODO_DEV["⚙️ NODO DE DESARROLLO (Capa Local)"]
        DEV["Developer\n• Navega la estrategia algorítmica\n• Revisa lógica crítica\n• Itera ciclo Red-Green en local"]
        IA_LOCAL["Agente Local (Sintaxis)\n• Cursor / Copilot / Claude Code / Antigravity / Ollama\n• Diseñado para operar a costo cero\n• Autocompleta y corrige stack traces"]
    end

    subgraph NODO_QA["🔍 NODO DE CALIDAD (Capa Auditoría Local)"]
        QA["Revisor de Código / QA\n• Elabora pruebas funcionales\n• Analiza Pull Requests\n• Árbitro de refactorizaciones"]
        IA_RAZON["Agente Razonador (CoT)\n• Evalúa Big O (temporal/espacial)\n• Evalúa M <= 10 y C_cog <= 12\n• Genera bloques SEARCH/REPLACE"]
    end

    NODO_PRODUCTO -->|"User Stories + Criterios de Aceptación"| NODO_ARQ
    NODO_ARQ -->|"Contratos técnicos + Suite TDD Roja"| NODO_DEV
    NODO_DEV -->|"Código Verde funcional"| NODO_QA
    NODO_QA -->|"Merge autorizado al main"| MAIN["🌿 Main Branch"]

    style NODO_PRODUCTO fill:#fef9c3,stroke:#ca8a04
    style NODO_ARQ fill:#dbeafe,stroke:#3b82f6
    style NODO_DEV fill:#dcfce7,stroke:#22c55e
    style NODO_QA fill:#fce7f3,stroke:#ec4899
```

---

## Especificaciones de Herramientas por Nodo

### Arquitectura Agnóstica de Herramientas (Tooling Taxonomy)

```
[1] NODO ARQUITECTÓNICO (Capa Estratégica / Nube)
┌─────────────────────────────────────────────────────────────────┐
│ Entorno:  Workspace colaborativo con soporte de artefactos      │
│ Interfaz: Plataforma conversacional estructurada o API de Nube  │
│ Motor:    Modelo Fundacional de Frontera (High-Reasoning)       │
│ Enfoque:  Diseño de dominio, esquemas DDL, contratos API y TDD  │
└─────────────────────────────────────────────────────────────────┘
              ↓ (Artefactos: Contratos técnicos, interfaces, tests en ROJO)

[2] NODO DE DESARROLLO (Capa de Ejecución / Local)
┌─────────────────────────────────────────────────────────────────┐
│ Entorno:  IDE / Editor con extensiones de IA                    │
│ Interfaz: Autocompletado contextual y chat de ventana corta     │
│ Motor:    Modelo de inferencia local especializado en código     │
│           (diseñado para operar con latencia de milisegundos)   │
│ Enfoque:  Pair Programming simbiótico, ciclo Red-Green          │
└─────────────────────────────────────────────────────────────────┘
              ↓ (Artefactos: Código fuente ejecutable en VERDE)

[3] NODO DE CALIDAD (Capa de Auditoría / Asíncrona Local)
┌─────────────────────────────────────────────────────────────────┐
│ Entorno:  CLI, Git Hooks o CI local                             │
│ Interfaz: Agente de terminal asíncrono o script de análisis     │
│ Motor:    Modelo de razonamiento local con CoT                  │
│ Enfoque:  Auditoría algorítmica, evaluación Big O, diffs AST    │
└─────────────────────────────────────────────────────────────────┘
```

---

## Regla de Autoridad del Cliente y el Programador

1. **El cliente dicta el "Qué":** Ningún agente de IA está autorizado a inventar flujos de negocio, suponer características no solicitadas o alterar las prioridades. El LLM tiene estrictamente prohibido alterar la historia de usuario original.

2. **El equipo de desarrollo dicta el "Cómo":** El cliente y el PO no imponen cómo se estructura el código, cómo se normaliza la base de datos o qué algoritmos de ordenamiento usar. Esa responsabilidad recae enteramente en el Arquitecto de Dominio y el Auditor.

---

## Figura 1: Matriz de Trazabilidad: SCRUM/XP Clásico hacia H-AXP

Para facilitar su adopción en equipos tradicionales y establecer equivalencias formales para evaluación empírica, la siguiente matriz mapea los roles y artefactos clásicos hacia su equivalencia híbrida simbiótica:

| Dimensión Operativa | Scrum / XP Clásico (100% Humano) | Ecosistema Simbiótico H-AXP (Humano + IA) | Mecanismo de Control y Restricción Formal |
| :--- | :--- | :--- | :--- |
| **Gobernanza y Producto** | **Product Owner & Scrum Master:** Redactan historias en lenguaje natural abierto, priorizan el backlog y facilitan reuniones de seguimiento. | **Nodo de Producto y Gobernanza:** El PO/Scrum Manager lidera la visión, audita el presupuesto de tokens ($TCF$) y utiliza IA para detectar ambigüedades antes del Sprint. | Especificación `<UserStory>` en formato BDD con criterios de aceptación estrictamente booleanos (prohibición de adjetivos subjetivos). |
| **Arquitectura y Contratos** | **Tech Lead / Arquitecto:** Diseña diagramas UML y estructuras en sesiones de pizarra; alto riesgo de desviación durante la programación. | **Nodo Arquitectónico (Nube):** Binomio Tech Lead + Modelo Fundacional de Frontera. Co-diseñan el dominio sin emitir una sola línea de lógica de negocio ejecutable. | Generación determinista de `<DataModel>`, `<Interfaces_And_Stubs>` y `<TDD_Suite>` (Pública y Sombra) en estado Rojo verificado. |
| **Codificación (Pair Programming)** | **Conductor y Navegante Humanos:** Dos desarrolladores frente a un mismo IDE; velocidad limitada por el tipeo humano y fatiga en código repetitivo. | **Nodo Táctico de Desarrollo (Local):** Humano (Navegante estratégico) + Agente Local especializado en código (Conductor de fuerza bruta) bajo filosofía *Zero-Token*. | Aislamiento total del lenguaje natural; iteración por inyección cruda de `<Stack_Trace>` y bloqueo *pre-commit* de contratos ($CMR = 0\%$). |
| **Calidad y Refactorización** | **QA / Code Reviewer:** Revisión manual de *Pull Requests*; la refactorización algorítmica suele postergarse por presión de entrega. | **Nodo de Calidad (Auditoría Local Asíncrona):** Revisor Humano (Árbitro final) + Modelo Local de Razonamiento (`<think>` / CoT) enfocado en diseño simple de XP. | Limpieza de historial (*State Wiping*), cálculo explícito de Big $\mathcal{O}$, complejidad $\mathcal{M} \le 10$, $\mathcal{C}_{cog} \le 12$ y parches inmutables al comportamiento. |
| **Cadencia y Retrospectiva** | **Sprint (2 a 4 semanas) y Retrospectiva:** Ajustes enfocados en dinámicas interpersonales y velocidad estimada en puntos de historia. | **Micro-Sprint (3 a 7 días) y Retrospectiva Paramétrica:** Ciclos comprimidos orientados a componentes atómicos aislables y calibración del entorno híbrido. | Ajuste de *System Prompts*, calibración de límites de *KV Cache*, poda de contexto y auditoría de métricas empíricas ($LTPR$, $DD$, $HATR$). |

---

← [Anterior: Marco de Evaluación](03-marco-evaluacion.md) | [Siguiente: Ciclo de Vida →](05-ciclo-de-vida.md)
