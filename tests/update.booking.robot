*** Settings ***
Library    Collections
Resource    ../resources/variables.resource
Resource    ../resources/update.booking.keywords.resource
Resource    ../resources/auth.keywords.resource
Resource    ../resources/find.booking.keywords.resource

*** Test Cases ***
Cenário 1: Atualizar reserva
    Fazer Login com sucesso    admin    password123
    Buscar todas as reservas
    ${ID}=    Get From Dictionary    ${response.json()[0]}    bookingid
    Atualizar reserva    ${ID}    ${TOKEN}    nameQA    engineer    100    true    2025-05-20    2025-05-30    Breakfast  
    Should Not Be Empty    ${res.json()} 
    Status Should Be  200 

Cenário 2: Atualizar reserva com token inválido
    Buscar todas as reservas
    ${ID}=    Get From Dictionary    ${response.json()[0]}    bookingid
    Atualizar reserva    ${ID}    9999999    nameQA    engineer    100    true    2025-05-20    2025-05-30    Breakfast  
    Status Should Be  403  ${res}


Cenário 3: Atualizar reserva com formato errado
    Fazer Login com sucesso    admin    password123
    Buscar todas as reservas
    ${ID}=    Get From Dictionary    ${response.json()[0]}    bookingid
    Atualizar reserva com formato errado  ${ID}    ${TOKEN}    nameQA    engineer    100    true    Breakfast  
    Status Should Be  400  ${res}            