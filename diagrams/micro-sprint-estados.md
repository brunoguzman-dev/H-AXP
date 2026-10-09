# ⚙️ Diagrama: Estados del Micro-Sprint H-AXP

> Máquina de estados completa del ciclo de vida de un Micro-Sprint.

---

## Máquina de Estados del Micro-Sprint

```mermaid
stateDiagram-v2
    [*] --> BACKLOG_REFINEMENT : Sprint Planning

    state BACKLOG_REFINEMENT {
        [*] --> UserStory : PO presenta necesidad
        UserStory --> Contratos : Tech Lead + IA Frontera
        Contratos --> TDD_ROJA : Generación de suite
        TDD_ROJA --> [*] : Contratos validados
    }

    BACKLOG_REFINEMENT --> ZERO_TOKEN_ITERATION : Suite TDD en ROJO inyectada

    state ZERO_TOKEN_ITERATION {
        [*] --> RED : Test falla ✅
        RED --> GREEN : Agente Local implementa
        GREEN --> REFACTOR : 100% Tests en verde
        REFACTOR --> GREEN : Diff aprobado
        REFACTOR --> [*] : Código listo (DONE)
    }

    ZERO_TOKEN_ITERATION --> QUALITY_TRIBUNAL : Pull Request generado

    state QUALITY_TRIBUNAL {
        [*] --> Auditoria : QA + Agente Razonador
        Auditoria --> Aprobado : Tests ok + Big O ok
        Auditoria --> Rechazado : Drift o tautología
        Rechazado --> [*] : Devuelto a Nodo Arquitectónico
        Aprobado --> [*] : PR aprobado
    }

    QUALITY_TRIBUNAL --> MERGE : Tech Lead autoriza
    MERGE --> REVIEW_RETRO : Merge a main branch
    REVIEW_RETRO --> [*] : Micro-Sprint completado
```

---

## Diagrama de Flujo del Sprint Planning

```mermaid
sequenceDiagram
    participant PO as 🎯 Product Owner
    participant SM as 📋 Scrum Manager
    participant TL as 🏛️ Tech Lead
    participant IA_F as 🤖 IA Frontera

    PO->>SM: Presenta User Stories priorizadas
    SM->>TL: Facilita sesión de planificación
    TL->>IA_F: <UserStory>\n<TechConstraints>\n<DomainSchema>
    
    IA_F-->>TL: DDL Schema\n+ Interface Signatures\n+ TDD Suite (RED)
    
    TL->>TL: ✅ Validación humana de contratos
    Note over TL: Verifica: sin datos reales,\ninterfaces abstractas,\ntests que fallen correctamente
    
    TL->>TL: 🚀 Micro-Sprint iniciado
```

---

## Estados de los Tests a lo Largo del Ciclo

```mermaid
graph LR
    subgraph ROJO["🔴 Estado ROJO (Obligatorio al inicio)"]
        R1["Test generado\npor IA Frontera"]
        R2["Falla con error\nsemántico o sintáctico"]
        R1 --> R2
    end

    subgraph VERDE["🟢 Estado VERDE (Meta del Nodo Dev)"]
        V1["Implementación mínima\ngenerada por Agente Local"]
        V2["100% tests\nen verde"]
        V1 --> V2
    end

    subgraph AZUL["🔵 Estado REFACTOR (Mejora sin romper)"]
        RF1["Unified Diff\nde refactorización"]
        RF2["Tests siguen\nen verde ✅"]
        RF1 --> RF2
    end

    ROJO -->|"Agente Local\nimplementa"| VERDE
    VERDE -->|"Agente Razonador\naudita"| AZUL

    style ROJO fill:#fee2e2,stroke:#ef4444
    style VERDE fill:#dcfce7,stroke:#22c55e
    style AZUL fill:#dbeafe,stroke:#3b82f6
```

---

## Ceremonias del Micro-Sprint

| Ceremonia | Frecuencia | Duración | Participantes | Resultado |
|---|---|---|---|---|
| **Sprint Planning** | Inicio de cada Micro-Sprint | 1–2 horas | PO + SM + Tech Lead + IA Frontera | Suite TDD ROJA + Contratos |
| **Daily Stand-up** | Diario | 15 minutos | Todo el equipo | Sincronización de bloqueos |
| **Tribunal de Calidad** | Al completar implementación | 30–45 minutos | QA + Agente Razonador + Tech Lead | Decisión de merge |
| **Review / Retrospectiva** | Fin de cada Micro-Sprint | 1 hora | Todo el equipo | Ajuste de proceso |

---

← [Volver a Documentación](../docs/) | [Volver al README](../README.md)
