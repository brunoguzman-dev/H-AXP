# ✅ Checklist: Micro-Sprint H-AXP

> Lista de verificación completa para cada fase del Micro-Sprint.
> Completar en orden secuencial. No avanzar a la siguiente fase sin aprobar la actual.

---

## 📅 Sprint Planning — Checklist del Nodo Arquitectónico

### Preparación de la User Story

- [ ] La User Story tiene formato `<UserStory>` XML completo
- [ ] NO contiene datos reales, PII ni información sensible
- [ ] Los criterios de aceptación son verificables y medibles
- [ ] El alcance está delimitado (incluidos y excluidos)
- [ ] La historia puede completarse en 3–7 días

### Generación de Contratos (IA Frontera + Tech Lead)

- [ ] DDL schema generado con tipos correctos (sin datos de ejemplo reales)
- [ ] Firmas de interfaz generadas con tipos abstractos (sin lógica de implementación)
- [ ] Suite TDD generada con al menos 1 test por criterio de aceptación
- [ ] **Barrera 1 — Fase Roja Empírica:** Se ejecutaron los tests antes de implementar
  - [ ] Los tests fallan con error semántico o sintáctico (✅ correcto)
  - [ ] Los tests NO pasan en verde sin implementación (si pasan → test tautológico → reescribir)

### Autorización del Tech Lead

- [ ] Tech Lead revisó y validó los contratos generados
- [ ] Suite TDD aprobada para inyección al Nodo de Desarrollo
- [ ] Micro-Sprint oficialmente iniciado

---

## ⚙️ Iteración Zero-Token — Checklist del Nodo de Desarrollo

### Configuración del Agente Táctico

- [ ] System Prompt del Nodo Táctico configurado en el IDE
- [ ] Historial de sesión limpio (State Wiping)
- [ ] Archivos de interfaz marcados como protegidos (no editar)
- [ ] Git hook pre-commit configurado para detectar deriva arquitectónica

### Ciclo Red-Green (por cada iteración)

**Turno 1 — Inyección inicial:**
- [ ] `<Test_Suite>` inyectado (suite TDD completa)
- [ ] `<Target_Interface>` inyectado (firma de interfaz)
- [ ] Agente genera implementación mínima
- [ ] Tests ejecutados en local

**Si tests fallan (Turno 2+):**
- [ ] Stack trace copiado íntegramente del compilador (NO parafrasear)
- [ ] `<Stack_Trace>` inyectado al Agente
- [ ] Agente corrige implementación
- [ ] Tests ejecutados de nuevo

**Límite de reintentos:**
- [ ] Intento 1: ⬜ Verde / ⬜ Falla
- [ ] Intento 2: ⬜ Verde / ⬜ Falla
- [ ] Intento 3: ⬜ Verde / ⬜ Falla → **Escalar al Tech Lead si aún falla**

### Código Verde alcanzado

- [ ] 100% de tests en verde
- [ ] Ningún archivo de interfaz fue modificado
- [ ] Ningún archivo de test fue modificado
- [ ] Git commit con código verde (no merge aún)

---

## 🔍 Tribunal de Calidad — Checklist del Nodo de Calidad

### Auditoría del Agente Razonador (CoT)

- [ ] `<Green_Code>` inyectado (implementación verde)
- [ ] `<Test_Suite>` inyectado (para verificación)
- [ ] `<Target_Interface>` inyectado
- [ ] Agente Razonador genera análisis CoT

### Métricas de Calidad

| Métrica | Valor calculado | ¿Aprobado? |
|---|---|---|
| Complejidad Ciclomática (M) | _____ | ⬜ ≤10 ✅ / ⬜ >10 ⚠️ |
| Densidad de Defectos (DD) | _____ | ⬜ ≤0.5/KLOC ✅ / ⬜ >0.5 ⚠️ |
| Token Count del Contexto (TCF) | _____ | ⬜ <4500 ✅ / ⬜ >4500 ⚠️ |
| Complejidad Temporal (Big O) | _____ | ⬜ Óptimo ✅ / ⬜ Mejorable ⚠️ |

### Decisión del Árbitro QA

**Opción A — Sin refactorización:**
- [ ] QA acepta el código verde tal cual
- [ ] Motivo documentado: ___________________

**Opción B — Con refactorización:**
- [ ] QA acepta el Unified Diff propuesto
- [ ] Diff aplicado al código
- [ ] Tests re-ejecutados tras aplicar diff
- [ ] **Barrera 2 — Todos los tests siguen en verde** (si alguno falla → descartar diff)

**Opción C — Rechazo de diff por sobreingeniería:**
- [ ] QA rechaza el diff (sobreingeniería detectada)
- [ ] Código verde original enviado al merge sin modificaciones

---

## 🌿 Merge y Cierre — Checklist Final

### Pre-Merge

- [ ] Pull Request creado con descripción completa
- [ ] Suite TDD 100% verde en el estado final
- [ ] Git hook pre-commit ejecutado sin errores
- [ ] Ningún contrato inmutable modificado (interfaces, DDL)

### Autorización de Merge

- [ ] Tech Lead revisó el Pull Request
- [ ] Tech Lead autoriza el merge al main branch
- [ ] Merge ejecutado

### Review / Retrospectiva

- [ ] Métricas registradas en el tracker del equipo
- [ ] Lecciones aprendidas documentadas
- [ ] Backlog actualizado para el próximo Micro-Sprint

---

## 📊 Registro de Métricas del Micro-Sprint

```
Micro-Sprint ID: MS-______
Fecha inicio: ___________
Fecha fin: _____________
User Story: US-__________

Métricas finales:
- Defect Density (DD): _____ defectos/KLOC  [objetivo: ≤0.5]
- Contract Mutation Rate (CMR): _____% [objetivo: 0%]
- Local Test Pass Rate (LTPR): _____% [objetivo: ≥85%]
- Token Context Footprint (TCF): _____ tokens [objetivo: <4500]
- Cyclomatic Complexity (M): _____ [objetivo: ≤10]

Notas:
________________________________________________________
________________________________________________________
```

---

← [Volver a Templates](.) | [Volver al README](../README.md)
