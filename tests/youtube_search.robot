*** Settings ***
Library    SeleniumLibrary
Resource   ../data/data.robot
Resource   ../pages/wiki_page.robot
Library     JSONLibrary


*** Test Cases ***
check homepage load
    [Documentation]    Verify that a user can search  successfully
    Open Homepage
    Close Browser


check empty
    Open Homepage
    Empty Search
    Close Browser

Language cHECK
    Open Homepage
    Language Selection


