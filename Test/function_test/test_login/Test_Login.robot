*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/LoginPage.robot
Resource    ../../../Resource/page/action.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
*** Test Cases ***
Login fail with empty password
    Given open HRM login page
    When input email and password    Camlinh15172@gmail.com     ${empty}
    Verify error message for email and password     Email or Password is not correct      Password required more than 6 characters.
Login fail with empty Email
    Given open HRM login page
    When input email and password    ${empty}   123456
    verify message displays below fields required    Please input correct email address
Login fail with empty email and password
    Given open HRM login page
    When input email and password    ${empty}    ${empty}
    Verify error message for email and password     Please input correct email address      Password required more than 6 characters.
Login fail with invalid password
    Given open HRM login page
    When input email and password    Camlinh15172@gmail.com     12345678
    Verify error message for email    Email or Password is not correct
Login fail with invalid Email
    Given open HRM login page
    When input email and password    camlinh@gmail.com      123456
    Verify error message for email    Email or Password is not correct
Verify that message is displayed in the case input password not enough 6 characters
    Given open HRM login page
    When input email and password    Camlinh15172@gmail.com     1
    verify error message for password    Password required more than 6 characters.
Verify that message is displayed in the case input special character in the Email
    Given open HRM login page
    When input email and password    lsdjkklsdj     123456
    verify error message for email      Please input correct email address
Verify that message is displayed in the case input number in the Email
    Given open HRM login page
    When input email and password    1234567     123456
    verify error message for email      Please input correct email address
Verify that message is displayed in the case input space in the Email
    Given open HRM login page
    When input email and password      \     123456
    verify error message for email      Please input correct email address
Verify that message is displayed in the case input space in the password
    Given open HRM login page
    When input email and password    camlinh15172@gmail.com     \
    verify error message for password    Password required more than 6 characters.
Login successful with valid email and password
    Given open HRM login page
    When input email and password   camlinh15172@gmail.com      123456
    Then User can successfully login to the system
Verify if the forgot password link is working correctly and landing on the correct page
    Given open HRM login page
    When click link  Forgot password?
    Then the page is correctly redirected to the "find your account" page