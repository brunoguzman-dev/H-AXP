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
│      <TestFramework>_______________________________________</TestFramework>│
│    </TechConstraints>                                               │
│    <DomainSchema>                                                   │
│      [DDL existente o "No existing schema — generate new"]         │
│    </DomainSchema>                                                  │
│  </UserStory>                                                       │
│                                                                     │
│  ⚠️  NUNCA incluir: datos reales, PII, código ejecutable           │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Canvas del Nodo Táctico — Turno 1 (Implementación inicial)

```
┌─────────────────────────────────────────────────────────────────────┐
│           CANVAS 2A: INYECCIÓN AL NODO TÁCTICO — TURNO 1           │
│                    (Agente Local — Sin implementación)              │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  <Test_Suite>                                                       │
│    [COPYPASTE ÍNTEGRO de la suite TDD generada por Nodo Arq.]      │
│    — Incluir todos los @Test / test_ / it() / describe()           │
│    — NO resumir ni parafrasear                                      │
│  </Test_Suite>                                                      │
│                                                                     │
│  <Target_Interface>                                                 │
│    [COPYPASTE ÍNTEGRO de la firma de interfaz]                     │
│    — Solo firmas de métodos, sin cuerpo                            │
│    — NO modificar, es inmutable                                     │
│  </Target_Interface>                                                │
│                                                                     │
│  ✅ Correcto: Código fuente exacto                                  │
│  ❌ Incorrecto: "El test verifica que..."                           │
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
│  <Test_Suite>                                                       │
│    [MISMO contenido del Turno 1 — no cambiar]                      │
│  </Test_Suite>                                                      │
│                                                                     │
│  <Target_Interface>                                                 │
│    [MISMO contenido del Turno 1 — no cambiar]                      │
│  </Target_Interface>                                                │
│                                                                     │
│  <Stack_Trace>                                                      │
│    [COPYPASTE CRUDO del output del compilador/runner]              │
│    Ejemplo:                                                         │
│    FAIL: test_register_duplicate_email                              │
│      AssertionError: Expected UserAlreadyExistsException            │
│        at UserService.java:45                                       │
│        at UserServiceTest.java:23                                   │
│  </Stack_Trace>                                                     │
│                                                                     │
│  ✅ Correcto: Output exacto del compilador                          │
│  ❌ Incorrecto: "Creo que el error es que..."                       │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Canvas del Nodo de Calidad (Auditoría CoT)

```
┌─────────────────────────────────────────────────────────────────────┐
│              CANVAS 3: INYECCIÓN AL NODO DE CALIDAD                │
│                    (Agente Razonador — CoT)                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  <Green_Code>                                                       │
│    [COPYPASTE ÍNTEGRO de la implementación que pasa los tests]     │
│    — Incluir todos los archivos de implementación                   │
│    — NO incluir archivos de test                                    │
│    — NO incluir archivos de interfaz                                │
│  </Green_Code>                                                      │
│                                                                     │
│  <Test_Suite>                                                       │
│    [COPYPASTE ÍNTEGRO de la suite TDD]                             │
│    — Para que el Agente verifique que su diff no rompe tests       │
│  </Test_Suite>                                                      │
│                                                                     │
│  <Target_Interface>                                                 │
│    [COPYPASTE ÍNTEGRO de la firma de interfaz]                     │
│    — Para contexto del dominio                                      │
│  </Target_Interface>                                                │
│                                                                     │
│  ✅ El Agente Razonador solo AUDITA y propone — el QA DECIDE       │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Tabla de Reglas de Inyección

| Variable | Nodo | ¿Obligatoria? | Formato | Nunca incluir |
|---|---|---|---|---|
| `<UserStory>` | Arquitectónico | ✅ Sí | XML estructurado | PII, datos reales |
| `<TechConstraints>` | Arquitectónico | ✅ Sí | XML estructurado | Credenciales, tokens |
| `<DomainSchema>` | Arquitectónico | ⚪ Si existe | DDL/SQL | Datos de producción |
| `<Test_Suite>` | Táctico | ✅ Sí | Código fuente exacto | Interpretación en prosa |
| `<Target_Interface>` | Táctico | ✅ Sí | Código fuente exacto | Implementación |
| `<Stack_Trace>` | Táctico | ⚪ Si falla | Output crudo del compilador | Paráfrasis o interpretación |
| `<Green_Code>` | Calidad | ✅ Sí | Código fuente exacto | Tests, interfaces |

---

## Reglas de Micro-Contexting

```
REGLA 1 — IDENTIDAD ÚNICA
  Cada Agente recibe UN SOLO System Prompt.
  Nunca combinar prompts de Nodo Táctico y Nodo de Calidad en el mismo contexto.

REGLA 2 — STATE WIPING
  Antes de cada nuevo Micro-Sprint:
  → Limpiar historial de sesión del Agente Táctico
  → Iniciar nuevo contexto vacío
  → Re-inyectar las variables desde cero

REGLA 3 — SEGREGACIÓN DE ARTEFACTOS
  El Agente Táctico NUNCA recibe código ya escrito de otros componentes.
  El Agente de Calidad NUNCA recibe la User Story original.
  Cada Agente recibe SOLO lo que necesita para su tarea.
```

---

← [Volver a Templates](.) | [Volver al README](../README.md)
