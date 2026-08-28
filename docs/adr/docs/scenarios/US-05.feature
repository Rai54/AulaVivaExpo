@MultiTenant
@US05
Feature: Aislamiento y configuración multi-tenant del colegio

  # Historia de usuario:
  # Como coordinador académico,
  # quiero que la información de mi colegio esté aislada de otros colegios,
  # para garantizar privacidad, seguridad y personalización dentro de mi tenant.


  @Success
  Scenario: Configuración correcta del tenant del colegio

    Given el coordinador académico inició sesión en AulaViva
    And pertenece al tenant de su colegio

    When configura los parámetros institucionales del colegio

    Then el sistema guarda la configuración correctamente
    And aplica los cambios únicamente dentro de su tenant
    And mantiene los datos aislados de otros colegios



  @Performance
  Scenario: Alta demanda de múltiples tenants durante evaluaciones

    Given existen múltiples colegios utilizando AulaViva simultáneamente
    And los usuarios generan un alto volumen de solicitudes

    When la demanda supera la capacidad normal del sistema

    Then la plataforma escala los recursos disponibles
    And mantiene el rendimiento de cada tenant
    And conserva el aislamiento de información entre colegios



  @Security
  Scenario: Fallo en el aislamiento de datos entre colegios

    Given existe un error en la configuración del tenant

    When el sistema detecta un posible acceso cruzado de información

    Then bloquea la operación afectada inmediatamente
    And evita la exposición de datos entre colegios
    And genera una alerta para el equipo de soporte
