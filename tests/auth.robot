*** Settings ***
Library    Collections
Resource    ../resources/variables.resource
Resource    ../resources/auth.keywords.resource

*** Test Cases ***
Cenário 1: Login com sucesso
    Fazer Login com sucesso    admin    password123  

Cenário 2: Login com usuario errado
    Fazer Login com dados errados    userErrado    password123  
    ${reason}=    Get From Dictionary    ${response.json()}    reason   
    Should Be Equal    ${reason}    Bad credentials

Cenário 3: Login com senha errado     
    Fazer Login com dados errados    admin    SenhaErrada 
    ${reason}=    Get From Dictionary    ${response.json()}    reason   
    Should Be Equal    ${reason}    Bad credentials
