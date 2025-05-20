*** Settings ***
Library    RequestsLibrary
Resource   variables.resource

*** Keywords *** 
Fazer login com sucesso
    [Arguments]    ${username}    ${password}
    ${body}=    Create Dictionary    username=${username}    password=${password}
    ${response}=     POST    ${HOST}/${AUTH_ENDPOINT}    data=${body}
    ${TOKEN}=    Get From Dictionary    ${response.json()}    token
    Set Suite Variable    ${TOKEN}

Tentar login com dados errados
    [Arguments]    ${username}    ${password}
    ${body}=    Create Dictionary    username=${username}    password=${password}
    ${response}=     POST    ${HOST}/${AUTH_ENDPOINT}    data=${body}
    Set Suite Variable    ${response}    
