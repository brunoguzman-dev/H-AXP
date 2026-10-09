# 🏛️ Diagrama: Arquitectura de Dos Capas H-AXP

> Representa la separación fundamental entre la Capa Estratégica (Nube) y la Capa Táctica (Local).

---

## Diagrama Principal

```mermaid
graph TB
    subgraph NUBE["☁️ CAPA ESTRATÉGICA — Nube"]
        direction TB
        PO["🎯 Product Owner / Scrum Manager"]
        TL["🧑‍💻 Tech Lead"]
        IA_F["🤖 IA Frontera\n(High-Reasoning Model)\nClaude / GPT-4 / Gemini"]
        
        PO -->|"User Stories + Criterios"| TL
        TL <-->|"Co-diseño de dominio"| IA_F
        
        TL --> ARTEFACTOS["📦 Artefactos Inmutables\n• DDL / Esquemas de BD\n• Firmas de Interfaces\n• Suite TDD en ROJO"]
    end

    subgraph LOCAL["💻 CAPA TÁCTICA — Local"]
        direction TB
        DEV["🧑‍💻 Developer"]
        IA_L["🤖 Agente Local\n(Syntax Solver)\nCursor / Copilot / Claude Code"]
        QA["🔍 Revisor QA"]
        IA_R["🤖 Agente Razonador\n(Chain of Thought)\nModelo CoT Local"]
        
        DEV <-->|"Pair Programming 2.0\nIDE compartido"| IA_L
        QA <-->|"Auditoría asíncrona"| IA_R
        
        DEV --> CODIGO["✅ Código Verde\n(implementación mínima)"]
        CODIGO --> QA
        QA --> DIFF["📋 Unified Diff\n(refactorización)"]
    end

    ARTEFACTOS -->|"Inyección de contratos\n(sin lógica ejecutable)"| DEV
    DIFF -->|"Merge autorizado\npor Tech Lead"| MAIN["🌿 Main Branch\n(Repositorio Principal)"]

    NUBE -.->|"Solo abstracciones\nNUNCA código propietario"| CLOUD_API["🌐 API Comercial"]
    LOCAL -.->|"Inferencia a costo cero\n(hardware propio)"| HW["🖥️ Hardware Local"]

    style NUBE fill:#dbeafe,stroke:#3b82f6,color:#1e3a5f
    style LOCAL fill:#dcfce7,stroke:#22c55e,color:#14532d
    style MAIN fill:#fef9c3,stroke:#ca8a04
    style CLOUD_API fill:#f3f4f6,stroke:#9ca3af,stroke-dasharray: 5 5
    style HW fill:#f3f4f6,stroke:#9ca3af,stroke-dasharray: 5 5
```

---

## Flujo de Artefactos

```mermaid
sequenceDiagram
    participant CLI as 👤 Cliente
    participant PO as 🎯 Product Owner
    participant TL as 🧑‍💻 Tech Lead
    participant IA_N as ☁️ IA Frontera (Nube)
    participant DEV as 🧑‍💻 Developer
    participant IA_L as 💻 Agente Local
    participant QA as 🔍 QA
    participant IA_R as 🤖 Agente Razonador

    CLI->>PO: Necesidad de negocio
    PO->>TL: User Story formalizada
    TL->>IA_N: <UserStory> + <Constraints>
    IA_N-->>TL: DDL + Interfaces + Suite TDD Roja
    TL->>TL: Validación humana de contratos
    TL->>DEV: Suite TDD (Estado ROJO)
    
    loop Ciclo Zero-Token (Local)
        DEV->>IA_L: <Test_Suite> + <Target_Interface>
        IA_L-->>DEV: Implementación mínima
        DEV->>DEV: Ejecutar tests en local
        alt Tests fallan
            DEV->>IA_L: <Stack_Trace> (copypaste crudo)
        else Tests en verde
            DEV->>QA: Código Verde
        end
    end

    QA->>IA_R: Código Verde para auditoría
    IA_R-->>QA: Análisis Big O + Unified Diff
    QA->>QA: Árbitro: acepta/rechaza refactor
    QA->>TL: Pull Request aprobado
    TL->>TL: Merge autorizado al main
```

---

## Principio de Separación de Información

| Información | ¿Sale a la Nube? | Justificación |
|---|---|---|
| `<UserStory>` abstracta | ✅ Sí | Solo describe el QUÉ, sin implementación |
| Esquema DDL sin datos | ✅ Sí | Estructura, no contenido sensible |
| Firmas de interfaces | ✅ Sí | Contratos abstractos, sin lógica |
| Lógica de negocio ejecutable | ❌ Nunca | Código propietario — permanece en local |
| Algoritmos internos | ❌ Nunca | Propiedad intelectual corporativa |
| Datos reales / PII | ❌ Nunca | Cumplimiento GDPR y privacidad |
| Stack traces de compilación | ❌ Nunca | Solo se inyectan al agente local |

---

← [Volver a Documentación](../docs/) | [Volver al README](../README.md)
