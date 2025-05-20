*** Settings ***
Library    RequestsLibrary
Resource   variables.resource

*** Keywords ***
deletar reserva
    [Arguments]     ${ID}    ${token}   
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${response}=    DELETE  url=${HOST}/${BOOKING}/${ID}    headers=${headers}    expected_status=any
    Set Suite Variable    ${response}        

