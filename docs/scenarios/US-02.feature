@Evaluaciones
@US02
Feature: Evaluaciones auto-corregidas con feedback

  # Historia de usuario:
  # Como estudiante,
  # quiero recibir corrección automática y retroalimentación de mis evaluaciones,
  # para conocer mi desempeño sin esperar la revisión manual del docente.


  @Success
  Scenario: Evaluación corregida correctamente

    Given el estudiante inició sesión en AulaViva
    And tiene una evaluación disponible dentro de su curso

    When completa y envía la evaluación

    Then el sistema procesa automáticamente sus respuestas
    And muestra la calificación obtenida
    And entrega retroalimentación asociada a cada pregunta



  @PartialReview
  Scenario: Evaluación con preguntas que requieren revisión docente

    Given el estudiante responde una evaluación con preguntas abiertas

    When el sistema no puede corregir automáticamente algunas respuestas

    Then marca esas preguntas como pendientes de revisión docente
    And entrega los resultados disponibles de las preguntas autocorregibles



  @ErrorHandling
  Scenario: Fallo durante el proceso de corrección

    Given el estudiante envió una evaluación completa

    When ocurre un error durante la corrección automática

    Then el sistema informa que la corrección no pudo completarse temporalmente
    And notifica al docente para realizar una revisión manual
    And registra el incidente para una revisión posterior
