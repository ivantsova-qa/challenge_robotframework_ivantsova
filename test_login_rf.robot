*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//button[@type='submit']
${EMAILFIELD}       xpath=//*[@id='login']
${PASSWORDFIELD}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[@title='Logo Scouts Panel']
${ADDPLAYERBUTTON}      xpath=//*[2][name()="a"]/button
${NAMEFIELD}        xpath=//input[@name="name"]
${SURNAMEFIELD}     xpath=//input[@name="surname"]
${AGEFIELD}     xpath=//input[@name="age"]
${MAINPOSITIONFIELD}        xpath=//input[@name="mainPosition"]
${SUBMITADDPLAYERBUTTON}        xpath=//*[text()= "Submit"]
${ALERTSUCCESSADDPLAYER}        xpath=//div[@role="alert"]


*** Test Cases ***
Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

Add new player
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Wait Until Page Contains Element    ${ADDPLAYERBUTTON}
    Click Add Player Button
    Type In Name
    Type In Surname
    Type in Age
    Type in Main Position
    Click Submit Button
    Assert Success Alert
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
Assert dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Click Add Player Button
    Click Element   ${ADDPLAYERBUTTON}
Type In Name
    Input Text    ${NAMEFIELD}  NameRoboTest
Type In Surname
    Input Text    ${SURNAMEFIELD}   SurnameRoboTest
Type in Age
    Input Text    ${AGEFIELD}   01012000
Type in Main Position
    Input Text    ${MAINPOSITIONFIELD}  MainRoboTest
Click Submit Button
    Click Element    ${SUBMITADDPLAYERBUTTON}
Assert Success Alert
    Wait Until Page Contains Element    ${ALERTSUCCESSADDPLAYER}
    Capture Page Screenshot    alert_add_player_page.png