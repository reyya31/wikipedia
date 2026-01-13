*** Settings ***
Library    SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     JSONLibrary
Resource   ../data/data.robot
Resource   ../pages/wiki_page.robot

*** Test Cases ***
Search
    ${data}=    Load Json From File    ${CURDIR}/../data/data.json
    Open Homepage
    FOR    ${item}   IN    @{data["searches"]}
        ${query}=       Get From Dictionary    ${item}    query
        Search    ${query}
        Go To    ${URL}
         
    END
    Close Browser



