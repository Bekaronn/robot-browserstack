*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/KeywordsFile.robot
Resource        ../resources/TestCases.robot
Test Setup      Execute test
Test Teardown   Close Session


*** Variables ***
${website_url}=     https://www.wikipedia.org
&{test_caps}        browser=chrome
${search_term}=     python

*** Keywords ***
Execute test
    Open Session    ${test_caps}    ${website_url}


*** Test Cases ***
Check Wikipedia Homepage Test 1
    Check Wikipedia Homepage

Search Term In Wikipedia Test 2
    Search And Verify Term    ${search_term}