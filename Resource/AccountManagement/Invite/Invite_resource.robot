*** Settings ***
Library  SeleniumLibrary
Variables  Invite_Data.py
Resource    ../../CommonResource.robot
*** Keywords ***
Access Invite
    click element       ${Invite_Button}
#    Wait Until Page Contains               ${Add_Button}
User Invite by empty Name
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${Nothing}
    input text          ${Email_input}     ${valid_email1}
    click element       ${Add_Button}
    Verify Name Text Error                 Name is required
User Invite by empty Email
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${valid_name1}
    input text          ${Email_input}     ${Nothing}
    click element       ${Add_Button}
    Verify Email Text Error                 Please input correct email address
User Invite by just one whitespace name
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${whitespace}
    input text          ${Email_input}     ${valid_email1}
    click element       ${Add_Button}
    Verify Name Text Error                 Name is required
User Invite by Short Name
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${S_name}
    input text          ${Email_input}     ${valid_email2}
    click element       ${Add_Button}
    Verify Name Text Error                Name must be between 3 and 50 characters
User Invite by Long Name
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${L_name}
    input text          ${Email_input}     ${valid_email1}
    click element       ${Add_Button}
    Verify Name Text Error                Name must be between 3 and 50 characters
User Invite by invalid Email
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${valid_name2}
    input text          ${Email_input}     ${invalid_email1}
    click element       ${Add_Button}
    Verify Email Text Error                 Please input correct email address
User Invite by blank fields
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${Nothing}
    input text          ${Email_input}     ${Nothing}
    click element       ${Add_Button}
    Verify Name Text Error                 Name is required
    Verify Email Text Error                Please input correct email address
User Invite by registed email
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${valid_name2}
    input text          ${Email_input}     ${Registed_email}
    click element       ${Add_Button}
User Invite by valid Email
    [Arguments]    ${valid_email}
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${valid_name4}
    input text          ${Email_input}     ${valid_email}
    click element       ${Add_Button}
User Invite successfully
    [Arguments]    ${NotRegisted_Mail}
    wait until element is visible          ${Name_input}
    input text          ${Name_input}      ${valid_name4}
    input text          ${Email_input}     ${NotRegisted_Mail}
    click element       ${Add_Button}
Delete invite info
    Press keys          ${Name_input}               CTRL+A+DELETE
    Press Keys          ${Email_input}             CTRL+A+DELETE
#    Clear Element Text      ${email_txt}
#    Clear Element Text      ${password_txt}
    textfield value should be    ${Name_input}   ${Nothing}
    textfield value should be    ${Email_input}   ${Nothing}
Verify Name Text Error
    [Arguments]    ${Invite_NameError}
    sleep   1
#    wait until element is visible  ${Name_warning}
    element text should be         ${Name_warning}     ${Invite_NameError}
Verify Email Text Error
    [Arguments]    ${Invite_EmailError}
    sleep   1
#    wait until element is visible  ${Email_warning}
    element text should be         ${Email_warning}     ${Invite_EmailError}
Send Invitations
    click element  ${Send_Button}
Clear Invite Databox
    click element  ${Clear_button}
    textfield value should be    ${Name_input}   ${Nothing}
    textfield value should be    ${Email_input}   ${Nothing}
Check Invitation results
    wait until element is visible    ${failure_NumberPosition}
    ${fail_text}=    get text    ${failure_NumberPosition}
    ${result1}=    Compare string     ${fail_text}    ${Nofailure_number}
    log to console      ${result1}
    wait until element is visible  ${Invite_Notification}
    IF    ${result1} == ${False}
        log         ${fail_text}
        element text should be     ${Invite_Notification}     ${fail_text}
    ELSE
        log         ${Success_Notification}
        element text should be     ${Invite_Notification}     ${Success_Notification}
    END
Remove invited information
    click element    ${x_button}
    textfield value should be    ${Name_input}   ${Nothing}
    textfield value should be    ${Email_input}   ${Nothing}



