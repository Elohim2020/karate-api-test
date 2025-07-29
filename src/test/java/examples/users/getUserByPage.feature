Feature: Obtener usuarios por página

  Scenario: Obtener usuarios por número de página
    Given url 'https://gorest.co.in/public/v2/users?page=' + page
    When method get
    Then status 200
