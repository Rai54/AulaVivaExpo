# Backlog - AulaViva

## Objetivo

Modernizar la experiencia de aprendizaje mediante una plataforma SaaS multi-tenant para colegios de la Región Metropolitana, incorporando tutor IA con contexto curricular, evaluaciones automáticas y seguimiento académico personalizado.

---

# 1. US-01: Tutor IA con contexto curricular

**Actor (Impact Map):** Estudiante

**Priorización MoSCoW:** Must Have

**Historia de Usuario (Formato INVEST):**

Como estudiante, quiero consultar un tutor IA basado en los contenidos de mi curso, para resolver dudas de forma inmediata y personalizada.

## Escenario 1: Consulta exitosa

```gherkin
Given el estudiante tiene acceso a los contenidos del curso

When realiza una pregunta relacionada con la materia

Then el tutor IA busca información mediante RAG

And responde utilizando el material del curso
```

## Escenario 2: Consulta fuera de contexto curricular

```gherkin
Given el estudiante realiza una pregunta no relacionada con el contenido del curso

When el tutor IA no encuentra información suficiente

Then informa que no posee contenido para responder

And recomienda consultar directamente al docente
```

## Escenario 3: Servicio de tutor IA no disponible

```gherkin
Given el estudiante realiza una consulta al tutor IA

When el servicio de inteligencia artificial no responde

Then el sistema informa que el tutor no está disponible temporalmente

And registra el fallo para revisión posterior
```

---

# 2. US-02: Evaluaciones automáticas con feedback

**Actor (Impact Map):** Estudiante

**Priorización MoSCoW:** Must Have

**Historia de Usuario (Formato INVEST):**

Como estudiante, quiero recibir corrección automática y retroalimentación de mis evaluaciones, para conocer mi rendimiento sin esperar la revisión manual del docente.

## Escenario 1: Corrección exitosa

```gherkin
Given el estudiante finalizó una evaluación

When envía sus respuestas

Then el sistema corrige automáticamente

And entrega la calificación obtenida junto con retroalimentación
```

## Escenario 2: Preguntas no autocorregibles

```gherkin
Given la evaluación contiene preguntas abiertas

When el sistema no puede corregir automáticamente una respuesta

Then marca la pregunta como pendiente de revisión docente

And entrega los resultados disponibles
```

## Escenario 3: Error del motor de corrección

```gherkin
Given el estudiante envió una evaluación

When ocurre un error durante la corrección automática

Then el sistema informa que la corrección está temporalmente pendiente

And notifica al docente para revisión
```

---

# 3. US-03: Gestión académica con control de roles (RBAC)

**Actor (Impact Map):** Docente

**Priorización MoSCoW:** Must Have

**Historia de Usuario (Formato INVEST):**

Como docente, quiero gestionar cursos y estudiantes según mis permisos, para mantener organizada la información académica dentro de mi colegio.

## Escenario 1: Gestión correcta de cursos

```gherkin
Given el docente tiene permisos dentro de su colegio

When crea o modifica un curso

Then el sistema guarda los cambios correctamente

And los estudiantes acceden solamente a los cursos asignados
```

## Escenario 2: Intento de acceso no autorizado

```gherkin
Given el docente pertenece a un colegio determinado

When intenta acceder a información de otro colegio

Then el sistema bloquea el acceso

And registra el intento por seguridad
```

## Escenario 3: Permisos insuficientes

```gherkin
Given el docente no posee permisos administrativos

When intenta realizar una acción restringida

Then el sistema rechaza la operación

And muestra un mensaje indicando falta de permisos
```

---

# 4. US-04: Seguimiento académico del apoderado

**Actor (Impact Map):** Apoderado

**Priorización MoSCoW:** Should Have

**Historia de Usuario (Formato INVEST):**

Como apoderado, quiero visualizar el avance académico de mi pupilo, para acompañar oportunamente su proceso de aprendizaje.

## Escenario 1: Consulta exitosa del progreso

```gherkin
Given el apoderado tiene un estudiante asociado

When ingresa al panel académico

Then visualiza calificaciones y avances del estudiante

And puede revisar evaluaciones recientes
```

## Escenario 2: Estudiante sin información académica

```gherkin
Given el estudiante está asociado al apoderado

When no existen evaluaciones registradas

Then el sistema muestra que no hay información disponible

And evita mostrar datos incorrectos
```

## Escenario 3: Error al cargar información

```gherkin
Given el apoderado accede al panel académico

When ocurre un error al recuperar los datos

Then el sistema informa que la información no está disponible temporalmente

And registra el incidente
```

---

# 5. US-05: Arquitectura multi-tenant y aislamiento de datos

**Actor (Impact Map):** Coordinador académico

**Priorización MoSCoW:** Must Have

**Historia de Usuario (Formato INVEST):**

Como coordinador académico, quiero que la información de mi colegio esté aislada de otros colegios, para garantizar privacidad y seguridad de los datos.

## Escenario 1: Acceso correcto al tenant

```gherkin
Given un usuario pertenece a un colegio determinado

When ingresa a la plataforma

Then visualiza solamente información correspondiente a su colegio
```

## Escenario 2: Intento de acceso entre colegios

```gherkin
Given existen múltiples colegios registrados

When un usuario intenta acceder a información de otro colegio

Then el sistema bloquea el acceso

And protege los datos institucionales
```

## Escenario 3: Fallo en aislamiento de datos

```gherkin
Given existe un error en la configuración del tenant

When el sistema detecta un posible cruce de información

Then bloquea la operación afectada

And genera una alerta de seguridad
```

---

# Priorización MoSCoW

| Historia | Prioridad | Justificación |
|---|---|---|
| US-01 | Must Have | Es el elemento diferenciador de AulaViva mediante tutor IA personalizado. |
| US-02 | Must Have | Permite automatizar evaluaciones y entregar feedback inmediato. |
| US-03 | Must Have | Es necesario para la administración académica de cada colegio. |
| US-04 | Should Have | Permite involucrar al apoderado en el proceso educativo. |
| US-05 | Must Have | Garantiza seguridad y privacidad mediante arquitectura multi-tenant. |
