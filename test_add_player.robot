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
${REQUIREDTEXT}     xpath=//p[text()="Required"]
${EMAILADDPLAYERFIELD}       xpath=//input[@name="email"]
${PHONEFIELD}       xpath=//input[@name="phone"]
${WEIGHTFIELD}      xpath=//input[@name="weight"]
${HEIGHTFIELD}      xpath=//input[@name="height"]
${LEGDROPDOWN}      xpath=//*[@id="mui-component-select-leg"]
${RIGHTLEG}     xpath=//*/ul/li[1]
${CLUBFIELD}        xpath=//input[@name="club"]
${LEVELFIELD}       xpath=//input[@name="level"]
${SECONDPOSITIONFIELD}      xpath=//input[@name="secondPosition"]
${DISTRICTDROPDOWN}     xpath=//*[@id="mui-component-select-district"]
${ACHIEVEMENTSFIELD}        xpath=//input[@name="achievements"]
${LACZYFIELD}       xpath=//input[@name="webLaczy"]
${NINETEENMINUTESFIELD}     xpath=//input[@name="web90"]
${FACEBOOKFIELD}        xpath=//input[@name="webFB"]
${LODZDISTRICT}     xpath=/html/body/div[2]/div[3]/ul/li[5]
${CLEARBUTTON}      xpath=//*/button[2]/span[1]

*** Test Cases ***

Add new player
    Open Login Page
    Maximize Browser Window
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

Add new player with empty fields
    Open Login Page
    Maximize Browser Window
    Type In Email
    Type In Password
    Click On The Submit Button
    Click Add Player Button
    Click Submit Button
    Assert Required Text
    [Teardown]    Close Browser

Clear fields
    Open Login Page
    Maximize Browser Window
    Type In Email
    Type In Password
    Click On The Submit Button
    Click Add Player Button
    Fill all fields
    Click Clear Button
    Assert Clear Fields
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
    Input Text    ${NAMEFIELD}  NameRoboTest
Type In Surname
    Input Text    ${SURNAMEFIELD}   SurnameRoboTest
Type in Age
    Input Text    ${AGEFIELD}   01012000
Type in Main Position
    Input Text    ${MAINPOSITIONFIELD}  MainRoboTest
Click Submit Button
    Wait Until Element Is Visible   ${SUBMITADDPLAYERBUTTON}
    Click Element    ${SUBMITADDPLAYERBUTTON}
Assert Success Alert
    Wait Until Page Contains Element    ${ALERTSUCCESSADDPLAYER}
    Capture Page Screenshot    alert_add_player_page.png
Assert Required Text
    Page Should Contain     Required
    Capture Page Screenshot    required_text.png
Fill all fields
    Input Text    ${EMAILADDPLAYERFIELD}     testemail@gmail.com
    Input Text    ${NAMEFIELD}      NameRoboTest
    Input Text    ${SURNAMEFIELD}       SurnameRoboTest
    Input Text    ${PHONEFIELD}     +4878000000
    Input Text    ${WEIGHTFIELD}        75
    Input Text    ${HEIGHTFIELD}        175
    Input Text    ${AGEFIELD}       01012000
    Click Element    ${LEGDROPDOWN}
    Click Element    ${RIGHTLEG}
    Input Text    ${CLUBFIELD}      ClubRobo
    Input Text    ${LEVELFIELD}     LevelRobo
    Input Text    ${MAINPOSITIONFIELD}      MainRoboTest
    Input Text    ${SECONDPOSITIONFIELD}        SecondRoboTest
    Click Element    ${DISTRICTDROPDOWN}
    Wait Until Element Is Visible   ${LODZDISTRICT}
    Click Element    ${LODZDISTRICT}
    Input Text    ${ACHIEVEMENTSFIELD}      AcieveTest
    Input Text    ${LACZYFIELD}     LaczyRodo
    Input Text    ${NINETEENMINUTESFIELD}       55
    Input Text    ${FACEBOOKFIELD}      https://fecebook.com
Click Clear Button
    Click Element    ${CLEARBUTTON}
Assert Clear Fields
    Page Should Contain     Required
    Capture Page Screenshot    empty_fields.png