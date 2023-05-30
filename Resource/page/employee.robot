*** Settings ***
Library     SeleniumLibrary
Resource    LoginPage.robot
Library  String
Library  Random
Library    BuiltIn
*** Variables ***
${employee_management}    xpath://div[@class='dropdown_header mx-auto d-flex align-items-center']//span[contains(text(),'Employee Management')]
#account
${account}    xpath://div[@class="sidebar-item-icon"]//following-sibling::span[text()="Accounts"]
${txt_entername}    xpath://input[@placeholder='Enter Name or Email']
${bỉthday}    xpath://input[@placeholder='Birthday']
${joindate}    xpath://input[@placeholder='Join date']
${gender}    xpath://input[@placeholder='Gender']
${position}    xpath://input[@placeholder='Position']
${team}    xpath://input[@placeholder='Team']
${btn_invite}    xpath://span[@class='ml-2'][normalize-space()='Invite']
${title_invite}    xpath://body//div[@class='container-fluid']//div[@class='row']//div[@class='row']//button[1]
${search_result}    xpath://input[@placeholder='Enter Name or Email']
${txt_invite_name}    xpath://div[@class="el-dialog__body"]//input[@placeholder='Enter name']
${txt_invite_email}    xpath://div[@class="el-dialog__body"]//input[@placeholder='E-mail']
${btn_clear}    xpath://button[@class='el-button el-button--info']
${btn_add}    xpath://div[@class="el-dialog__body"]//button[@class="el-button el-button--primary"]/span[normalize-space()='Add']
${btn_Send_invitations}     //div[@class="el-dialog__body"]//button[@class="el-button el-button--primary"]/span[text()="Send invitations"]
${table}    //div[@class="el-dialog__body"]//table[@class="el-table__body"]
#${check}    xpath:///strong[normalize-space()='linh']
#title
${title}    xpath://span[contains(text(),'Titles')]
${search}   xpath://input[@placeholder='Search here']
${remove}   xpath://tbody/tr[12]/td[2]/div[1]/img[1]
${remove_title}     xpth://h3[normalize-space()='Remove title']
${btn_remove}   xpath://button[@class='el-button el-button--primary']
${btn_cancel}   xpath://div[contains(@class,'d-flex justify-content-center')]//span[contains(text(),'Cancel')]
${error_mess}   xpath://div[@role='alert']
${createtitle}     xpath://button[@class='el-button mt-3 el-button--primary']
${title_create}     xpath://h3[contains(text(),'Create title')]
${txt_title}    xpath://div[@class='el-input']//input[@type='text']
${btn_create}   xpath://form[@class='el-form']//button[1]
${btn_cancel1}    xpath://span[normalize-space()='Cancel']
${danger}    xpath://div[@class='el-form-item__error']
${name}    linh
${name1}    Automation Tester
${mail}    camlinh123@gmail.com
${row_locator}    xpath://tr[@class='el-table__row']
${name2}    hu


*** Keywords ***

click on Menu Employee Management
    wait until element is visible    ${employee_management}
    click element    ${employee_management}
#account
click on Account
    wait until element is visible    ${account}
    click element    ${account}
click button Invite user
    wait until element is visible    ${btn_invite}
    click element  ${btn_invite}
input keyword
    [Arguments]    ${keyword}
    input text    ${txt_entername}    ${keyword}
press enter
    Press Key    ${txt_entername}    \\13
input valid name and email
    [Arguments]    ${name}    ${gmail}

    input text    ${txt_invite_name}    ${name}
    input text    ${txt_invite_email}    ${gmail}
input name and email existed
    ${random_name}=   Generate Random Name
    input text    ${txt_invite_name}    ${random_name}
    input text    ${txt_invite_email}    camlinh15172@gmail.com
click button clear
    click button    ${btn_clear}
click button add
    click element    ${btn_add}
click button Send invitations
    click element    ${btn_Send_invitations}
Displays status below email column
    [Arguments]    ${status}
    Table Cell Should Contain    ${table}    1   3    ${status}
Generate Random Email
    ${random_string}=  Generate Random String  8  [LETTERS][UPPER]
    ${random_email}=   Set Variable    ${random_string}@gmail.com
    [Return]  ${random_email}

Generate Random Name
    ${random_name}=    Generate Random String  8  [LETTERS][UPPER]
    [Return]  ${random_name}
#verify search name
#    ${count_rows}=    get element count        ${row_locator}
#    FOR    ${i}   IN RANGE   ${count_rows}
#        ${pos}=    evaluate        ${i}+1
#        ${text_locator}=    Catenate    SEPARATOR=    ${row_locator}     [
#        ${text_locator}=    Catenate    SEPARATOR=    ${text_locator}    ${pos}
#        ${text_locator}=    Catenate    SEPARATOR=    ${text_locator}    ]//descendant::strong
#         Log To Console    ${text_locator}
#        ${text}=    get text       ${text_locator}
##        should be true    """${name2}""" in """${text}"""
#    END
##    ${result}=    Get text     xpath=//*[@id="search"]
##    Log to console  ${result}

#title
click on Titles
    wait until element is visible    ${title}
    click element  ${title}
click on the Create New Title button
    wait until element is visible    ${create_title}
    click button    ${create_title}
input Title Name
    [Arguments]     ${title_name}
    input text      ${txt_title}    ${title_name}
click on the Create button
    click button    ${btn_create}
#click icon delete
#    click element    ${remove}
#delete comfirm
#    click button    ${btn_remove}
search and delete users
    [Arguments]     ${random_email}
    click element    //div[@role="dialog"]//button[@aria-label="Close"]
    input text    ${search_result}    ${random_email}
    press enter
    click element    //tr[@class='el-table__row']//descendant::strong
    sleep  3


#
#*** Test Cases ***
#search1
#    login to account with admin role
#    sleep    1
#    click on Menu Employee Management
#    sleep    1
#    click on Account
#    Sleep    2
#    input keyword    ${name2}
#    press enter
#    sleep    1
#    verify search name
##    sleep    1
##    ${result}=    get text    ${search_result}
##    should be equal    ${result}    linh
###    table column should contain    ${search_result}    ${search}
##    sleep   2
#    [Teardown]    close browser
