*** Settings ***
Library     SeleniumLibrary
Resource    ../data/data.robot
Resource    ../pages/wiki_page.robot
Library     DataDriver    ../data/Query.xlsx    sheet_name=Sheet1
Suite Setup      Open Homepage
Suite Teardown   Close All Browsers
Test Template    Perform Search

*** Test Cases ***
Search Wikipedia Query    ${searches}

*** Keywords ***
Perform Search
    [Arguments]    ${searches}
    Search    ${searches}
    Wait Until Page Contains    ${searches}  
    Sleep    5s
    Go To    ${URL}
