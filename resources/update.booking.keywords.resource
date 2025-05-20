*** Settings ***
Library    RequestsLibrary
Resource   variables.resource

*** Keywords ***
Atualizar reserva
    [Arguments]     ${ID}    ${token}    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkin}    ${checkout}    ${additionalneeds}   
    ${bookingdates}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}   
    
    ${body}=    Create Dictionary    
    ...    firstname=${firstname}  
    ...    lastname=${lastname}    
    ...    totalprice=${totalprice}    
    ...    depositpaid=${depositpaid}    
    ...    bookingdates=${bookingdates}   
    ...    additionalneeds=${additionalneeds}

    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${res}=    PUT  url=${HOST}/${BOOKING}/${ID}    json=${body}    headers=${headers}    expected_status=any
    Set Suite Variable    ${res}        


Atualizar reserva com formato errado
    [Arguments]     ${ID}    ${token}    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${additionalneeds} 
    ${body}=    Create Dictionary    
    ...    firstname=${firstname}  
    ...    lastname=${lastname}    
    ...    totalprice=${totalprice}    
    ...    depositpaid=${depositpaid}      
    ...    additionalneeds=${additionalneeds}
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${res}=    PUT  url=${HOST}/${BOOKING}/${ID}    json=${body}    headers=${headers}    expected_status=any
    Set Suite Variable    ${res} 