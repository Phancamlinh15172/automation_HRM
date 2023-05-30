*** Settings ***
Library     SeleniumLibrary
Resource    action.robot
*** Variables ***
${ADD_NEW_TEAM_BUTTON}    xpath://span[contains(text(),'Create New Team')]
${ADD_NEW_TEAM_NAME_TEXT_BOX}    xpath://input[@placeholder='Team Name']
${ADD_NEW_TEAM_EMAIL_TEXT_BOX}    xpath://input[@placeholder='Email']
${ADD_NEW_TEAM_TEAMLEADER_DROPDOWN}    xpath: //input[@placeholder='Team Leader']
${ADD_NEW_TEAM_TEAMLEADER_DROPDOWN_VALUE}    xpath://body/div[@class='el-select-dropdown el-popper']/div[@class='el-scrollbar']/div[@class='el-select-dropdown__wrap el-scrollbar__wrap']/ul[@class='el-scrollbar__view el-select-dropdown__list']
${ADD_NEW_TEAM_CREATE_BUTTON}    xpath://button[@class='el-button el-button--primary']
${ADD_NEW_TEAM_OFFICE_DROPDOWN}    xpath://input[@placeholder='Office']
${ADD_NEW_TEAM_OFFICE_DROPDOWN_VALUE}    xpath://div[@x-placement='bottom-start']
${ORGANIZATION}    xpath://div[@class='dropdown_header mx-auto d-flex align-items-center']//span[contains(text(),'Organization')]
${TEAM}    xpath://span[contains(text(),'Team')]
${ERROR_BELOW_FIELDS_NAME}     xpath:(//div[@class='el-form-item__error'])[1]
${ERROR_BELOW_FIELDS_TEAMLEADER}    xpath:(//div[@class='el-form-item__error'])[2]
${ERROR_BELOW_FIELDS_TEAMLEADER}    xpath:(//div[@class='el-form-item__error'])[2]
${DROPDOWN}    xpath://li[@class="el-select-dropdown__item"]/span[contains(text(),'Cam Linh')]
${DROPDOWN_1}    xpath://span[contains(text(),'Nguyen Huu Tho')]
#edit
${EDIT_TEAM_NAME_TEXT_BOX}    xpath://div[text()="Name:"]/following-sibling::div//input[@placeholder="Please input"]
${BUTTON_EDIT}    xpath://button[@class='el-button edit-button el-button--text']
${BUTTON_SAVE_E}    xpath://span[normalize-space()='Save']
${EDIT_EMAIL_TEXT_BOX}      xpath://input[@type='email']
${SEARCH_TEAM_NAME}    //input[@placeholder='Search here']
${TEAM_NAME_LABEL}    //tr[@class='el-table__row']//descendant::strong
*** Keywords ***
Input add New Team form with missing value team leader
    [Arguments]     ${name}=Test   ${email}=Linhtest@gmail.com
    click on Create New Team button
    wait until element is visible    ${ADD_NEW_TEAM_NAME_TEXT_BOX}
    input text    ${ADD_NEW_TEAM_NAME_TEXT_BOX}  ${name}
    input text    ${ADD_NEW_TEAM_EMAIL_TEXT_BOX}  ${email}
    click element    ${ADD_NEW_TEAM_OFFICE_DROPDOWN}
    wait until element is visible    ${DROPDOWN_1}
#    select from list by value    ${ADD_NEW_TEAM_OFFICE_DROPDOWN_VALUE}    Nguyễn Hữu Thọ

    click element    ${DROPDOWN_1}
    click button    ${ADD_NEW_TEAM_CREATE_BUTTON}
Fill data for fields
    [Arguments]     ${name}=Test   ${email}=Linhtest@gmail.com
    click on Create New Team button
    wait until element is visible    ${ADD_NEW_TEAM_NAME_TEXT_BOX}
    input text    ${ADD_NEW_TEAM_NAME_TEXT_BOX}  ${name}
    input text    ${ADD_NEW_TEAM_EMAIL_TEXT_BOX}  ${email}
    click element    ${ADD_NEW_TEAM_TEAMLEADER_DROPDOWN}
    wait until element is visible    ${ADD_NEW_TEAM_TEAMLEADER_DROPDOWN_VALUE}
    click element    ${DROPDOWN}
    click element    ${ADD_NEW_TEAM_OFFICE_DROPDOWN}
    wait until element is visible    ${DROPDOWN_1}
    click element    ${DROPDOWN_1}
    click button    ${ADD_NEW_TEAM_CREATE_BUTTON}
Go to Team page
    wait until element is visible    ${ORGANIZATION}
    click element    ${ORGANIZATION}
    wait until element is visible    ${TEAM}
    click element    ${TEAM}
click on Create New Team button
    wait until element is visible    ${ADD_NEW_TEAM_BUTTON}
    click element    ${ADD_NEW_TEAM_BUTTON}

check displays below fields required
    [Arguments]    ${error_msg_name}    ${error_msg_team}
    wait until element is visible   ${ERROR_BELOW_FIELDS_NAME}
    wait until element is visible   ${ERROR_BELOW_FIELDS_TEAMLEADER}
    element text should be    ${ERROR_BELOW_FIELDS_NAME}    ${error_msg_name}
    element text should be    ${ERROR_BELOW_FIELDS_TEAMLEADER}     ${error_msg_team}
Observe the Previous/ Next button is disabled on the first/final pagination
    wait until element is visible    //li[contains(@class,'number')]
    element should be disabled    //button[@class='btn-prev']
    element should be disabled    //button[@class='btn-next']
input name data
    [Arguments]    ${team_name}
    wait until element is visible    ${EDIT_TEAM_NAME_TEXT_BOX}
    clear element text    ${EDIT_TEAM_NAME_TEXT_BOX}
    input text    ${EDIT_TEAM_NAME_TEXT_BOX}    ${team_name}
    click element    ${BUTTON_EDIT}
click edit Team
    [Arguments]    ${Team_name}
    wait until element is visible    ${SEARCH_TEAM_NAME}
    input text    ${SEARCH_TEAM_NAME}    ${Team_name}
    Press Key    ${SEARCH_TEAM_NAME}    \\13
    sleep    2
    click element    ${TEAM_NAME_LABEL}
    click element    ${BUTTON_EDIT}
click save button
    wait until element is visible    ${BUTTON_SAVE_E}
    click element    ${BUTTON_SAVE_E}
input email data
    [Arguments]    ${team_email}
    wait until element is visible    ${EDIT_TEAM_NAME_TEXT_BOX}
    clear element text    ${EDIT_EMAIL_TEXT_BOX}
    input text    ${EDIT_EMAIL_TEXT_BOX}    ${team_email}
Click Edit icon
        click element    ${BUTTON_EDIT}