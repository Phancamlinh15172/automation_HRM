*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/LoginPage.robot
Test Template    invalid login
*** Test Cases ***
Login with empty password    camlinh15172@gmail.com    ${empty}    Password required more than 6 characters.
Login with empty Email       ${empty}                  123456      Email required.
Login with invalid password  camlinh15172@gmail.com    1234567     invalid password
Login with invalid Email     camlinh@gmail.com         123456      wrong email
*** Keywords ***
invalid login
    [Arguments]  ${username}  ${password}    ${error}
    open HRM login page
    enter username    ${username}
    enter password    ${password}
    click Login button
    verify Error text    ${error}
    [Teardown]    close browser
