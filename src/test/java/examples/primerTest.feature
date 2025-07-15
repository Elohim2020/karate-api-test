Feature: Mi primer Test
  Background:
    * url 'https://jsonplaceholder.typicode.com/posts'


  Scenario: Obtener un usuario
    When method get
    Then status 200
    And match response.name == 'Leanne Graham'

  Scenario: Obtener un usuario, email y compañia
    When method get
    Then status 200
    And match response.name == 'Leanne Graham'
    And match response.email == 'Sincere@april.biz'
    And match response.company.name == 'Romaguera-Crona'

  Scenario: Crear post con cuerpo inline
    * def nuevoPost =
      """
      {
        "title": "Hola mundo",
        "body": "Este es mi primer post",
        "userId": 1
      }
      """
    And request nuevoPost
    When method post
    Then status 201
    And match response.title == 'Hola mundo'
    And match response.userId == 1


  Scenario: Crear un post desde un JSON
    * def nuevoPost = read('classpath:examples/data/nuevo-post.json')
    And request nuevoPost
    When method post
    Then status 201
    And match response.title == 'Post desde archivo'

  Scenario:actualizar un post existente
    * def actualizacion =
      """
      {
        "id": 1,
        "title": "Título actualizado desde Karate",
        "body": "Este es un cambio completo",
        "userId": 1
      }
      """
    Given path 1
    And request actualizacion
    When method put
    Then status 200
    And match response.title == 'Título actualizado desde Karate'

  Scenario: eliminar un post con DELETE
    Given path 1
    When method delete
    Then status 200