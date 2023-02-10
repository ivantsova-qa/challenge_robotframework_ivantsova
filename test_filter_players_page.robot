*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//button[@type='submit']
${EMAILFIELD}       xpath=//*[@id='login']
${PASSWORDFIELD}        xpath=//*[@id='password']
${PlAYERSBUTTON}        xpath=//ul[1]/div[2]
${FILTERBUTTON}     xpath=//*[@title="Filter Table"]
${FILTERNAMEFIELD}      xpath=//*/label [text() = "Name"]/parent::div/div/input
${FILTERCLOSEBUTTON}        xpath=//*[@aria-label ="Close"]
${TABLE}        xpath=//*[@id="__next"]/div[1]/main/div[2]/div/div/div[3]/table

*** Test Cases ***
Filter players by name
    Open Login Page
    Maximize Browser Window
    Type In Email
    Type In Password
    Click On The Submit Button
    Click Players Button
    Click Filter Button
    Type In Name Field
    Click Close Filter Button
    Assert Palyers Are Presented
     [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILFIELD}     user01@getnada.com
Type in password
    Input Password    ${PASSWORDFIELD}      Test-1234
Click on the Submit button
    Click Element    ${SIGNINBUTTON}
Click Players Button
    Wait Until Page Contains Element    ${PlAYERSBUTTON}
    Click Element    ${PlAYERSBUTTON}
Click Filter Button
    Wait Until Page Contains Element    ${FILTERBUTTON}
    Click Element    ${FILTERBUTTON}
Type In Name Field
    Input Text      ${FILTERNAMEFIELD}  NameRoboTest
Click Close Filter Button
    Click Element    ${FILTERCLOSEBUTTON}
Assert Palyers Are Presented
    Wait Until Location Contains    NameRoboTest
    Table Cell Should Contain   ${TABLE}    2   1   NameRoboTest
    Capture Page Screenshot    filter_by_name.png
