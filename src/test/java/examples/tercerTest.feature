Feature: Declaración y reutilización de variables

  Scenario: Declaración de variables
    * def userId = 1
    * def endpoint = 'https://jsonplaceholder.typicode.com/users/'+ userId

    Given url endpoint
    When method get
    Then status 200
    And match response.id == userId

  Scenario: Validacion con match contains
   * def usersId = [1, 5, 10]
    * match usersId contains 1
    * match usersId contains any [1, 5]
    * match usersId contains only [1, 5, 10]
    * def endpoint = 'https://jsonplaceholder.typicode.com/users/'

    Given url endpoint
    When method get
    Then status 200
    * def responseIds = get response[*].id
    * match responseIds contains 1

  Scenario: Validar que todos los IDs sean mayores a 0
    Given url 'https://jsonplaceholder.typicode.com/users'
    When method get
    Then status 200
    * def responseIds = get response[*].id
    * match each responseIds == "#? _ > 0"

  Scenario: Validar estructura de usuarios
    Given url 'https://jsonplaceholder.typicode.com/users'
    When method get
    Then status 200
    * match each response contains deep
      """
      {
        id: '#number',
        name: '#string',
        username: '#string',
        email: '#string',
        address: {
          street: '#string',
          city: '#string'
        }
      }
      """


