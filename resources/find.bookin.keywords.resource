*** Settings ***
Library    RequestsLibrary
Resource   variables.resource

*** Keywords ***
Buscar todas as reservas
    ${response}=    GET  ${HOST}/${BOOKING}
    Set Suite Variable    ${response} 
       
Buscar reservas por firstname
    [Arguments]    ${firstname}    
    GET  url=${HOST}/${BOOKING}  params= ${firstname}

Buscar reservas por check in
    [Arguments]    ${checkin}    
    GET  url=${HOST}/${BOOKING}  params= ${checkin}   

Buscar reservas por checkout
    [Arguments]    ${checkout}    
    GET  url=${HOST}/${BOOKING}  params= ${checkout}  

Buscar reservas por ID
    [Arguments]    ${ID}   
    GET  url=${HOST}/${BOOKING}/${ID}
       
         



Fazer Login com Sucesso
    [Arguments]    ${username}    ${password}
    ${body}=    Create Dictionary    username=${username}    password=${password}
    POST    booking    /${AUTH_ENDPOINT}    data=${body}