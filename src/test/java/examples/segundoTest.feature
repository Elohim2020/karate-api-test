Feature: Mi primer test outline
  Background:
    * url 'https://jsonplaceholder.typicode.com/posts'

Scenario Outline: Crear post con distintos datos
  * def nuevoPost =
    """
    {
      "title": "<titulo>",
      "body": "<contenido>",
      "userId": <userId>
    }
    """
  Given request nuevoPost
  When method post
  Then status 201
  And match response.title == '<titulo>'

  Examples:
    | titulo              | contenido                  | userId |
    | Post A              | Contenido del post A       | 1      |
    | Post B              | Contenido del post B       | 2      |
    | Karate es genial    | Probar varias entradas     | 3      |


