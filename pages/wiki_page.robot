*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    BuiltIn
Library    JSONLibrary
Resource   ../data/data.robot

*** Keywords ***
Open Homepage
   
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    ${args}=    Create List
    ...    --window-size=1920,1080
    ...    --start-maximized
    ...    --no-sandbox
    ...    --disable-dev-shm-usage
    ...    --disable-gpu
    ...    --disable-software-rasterizer
    ...    --remote-debugging-port=9222
    ...    --disable-extensions
    ...    --disable-setuid-sandbox
    FOR    ${arg}    IN    @{args}
        Call Method    ${chrome_options}    add_argument    ${arg}
    END
    Open Browser    ${URL}    ${BROWSER}    options=${chrome_options}
    Wait Until Page Contains    Wikipedia    timeout=10s
Load json data
    ${data}=    Load Json From File    ../data/data.json
    RETURN    ${data}

Search
    [Arguments]    ${query}
    Wait Until Element Is Visible    xpath=//input[@id='searchInput']    timeout=10s
    Clear Element Text    xpath=//input[@id='searchInput']
    Input Text    xpath=//input[@id='searchInput']    ${query}
    Wait Until Element Is Enabled    xpath=//*[@id="search-form"]/fieldset/button    timeout=10s
    Click Button    xpath=//*[@id="search-form"]/fieldset/button

Empty Search
    Wait Until Element Is Enabled    xpath=//*[@id="search-form"]/fieldset/button    timeout=10s
    Click Button    xpath=//*[@id="search-form"]/fieldset/button
    Wait Until Page Contains    Search    timeout=10s

Language Selection
    Wait Until Element Is Visible    xpath=//input[@id='searchInput']    timeout=10s
    Input Text    xpath=//input[@id='searchInput']    Pizza
    Select From List By Value    id=searchLanguage    da
    Wait Until Element Is Enabled    xpath=//*[@id="search-form"]/fieldset/button
    Click Button    xpath=//*[@id="search-form"]/fieldset/button
    Wait Until Page Contains    Pizza    timeout=10s
