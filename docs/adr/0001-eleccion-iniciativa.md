# ADR-0001: Elección de iniciativa — AulaViva

## Título

Elección de iniciativa: AulaViva

## Contexto

El equipo debía seleccionar una iniciativa para desarrollar durante el taller.

AulaViva es una plataforma SaaS multi-tenant orientada al aprendizaje, que busca ofrecer a colegios herramientas para gestionar cursos, docentes y estudiantes, realizar evaluaciones automáticas y utilizar un tutor IA con contexto curricular.

El proyecto presenta desafíos técnicos relacionados con multi-tenancy, seguridad, privacidad de datos, inteligencia artificial, escalabilidad y costos.

## Decisión

El equipo decidió desarrollar AulaViva por consenso.

La iniciativa fue seleccionada debido a su alcance, los desafíos técnicos que presenta y la posibilidad de aplicar conocimientos de arquitectura, desarrollo, seguridad, inteligencia artificial y calidad de software.

## Consecuencias

### Positivas

- Permite trabajar con una arquitectura multi-tenant.
- Permite incorporar inteligencia artificial mediante RAG.
- Permite aplicar prácticas de seguridad y DevSecOps.
- Permite desarrollar funcionalidades para distintos tipos de usuarios.
- Presenta desafíos de escalabilidad y optimización de costos.

### Negativas

- El proyecto tiene una mayor complejidad técnica.
- Se deben considerar medidas especiales para proteger los datos de menores.
- El uso de modelos de IA puede generar costos.
- Se requiere controlar correctamente el aislamiento de información entre colegios.

## Fecha

2026-08-21

## Autores

- Christine Maulen
- Diego Silva
- Carlos Ramos
-Raimundo Bobillier
