# C4 Nivel 1 - Diagrama de Contexto AulaViva

## Objetivo

El diagrama C4 Nivel 1 representa una visión general del sistema AulaViva, identificando los usuarios principales, el sistema central y las integraciones externas necesarias para su funcionamiento.

---

# Sistema principal

## AulaViva

AulaViva es una plataforma educativa SaaS multi-tenant orientada a colegios de la Región Metropolitana.

El sistema permite:

- Gestión académica de cursos.
- Evaluaciones automáticas con retroalimentación.
- Tutor IA basado en contenidos educativos.
- Seguimiento del avance académico.
- Aislamiento lógico de información entre colegios.

---

# Actores del sistema

## Estudiante

Utiliza AulaViva para:

- Consultar contenidos educativos.
- Realizar preguntas al Tutor IA.
- Resolver evaluaciones.
- Recibir retroalimentación sobre su desempeño.

---

## Docente

Utiliza AulaViva para:

- Administrar cursos.
- Gestionar estudiantes.
- Crear evaluaciones.
- Revisar resultados académicos.

---

## Apoderado

Utiliza AulaViva para:

- Consultar el avance académico del estudiante.
- Revisar calificaciones.
- Realizar seguimiento del proceso educativo.

---

## Coordinador académico

Utiliza AulaViva para:

- Administrar la configuración del colegio.
- Gestionar el tenant institucional.
- Garantizar el aislamiento de información.

---

# Sistemas externos

## MINEDUC

Sistema externo utilizado como referencia curricular.

Su relación con AulaViva permite:

- Alinear contenidos educativos.
- Mantener coherencia con los lineamientos curriculares vigentes.

---

## Proveedor LLM

Servicio externo utilizado para entregar capacidades de inteligencia artificial al Tutor IA.

Su función es:

- Procesar consultas realizadas por estudiantes.
- Generar respuestas utilizando modelos de lenguaje.
- Permitir la integración de inteligencia artificial sin desarrollar un modelo propio.

---

# Relación entre componentes

```
                 MINEDUC
                    |
                    |
          Referencia curricular
                    |
                    ↓

Estudiante ────────┐
                   |
Docente ───────────┤
                   |
Apoderado ─────────┤──────> AulaViva <────── Proveedor LLM
                   |          SaaS              Modelo IA
Coordinador ───────┘
Académico
```

---

# Relación con ADR

La integración del Proveedor LLM está relacionada con la decisión arquitectónica definida en el ADR del proyecto.

La decisión consiste en desacoplar el Tutor IA del núcleo principal de AulaViva mediante un servicio externo especializado.

Esto permite:

- Mantener separado el componente de inteligencia artificial.
- Facilitar futuros cambios de proveedor.
- Escalar el servicio según la demanda.
- Evitar que una dependencia externa afecte todo el sistema.

Por esta razón, en el diagrama C4 Nivel 1 el Tutor IA aparece como una funcionalidad propia de AulaViva, pero conectada a un sistema externo encargado del procesamiento del lenguaje.

---

# Resumen

El diagrama C4 Nivel 1 permite entender cómo AulaViva interactúa con sus usuarios y servicios externos, mostrando el sistema desde una perspectiva general antes de profundizar en componentes internos.
