*** Settings ***
Library  SeleniumLibrary
Variables  Common_Data.py
Variables  Login_data.py
*** Keywords ***
Login with empty password
    Input Text          ${email_txt}         ${Email_valid1}
    click button        ${login_btn}
    Verify Error text   Password required more than 6 characters.
Login with empty Email
    Input Text          ${password_txt}         ${Password_valid1}
    click button        ${login_btn}
    Verify Error text   Email required.     #invalid password
Login with invalid password
    Input Text          ${email_txt}         ${Email_person1}
    Input Text          ${password_txt}      ${Password_valid1}
    click button        ${login_btn}
    Verify Error text   invalid password
Login with invalid Email
    Input Text          ${email_txt}         ${Email_valid1}
    Input Text          ${password_txt}      ${Password_admin}
    click button        ${login_btn}
    Verify Error text   invalid password
Login with unformatted Email
    Input Text          ${email_txt}         ${Unformatted_Email}
    Input Text          ${password_txt}      ${Password_admin}
    click button        ${login_btn}
    Verify Error text   ${Notvalue}
Admin Login
    wait until element is visible    ${email_txt}
    Input Text          ${email_txt}         ${Email_admin}
    Input Password      ${password_txt}      ${Password_admin}
    click button        ${login_btn}
User Login
    Input Text          ${email_txt}         ${Email_person1}
    Input Password      ${password_txt}      ${Password_person1}
    click button        ${login_btn}
Delete login value
    Press keys          ${email_txt}                CTRL+A+DELETE
    Press Keys          ${password_txt}             CTRL+A+DELETE
#    Clear Element Text      ${email_txt}
#    Clear Element Text      ${password_txt}
    textfield value should be    ${email_txt}   ${Notvalue}
    textfield value should be    ${password_txt}   ${Notvalue}
Verify Error text
    [Arguments]    ${error}
    sleep   1
#    wait until element is visible  ${Error_mess}
    element text should be         ${Error_mess}     ${error}