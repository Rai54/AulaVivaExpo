Feature: Consulta al tutor IA con contexto curricular

  Scenario: Consulta exitosa al tutor IA

    Given el estudiante inició sesión en AulaViva
    And tiene acceso a un curso con contenidos disponibles

    When realiza una pregunta relacionada con la materia

    Then el sistema procesa la consulta utilizando los contenidos del curso
    And genera una respuesta basada en el material disponible
    And la respuesta se ajusta al currículum vigente de MINEDUC


  Scenario: Pregunta fuera del contexto curricular

    Given el estudiante utiliza el tutor IA dentro de un curso

    When realiza una pregunta no relacionada con los contenidos disponibles

    Then el sistema informa que no existe información suficiente para responder
    And recomienda consultar directamente al docente


  Scenario: Servicio de tutor IA no disponible

    Given el estudiante envía una consulta al tutor IA

    When ocurre una falla en el servicio de inteligencia artificial

    Then el sistema informa que el tutor no está disponible temporalmente
    And registra el incidente para su posterior revisión
