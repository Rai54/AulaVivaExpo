@GestionAcademica
@US03
Feature: Gestión de cursos, docentes y estudiantes con RBAC

  # Historia de usuario:
  # Como docente,
  # quiero gestionar cursos y estudiantes según mis permisos,
  # para mantener organizada la información académica dentro de mi colegio.


  @Success
  Scenario: Gestión correcta de cursos y estudiantes

    Given el docente inició sesión en AulaViva
    And tiene un rol asignado dentro del tenant de su colegio

    When crea o modifica un curso
    And asigna estudiantes al curso

    Then el sistema guarda los cambios correctamente
    And los estudiantes pueden acceder solamente a los cursos asignados



  @Security
  Scenario: Intento de acceso a información de otro tenant

    Given el docente pertenece al tenant de un colegio determinado

    When intenta acceder a información académica de otro colegio

    Then el sistema bloquea el acceso
    And registra el intento de acceso no autorizado
    And mantiene el aislamiento de datos entre colegios



  @Authorization
  Scenario: Usuario con permisos insuficientes intenta modificar información restringida

    Given el docente no posee permisos de administrador del curso

    When intenta eliminar un curso completo

    Then el sistema rechaza la operación
    And informa que no cuenta con permisos suficientes
    And mantiene la integridad de la información académica
