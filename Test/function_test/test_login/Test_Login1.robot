*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/LoginPage.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
*** Test Cases ***
Login with empty password
    open HRM login page
    enter username  camlinh15172@gmail.com
    enter password    ${empty}
    click Login button
    verify Error text    Password required more than 6 characters.
Login with empty Email
    open HRM login page
    enter username    ${empty}
    enter password    123456
    click Login button
    verify Error text    Email required.
Login with invalid password
    open HRM login page
    enter username  camlinh15172@gmail.com
    enter password    12345678
    click Login button
    verify Error text    invalid password
Login with invalid Email
    open HRM login page
    enter username  camlinh@gmail.com
    enter password    12345678
    click Login button
    verify Error text    wrong email
Login successfully
    open HRM login page
    enter username  camlinh15172@gmail.com
    enter password    123456
    click Login button
    welcome page should be open
