*** Settings ***
Library  SeleniumLibrary
Library    SeleniumLibrary.Press Keys
Documentation    Suite description #automated tests for scout website*** Test Cases ***

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
${FILTERSURNAMEFIELD}       xpath=//*/label [text() = "Surname"]/parent::div/div/input
${FILTERMAINPOSITIONFIELD}      xpath=//*/label [text() = "Main position"]/parent::div/div/input
${FIRSROW}      xpath=//*[@id="MUIDataTableBodyRow-0"]/td[2]
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
${SUBMITADDPLAYERBUTTON}        xpath=//*[text()= "Submit"]
${FILTERCLOSEBUTTON}        xpath=//*[@aria-label ="Close"]
${NAMEFIELD}        xpath=//input[@name="name"]
${SURNAMEFIELD}     xpath=//input[@name="surname"]
${MAINPOSITIONFIELD}        xpath=//input[@name="mainPosition"]

*** Test Cases ***
Edit player after filtering
    Open Login Page
    Maximize Browser Window
    Type In Email
    Type In Password
    Click On The Submit Button
    Click Players Button
    Click Filter Button
    Type In Name Field
    Type In Surname Field
    Type In Main Position Field
    Click Close Filter Button
    Click On The Players
    Edit Player Info
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
Click Players Button
    Wait Until Page Contains Element    ${PlAYERSBUTTON}
    Click Element    ${PlAYERSBUTTON}
Click Filter Button
    Wait Until Page Contains Element    ${FILTERBUTTON}
    Click Element    ${FILTERBUTTON}
Type In Name Field
    Input Text      ${FILTERNAMEFIELD}      NameRoboTest
Type In Surname Field
    Input Text    ${FILTERSURNAMEFIELD}     SurnameRoboTest
Type In Main Position Field
    Input Text    ${FILTERMAINPOSITIONFIELD}        MainRoboTest
Click On The Players
    Wait Until Page Contains Element    ${FIRSROW}
    Table Row Should Contain   ${TABLE}     2   NameRoboTest
    Table Row Should Contain   ${TABLE}     2   SurnameRoboTest
    Table Row Should Contain   ${TABLE}     2   MainRoboTest
    Wait Until Element Is Visible    ${FIRSROW}
    Click Element   ${FIRSROW}
Edit Player Info
    Input Text    ${EMAILADDPLAYERFIELD}     testemail@gmail.com
    Double Click Element       ${NAMEFIELD}
    Press Keys    ${NAMEFIELD} BACKSPACE
    Input Text    ${NAMEFIELD}      Test
    Input Text    ${SURNAMEFIELD}       Test
    Input Text    ${PHONEFIELD}     +4878000000
    Input Text    ${WEIGHTFIELD}        75
    Input Text    ${HEIGHTFIELD}        175
    Click Element    ${LEGDROPDOWN}
    Click Element    ${RIGHTLEG}
    Input Text    ${CLUBFIELD}      ClubRobo
    Input Text    ${LEVELFIELD}     LevelRobo
    Input Text    ${MAINPOSITIONFIELD}      Test
    Input Text    ${SECONDPOSITIONFIELD}        SecondRoboTest
    Click Element    ${DISTRICTDROPDOWN}
    Wait Until Element Is Visible   ${LODZDISTRICT}
    Click Element    ${LODZDISTRICT}
    Input Text    ${ACHIEVEMENTSFIELD}      AcieveTest
    Input Text    ${LACZYFIELD}     LaczyRodo
    Input Text    ${NINETEENMINUTESFIELD}       55
    Input Text    ${FACEBOOKFIELD}      https://fecebook.com
Click Submit button
    Click Element    ${SUBMITADDPLAYERBUTTON}
Assert Success Alert
    Wait Until Page Contains Element    ${ALERTSUCCESSADDPLAYER}
    Capture Page Screenshot    success_edit_player.png
Click Close Filter Button
    Click Element    ${FILTERCLOSEBUTTON}
