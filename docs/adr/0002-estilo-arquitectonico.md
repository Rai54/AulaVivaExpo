# ADR 0002 · Elección de estilo arquitectónico

## Estado
Aceptado — Sprint 3

## Contexto
AulaViva es un SaaS multi-tenant con tutor IA (RAG) para colegios. Tres fuerzas dominan la arquitectura:
- Privacidad y seguridad de los datos de menores.
- Picos de uso estacionales (período de pruebas).
- Control del costo del LLM por tenant (FinOps).

## Decisión
Monolito modular para el core (cursos, evaluaciones, RBAC, panel apoderado) + tutor IA desacoplado como función serverless, expuesto vía API interna.

## Consecuencias

### Qué se gana
- El tutor IA escala solo, sin sobredimensionar el monolito.
- Costo de LLM medible y optimizable por tenant (FinOps).
- Aísla el componente de mayor riesgo.

### Qué se pierde / riesgos a mitigar
- Dos runtimes: exige un contrato de API estable entre ambos.
- Cold starts del proveedor serverless afectan la latencia.
- Requiere disciplina de módulos: si el monolito no es modular, se acopla igual.

## Alternativas descartadas
- **Microservicios completos desde día 0:** complejidad operacional (service mesh, múltiples pipelines, tracing distribuido) injustificada para el tamaño del equipo. Ningún bounded context aparte del tutor IA necesita escalar por separado.
- **Monolito sin desacoplar:** el tutor IA compite por recursos con el resto de la app en los picos de pruebas, impide medir el costo del LLM por tenant y una falla del proveedor LLM degradaría todo el sistema.
- **Event-driven completo:** añade trazabilidad compleja, consistencia eventual e idempotencia a flujos mayormente síncronos y simples (login, CRUD de cursos, RBAC). Es sobre-ingeniería para el alcance del MVP.
