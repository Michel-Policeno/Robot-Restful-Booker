*** Settings ***
Library    Collections
Resource    ../resources/variables.resource
Resource    ../resources/delete.booking.keywords.resource
Resource    ../resources/auth.keywords.resource
Resource    ../resources/find.booking.keywords.resource

*** Test Cases ***
Cenário 1: Deletar reserva
    Fazer Login com sucesso    admin    password123
    Buscar todas as reservas
    ${ID}=    Get From Dictionary    ${response.json()[0]}    bookingid
    deletar reserva    ${ID}    ${TOKEN} 
    Status Should Be  201

Cenário 2: Deletar reserva com Token inválido
    Buscar todas as reservas
    ${ID}=    Get From Dictionary    ${response.json()[0]}    bookingid
    deletar reserva    ${ID}    tokenInvalido
    Status Should Be  403

Cenário 3: Deletar reserva com Id inexistente
    Fazer Login com sucesso    admin    password123
    deletar reserva    0000    ${TOKEN} 
    Status Should Be  405