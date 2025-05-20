*** Settings ***
Library    Collections
Resource    ../resources/variables.resource
Resource    ../resources/created.booking.keywords.resource

*** Test Cases ***
Cenário 1: Criar reserva
    Criar nova reserva    nameQA    engineer    100    true    2025-05-20    2025-05-30    Breakfast    
    Should Not Be Empty    ${response.json()} 
    Status Should Be  200    

Cenário 2: Tentar criar reserva com body errado
    Criar nova reserva com body inválido    QA    100    false    Breakfast    
    Status Should Be  500    

Cenário 3: Tentar criar reserva com check in retroativo
    Criar nova reserva    nameQA    engineer    100    true    2024-05-20    2024-05-30    Breakfast    
    Should Not Be Empty    ${response.json()} 
    Status Should Be  400    

Cenário 4: Tentar criar com checkout inferior ao check in
    Criar nova reserva    nameQA    engineer    100    true    2025-05-20    2025-05-01    Breakfast    
    Should Not Be Empty    ${response.json()} 
    Status Should Be  400    

Cenário 5: Tentar criar reserva com preço negativo
    Criar nova reserva    nameQA    engineer    -350    false    2025-05-20    2025-05-30    Breakfast    
    Should Not Be Empty    ${response.json()} 
    Status Should Be  400    

Cenário 6: Tentar criar reserva com preço em formato inválido
    Criar nova reserva    nameQA    engineer    precoInvalido    false    2025-05-20    2025-05-30    Breakfast    
    Should Not Be Empty    ${response.json()} 
    Status Should Be  400    
