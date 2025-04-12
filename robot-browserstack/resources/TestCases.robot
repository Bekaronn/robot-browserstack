*** Settings ***
Library    SeleniumLibrary
Resource    ./KeywordsFile.robot

*** Keywords ***
Check Wikipedia Homepage
    Add Implicit Wait
    Title Should Be    Wikipedia
    Page Should Contain Element    css:select#searchLanguage

Search And Verify Term
    [Arguments]    ${search_term}
    Input Text    id:searchInput    ${search_term}
    Click Button    xpath://button[@type='submit']
    Wait Until Page Contains    ${search_term}    timeout=5s
    Page Should Contain    ${search_term}
    Capture Page Screenshot