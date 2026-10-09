# 🗺️ Diagrama: Topología del Equipo H-AXP

> Los cuatro Nodos Simbióticos y sus relaciones operativas.

---

## Diagrama de Topología Completa

```mermaid
graph TB
    subgraph NODO_PROD["🎯 NODO DE PRODUCTO"]
        PO["Product Owner"]
        SM["Scrum Manager"]
        PO <-->|"Refinamiento\nde backlog"| SM
    end

    subgraph NODO_ARQ["🏛️ NODO ARQUITECTÓNICO"]
        TL["Tech Lead"]
        IA_F["🤖 IA Frontera\n(High-Reasoning Model)\nClaude / GPT-4 / Gemini"]
        TL <-->|"Co-diseño\nde dominio"| IA_F
    end

    subgraph NODO_DEV["⚙️ NODO DE DESARROLLO"]
        DEV["Developer\n(Navegante)"]
        IA_L["🤖 Agente Local\n(Syntax Solver)\nCursor / Copilot / Claude Code"]
        DEV <-->|"Pair Programming 2.0\nIDE compartido"| IA_L
    end

    subgraph NODO_QA["🔍 NODO DE CALIDAD"]
        QA["Revisor QA\n(Árbitro)"]
        IA_R["🤖 Agente Razonador\n(Chain of Thought)\nModelo CoT Local"]
        QA <-->|"Auditoría\nasíncrona"| IA_R
    end

    %% Flujo de artefactos
    PO -->|"User Stories\nformalizadas"| TL
    TL -->|"Suite TDD ROJA\n+ Contratos"| DEV
    DEV -->|"Código Verde\n(impl. mínima)"| QA
    QA -->|"Pull Request\naprobado"| TL
    TL -->|"Merge autorizado"| MAIN["🌿 Main Branch"]

    %% Capas
    NUBE["☁️ Capa Estratégica — Nube"]
    LOCAL["💻 Capa Táctica — Local"]

    style NODO_PROD fill:#f3e8ff,stroke:#9333ea
    style NODO_ARQ fill:#dbeafe,stroke:#3b82f6
    style NODO_DEV fill:#dcfce7,stroke:#22c55e
    style NODO_QA fill:#fef9c3,stroke:#ca8a04
    style MAIN fill:#f0fdf4,stroke:#16a34a
```

---

## Tabla de Responsabilidades por Nodo

| Nodo | Rol Humano | Rol IA | Artefacto de Entrada | Artefacto de Salida |
|---|---|---|---|---|
| **🎯 Producto** | Product Owner + Scrum Manager | — | Necesidad de negocio | User Story formalizada |
| **🏛️ Arquitectónico** | Tech Lead | IA Frontera (Nube) | User Story | Suite TDD ROJA + DDL + Interfaces |
| **⚙️ Desarrollo** | Developer (Navegante) | Agente Local (Táctico) | Suite TDD ROJA | Código Verde (implementación mínima) |
| **🔍 Calidad** | Revisor QA (Árbitro) | Agente Razonador (CoT) | Código Verde | Unified Diff + Pull Request aprobado |

---

## Binomios Humano-IA por Nodo

```mermaid
graph LR
    subgraph BINOMIO_ARQ["Binomio Arquitectónico"]
        TL2["🧑‍💻 Tech Lead\n(Piloto)"]
        IAF["🤖 IA Frontera\n(Copiloto)"]
        TL2 <-->|"Co-diseño\nde dominio"| IAF
    end

    subgraph BINOMIO_DEV["Binomio de Desarrollo"]
        DEV2["🧑‍💻 Developer\n(Navegante)"]
        IAL["🤖 Agente Local\n(Teclado)"]
        DEV2 <-->|"Pair\nProgramming 2.0"| IAL
    end

    subgraph BINOMIO_QA["Binomio de Calidad"]
        QA2["🔍 QA\n(Árbitro)"]
        IAR["🤖 Agente Razonador\n(Analista)"]
        QA2 <-->|"Auditoría\nasíncrona"| IAR
    end

    style BINOMIO_ARQ fill:#dbeafe,stroke:#3b82f6
    style BINOMIO_DEV fill:#dcfce7,stroke:#22c55e
    style BINOMIO_QA fill:#fef9c3,stroke:#ca8a04
```

---

## Principio de Soberanía Humana

En todos los Nodos Simbióticos, el humano mantiene la **decisión final** (Human-in-the-loop):

- **Tech Lead** → Valida y autoriza contratos antes de enviarlos al Nodo de Desarrollo
- **Developer** → Árbitro de la calidad del código generado; decide qué stack trace inyectar
- **QA** → Acepta o rechaza el Unified Diff de refactorización

> "La IA acelera; el humano decide."

---

← [Volver a Documentación](../docs/) | [Volver al README](../README.md)
