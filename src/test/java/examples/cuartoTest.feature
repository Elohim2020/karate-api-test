Feature: Pruebas negativas sobre endpoints de usuario
  Scenario: Consultar un usuario inexistente(error 404)
    Given url 'https://jsonplaceholder.typicode.com/users/9999'
    When method get
    Then status 404

  Scenario: Error al validar un solo objeto contra una lista
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request {}
    When method get
    Then status 200
    And match response == {id: '#number'}

  Scenario: Consultar un recurso inexistente y validar el mensaje
    Given url 'https://jsonplaceholder.typicode.com/invalid-endpoint'
    When method get
    Then status 404


