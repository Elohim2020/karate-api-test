Feature: Crear usuario en GO REST
  Scenario: Crear nuevo usuario
  * def token = 'Bearer d7b79b79f795cab4326e2e134dfb44d2fc450a23e94a6e7ad9233e9c066acbf4'

  * def body =
    """
    {
    "name": "Elohim QA",
    "gender": "male",
    "email": "elo qa." + java.util.UUID.randomUUID() + "@mail.com",
    "status": "active"
    }
    """
    Given url "https://gorest.co.in/public/v2/users"
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 201
    And match response.name == 'Elohim QA'
    And match response.gender == 'male'
    And match response.status == 'active'
    And match response.mail contains '@mail.com'