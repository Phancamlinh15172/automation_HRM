*** Settings ***
Library  SeleniumLibrary
Variables  Xpath_Topic_Elearning.py
Library  Utils.Combine_Strings
Resource    ../../CommonResource.robot

*** Keywords ***
Go to Add Topic
       click element                   ${Add_Topic}
       wait until element is visible    ${Dialog_Title_ADDTOPIC}
Input Title and Topic Decription
    [Arguments]         ${Title}     ${Description}
    wait until element is visible   ${Title_AddTopic}
    input text          ${Title_AddTopic}    ${Title}
    input text          ${Description_AddTopic}    ${Description}
Create confirmation
    click element       ${Create_button}
    wait until element is visible   ${NOTIFICATION_POPUP}
Cancel Adding Topic
    wait until element is visible   ${Cancel_button}
    click element    ${Cancel_button}
    wait until element is visible   ${Messagebox_CancelButton}
    element text should be   ${Messagebox_CancelButton}    Are you sure to stop creating topic?
    click element    ${Ok_button_CancelAddingTopic}
Revoke Cancel Adding Topic
    wait until element is visible   ${Cancel_button}
    click element    ${Cancel_button}
    wait until element is enabled   ${Cancelbutton_CancelAddingTopic}
    click element    ${Cancelbutton_CancelAddingTopic}
Search by Title
    [Arguments]         ${search_keyword}
    wait until element is visible   ${SearchTopic_AddTopic}
    input text      ${SearchTopic_AddTopic}     ${search_keyword}
Check Exist and Open Edit Dialog
    [Arguments]   ${Xpath_to_check}  ${Data_ExistCheck}
    Wait Until Element Is Visible    ${Xpath_to_check}
    ${count_rows}=    get element count        ${Xpath_to_check}
    FOR    ${i}   IN RANGE   ${count_rows}-1
           ${pos}=    evaluate        ${i}+1
           ${checkingtarget_locator}=     Combine    ${Xpath_to_check}    [    ${pos}    ]/td[2]
           ${text}=    get text       ${checkingtarget_locator}
           ${result} =  compare string    ${text}    ${Data_ExistCheck}
           IF  ${result} == True
               ${target_clicker}=    Combine   //div[contains(@class,'el-table__fixed-right')]   ${Xpath_to_check}    [    ${pos}    ]//i[contains(@class,'el-icon-edit')]
               wait until element is visible    ${target_clicker}
               click element    ${target_clicker}
               log to console   Opening Edit Topic
              BREAK
        END
    END
