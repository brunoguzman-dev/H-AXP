# 📋 Template: User Story H-AXP

> Plantilla para formalizar User Stories antes de enviarlas al Nodo Arquitectónico.
> 
> Copiar y completar este template para cada historia de usuario del Micro-Sprint.

---

## Template XML para el Nodo Arquitectónico

```xml
<UserStory id="US-[número]" priority="[HIGH|MEDIUM|LOW]">
  
  <Title>[Título corto de la historia]</Title>
  <PrivacyLevel>[LEVEL_1_STANDARD | LEVEL_2_ISOMORPHIC]</PrivacyLevel>
  
  <Narrative>
    As a [rol del usuario],
    I want to [acción o funcionalidad],
    so that [valor de negocio o beneficio].
  </Narrative>
  
  <AcceptanceCriteria>
    <Criterion id="AC-1">[Criterio de aceptación 1 — booleano, verificable y medible]</Criterion>
    <Criterion id="AC-2">[Criterio de aceptación 2 — booleano]</Criterion>
    <Criterion id="AC-3">[Criterio de aceptación 3 — booleano]</Criterion>
    <!-- Agregar más criterios según sea necesario -->
  </AcceptanceCriteria>
  
  <TechConstraints>
    <Language>[Lenguaje de programación, ej: Java 21]</Language>
    <Framework>[Framework principal, ej: Spring Boot 3.2]</Framework>
    <Database>[Motor de base de datos, ej: PostgreSQL 16]</Database>
    <Architecture>[Hexagonal / Ports & Adapters / Clean Architecture]</Architecture>
    <TestFramework>[Framework de testing + PBT, ej: JUnit 5 + jqwik / Hypothesis]</TestFramework>
    <AdditionalConstraints>[Otras restricciones técnicas si aplica]</AdditionalConstraints>
  </TechConstraints>
  
  <DomainSchema>
    <!-- Esquemas DDL existentes relacionados a esta historia (si aplica) -->
    <!-- Si no hay esquemas previos, indicar: "No existing schema — generate new" -->
    [DDL existente o "No existing schema"]
  </DomainSchema>
  
  <OutOfScope>
    <!-- Qué NO está incluido en esta historia para evitar scope creep -->
    <Exclusion>[Funcionalidad excluida 1]</Exclusion>
    <Exclusion>[Funcionalidad excluida 2]</Exclusion>
  </OutOfScope>
  
</UserStory>
```

---

## Checklist de Validación (antes de enviar al Nodo Arquitectónico)

### Seguridad, Privacidad y Soberanía Ontológica

- [ ] ¿La historia NO contiene datos reales de producción ni PII?
- [ ] ¿Se clasificó correctamente el nivel de confidencialidad (`LEVEL_1` o `LEVEL_2`)?
- [ ] Si es `LEVEL_2_ISOMORPHIC`: ¿Se aplicó la ofuscación ontológica antes de la nube y se preparó el `domain-map.json` local?
- [ ] ¿El esquema DDL es solo estructural, sin datos de ejemplo reales?

### Completitud

- [ ] ¿El narrativo tiene Rol + Acción + Valor de negocio?
- [ ] ¿Hay al menos 2 criterios de aceptación verificables?
- [ ] ¿Están especificados el lenguaje, framework y base de datos?
- [ ] ¿El alcance está claramente delimitado (incluidos y excluidos)?

### Atomicidad (para Micro-Sprint)

- [ ] ¿La historia puede implementarse en 3–7 días?
- [ ] ¿La historia representa un único componente funcional atómico?
- [ ] ¿Si la historia es muy grande, se ha dividido en sub-historias?

---

## Ejemplo Completo

```xml
<UserStory id="US-042" priority="HIGH">
  
  <Title>Registro de usuario con email y contraseña</Title>
  
  <Narrative>
    As a new customer,
    I want to register an account using my email and password,
    so that I can access the platform and its features.
  </Narrative>
  
  <AcceptanceCriteria>
    <Criterion id="AC-1">Email must be unique — system rejects duplicate emails with UserAlreadyExistsException</Criterion>
    <Criterion id="AC-2">Password must be at least 8 characters — system rejects shorter passwords with InvalidPasswordException</Criterion>
    <Criterion id="AC-3">On successful registration, system returns a UserDTO with id and email (no password exposed)</Criterion>
    <Criterion id="AC-4">Password is stored as a bcrypt hash — never as plaintext</Criterion>
  </AcceptanceCriteria>
  
  <TechConstraints>
    <Language>Java 21</Language>
    <Framework>Spring Boot 3.2 + Spring Security</Framework>
    <Database>PostgreSQL 16</Database>
    <TestFramework>JUnit 5 + Mockito + AssertJ</TestFramework>
    <AdditionalConstraints>Use BCryptPasswordEncoder from Spring Security</AdditionalConstraints>
  </TechConstraints>
  
  <DomainSchema>
    No existing schema — generate new users table
  </DomainSchema>
  
  <OutOfScope>
    <Exclusion>Email verification flow (separate story US-043)</Exclusion>
    <Exclusion>OAuth / social login</Exclusion>
    <Exclusion>Password reset functionality</Exclusion>
  </OutOfScope>
  
</UserStory>
```

---

← [Volver a Templates](.) | [Volver al README](../README.md)
