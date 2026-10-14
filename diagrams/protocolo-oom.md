# 💾 Diagrama: Protocolo de Contingencia OOM (Out of Memory)

> Protocolo de respuesta ante desbordamiento de KV Cache en hardware local.

---

## Diagrama de Flujo OOM

```mermaid
flowchart TD
    TRIGGER(["⚠️ TRIGGER DETECTADO\nLatencia extrema TTFT > 5s\nSO Congelado\nDisparo de Swap en SSD"])

    TRIGGER --> PASO1

    subgraph PASO1["💀 PASO 1: HARD KILL"]
        P1A["Cancelar petición\nen el IDE/Terminal"]
        P1B["Motivo: Evitar colapso\ndel Kernel del SO por RAM"]
        P1A --> P1B
    end

    PASO1 --> PASO2

    subgraph PASO2["🧹 PASO 2: VRAM FLUSH"]
        P2A["Reiniciar motor\nde inferencia local"]
        P2B["Motivo: Vaciar tensores\natascados + limpiar paginación"]
        P2C["Herramientas:\nvLLM, Ollama, LM Studio"]
        P2A --> P2B --> P2C
    end

    PASO2 --> PASO3

    subgraph PASO3["⬇️ PASO 3: MODEL TIER-DOWN & AST METHOD SLICING"]
        P3A["Suspender Modelo Primario\n7B–14B parámetros"]
        P3B["Activar Modelo Ligero (3B)\n+ AST Method Slicing"]
        P3C["Modo Micro-Foco: Aislar\n1 método y 1 aserción a la vez"]
        P3D["Reducción > 75% en KV Cache\ny prevención de atención cruzada"]
        P3A --> P3B --> P3C --> P3D
    end

    PASO3 --> CONTINUAR(["✅ Continuar operación\ncon modelo 3B\ny método individual congelado"])

    style TRIGGER fill:#fee2e2,stroke:#ef4444
    style PASO1 fill:#fef9c3,stroke:#ca8a04
    style PASO2 fill:#fce7f3,stroke:#ec4899
    style PASO3 fill:#dbeafe,stroke:#3b82f6
    style CONTINUAR fill:#dcfce7,stroke:#22c55e
```

---

## Relación KV Cache — Memoria Física

```mermaid
graph LR
    subgraph MODELOS["Tamaño del Modelo vs RAM Requerida"]
        M3["3B params\n~4 GB VRAM\n(cuantizado 4-bit)"]
        M7["7B params\n~8 GB VRAM\n(cuantizado 4-bit)"]
        M14["14B params\n~16 GB VRAM\n(cuantizado 4-bit)"]
        M70["70B params\n~48 GB VRAM\n(cuantizado 4-bit)"]
    end

    subgraph KVCACHE["KV Cache cresce con el contexto"]
        C1["1K tokens → ~200 MB"]
        C2["4K tokens → ~800 MB"]
        C3["16K tokens → ~3.2 GB"]
        C4["128K tokens → ~25 GB ⚠️"]
    end

    style M3 fill:#dcfce7,stroke:#22c55e
    style M7 fill:#dcfce7,stroke:#22c55e
    style M14 fill:#fef9c3,stroke:#ca8a04
    style M70 fill:#fee2e2,stroke:#ef4444
    style C4 fill:#fee2e2,stroke:#ef4444
```

---

## Umbrales de Alerta

| Métrica | ✅ Normal | ⚠️ Advertencia | 🚨 Crítico (OOM) |
|---|---|---|---|
| **RAM / VRAM ocupada** | < 60% | 60–85% | > 85% |
| **TTFT (Time To First Token)** | < 1s | 1–5s | > 5s |
| **Tokens por segundo** | > 10 tok/s | 5–10 tok/s | < 5 tok/s |
| **Uso de Swap en SSD** | 0% | 1–20% | > 20% |
| **Temperatura del SSD** | < 60°C | 60–70°C | > 70°C ♨️ |

---

## Estrategia de Cuantización Recomendada

```mermaid
graph TD
    HW{Hardware disponible}

    HW -->|"GPU 4-8 GB VRAM"| Q4["Cuantización 4-bit (Q4_K_M)\nModelos hasta 7B"]
    HW -->|"GPU 16-24 GB VRAM"| Q8["Cuantización 8-bit (Q8_0)\nModelos hasta 14B"]
    HW -->|"GPU 48+ GB VRAM"| FP["FP16 / BF16\nModelos hasta 70B"]
    HW -->|"Solo CPU + RAM"| GGUF["GGUF + llama.cpp\nModelos 3B–7B (lento)"]

    style Q4 fill:#dcfce7,stroke:#22c55e
    style Q8 fill:#dbeafe,stroke:#3b82f6
    style FP fill:#f3e8ff,stroke:#9333ea
    style GGUF fill:#fef9c3,stroke:#ca8a04
```

---

## Herramientas de Motor de Inferencia Local

| Motor | Plataforma | GPU Compatible | Uso en H-AXP |
|---|---|---|---|
| **Ollama** | macOS / Linux / Windows | CUDA, Metal, ROCm | Desarrollo local rápido |
| **LM Studio** | macOS / Windows | Metal, CUDA | Equipo no técnico |
| **vLLM** | Linux | CUDA | Producción / Servidores |
| **llama.cpp** | Multiplataforma | CPU + GPU | Máxima compatibilidad |
| **Jan.ai** | macOS / Windows / Linux | CUDA, Metal | Alternativa a LM Studio |

---

← [Volver a Documentación](../docs/) | [Volver al README](../README.md)
