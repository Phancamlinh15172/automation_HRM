*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${browser}  chrome
${url}  https://erp.rc.damelagi.org/
${email_txt}  xpath://input[@placeholder='Email Address']
${pw_txt}   xpath://input[@placeholder='Password']
${butonlogin}   xpath://button[@type='submit']
${error_text}    xpath://div[@class='text-danger']
${logo}    //img[@class='logoParadox']
${empty}
${ERROR_BELOW_FIELDS_EMAIL}     //input[@placeholder="Email Address"]/parent::div/following-sibling::div[@class="el-form-item__error"]
${ERROR_BELOW_FIELDS_PASS}     //input[@placeholder="Password"]/parent::div/following-sibling::div[@class="el-form-item__error"]
*** Keywords ***
open HRM login page
    open browser    ${url}  ${browser}
    maximize browser window
enter username
    [Arguments]    ${username}
    input text     ${email_txt}      ${username}
enter password
    [Arguments]     ${password}
    input text    ${pw_txt}         ${password}
click Login button
    click button    ${butonlogin}
verify Error text
    [Arguments]    ${error}
    wait until element is visible  ${error_text}
    element text should be    ${error_text}     ${error}
Welcome Page Should Be Open
    wait until element is visible    ${logo}
    page should contain image    ${logo}
Login to account with admin role
    enter username  noreply.damelagi@gmail.com
    enter password    Abc@12345
    click Login button
Login to Hrm Paradox with User account
    enter username  camlinh15172@gmail.com
    enter password    123456
    click Login button
Login to Hrm Paradox with new password
    enter username  camlinh15172@gmail.com
    enter password    1234567
    click Login button
clear text
    clear element text    ${email_txt}
    clear element text    ${pw_txt}
input email and password
    [Arguments]    ${email}    ${password}
    input text    ${email_txt}    ${email}
    input text    ${pw_txt}    ${password}
    click Login button
Verify error message for email and password
    [Arguments]    ${error_msg_email}   ${error_msg_pass}
    wait until element is visible   ${ERROR_BELOW_FIELDS_EMAIL}
    wait until element is visible   ${ERROR_BELOW_FIELDS_PASS}
    element text should be    ${ERROR_BELOW_FIELDS_EMAIL}    ${error_msg_email}
    element text should be    ${ERROR_BELOW_FIELDS_PASS}     ${error_msg_pass}
Verify error message for email
    [Arguments]    ${error_msg_email}
    wait until element is visible   ${ERROR_BELOW_FIELDS_EMAIL}
    element text should be    ${ERROR_BELOW_FIELDS_EMAIL}    ${error_msg_email}
    element should not be visible  ${ERROR_BELOW_FIELDS_PASS}
Verify error message for password
    [Arguments]    ${error_msg_pass}
    wait until element is visible   ${ERROR_BELOW_FIELDS_PASS}
    element text should be    ${ERROR_BELOW_FIELDS_PASS}     ${error_msg_pass}
    sleep   4
    element should not be visible  ${ERROR_BELOW_FIELDS_EMAIL}
User can successfully login to the system
    title should be  Paradox
The page is correctly redirected to the "Find your account" page
    element should be visible  //h1[normalize-space()='Find your account']