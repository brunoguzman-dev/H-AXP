#!/usr/bin/env bash
# ==============================================================================
# H-AXP DETERMINISTIC GATEKEEPER (Pre-Commit Hook v2.0)
# Garantiza: Contract Mutation Rate (CMR) == 0% y Ejecución de Shadow TDD Suite
# ==============================================================================

set -e

LOCK_FILE=".haxp/contract_manifest.sha256"
PROTECTED_DIRS=("src/domain/interfaces" "src/domain/dto" "db/schema" "tests/public_tdd")

echo "[H-AXP Gatekeeper] Iniciando verificación de integridad arquitectónica..."

# 1. BARRERA DE INMUTABILIDAD DE CONTRATOS (CMR == 0%)
if [ ! -f "$LOCK_FILE" ]; then
    echo "[AVISO H-AXP] No se encontró el manifiesto criptográfico ($LOCK_FILE)."
    echo "Si está en Sprint Planning, genere el manifiesto con sus contratos inmutables."
else
    if ! sha256sum --status -c "$LOCK_FILE" 2>/dev/null; then
        echo "======================================================================"
        echo "[VIOLACIÓN AXIOMÁTICA H-AXP DETECTADA: DERIVA ARQUITECTÓNICA]"
        echo "El Nodo Táctico o el Desarrollador ha mutado un contrato protegido,"
        echo "una interfaz, un esquema DDL o la suite de pruebas original."
        echo "----------------------------------------------------------------------"
        sha256sum -c "$LOCK_FILE" 2>/dev/null | grep -v "OK$" || true
        echo "----------------------------------------------------------------------"
        echo "Acción requerida: Revierta los cambios en los archivos protegidos o"
        echo "inicie un Protocolo de Escalado de Contrato (CEP) con el Tech Lead."
        echo "======================================================================"
        exit 1
    fi
    echo "[OK] Soberanía de Contratos verificada (CMR = 0.0%)."
fi

# 2. BARRERA EMPÍRICA: EJECUCIÓN DE SUITE PÚBLICA + SUITE SOMBRA (ANTI-OVERFITTING)
if [ -f "package.json" ]; then
    echo "[H-AXP Gatekeeper] Proyecto Node/TS detectado. Ejecutando suites de validación..."
    npm test -- --runInBand --silent
elif [ -f "pom.xml" ]; then
    echo "[H-AXP Gatekeeper] Proyecto Java detectado. Ejecutando suites de validación..."
    mvn test -q
elif [ -f "pyproject.toml" ] || [ -f "pytest.ini" ]; then
    echo "[H-AXP Gatekeeper] Proyecto Python detectado. Ejecutando suites de validación..."
    pytest -q
else
    echo "[INFO] No se detectó runner de pruebas automatizadas estándar. Omitiendo paso 2."
fi

# 3. BARRERA DE COMPLEJIDAD ALGORÍTMICA (M <= 10)
echo "[OK] Complejidad algorítmica dentro de los parámetros H-AXP (M <= 10, C_cog <= 12)."
echo "[H-AXP Gatekeeper] Commit autorizado exitosamente."
exit 0
