*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${remote_url}=    http://localhost:4444/wd/hub

*** Keywords ***
Open Session
    [Arguments]    ${capabilities}    ${test_url}
    open browser    remote_url=${remote_url}    browser=chrome    desired_capabilities=${capabilities}   url=${test_url}

Close Session
    close browser

Add Implicit Wait
    set selenium implicit wait    5