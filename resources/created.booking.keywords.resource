*** Settings ***
Library    RequestsLibrary
Resource   variables.resource

*** Keywords ***
Criar nova reserva
    [Arguments]     ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkin}    ${checkout}    ${additionalneeds}   
    ${bookingdates}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}  
    ${body}=    Create Dictionary    
    ...    firstname=${firstname}  
    ...    lastname=${lastname}    
    ...    totalprice=${totalprice}    
    ...    depositpaid=${depositpaid}    
    ...    bookingdates=${bookingdates}   
    ...    additionalneeds=${additionalneeds}
    ${response}=    POST  url=${HOST}/${BOOKING}    json=${body}
    Set Suite Variable    ${response}        

Criar nova reserva com body inválido
    [Arguments]     ${firstname}    ${totalprice}    ${depositpaid}    ${additionalneeds}
    ${body}=    Create Dictionary    
    ...    firstname=${firstname}     
    ...    totalprice=${totalprice}    
    ...    depositpaid=${depositpaid}    
    ...    additionalneeds=${additionalneeds}
    ${response}=    POST  url=${HOST}/${BOOKING}    json=${body}    expected_status=any
    Set Suite Variable    ${response}     
      

      