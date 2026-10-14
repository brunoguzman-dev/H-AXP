# 🚨 Template: Contract Fault Ticket (CEP)
> Plantilla formal de escalado de contratos inviables del Nodo Táctico al Nodo Arquitectónico.
> Se emite únicamente tras agotar la Regla de 3 intentos y aplicar el Purgado Markoviano.

---

## Formato del Ticket XML (`<Contract_Fault_Ticket>`)

```xml
<Contract_Fault_Ticket id="CFT-[número]" micro_sprint="MS-[número]" priority="BLOCKING">
  
  <Header>
    <Issuer>Nodo de Desarrollo (Developer + Agente Local)</Issuer>
    <Recipient>Nodo Arquitectónico (Tech Lead + IA Frontera)</Recipient>
    <TargetInterface>[Nombre de la interfaz o archivo DDL en conflicto]</TargetInterface>
    <Timestamp>[YYYY-MM-DDTHH:MM:SSZ]</Timestamp>
  </Header>

  <FaultClassification>
    <!-- Seleccionar una o más opciones:
         - TYPE_INCOMPATIBILITY: Incompatibilidad entre tipos de retorno y librerías del runtime
         - LOGICAL_CONTRADICTION: Dos aserciones de la suite TDD son mutuamente excluyentes
         - CONCURRENCY_DEADLOCK: La firma impone sincronización bloqueante inviable
         - MISSING_DOMAIN_COLLABORATOR: Falta un puerto/adaptador requerido por el caso de uso
    -->
    <Category>[TYPE_INCOMPATIBILITY | LOGICAL_CONTRADICTION | CONCURRENCY_DEADLOCK | MISSING_DOMAIN_COLLABORATOR]</Category>
  </FaultClassification>

  <EmpiricalEvidence>
    <FailingSignature>
      <![CDATA[
      [Firma exacta del método o esquema DDL en conflicto]
      ]]>
    </FailingSignature>

    <CompilerOrRunnerOutput>
      <![CDATA[
      [Volcado exacto (copypaste crudo de stderr) demostrando la imposibilidad matemática o técnica]
      ]]>
    </CompilerOrRunnerOutput>
  </EmpiricalEvidence>

  <LocalExhaustionLog>
    <Attempt1Status>Falla en implementación inicial</Attempt1Status>
    <Attempt2Status>Falla tras primer stack trace + Purgado Markoviano ejecutado</Attempt2Status>
    <Attempt3Status>Falla persistente con KV Cache limpia (Blind Loop descartado)</Attempt3Status>
  </LocalExhaustionLog>

  <ProposedHotPatchHint>
    <!-- Sugerencia mínima del desarrollador humano para el Tech Lead (opcional, en prosa técnica concisa) -->
    <![CDATA[
    [Ej: Modificar el tipo de retorno de CompletableFuture<UserDTO> a Uni<UserDTO> para compatibilidad con Mutiny/Quarkus]
    ]]>
  </ProposedHotPatchHint>

</Contract_Fault_Ticket>
```

---

## Protocolo de Atención del Tech Lead (Hot-Patch Estratégico)

1. **Recepción:** El Tech Lead recibe el ticket y evalúa si la contradicción es empírica.
2. **Inyección en Nube:** Inyecta exclusivamente el contrato afectado y el bloque `<Contract_Fault_Ticket>` en el Nodo Arquitectónico (consumo $< 800$ tokens).
3. **Regeneración de Contrato:** La IA Frontera emite la versión corregida de la interfaz y la suite TDD.
4. **Actualización de Bloqueo:** El Tech Lead recalcula el hash SHA-256 en `.haxp/contract_manifest.sha256`.
5. **Reinicio de Fase RED:** El desarrollador descarga el contrato corregido y reanuda el Bucle Táctico Continuo en local.

---

← [Volver a Templates](.) | [Volver al README](../README.md)
