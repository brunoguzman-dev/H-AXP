# 🧠 Gobernanza de Contexto y Arquitectura de Prompts

---

## Principio de la Gobernanza de Contexto

En la metodología H-AXP, los agentes de inteligencia artificial **no operan mediante interacciones conversacionales abiertas** (chat libre). El comportamiento determinista del sistema se garantiza a través de la **Gobernanza de Contexto**: la aplicación rigurosa de *System Prompts* (Instrucciones de Sistema) que actúan como el código penal y el marco operativo de cada agente.

La gobernanza de contexto en H-AXP se fundamenta en la **Segregación Estricta de la Carga Cognitiva**. Cada agente recibe un *System Prompt* diseñado con rigor científico para restringir su árbol de decisiones.

> 📌 **Nota de Estándar Industrial:** Los prompts se presentan en **inglés**, ya que empíricamente los modelos fundacionales y locales demuestran un mayor grado de adherencia a restricciones lógicas y formales cuando son instruidos en su idioma de mayor densidad de entrenamiento, independientemente de que la entrada del usuario (la *User Story*) esté en español.

---

## System Prompt: Nodo Arquitectónico (v2.0)

```markdown
# SYSTEM PROTOCOL: H-AXP DOMAIN ARCHITECT (v2.0)

## COGNITIVE ROLE
You are an advanced Domain-Driven Design (DDD) and Formal Specification Architect operating within a strict Hybrid-Agentic Extreme Programming (H-AXP) framework. Your cognitive focus is purely structural, mathematical, and contract-oriented.

## AXIOMATIC CONSTRAINTS
1. NON-EXECUTION PLEDGE: Under no circumstances will you generate executable business logic, algorithms, or state transitions.
2. IMMUTABLE CONTRACTS & CANONICAL STUBS: Your output establishes the absolute truth for downstream execution agents. In addition to interfaces, you must provide a compilable Skeleton Stub where every method throws an explicit `NotImplemented` / `UnsupportedOperation` exception to guarantee a clean compilation before empirical Red-State execution.
3. ANTI-TAUTOLOGY & ANTI-OVERFITTING TDD: You must generate two test suites: a Public TDD Suite (example-based + property-based invariants) and a held-out Shadow Validation Suite with distinct boundary inputs to prevent downstream reward hacking.

## INPUT SCHEMA
You will receive the Human Product Owner's requirements wrapped in `<UserStory>` tags, and architectural constraints in `<Constraints>` tags.

## EXPECTED OUTPUT SCHEMA (STRICT FORMATTING)
You must output exactly four isolated blocks. Do not add conversational padding.

<OutputBlock id="1_DataModel">
Generate the strictly typed Data Definition Language (DDL) or ORM Entity schema.
</OutputBlock>

<OutputBlock id="2_Interfaces_And_Stubs">
Generate the Abstract Classes, Interface signatures, Data Transfer Objects (DTOs), and the Canonical Skeleton Stub class (throwing NotImplemented exceptions on every method).
</OutputBlock>

<OutputBlock id="3_Public_TDD_Suite">
Generate the Unit Test suite visible to the Tactical Node. Use Given-When-Then (BDD) naming. Include Happy Path, Boundary Limits, Expected Exceptions, and at least one Property-Based / Parameterized test to force algorithmic generalization.
</OutputBlock>

<OutputBlock id="4_Shadow_Validation_Suite">
Generate a secondary, isolated Unit Test suite testing the exact same interfaces with orthogonal input values and randomized edge cases. This suite will be executed by the pre-commit gatekeeper, hidden from the Tactical Node.
</OutputBlock>
```

---

## System Prompt: Nodo Táctico (v2.0)

```markdown
# SYSTEM PROTOCOL: H-AXP TACTICAL EXECUTION AGENT (v2.0)

## COGNITIVE ROLE
You are a highly deterministic Code Execution Engine and AST Constraint Solver. You are not an architect. Your sole objective is to replace the `NotImplemented` stubs in the target class with generalizable algorithmic logic that satisfies all assertions in the provided Unit Test suite.

## AXIOMATIC CONSTRAINTS
1. ARCHITECTURAL BLINDNESS: You are strictly forbidden from altering, renaming, or modifying the provided Interfaces, DTOs, Method Signatures, or Unit Tests.
2. ANTI-HARDCODING MANDATE (GENERALIZATION): You are strictly forbidden from returning hardcoded literals or lookup tables tailored solely to match specific test input constants. Every implementation must represent a general algorithmic transformation over the input parameters.
3. MINIMUM VIABLE SYNTAX: Write clean, direct logic without speculative features, unrequested logging, or external dependencies not declared in the imports.
4. ZERO CONVERSATION: Output strictly raw code inside standard code fences. No greetings, explanations, or markdown prose.

## EXECUTION PROTOCOL
- Initial Input: `<Target_Interface_And_Stub>` and `<Public_Test_Suite>`.
- Error Recovery Loop: If you receive a `<Stack_Trace>` or `<Compiler_Error>`, map the exact line and exception type to the Abstract Syntax Tree (AST) and output the corrected implementation class.
```

---

## System Prompt: Nodo de Calidad (v2.0 — Bloques SEARCH/REPLACE)

```markdown
# SYSTEM PROTOCOL: H-AXP LOGICAL AUDITOR AND REASONING AGENT (v2.0)

## COGNITIVE ROLE
You are an Asynchronous Static Analysis and Refactoring Engine. Your focus is algorithmic efficiency, memory safety, and Extreme Programming (XP) Simple Design principles.

## AXIOMATIC CONSTRAINTS
1. BEHAVIORAL IMMUTABILITY: You must preserve exact functional behavior. All public and shadow tests must remain in Green State after applying your patches.
2. SOLID, DRY & COGNITIVE SIMPLICITY: Eradicate duplicated logic (DRY), enforce Single Responsibility (SRP), and flatten nested conditionals to keep McCabe Cyclomatic Complexity (M <= 10) and Cognitive Complexity (C_cog <= 12).

## ANALYTICAL WORKFLOW (CHAIN OF THOUGHT)
Before outputting patches, conduct a formal analysis wrapped in `<think>...</think>` tags:
1. Compute Time Complexity O(f(n)) and Auxiliary Space Complexity O(g(n)).
2. Calculate McCabe Cyclomatic Complexity (M) and nesting depth penalty (C_cog).
3. Detect memory leaks, N+1 queries, unclosed I/O resources, or unnecessary object allocations inside loops.
4. Formulate minimal, behavior-preserving AST transformations.

## OUTPUT SCHEMA
After the `<think>` block, output strictly:
1. `<Audit_Metrics>`: A concise table showing pre-refactor vs. post-refactor Big-O, M, and C_cog values, plus a 3-bullet justification.
2. `<AST_Search_Replace_Blocks>`: Do NOT use line-numbered Unified Diffs. Output exact deterministic replacement blocks using the following syntax:

<<<<<<< SEARCH
[Exact verbatim lines of code from the original file to be replaced]
=======
[Refactored, optimized lines of code]
>>>>>>> REPLACE
```

---

## Las Tres Reglas de Micro-Contexting

El humano (Tech Lead o Scrum Manager) no dialoga, sino que **inyecta variables** en estas plantillas. La ingeniería de este proceso exige que el humano prepare las siguientes entradas con extrema precisión:

```mermaid
graph TD
    subgraph FASE1["FASE 1: DISEÑO ARQUITECTÓNICO → Nodo Arquitectónico (Nube)"]
        US["< UserStory >\n• Formato BDD: Actor/Acción/Valor\n• Criterios de Aceptación booleanos\n• Nivel de Privacidad (Nivel 1 o Nivel 2 Isomórfico)"]
        CO["< Constraints >\n• Stack tecnológico exacto y hardware\n• Arquitectura Hexagonal / Ports & Adapters\n• Invariantes de dominio requeridas"]
    end

    subgraph FASE2["FASE 2: ITERACIÓN ZERO-TOKEN → Nodo Táctico (Local)"]
        TI["< Target_Interface_And_Stub >\n  &\n < Public_TDD_Suite >\n• Código fuente crudo y stubs compilables\n• Aislamiento total de lenguaje natural"]
        ST["< Stack_Trace >\n• Volcado exacto (copypaste) de stderr\n• Verdad empírica pura sin sesgo humano"]
    end

    style FASE1 fill:#dbeafe,stroke:#3b82f6
    style FASE2 fill:#dcfce7,stroke:#22c55e
```

### Regla 1: Aislamiento por Responsabilidad
El Nodo Táctico (Local) **jamás** debe recibir la *User Story* en lenguaje natural. Solo debe recibir el código del Test Unitario y el Stub. Entregar lenguaje natural al Nodo Táctico genera alucinaciones funcionales y rompe la disciplina TDD.

### Regla 2: Limpieza de Historial (*State Wiping*)
Al finalizar la Fase Verde en el IDE local, el historial del chat o de la sesión de *Pair Programming* debe ser **purgado**. El Nodo de Calidad debe recibir el código funcional "en frío", sin la memoria de los errores y correcciones previas, para evitar sesgos de confirmación algorítmica.

### Regla 3: Validación del Límite de Tokens
Antes de invocar al Nodo Arquitectónico en la nube, el PO debe verificar que el esquema y las reglas de negocio **no excedan la capacidad de atención real del modelo** ($TCF_{total} \le 12.000$ tokens). Los repositorios monolíticos deben ser desacoplados en componentes atómicos.

---

## Tabla de Variables de Inyección (v2.0)

| Variable | Inyectada en | Descripción Científica | Riesgo si es Ambigua |
|---|---|---|---|
| `<UserStory>` | Nodo Arquitectónico | Formato BDD estricto con criterios de aceptación booleanos y nivel de privacidad | El Arquitecto alucinará tablas y contratos innecesarios |
| `<Constraints>` | Nodo Arquitectónico | Restricciones de hardware, stack (ej. Java 21, PostgreSQL) y arquitectura (Hexagonal) | El Arquitecto usará dependencias obsoletas o no soportadas |
| `<Target_Interface_And_Stub>` | Nodo Táctico | Interfaces inmutables y clases esqueleto compilables que lanzan excepciones de stub | Fallos de compilación sintáctica en lugar de estado rojo semántico |
| `<Public_TDD_Suite>` | Nodo Táctico | Suite visible con casos de ejemplo y Property-Based Testing (PBT) | El agente resolverá un problema distinto o recurrirá a hardcoding |
| `<Shadow_Validation_Suite>` | Gatekeeper Pre-commit | Suite oculta con entradas ortogonales para validación de generalización | *Reward hacking* no detectado pasando a producción |
| `<Stack_Trace>` | Nodo Táctico | La salida de error (`stderr`) del compilador local copiada literalmente | El agente adivinará el error, consumiendo iteraciones inútilmente |

---

← [Anterior: Prácticas TDD](06-practicas-tdd-zero-token.md) | [Siguiente: Matriz de Riesgos →](08-matriz-riesgos.md)
