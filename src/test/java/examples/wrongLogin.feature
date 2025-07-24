Feature: Escenarios negativos - API GoRest
  Scenario: crear un usuario sin email(error 422 esperado)
   * def token = 'Bearer d7b79b79f795cab4326e2e134dfb44d2fc450a23e94a6e7ad9233e9c066acbf4'
   * def body =
    """
    {
      name: 'Elohim QA',
      gender: 'male',
      status: 'active'
    }
    """
    Given url "https://gorest.co.in/public/v2/users"
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 422
    And match response[0].field == 'email'
    And match response[0].message contains "can't be blank"

  Scenario: Intentar crear usuario con token inválido
  * def token = 'Bearer TOKEN_INVALIDO'
  * def body =
    """
    {
      name: 'Elohim QA',
      gender: 'male',
      status: 'active',
      email: 'qainvalido@gmail.com'
    }
    """
    Given url 'https://gorest.co.in/public/v2/users'
    And header Authorization = token
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 401
    And match response.message contains 'Invalid token'