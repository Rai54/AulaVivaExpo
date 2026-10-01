# Selección de servicios gestionados por servidor (C4L2) - AulaViva

Este documento trata la selección de 4 servicios gestionados Cloud Managed Services que darán soporte a los contenedores definidos en el nivel L2 del modelo C4 para la plataforma "AulaViva". 

La eleccion de estos servicios se basa en tres criterios fundamentales del proyecto:
Seguridad y Privacidad (PII): Cumplimiento de normativa de datos de menores de edad mediante aislamiento y encriptación nativa.
Escalabilidad Estacional: Capacidad de absorber picos de tráfico en horario escolar y reducir capacidad en horas inactivas.
FinOps: Reducir costos fijos de infraestructura.

---

## Tabla de servicios seleccionados

| Contenedor C4 L2 | Servicio Gestionado Elegido | Criterio Principal de Selección |
| :--- | :--- | :--- |
| **1. Core API (Monolito Modular)** | **AWS ECS Fargate** (o GCP Cloud Run) | Computo en contenedores sin admin. de servidores (*Serverless Containers*), escala según el horario escolar. |
| **2. Base de Datos Multi-tenant** | **AWS Aurora PostgreSQL Serverless** | BD relacional gestionada con escalado automático y aislamiento por tenant mediante Row Level Security (RLS). |
| **3. Pipeline RAG / Tutor IA** | **AWS Lambda** (o GCP Cloud Functions) | Orquestación serverless (FaaS) que escala a cero ($0 costo en noches, fines de semana y vacaciones) y funciona como sandbox de seguridad. |
| **4. Almacenamiento Vectorial y Caché** | **Amazon ElastiCache for Redis** | Reducción de costos en tokens de LLM mediante caching de preguntas frecuentes y respuesta rápida sub-milisegundo. |

---

## Justificación Detallada por Servicio

### Cómputo del core academic: AWS ECS Fargate
Contenedor C4 L2: API core Monolito Modular (Gestion del colegio)
Criterio de Selección:
  * **Sin gestión de infraestructura:** Elimina la necesidad de mantener, y ajustar maquinas virtuales con EC2, lo que da al equipo enfocarse en el software educativo.
  * **Escalado Automático por Métricas:** Configura de reglas para aumentar la cantidad de contenedores a la hora cuando se inician las clases y reducirlos drásticamente al finalizar la jornada.

### Base de datos relacional: AWS Aurora PostgreSQL Serverless
* Contenedor C4 L2: Relational Database (multi-tenant).
* Criterio de Selección:
  * Aislamiento Multi-tenant y Seguridad: Soporte nativo para *Row Level Security* (RLS), garantizando la separación lógica estricta de datos entre colegios.
  * Encriptación y Respaldos Automatizados: Encriptación de datos en reposo (KMS) y respaldos continuos para cumplir con la normativa chilena sobre protección de datos de menores.
  * Ajuste Dinámico de Capacidad: Ajusta la memoria y CPU en tiempo real según el volumen de transacciones sin interrumpir el servicio.

### Orquestador de IA: AWS Lambda (Serverless FaaS)
* Contenedor C4 L2: Tutor IA & Prompt Middleware.
* Criterio de Selección:
  * Modelo FinOps Estricto Se paga únicamente por los milisegundos que toma procesar la consulta del estudiante hacia el LLM. 
  * Aislamiento de Privacidad (PII Proxy):** Funciona como una capa intermedia aislada que intercepta las dudas del alumno, remueve nombres o rut antes de llamar a la API.

### Caché de prompts y Embeddings: Amazon ElastiCache for Redis
* Contenedor C4 L2 Vector Search y Prompt Cache.
* Criterio de Selección
  * Optimización de Costos de IA (FinOps): Guarda las respuestas a las preguntas más frecuentes del MINEDUC. Si otro estudiante pregunta lo mismo, se responde desde la caché sin consumir tokens en el LLM externo.
  * Baja Latencia: Entrega respuestas en tiempo real (sub-milisegundos) para no saturar la experiencia de usuario de los estudiantes.
