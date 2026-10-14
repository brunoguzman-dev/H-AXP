# 🔴🟢🔵 Diagrama: Ciclo Red-Green-Refactor H-AXP (Zero-Token)

---

## Flujo Completo del Ciclo TDD Zero-Token

```mermaid
flowchart TD
    INICIO(["🚀 INICIO\nMicro-Sprint"]) --> RED_FASE

    subgraph RED_FASE["🔴 1. FASE RED — Validación Empírica con Stub Canónico"]
        R1["Tech Lead + IA Frontera generan\nInterfaces + Canonical Stub + TDD Suites"]
        R2["Developer compila en local\n(100% libre de errores sintácticos)"]
        R3{¿Test falla por\nAssertion/Stub?}
        R4["⛔ BARRERA 1\nTest tautológico o pasa con stub\nDevolver a Nodo Arquitectónico"]
        R_SYN["⛔ BARRERA 1\nError sintáctico (falta stub)\nExigir compilación limpia"]

        R1 --> R2 --> R3
        R3 -->|"Pasa en verde\ncon stub"| R4
        R3 -->|"Falla de compilación"| R_SYN
        R3 -->|"Falla empírica válida ✅"| VERDE_FASE
    end

    subgraph VERDE_FASE["🟢 2. FASE VERDE — Nodo Táctico (Zero-Token & Anti-Overfitting)"]
        V1["Humano (Navegante) cede teclado\nProhibido hardcoding de constantes"]
        V2["🤖 Agente Local genera lógica general"]
        V3["Ejecutar Public TDD en local ($0)"]
        V4{¿Public TDD\n100% verde?}
        V5["Inyectar stack trace crudo (stderr)"]
        V_SHADOW{¿Shadow Suite\n100% verde?}
        V_OVER["⛔ Falla Shadow Suite\nReward Hacking detectado"]

        V1 --> V2 --> V3 --> V4
        V4 -->|"Fallan"| V5
        V5 --> V2
        V4 -->|"Pasan ✅"| V_SHADOW
        V_SHADOW -->|"Falla"| V_OVER --> V5
        V_SHADOW -->|"Pasa ✅"| REFACTOR_FASE
    end

    subgraph REFACTOR_FASE["🔵 3. FASE REFACTOR — Nodo de Calidad (SEARCH/REPLACE)"]
        RF1["State Wiping (en frío)\nCoT calcula Big O + McCabe M <= 10 + C_cog <= 12"]
        RF2["Genera bloques deterministas\nSEARCH / REPLACE"]
        RF3{"Humano árbitro\n(HATR <= 25%)"}
        RF4["Aplicar parche SEARCH/REPLACE\nRe-ejecutar Public + Shadow TDD"]
        RF5{¿Tests siguen\n100% verdes?}
        RF6["⛔ BARRERA 2\nParche rompe tests\nDescartar → revertir a Verde previo"]

        RF1 --> RF2 --> RF3
        RF3 -->|"Rechaza (sobreingeniería)"| DONE
        RF3 -->|"Acepta"| RF4 --> RF5
        RF5 -->|"No"| RF6
        RF5 -->|"Sí ✅"| DONE
    end

    DONE(["✅ CÓDIGO LISTO\nDONE"]) --> MERGE["🌿 Merge Autorizado\nal Main Branch (CMR == 0%)"]

    style RED_FASE fill:#fee2e2,stroke:#ef4444
    style VERDE_FASE fill:#dcfce7,stroke:#22c55e
    style REFACTOR_FASE fill:#dbeafe,stroke:#3b82f6
    style R4 fill:#fef9c3,stroke:#ca8a04
    style R_SYN fill:#fef9c3,stroke:#ca8a04
    style V_OVER fill:#fef9c3,stroke:#ca8a04
    style RF6 fill:#fef9c3,stroke:#ca8a04
```

---

## Las Dos Barreras de Calidad (v2.0)

```mermaid
graph LR
    subgraph B1["🛡️ Barrera 1: Anti-Tautología & Stub Canónico"]
        B1A["Riesgo: LLM genera tautología\n`assert(true == true)` o falla compilación"]
        B1B["Solución: Compilación 100% limpia\ncon Canonical Skeleton Stub"]
        B1C["Criterio: Falla estricta por\nAssertionError o NotImplemented"]
        B1A --> B1B --> B1C
    end

    subgraph B2["🛡️ Barrera 2: Inmutabilidad del Comportamiento"]
        B2A["Riesgo: Refactorización rompe\ncasos de borde o induce sobreingeniería"]
        B2B["Solución: Re-ejecutar Public TDD\ny Shadow Suite tras SEARCH/REPLACE"]
        B2C["Criterio: 100% tests en verde\nsin mutar interfaces ni firmas"]
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

<Target_Interface_And_Stub>
interface UserService {
    UserDTO register(RegisterDTO dto) throws UserAlreadyExistsException;
}

class UserServiceStub implements UserService {
    public UserDTO register(RegisterDTO dto) throws UserAlreadyExistsException {
        throw new UnsupportedOperationException("H-AXP Red State Stub");
    }
}
</Target_Interface_And_Stub>

<!-- ❌ Incorrecto: descripción en lenguaje natural (sesga la IA) -->
<!-- "Creo que el problema es que el método no lanza la excepción..." -->
```

---

← [Volver al README](../README.md)
