*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//button[@type='submit']
${EMAILFIELD}       xpath=//*[@id='login']
${PASSWORDFIELD}        xpath=//*[@id='password']
${ADDPLAYERBUTTON}      xpath=//*[2][name()="a"]/button
${NAMEFIELD}        xpath=//input[@name="name"]
${SURNAMEFIELD}     xpath=//input[@name="surname"]
${AGEFIELD}     xpath=//input[@name="age"]
${MAINPOSITIONFIELD}        xpath=//input[@name="mainPosition"]
${SUBMITADDPLAYERBUTTON}        xpath=//*[text()= "Submit"]
${MATCHESBUTTON}       xpath=//span[text()='Matches']/ancestor::div[2]
${ADDNEWMATCHBUTTON}        xpath=//a/button
${MYTEAMFIELD}      xpath=//input[@name='myTeam']
${ENEMYTEAMFIELD}       xpath=//input[@name='enemyTeam']
${MYTEAMSCOREFIELD}     xpath=//input[@name='myTeamScore']
${ENEMYTEAMSCOREFIELD}      xpath=//input[@name='enemyTeamScore']
${DATEFIELD}        xpath=//input[@name='date']
${MATCHATHOMERADIOBUTTON}       xpath=//input[@name='matchAtHome' and contains (@value, 'true')]
${MATCHOUTHOMERADIOBUTTON}      xpath=//input[@name='matchAtHome' and contains (@value, 'false')]
${TSHIRTCOLORFIELD}     xpath=//input[@name='tshirt']
${LEAGUEFIELD}      xpath=//input[@name='league']
${TIMEPLAYEDFIELD}      xpath=//input[@name='timePlayed']
${NUMBERFIELD}      xpath=//input[@name='number']
${WEBMATCHFIELD}        xpath=//input[@name='webMatch']
${GENERALFIELD}     xpath=//input[@name='general']
${RATINGFIELD}      xpath=//input[@name='rating']
${SUBMITADDMATCHBUTTON}        xpath=//button[@type='submit']
${ALERTSUCCESSADDMATCH}        xpath=//div[@role="alert"]
${ALERT}        //div[@role="alert"]


*** Test Cases ***
Add new match
    Open Login Page
    Maximize Browser Window
    Type In Email
    Type In Password
    Click On The Submit Button
    Click Add Player Button
    Type In Name
    Type In Surname
    Type in Age
    Type in Main Position
    Click Submit Button
    Click Matches Button
    Click Add Match Button
    Fill all fields
    Click Submit Add Match Button
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
Click Add Player Button
    Wait Until Page Contains Element    ${ADDPLAYERBUTTON}
    Click Element   ${ADDPLAYERBUTTON}
Type In Name
    Wait Until Element Is Visible    ${NAMEFIELD}
    Input Text    ${NAMEFIELD}  TestNewMatch
Type In Surname
    Input Text    ${SURNAMEFIELD}   TestNewMatch
Type in Age
    Input Text    ${AGEFIELD}   01012000
Type in Main Position
    Input Text    ${MAINPOSITIONFIELD}  TestNewMatch
Click Submit Button
    Click Element    ${SUBMITADDPLAYERBUTTON}
Click Matches Button
    Wait Until Element Is Visible   ${MATCHESBUTTON}
    Click Element   ${MATCHESBUTTON}
Click Add Match Button
    Wait Until Element Is Visible   ${ADDNEWMATCHBUTTON}
    Click Element    ${ADDNEWMATCHBUTTON}
Fill all fields
    Wait Until Element Is Not Visible    ${ALERT}
    Wait Until Element Is Visible   ${MYTEAMFIELD}
    Input Text    ${MYTEAMFIELD}    TestMyTeam
    Input Text    ${ENEMYTEAMFIELD}     TestEnemyTeam
    Input Text    ${MYTEAMSCOREFIELD}       5
    Input Text    ${ENEMYTEAMSCOREFIELD}        1
    Input Text    ${DATEFIELD}      10022023
    Click Element    ${MATCHATHOMERADIOBUTTON}
    Input Text    ${TSHIRTCOLORFIELD}       GreenColor
    Input Text    ${LEAGUEFIELD}        TestLeague
    Input Text    ${TIMEPLAYEDFIELD}        90
    Input Text    ${NUMBERFIELD}        3
    Input Text    ${WEBMATCHFIELD}      TestWeb
    Input Text    ${GENERALFIELD}       TestGeneral
    Input Text    ${RATINGFIELD}        5
Click Submit Add Match Button
    Click Element    ${SUBMITADDMATCHBUTTON}
Assert Success Alert
    Wait Until Element Is Visible       ${ALERTSUCCESSADDMATCH}
    Element Text Should Be      ${ALERTSUCCESSADDMATCH}     Added match.
    Capture Page Screenshot    success_add_match.png

