*** Settings ***
Library    Collections
Resource    ../resources/variables.resource
Resource    ../resources/find.booking.keywords.resource

*** Test Cases ***
Cenário 1: Retornar todas as reservas
    Buscar todas as reservas
    Should Not Be Empty    ${response.json()[0]} 
    Status Should Be  200   
    

Cenário 2: Reservas por nome de existente
    Buscar reservas por firstname  jane
    Should Not Be Empty    ${response.json()[0]}
     Status Should Be  200

Cenário 3: Reservas por nome de inexistente
    Buscar reservas por firstname  nomeInexistente
    Status Should Be  404

Cenário 4: Reservas por data de check in
    Buscar reservas por check in  2025-05-01
    Should Not Be Empty    ${response.json()[0]}
    Status Should Be  200

Cenário 5: Reservas por data de check in inválido
    Buscar reservas por check in  0000-00-00
    Status Should Be  400

Cenário 6: Reservas por data de checkout
    Buscar reservas por checkout  2025-05-01
    Should Not Be Empty    ${response.json()[0]}
    Status Should Be  200

Cenário 7: Reservas por data de checkout inválido
    Buscar reservas por checkout  0000-00-00
    Status Should Be  400

Cenário 8: Reserva por ID
    Buscar todas as reservas 
    ${ID}=    Get From Dictionary    ${response.json()[0]}    bookingid
    Buscar reservas por ID    ${ID}
    Status Should Be    200    ${response} 

Cenário 9: Reserva por ID incorreto
    Buscar reservas por ID    999
    Status Should Be    404    ${response} 

