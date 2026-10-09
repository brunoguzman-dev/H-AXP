# 🔴🟢🔵 Diagrama: Ciclo Red-Green-Refactor H-AXP (Zero-Token)

---

## Flujo Completo del Ciclo TDD Zero-Token

```mermaid
flowchart TD
    INICIO(["🚀 INICIO\nMicro-Sprint"]) --> RED_FASE

    subgraph RED_FASE["🔴 FASE RED — Nodo Arquitectónico (Nube)"]
        R1["Tech Lead + IA Frontera\ngeneran Suite TDD\ncon funciones inexistentes"]
        R2["Developer ejecuta tests\nen hardware local"]
        R3{¿Test falla\ncorrectamente?}
        R4["⛔ BARRERA 1\nTest tautológico\ndevolver a Nodo Arq."]

        R1 --> R2 --> R3
        R3 -->|"Pasa en verde\nde inmediato"| R4
        R3 -->|"Falla semántica\no sintáctica ✅"| VERDE_FASE
    end

    subgraph VERDE_FASE["🟢 FASE VERDE — Nodo Táctico (Local)"]
        V1["Humano (Navegante)\ncede teclado al Agente"]
        V2["🤖 Agente Local genera\nimplementación mínima"]
        V3["Ejecutar tests\nen local (costo $0)"]
        V4{¿100% verde?}
        V5["Inyectar stack trace\ncrudo del compilador"]

        V1 --> V2 --> V3 --> V4
        V4 -->|"Fallan"| V5
        V5 --> V2
        V4 -->|"Pasan ✅"| REFACTOR_FASE
    end

    subgraph REFACTOR_FASE["🔵 FASE REFACTOR — Nodo de Calidad (Local Asíncrono)"]
        RF1["Agente Razonador (CoT)\ncalcula Big O + Complejidad Ciclomática"]
        RF2["Genera Unified Diff\nde refactorización"]
        RF3{"Humano árbitro\n¿Acepta?"}
        RF4["Aplicar diff +\nre-ejecutar suite TDD"]
        RF5{¿Tests siguen\nen verde?}
        RF6["⛔ BARRERA 2\nParche rompe tests\nDescartado → estado Green anterior"]

        RF1 --> RF2 --> RF3
        RF3 -->|"Rechaza (sobreingeniería)"| DONE
        RF3 -->|"Acepta"| RF4 --> RF5
        RF5 -->|"No"| RF6
        RF5 -->|"Sí ✅"| DONE
    end

    DONE(["✅ CÓDIGO LISTO\nDONE"]) --> MERGE["🌿 Merge Autorizado\nal Main Branch"]

    style RED_FASE fill:#fee2e2,stroke:#ef4444
    style VERDE_FASE fill:#dcfce7,stroke:#22c55e
    style REFACTOR_FASE fill:#dbeafe,stroke:#3b82f6
    style R4 fill:#fef9c3,stroke:#ca8a04
    style RF6 fill:#fef9c3,stroke:#ca8a04
```

---

## Las Dos Barreras de Calidad

```mermaid
graph LR
    subgraph B1["🛡️ Barrera 1: Anti-Tautología"]
        B1A["Riesgo: LLM genera\n`assert(true == true)`"]
        B1B["Solución: Humano ejecuta test\nantes de escribir implementación"]
        B1C["Criterio: Test DEBE fallar\ncon error semántico o sintáctico"]
        B1A --> B1B --> B1C
    end

    subgraph B2["🛡️ Barrera 2: Inmutabilidad del Comportamiento"]
        B2A["Riesgo: Refactorización\nrompe comportamiento existente"]
        B2B["Solución: Re-ejecutar suite TDD\ntras aplicar diff"]
        B2C["Criterio: Mismos tests en verde\nsin modificarlos"]
        B2A --> B2B --> B2C
    end

    style B1 fill:#fef9c3,stroke:#ca8a04
    style B2 fill:#fce7f3,stroke:#ec4899
```

---

## Ejemplo de Inyección Correcta de Stack Trace

```xml
<!-- ✅ Correcto: copypaste crudo del compilador -->
<Stack_Trace>
FAIL: test_user_registration_with_duplicate_email
  AssertionError: Expected UserAlreadyExistsException but got None
  at UserService.register (UserService.java:45)
  at UserServiceTest.java:23
</Stack_Trace>

<Target_Interface>
interface UserService {
    UserDTO register(RegisterDTO dto) throws UserAlreadyExistsException;
}
</Target_Interface>

<!-- ❌ Incorrecto: descripción en lenguaje natural (sesga la IA) -->
<!-- "Creo que el problema es que el método no lanza la excepción..." -->
```

---

← [Volver al README](../README.md)
