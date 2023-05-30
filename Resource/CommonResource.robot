*** Settings ***
Library  SeleniumLibrary
Library    String
Variables    Common_Data.py
*** Variables ***
${Notification_message}   xpath://div[@role='alert']
*** Keywords ***
Open Browser Login
    Open Browser        ${url}           ${BROWSER}
    Maximize Browser Window
Navigate to Landing
    Click Element   ${logo}
    Sleep   1
Access Account
    Wait Until Element Is Enabled    ${EmployeeMenu}
    Click Element                    ${EmployeeMenu}
    wait until element is visible    ${Account}
    Click Element                    ${Account}
Access Team
    Wait Until Element Is Enabled    ${Organization}
    Click Element                    ${Organization}
    wait until element is visible    ${Team_Organization}
    Click Element                    ${Team_Organization}
Access Elearning
    wait until element is visible   ${Elearning_list}
    click element                   ${Elearning_list}
Go to Topics
    wait until element is visible   ${Topic}
    click element                   ${Topic}
Go to Assignments
    wait until element is visible   ${Elearning_list}
    click element                   ${Elearning_list}
    wait until element is visible   ${Assignments}
    click element                   ${Assignments}
Go to Course
    wait until element is visible   ${Elearning_list}
    click element                   ${Elearning_list}
    wait until element is visible   ${Course}
    click element                   ${Course}
Generate Random Name
    [Arguments]    ${random_number}
    ${random_name} =  Generate Random String    ${random_number}   [LETTERS][NUMBERS]
    [Return]    ${random_name}
Generate Random Just Letter
    [Arguments]    ${random_number}
    ${random_name} =  Generate Random String    ${random_number}   [LETTERS]
    [Return]    ${random_name.capitalize()}
Wait with short time
    Sleep    2s
Wait with medium time
    Sleep    6s
Wait with large time
    Sleep    10s
Compare string
    [Arguments]    ${str1}  ${str2}
    IF  '${str1}' == '${str2}'
        RETURN    ${True}
    ELSE
        RETURN    ${False}
    END
abc
