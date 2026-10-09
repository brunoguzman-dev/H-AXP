# 🧪 Prácticas de Ingeniería y TDD Zero-Token

---

## El Problema del Código Espagueti Acelerado

La adopción de inteligencia artificial en la ingeniería de software a menudo conduce al fenómeno del *código espagueti acelerado*: la capacidad de generar miles de líneas de código por minuto **sin una red de seguridad estructural**. Para contrarrestar esto, H-AXP eleva el **Test-Driven Development (TDD)** de una recomendación a un axioma inquebrantable.

En el paradigma H-AXP (Equipos Humano + IA), el ciclo *Red-Green-Refactor* de Kent Beck se transforma en un proceso de **TDD Zero-Token**, aislando el costo computacional de la iteración en el hardware local y garantizando que el diseño del sistema permanezca inmutable frente a las alucinaciones de la IA.

---

## Filosofía Zero-Token

El principio *Zero-Token* establece que la resolución de errores de compilación, sintaxis o lógica táctica **nunca debe consumir cuotas de APIs comerciales en la nube**.

> 💡 Enviar cada `stack trace` o `NullReferenceException` a un modelo de frontera en la nube (Capa Estratégica) genera un desperdicio masivo de recursos financieros y ancho de banda. H-AXP confina este bucle ruidoso a la **Capa de Ejecución (Local)**, permitiendo que el Agente Táctico itere a fuerza bruta, a costo cero y con latencia de milisegundos en el IDE del desarrollador.

```mermaid
graph LR
    subgraph MAL["❌ Anti-patrón (Sin H-AXP)"]
        A1[Compilación falla] -->|stack trace| B1[API Comercial Nube]
        B1 -->|respuesta| C1[Corrección]
        C1 -->|Nueva compilación falla| A1
        B1 -.->|$$$ tokens| COSTO["💸 Costo inviable"]
    end

    subgraph BIEN["✅ H-AXP Zero-Token"]
        A2[Compilación falla] -->|stack trace| B2[Agente Local]
        B2 -->|corrección| C2[Código en Verde]
        B2 -.->|costo cero| GRATIS["🆓 Iteración gratuita"]
    end
```

---

## Ejecución del Ciclo Red-Green-Refactor H-AXP

El flujo de trabajo dentro del IDE local exige una estricta disciplina secuencial. **Alterar este orden destruye la garantía de calidad del framework.**

```mermaid
flowchart TD
    INICIO([🚀 INICIO DE MICRO-SPRINT]) --> RED

    subgraph FASE_RED["🔴 FASE RED — Validación del Contrato"]
        RED["Ejecutar Suite TDD\n(generada por Nodo Arquitectónico)"]
        RED --> VERIF{¿Test falla\nsemántica o sintácticamente?}
        VERIF -->|Pasa en verde inmediatamente| RECHAZAR["⛔ RECHAZAR contrato\nDevolver a Capa Estratégica\n(Test tautológico detectado)"]
        VERIF -->|Falla correctamente| VERDE
    end

    subgraph FASE_VERDE["🟢 FASE VERDE — Fuerza Bruta Confinada"]
        VERDE["Humano cede teclado\nal Motor de Inferencia Local"]
        VERDE --> INYECTAR["Inyectar stack trace\ncrudo del compilador"]
        INYECTAR --> AGENTE["🤖 Agente Local genera\nimplementación mínima"]
        AGENTE --> PRUEBA{¿Tests pasan\nal 100%?}
        PRUEBA -->|No| INYECTAR
        PRUEBA -->|Sí| REFACTOR
    end

    subgraph FASE_REFACTOR["🔵 FASE REFACTOR — Auditoría Asíncrona"]
        REFACTOR["Código Verde enviado\nal Nodo de Calidad"]
        REFACTOR --> COT["Agente Razonador (CoT)\ncalcula Big O + Complejidad Ciclomática"]
        COT --> DIFF["Genera Unified Diff\nde refactorización"]
        DIFF --> ARBITRO{Humano\nárbitra}
        ARBITRO -->|Acepta| APLICAR["Aplicar diff\nRe-ejecutar suite TDD"]
        ARBITRO -->|Rechaza| DONE
        APLICAR --> DONE
    end

    DONE([✅ CÓDIGO LISTO — DONE]) --> MERGE["🌿 Merge autorizado al main"]

    style FASE_RED fill:#fee2e2,stroke:#ef4444
    style FASE_VERDE fill:#dcfce7,stroke:#22c55e
    style FASE_REFACTOR fill:#dbeafe,stroke:#3b82f6
    style RECHAZAR fill:#fef9c3,stroke:#ca8a04
```

---

## Las Dos Barreras de Calidad

### 🛡️ Barrera 1: Prevención de Tautología (Fase RED)

El riesgo inherente de los LLMs es generar pruebas tautológicas (ej. `assert(true == true)`) o *mocks* mal configurados que siempre aprueban. Por lo tanto, la Fase RED exige que el desarrollador humano ejecute el test en su máquina **antes** de escribir la implementación. El test debe arrojar:

- Un **error semántico** (falla de aserción), o
- Un **error sintáctico** (clase no encontrada)

Si el test pasa a verde inmediatamente, el humano debe rechazar el contrato y devolverlo a la Capa Estratégica.

### 🛡️ Barrera 2: Inmutabilidad del Comportamiento (Fase REFACTOR)

Si el parche propuesto por la IA **rompe el test**, se descarta automáticamente y se vuelve al estado Verde anterior. El código refactorizado debe pasar la misma suite de pruebas sin modificarla.

---

## Técnica Clave: Inyección Directa de Stack Traces

La técnica clave de la Fase Verde es la **inyección directa de *stack traces***. Si el código generado falla, el humano **no describe el error conversacionalmente**; copia la salida bruta del compilador o del motor de pruebas (ej. JUnit, Jest) y la inyecta como contexto para el siguiente intento.

```
# Ejemplo de inyección correcta (Fase Verde)

<Stack_Trace>
FAIL: test_user_registration_with_duplicate_email
  AssertionError: Expected UserAlreadyExistsException but got None
  at UserService.register (UserService.java:45)
  at UserServiceTest.test_user_registration_with_duplicate_email (UserServiceTest.java:23)
</Stack_Trace>

<Target_Interface>
interface UserService {
    UserDTO register(RegisterDTO dto) throws UserAlreadyExistsException;
}
</Target_Interface>
```

Como este procesamiento ocurre en el hardware local (Capa de Ejecución), el equipo puede permitirse **decenas de iteraciones por minuto** sin consumir cuotas de API externas.

---

← [Anterior: Ciclo de Vida](05-ciclo-de-vida.md) | [Siguiente: Gobernanza de Contexto →](07-gobernanza-contexto.md)
