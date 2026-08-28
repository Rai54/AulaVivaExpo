@SeguimientoAcademico
@US04
Feature: Panel del apoderado con seguimiento de avance

  # Historia de usuario:
  # Como apoderado,
  # quiero visualizar el avance académico de mi pupilo,
  # para acompañar oportunamente su proceso de aprendizaje.


  @Success
  Scenario: Consulta exitosa del avance académico

    Given el apoderado inició sesión en AulaViva
    And tiene un estudiante vinculado a su cuenta

    When accede al panel de seguimiento académico

    Then el sistema muestra las calificaciones del estudiante
    And permite visualizar el avance por curso
    And muestra el detalle de evaluaciones recientes



  @Validation
  Scenario: Apoderado sin estudiantes asociados

    Given el apoderado inició sesión en AulaViva

    When no tiene ningún estudiante vinculado a su cuenta

    Then el sistema muestra un estado indicando que no existen pupilos asociados
    And recomienda contactar al colegio para realizar la vinculación



  @ErrorHandling
  Scenario: Error al cargar información académica

    Given el apoderado accede al panel de seguimiento

    When el sistema no puede recuperar los datos académicos del estudiante

    Then informa que la información no está disponible temporalmente
    And registra el error para una revisión posterior
