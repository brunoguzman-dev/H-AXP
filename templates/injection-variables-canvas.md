# 🎨 Canvas: Variables de Inyección H-AXP

> Canvas de referencia rápida para estructurar las variables de inyección en cada Nodo Simbiótico.
> Usar como guía al construir los prompts de inyección para cada agente.

---

## Canvas del Nodo Arquitectónico

```
┌─────────────────────────────────────────────────────────────────────┐
│              CANVAS 1: INYECCIÓN AL NODO ARQUITECTÓNICO             │
│                      (IA Frontera — Nube)                           │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  <UserStory id="US-___" priority="HIGH|MEDIUM|LOW">                 │
│    <Title>_______________________________________________</Title>    │
│    <PrivacyLevel>LEVEL_1_STANDARD | LEVEL_2_ISOMORPHIC</PrivacyLevel>│
│    <Narrative>                                                      │
│      As a [ROL],                                                    │
│      I want to [ACCIÓN],                                           │
│      so that [VALOR DE NEGOCIO].                                   │
│    </Narrative>                                                     │
│    <AcceptanceCriteria>                                             │
│      <Criterion id="AC-1">_________________________________</Criterion>│
│      <Criterion id="AC-2">_________________________________</Criterion>│
│      <Criterion id="AC-3">_________________________________</Criterion>│
│    </AcceptanceCriteria>                                            │
│    <TechConstraints>                                                │
│      <Language>_____________________________________________</Language>│
│      <Framework>___________________________________________</Framework>│
│      <Database>____________________________________________</Database>│
│      <Architecture>Hexagonal / Clean Architecture</Architecture>    │
│      <TestFramework>JUnit 5 + PBT / Hypothesis / jqwik</TestFramework>│
│    </TechConstraints>                                               │
│    <DomainSchema>                                                   │
│      [DDL existente o "No existing schema — generate new"]         │
│    </DomainSchema>                                                  │
│  </UserStory>                                                       │
│                                                                     │
│  ⚠️ NUNCA incluir: datos reales, PII. Si es LEVEL_2, aplicar ofuscación│
└─────────────────────────────────────────────────────────────────────┘
```

---

## Canvas del Nodo Táctico — Turno 1 (Implementación inicial)

```
┌─────────────────────────────────────────────────────────────────────┐
│           CANVAS 2A: INYECCIÓN AL NODO TÁCTICO — TURNO 1           │
│                    (Agente Local — Conductor Zero-Token)            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  <Target_Interface_And_Stub>                                        │
│    [COPYPASTE ÍNTEGRO de las interfaces y el Stub Canónico]         │
│    — El stub lanza UnsupportedOperationException                    │
│    — El proyecto compila al 100% en limpio                          │
│    — Inmutable: prohibido alterar firmas o tipos                    │
│  </Target_Interface_And_Stub>                                       │
│                                                                     │
│  <Public_Test_Suite>                                                │
│    [COPYPASTE ÍNTEGRO de la suite TDD pública]                     │
│    — Casos de ejemplo + Property-Based Tests                        │
│    — Prohibido hardcoding de constantes (Mandato Anti-Overfitting)  │
│  </Public_Test_Suite>                                               │
│                                                                     │
│  ✅ Correcto: Código fuente exacto sin lenguaje natural             │
│  ❌ Incorrecto: Inyectar UserStory o explicaciones conversacionales │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Canvas del Nodo Táctico — Turno 2+ (Con Stack Trace)

```
┌─────────────────────────────────────────────────────────────────────┐
│        CANVAS 2B: INYECCIÓN AL NODO TÁCTICO — TURNO 2+             │
│                  (Agente Local — Corrección de errores)             │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  <Target_Interface_And_Stub>                                        │
│    [MISMO contenido del Turno 1 — inmutable]                        │
│  </Target_Interface_And_Stub>                                       │
│                                                                     │
│  <Public_Test_Suite>                                                │
│    [MISMO contenido del Turno 1 — inmutable]                        │
│  </Public_Test_Suite>                                               │
│                                                                     │
│  <Stack_Trace>                                                      │
│    [COPYPASTE CRUDO de stderr del compilador o runner]              │
│    Ejemplo:                                                         │
│    FAIL: test_register_duplicate_email                              │
│      AssertionError: Expected UserAlreadyExistsException            │
│        at UserService.java:45                                       │
│        at UserServiceTest.java:23                                   │
│  </Stack_Trace>                                                     │
│                                                                     │
│  ⚠️ En Intento 2: Purgado Markoviano (limpiar KV Cache antes de reintentar)│
│  🚨 En Intento 3: Si falla, DETENER y emitir <Contract_Fault_Ticket> │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Canvas del Nodo de Calidad (Auditoría CoT y SEARCH/REPLACE)

```
┌─────────────────────────────────────────────────────────────────────┐
│              CANVAS 3: INYECCIÓN AL NODO DE CALIDAD                │
│                    (Agente Razonador — CoT)                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  <Green_Code>                                                       │
│    [COPYPASTE ÍNTEGRO de la implementación que pasa los tests]     │
│    — Inyectar en frío tras State Wiping                             │
│  </Green_Code>                                                      │
│                                                                     │
│  <Public_TDD_Suite>                                                │
│    [COPYPASTE ÍNTEGRO de la suite TDD para verificación]           │
│  </Public_TDD_Suite>                                                │
│                                                                     │
│  <Target_Interface>                                                 │
│    [COPYPASTE ÍNTEGRO de la firma de interfaz]                     │
│  </Target_Interface>                                                │
│                                                                     │
│  Salida esperada del agente:                                        │
│    1. <think> Cálculo Big O, McCabe M <= 10, C_cog <= 12 </think>  │
│    2. <Audit_Metrics> Tabla comparativa pre vs post refactor </Audit_Metrics>│
│    3. <<<<<<< SEARCH ... ======= ... >>>>>>> REPLACE                │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Tabla de Reglas de Inyección (v2.0)

| Variable | Nodo | ¿Obligatoria? | Formato | Nunca incluir |
|---|---|---|---|---|
| `<UserStory>` | Arquitectónico | ✅ Sí | XML estructurado con PrivacyLevel | PII, datos reales |
| `<Constraints>` | Arquitectónico | ✅ Sí | XML estructurado (Stack, Hexagonal) | Credenciales |
| `<DomainSchema>` | Arquitectónico | ⚪ Si existe | DDL/SQL estructural | Datos de producción |
| `<Target_Interface_And_Stub>` | Táctico | ✅ Sí | Código fuente con Stub Canónico | Implementación de negocio |
| `<Public_TDD_Suite>` | Táctico | ✅ Sí | Código fuente TDD + PBT | Lenguaje natural |
| `<Stack_Trace>` | Táctico | ⚪ Si falla | Output crudo de stderr | Paráfrasis o hipótesis humanas |
| `<Shadow_Validation_Suite>` | Gatekeeper Pre-commit | ✅ Sí | Tests con entradas ortogonales | Inyección al Nodo Táctico |
| `<Green_Code>` | Calidad | ✅ Sí | Código fuente funcional | Tests, interfaces |

---

## Reglas de Micro-Contexting

```
REGLA 1 — IDENTIDAD Y RESPONSABILIDAD ÚNICA
  Cada Agente recibe UN SOLO System Prompt de su nodo correspondiente.
  Nunca combinar roles arquitectónicos, tácticos o de auditoría.

REGLA 2 — STATE WIPING & PURGADO MARKOVIANO
  → Antes de iniciar la auditoría de calidad: purgar la sesión del IDE.
  → Al segundo fallo consecutivo en Fase Verde: purgar la memoria KV Cache.

REGLA 3 — SEGREGACIÓN TOTAL DE ARTEFACTOS
  El Agente Táctico NUNCA recibe la User Story en lenguaje natural ni la Shadow Suite.
  El Agente de Calidad NUNCA recibe el historial de ensayo-error de la fase de codificación.
```

---

← [Volver a Templates](.) | [Volver al README](../README.md)
