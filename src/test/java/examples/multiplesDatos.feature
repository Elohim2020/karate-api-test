Feature: Scenario Outline con mputiples datos
  Scenario Outline: Consultar usuario existente
    Given url 'https://gorest.co.in/public/v2/users/<id>'
    When method get
    Then status 200
    And match response.id == <id>

    Examples:
      | id       |
      | 8037259  |
      | 8037258  |
      | 8037257  |

  Scenario: validar estructura de usuarios en la lista
    Given url 'https://gorest.co.in/public/v2/users?page=1'
    When method get
    Then status 200
    And match each response contains {id: '#number', email: '#string', name: '#string', gender: '#string'}

  Scenario: Recorrer varias páginas de usuarios
    * def pages = [1, 2]
    * def allUsers = []

    * def recorrerPaginas =
      """
      function(page) {
        var result = karate.call('classpath:examples/users/getUserByPage.feature', { page: page });
        allUsers.push(result.response);
      }
      """

    * karate.forEach(pages, recorrerPaginas)

    * print 'Usuarios encontrados:', allUsers


