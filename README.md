# 🤖 Hybrid-Agentics eXtreme Programming (H-AXP)

> **Autor:** Bruno Guzmán · Asunción, Paraguay · 08/10/2026  
> **Categoría:** Metodología Ágil · Inteligencia Artificial · Ingeniería de Software

[![Licencia: MIT](https://img.shields.io/badge/Licencia-MIT-blue.svg)](LICENSE)
[![Metodología: H-AXP](https://img.shields.io/badge/Metodolog%C3%ADa-H--AXP-purple.svg)](#)
[![Estado: Activo](https://img.shields.io/badge/Estado-Activo-green.svg)](#)

---

## ¿Qué es H-AXP?

**H-AXP** es un marco de desarrollo de software híbrido y simbiótico que sintetiza la gobernanza macroscópica de **Scrum** con el rigor microscópico de **Extreme Programming (XP)**, estructurando el trabajo en torno a "Equipos H-AXP": binomios **Humano + Agente de IA** que operan como unidades de producción cohesionadas.

La metodología responde a tres problemas críticos del desarrollo asistido por IA no estructurado:

| Problema | Descripción |
|---|---|
| 🌀 **Vibe Coding** | Delegación desestructurada que produce prototipos frágiles sin contratos formales |
| 🏚️ **Deriva Arquitectónica** | Los LLMs mutan contratos e interfaces para resolver fallos locales de compilación |
| 💸 **Costo de Inferencia** | El uso irrestricto de APIs comerciales en el bucle de compilación genera costos inviables |

---

## Arquitectura de Dos Capas

```mermaid
graph TB
    subgraph NUBE["☁️ CAPA ESTRATÉGICA (Nube)"]
        A[Nodo Arquitectónico<br/>Tech Lead + IA Frontera]
        B[Contratos Inmutables<br/>DDL · Interfaces · Suite TDD]
    end

    subgraph LOCAL["💻 CAPA TÁCTICA (Local)"]
        C[Nodo de Desarrollo<br/>Developer + Agente Local]
        D[Nodo de Calidad<br/>QA + Agente Razonador]
    end

    A -->|"Artefactos: esquemas, firmas, tests en ROJO"| C
    C -->|"Código fuente ejecutable en VERDE"| D
    D -->|"Merge autorizado al main"| E[🌿 Main Branch]

    style NUBE fill:#dbeafe,stroke:#3b82f6,color:#1e3a5f
    style LOCAL fill:#dcfce7,stroke:#22c55e,color:#14532d
```

---

## Los Cuatro Axiomas

```mermaid
mindmap
  root((H-AXP))
    Soberanía Humana
      IA propone y codifica
      Humano orquesta y valida
      Humano autoriza el merge
    CONTRACT-FIRST
      Todo desarrollo inicia con un contrato
      Esquemas DDL antes de lógica
      Firmas de interfaces inmutables
    Zero-Token Iteration
      Compilar/fallar en local
      Sin consumo de API comercial
      Iteración de fuerza bruta gratuita
    Diseño Simple
      Refactorización forzada post-verde
      Eliminar duplicidad algorítmica
      Complejidad ciclomática ≤ 10
```

---

## Topología del Equipo (Nodos Simbióticos)

```mermaid
graph LR
    subgraph PRODUCTO["🎯 Nodo de Producto"]
        PO[Product Owner<br/>Scrum Manager]
        CLI[Cliente]
    end

    subgraph ARQUITECTURA["🏛️ Nodo Arquitectónico"]
        TL[Tech Lead]
        IA_NUBE[IA Frontera<br/>Claude / GPT-4]
    end

    subgraph DESARROLLO["⚙️ Nodo de Desarrollo"]
        DEV[Developer]
        IA_LOCAL[Agente Local<br/>Cursor / Copilot]
    end

    subgraph CALIDAD["🔍 Nodo de Calidad"]
        QA[Revisor / QA]
        IA_RAZON[Agente Razonador<br/>CoT Local]
    end

    PRODUCTO -->|"User Stories + Criterios"| ARQUITECTURA
    ARQUITECTURA -->|"Contratos + Suite TDD Roja"| DESARROLLO
    DESARROLLO -->|"Código Verde"| CALIDAD
    CALIDAD -->|"Aprobación / Merge"| PRODUCTO

    style PRODUCTO fill:#fef9c3,stroke:#ca8a04
    style ARQUITECTURA fill:#dbeafe,stroke:#3b82f6
    style DESARROLLO fill:#dcfce7,stroke:#22c55e
    style CALIDAD fill:#fce7f3,stroke:#ec4899
```

---

## Ciclo de Vida: El Micro-Sprint

El Micro-Sprint reemplaza el sprint tradicional de 2–4 semanas por **iteraciones de 3 a 7 días**, enfocadas en un único componente funcional aislable.

```mermaid
stateDiagram-v2
    [*] --> Planificacion_Nube
    
    state Planificacion_Nube {
        [*] --> Backlog_Priorizado
        Backlog_Priorizado --> Modelado_Conjunto : Tech Lead + IA debaten arquitectura
        Modelado_Conjunto --> [*]
    }
    
    Planificacion_Nube --> Pair_Programming : IA genera interfaces y tests (ROJO)
    
    state Pair_Programming {
        [*] --> Suite_TDD_Roja
        Suite_TDD_Roja --> Desarrollo_Iterativo : Dev + IA local comparten IDE
        Desarrollo_Iterativo --> Fix_Errores : IA corrige stack trace
        Fix_Errores --> Desarrollo_Iterativo : Falla
        Desarrollo_Iterativo --> [*] : Tests 100% verde
    }
    
    Pair_Programming --> Tribunal_Calidad : Código funcional alcanzado
    
    state Tribunal_Calidad {
        [*] --> Pruebas_Verdes
        Pruebas_Verdes --> Auditoria_Profunda : QA + IA analizan Big O
        Auditoria_Profunda --> Arbitraje_Refactor : Humano acepta/rechaza refactor
        Arbitraje_Refactor --> [*]
    }
    
    Tribunal_Calidad --> Main_Branch : Merge autorizado (PO)
    Main_Branch --> [*]
```

---

## Métricas de Rendimiento

| Métrica | Sigla | Umbral H-AXP |
|---|---|---|
| Densidad de Defectos | DD | ≤ 0.5 defectos / KLOC |
| Tasa de Mutación de Contratos | CMR | **0%** (bloqueo absoluto) |
| Ratio de Tests Locales | LTPR | ≥ 85% en runtime local |
| Costo de Tokens por Feature | TCF | < 4.500 tokens totales |
| Complejidad Ciclomática | M | M ≤ 10 por método |

---

## Hipótesis

> **H₀ (Nula):** La aplicación del ciclo H-AXP *no* genera variaciones estadísticamente significativas en la tasa de defectos, la estabilidad de contratos y el costo por funcionalidad en comparación con el desarrollo ágil tradicional asistido por chat no estructurado.

> **H₁ (Alternativa):** La segregación de responsabilidades en Nodos Simbióticos H-AXP, junto con el ciclo TDD Zero-Token y el micro-contexting, reduce la deuda técnica, elimina la mutación no autorizada de interfaces y reduce el costo de inferencia **por encima del 70%**.

---

## Estructura del Repositorio

```
h-axp/
├── README.md                          ← Este archivo
├── docs/
│   ├── 01-introduccion.md             ← Contexto y motivación
│   ├── 02-antecedentes.md             ← Estado del arte
│   ├── 03-marco-evaluacion.md         ← Framework de evaluación empírica
│   ├── 04-fundamentos-topologia.md    ← Axiomas y estructura del equipo
│   ├── 05-ciclo-de-vida.md            ← Micro-Sprints y ceremonias
│   ├── 06-practicas-tdd-zero-token.md ← TDD, Red-Green-Refactor
│   ├── 07-gobernanza-contexto.md      ← System Prompts y Micro-Contexting
│   ├── 08-matriz-riesgos.md           ← Riesgos y protocolos de fallback
│   ├── 09-etica-propiedad-intelectual.md ← Consideraciones éticas
│   └── 10-conclusiones.md             ← Conclusiones y trabajo futuro
├── diagrams/
│   ├── arquitectura-dos-capas.md      ← Diagrama de capas Nube/Local
│   ├── topologia-equipo.md            ← Mapa de roles y nodos
│   ├── micro-sprint-estados.md        ← Máquina de estados del Micro-Sprint
│   ├── red-green-refactor.md          ← Flujo TDD Zero-Token
│   └── protocolo-oom.md               ← Protocolo de contingencia de hardware
├── prompts/
│   ├── nodo-arquitectonico.md         ← System Prompt: Domain Architect
│   ├── nodo-tactico.md                ← System Prompt: Tactical Execution Agent
│   └── nodo-calidad.md                ← System Prompt: Logical Auditor Agent
└── templates/
    ├── user-story-template.md         ← Plantilla de Historia de Usuario
    ├── micro-sprint-checklist.md      ← Checklist de Definition of Done
    └── injection-variables-canvas.md  ← Canvas de variables de inyección
```

---

## Palabras Clave

`Metodologías Ágiles` · `Extreme Programming` · `Scrum` · `Inteligencia Artificial Generativa` · `Test-Driven Development (TDD)` · `Sistemas Multi-Agente` · `Equipos Híbridos` · `Micro-Contexting` · `Zero-Token` · `LLMs`

---

## Licencia

Este trabajo es de elaboración propia de **Bruno Guzmán** (Asunción, Paraguay).  
Distribuido bajo licencia [MIT](LICENSE).
