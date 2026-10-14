# ⚙️ Diagrama: Estados del Micro-Sprint H-AXP

> Máquina de estados completa del ciclo de vida de un Micro-Sprint.

---

## Máquina de Estados del Micro-Sprint (v2.0)

```mermaid
stateDiagram-v2
    [*] --> Planificacion_Nube

    state "1. Capa Estratégica (Nube - Nodo Arquitectónico)" as Planificacion_Nube {
        Backlog_Priorizado --> Modelado_Conjunto : Tech Lead + Modelo Frontera
        Modelado_Conjunto --> Sintesis_Contratos : Genera DDL + Interfaces + Stubs + TDD
    }

    Sintesis_Contratos --> Validacion_Fase_Roja : Descarga de Artefactos Inmutables (Commit 0)

    state "2. Capa de Ejecución (Local - Nodo Táctico Zero-Token)" as Pair_Programming_Local {
        Validacion_Fase_Roja --> Rechazo_Tautologia : ¿Test pasa en Verde con el Stub?
        Rechazo_Tautologia --> Modelado_Conjunto : Rechazar Contrato (Falso Positivo)
        
        Validacion_Fase_Roja --> Bucle_Tactico : Falla confirmada (Estado Rojo Empírico)
        Bucle_Tactico --> Evaluacion_Compilador : Agente Local escribe implementación
        Evaluacion_Compilador --> Inyeccion_StackTrace : Falla Test (Intento < 3)
        Inyeccion_StackTrace --> Purgado_Markoviano : Intento == 2 (Limpiar Historial KV)
        Purgado_Markoviano --> Bucle_Tactico : Reintentar en frío
        Inyeccion_StackTrace --> Bucle_Tactico : Inyección cruda de stderr
        
        Evaluacion_Compilador --> Escalado_Contrato : Falla Test (Intento == 3 - Blind Loop)
        Escalado_Contrato --> Modelado_Conjunto : Emitir <Contract_Fault_Ticket>
        
        Evaluacion_Compilador --> Suite_Sombra : Public TDD 100% Verde
    }

    Suite_Sombra --> Bucle_Tactico : Falla Shadow Suite (Anti-Overfitting)
    Suite_Sombra --> Auditoria_Calidad : Pasa Shadow Suite + CMR == 0%

    state "3. Capa de Auditoría (Local Asíncrona - Nodo de Calidad)" as Auditoria_Calidad {
        Auditoria_Profunda : State Wiping + Análisis CoT (Big O, McCabe <= 10, C_cog <= 12)
        Auditoria_Profunda --> Arbitraje_Humano : Emite bloques SEARCH/REPLACE
        Arbitraje_Humano --> Verificacion_Regresion : Humano acepta Refactor
        Arbitraje_Humano --> Merge_Autorizado : Humano rechaza (Evita sobreingeniería)
        Verificacion_Regresion --> Auditoria_Profunda : Parche rompe Tests (Revertir)
        Verificacion_Regresion --> Merge_Autorizado : Tests 100% Verdes
    }

    Merge_Autorizado --> Main_Branch : Aprobación final PO / Tech Lead
    Main_Branch --> [*]
```

---

## Diagrama de Flujo del Sprint Planning

```mermaid
sequenceDiagram
    participant PO as 🎯 Product Owner
    participant SM as 📋 Scrum Manager
    participant TL as 🏛️ Tech Lead
    participant IA_F as 🤖 IA Frontera

    PO->>SM: Presenta User Stories priorizadas (Nivel 1 o Nivel 2 Isomórfico)
    SM->>TL: Facilita sesión de planificación y presupuesto TCF
    TL->>IA_F: <UserStory>\n<Constraints>\n<DomainSchema>
    
    IA_F-->>TL: DDL Schema + Interfaces & Canonical Stubs + Public TDD + Shadow Suite
    
    TL->>TL: ✅ Validación humana de contratos y stubs
    Note over TL: Verifica: sin datos reales, stubs compilables,\ntests que fallen por aserción empírica
    
    TL->>TL: 🚀 Commit 0 en main con candado SHA-256
```

---

## Estados de los Tests a lo Largo del Ciclo

```mermaid
graph LR
    subgraph ROJO["🔴 1. Estado ROJO (Empírico con Canonical Stub)"]
        R1["Compilación 100% limpia\ncon Stub Canónico"]
        R2["Falla exclusivamente por\nAssertionError o UnsupportedOp"]
        R1 --> R2
    end

    subgraph VERDE["🟢 2. Estado VERDE (Public + Shadow Sucess)"]
        V1["Implementación algorítmica general\nsin hardcoding de constantes"]
        V2["100% Public TDD Verde\n+ 100% Shadow Suite Verde"]
        V1 --> V2
    end

    subgraph AZUL["🔵 3. Estado REFACTOR (SEARCH/REPLACE AST)"]
        RF1["Bloques deterministas\nSEARCH / REPLACE"]
        RF2["Tests permanecen verdes\nMcCabe <= 10 · C_cog <= 12"]
        RF1 --> RF2
    end

    ROJO -->|"Agente Local\nimplementa"| VERDE
    VERDE -->|"Agente Razonador\naudita en frío"| AZUL

    style ROJO fill:#fee2e2,stroke:#ef4444
    style VERDE fill:#dcfce7,stroke:#22c55e
    style AZUL fill:#dbeafe,stroke:#3b82f6
```

---

## Ceremonias del Micro-Sprint (v2.0)

| Ceremonia | Frecuencia | Duración | Participantes | Resultado |
|---|---|---|---|---|
| **Sprint Planning** | Inicio de cada Micro-Sprint | 1–2 horas | PO + SM + Tech Lead + IA Frontera | DDL + Interfaces + Stubs + TDD Pública y Sombra (Commit 0) |
| **Bucle Táctico Continuo (CTL)** | Continuo en IDE | Variable (sesión dev) | Dev (Navegante) + Agente Local (Conductor) | Implementación Verde funcional ($TCF = 0$) |
| **Contract Sync Daily (CSD)** | Diario (multi-equipo) | $\le 10$ minutos | Binomios H-AXP paralelos | Sincronización de excepciones CEP entre contratos |
| **Tribunal de Calidad** | Al completar implementación | 20–30 minutos | QA + Agente Razonador + Tech Lead | Arbitraje humano ($HATR \le 25\%$) de parches SEARCH/REPLACE |
| **Review / Retrospectiva Paramétrica** | Fin de cada Micro-Sprint | 45 minutos | Todo el equipo | Calibración de System Prompts, KV Cache y métricas empíricas |

---

← [Volver a Documentación](../docs/) | [Volver al README](../README.md)
