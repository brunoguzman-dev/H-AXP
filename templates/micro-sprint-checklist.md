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
- [ ] Firmas de interfaces generadas con tipos abstractos
- [ ] **Esqueleto Compilable (*Canonical Stub*):** Métodos retornan nulo o lanzan `UnsupportedOperationException("H-AXP Red State Stub")`
- [ ] **Public TDD Suite:** Pruebas BDD con casos de borde y al menos 1 prueba basada en propiedades (PBT)
- [ ] **Shadow Validation Suite:** Suite secundaria con entradas ortogonales para detección de *Reward Hacking*
- [ ] **Barrera 1 — Fase Roja Empírica:** 
  - [ ] El proyecto compila al 100% sin advertencias ni errores sintácticos
  - [ ] Los tests fallan estrictamente por aserción empírica o excepción de stub
  - [ ] Ningún test pasa en verde sin implementación (si pasa → tautología detectada → rechazar contrato)
- [ ] **Commit 0 en `main`:** Contratos, Stubs y Suites registrados con candado SHA-256 en `.haxp/contract_manifest.sha256`

### Autorización del Tech Lead

- [ ] Tech Lead revisó y validó los contratos generados
- [ ] Rama efímera creada (`haxp/node-[id]-[feature]`)
- [ ] Micro-Sprint oficialmente iniciado

---

## ⚙️ Iteración Zero-Token — Checklist del Nodo de Desarrollo

### Configuración del Agente Táctico

- [ ] System Prompt del Nodo Táctico v2.0 configurado en el IDE
- [ ] Historial de sesión limpio (*State Wiping*)
- [ ] Mandato Anti-Hardcoding activo (prohibidas tablas de búsqueda constantes)
- [ ] Archivos de interfaz y stubs protegidos por Git Hook ($CMR = 0\%$)

### Ciclo Red-Green (Bucle Táctico Continuo - CTL)

**Turno 1 — Inyección inicial:**
- [ ] `<Target_Interface_And_Stub>` inyectado
- [ ] `<Public_TDD_Suite>` inyectada
- [ ] Agente genera implementación algorítmica general
- [ ] Tests ejecutados en local ($0$ tokens)

**Si tests fallan (Turno 2+):**
- [ ] Stack trace copiado íntegramente del compilador/runner (`stderr`, sin parafrasear)
- [ ] `<Stack_Trace>` inyectado al Agente
- [ ] Intento 2: ¿Falla de nuevo? → **Purgado Markoviano** (limpiar KV Cache y reintentar en frío)
- [ ] Intento 3: ¿Falla consecutiva? → **Detener bucle local** y evaluar:
  - [ ] Si es limitación de hardware → Activar *AST Method Slicing* (aislar 1 método y 1 aserción)
  - [ ] Si es contradicción en el contrato → Emitir `<Contract_Fault_Ticket>` para Protocolo CEP

### Código Verde alcanzado y Validación Anti-Overfitting

- [ ] 100% de la Public TDD Suite en verde
- [ ] **Ejecución de Shadow Validation Suite:** 100% en verde (sin sobreajuste)
- [ ] Ningún archivo de interfaz ni DDL fue modificado ($CMR = 0\%$)
- [ ] Git commit en la rama efímera

---

## 🔍 Tribunal de Calidad — Checklist del Nodo de Calidad

### Auditoría del Agente Razonador (CoT)

- [ ] Limpieza de memoria (*State Wiping*) previa a la auditoría
- [ ] `<Green_Code>`, `<Public_TDD_Suite>` y `<Target_Interface>` inyectados
- [ ] Agente Razonador genera análisis CoT formal (`<think>`)

### Métricas de Calidad

| Métrica | Valor calculado | ¿Aprobado? |
|---|---|---|
| Complejidad Ciclomática ($\mathcal{M}$) | _____ | ⬜ $\le 10$ ✅ / ⬜ $> 10$ ⚠️ |
| Complejidad Cognitiva ($\mathcal{C}_{cog}$) | _____ | ⬜ $\le 12$ ✅ / ⬜ $> 12$ ⚠️ |
| Densidad de Defectos (DD) | _____ | ⬜ $\le 0.5$/KLOC ✅ / ⬜ $> 0.5$ ⚠️ |
| Mutation Score (MS) | _____ % | ⬜ $\ge 85\%$ ✅ / ⬜ $< 85\%$ ⚠️ |
| Ratio de Arbitraje Humano (HATR) | _____ % | ⬜ $\le 25\%$ ✅ / ⬜ $> 25\%$ ⚠️ |
| Complejidad Temporal (Big O) | _____ | ⬜ Óptimo ✅ / ⬜ Subóptimo ⚠️ |

### Decisión del Árbitro QA

**Opción A — Sin refactorización:**
- [ ] QA acepta el código verde tal cual
- [ ] Motivo documentado: ___________________

**Opción B — Con refactorización:**
- [ ] QA acepta los bloques deterministas `<<<<<<< SEARCH ... ======= ... >>>>>>> REPLACE`
- [ ] Bloques aplicados sobre el AST
- [ ] Public TDD y Shadow Validation Suites re-ejecutadas
- [ ] **Barrera 2 — Todos los tests siguen en verde** (si alguno falla → revertir parche)

**Opción C — Rechazo de parche por sobreingeniería:**
- [ ] QA rechaza la refactorización (sobreingeniería detectada)
- [ ] Código verde original enviado al merge

---

## 🌿 Merge y Cierre — Checklist Final

### Pre-Merge

- [ ] Pull Request creado hacia `main`
- [ ] Suites Pública y Sombra 100% verdes
- [ ] Git hook `pre-commit` determinista superado exitosamente (CMR = 0%, M <= 10)
- [ ] Ningún contrato inmutable modificado

### Autorización de Merge

- [ ] Tech Lead / PO revisó el Pull Request
- [ ] Merge autorizado al `main` branch
- [ ] Rama efímera eliminada

### Review y Retrospectiva Paramétrica

- [ ] Métricas registradas en el tracker
- [ ] Calibración de System Prompts y límites de KV Cache
- [ ] Backlog actualizado para el próximo Micro-Sprint

---

## 📊 Registro de Métricas del Micro-Sprint (v2.0)

```
Micro-Sprint ID: MS-______
Fecha inicio: ___________
Fecha fin: _____________
User Story: US-__________
Nivel de Privacidad: [LEVEL_1_STANDARD | LEVEL_2_ISOMORPHIC]

Métricas finales:
- Defect Density (DD): _____ defectos/KLOC  [objetivo: <= 0.5]
- Contract Mutation Rate (CMR): _____% [objetivo: 0.0%]
- Local Test Pass Ratio (LTPR): _____% [objetivo: >= 85%]
- Token Cost per Feature (TCF_total): _____ tokens [objetivo: <= 12.000 tokens]
- Cyclomatic Complexity (M): _____ [objetivo: <= 10]
- Cognitive Complexity (C_cog): _____ [objetivo: <= 12]
- Human Arbitration Time Ratio (HATR): _____% [objetivo: <= 25%]
- Mutation Score (MS): _____% [objetivo: >= 85%]

Notas y calibraciones:
________________________________________________________
________________________________________________________
```

---

← [Volver a Templates](.) | [Volver al README](../README.md)
