*** Settings ***
Library    SeleniumLibrary
Library    ../.././Utils/Compare.py
Library  String
Library  Random
*** Variables ***
${browser}  chrome
${url}  https://erp.rc.damelagi.org/
${Titles_btn}    xpath://span[text()='Titles']
${Employee_M_btn}    xpath://li[@class='dropdown_list_container category']//descendant::span[text()='Employee Management']
${Remove_btn}    xpath://button[@class='el-button el-button--primary']//child::span[text()='Remove']
#${Titles_txt}    linh
${row_locator}    xpath://tr[@class='el-table__row']
${update_btn}    xpath://span[contains(text(),'Update')]
${error_mess}    xpath://div[@role='alert']
${error_pass}    Added Successfully
${error_fail}    Input is not valid
${error_removed}    Removed Successfully
${error_update}    Updated Successfully
${input_title}    xpath://div[contains(@class,'el-form-item__content')]//input[contains(@type,'text')]
${ERROR_BELOW_FIELDS}    xpath://div[@class='el-form-item__error']
#${ICON_DELETE}    xpath://*[contains(text(),'${Titles_txt}')]/ancestor::tr//i

#*** Test Cases ***
#LoginTest
#   open browser    ${url}  ${browser}
#   loginToApplication
##    close browser
*** Keywords ***
#loginToApplication
#   input text  id:email    superadmin@gmail.com
#   input text  id:password     Abc@12345
#   click element    class:login-button
#   selectTitles
##   deleteTitles    ${Titles_txt}
#   edit    ${Titles_txt}
#selectTitles
#    Wait Until Element Is Visible    ${Employee_M_btn}
#    Click Element    ${Employee_M_btn}
#    Wait Until Element Is Visible    ${Titles_btn}
#    Click Element    ${Titles_btn}
check display error message
    [Arguments]    ${error}
    wait until element is visible    ${error_mess}
    element text should be    ${error_mess}    ${error}
delete
    [Arguments]    ${Titles_txt}
    Wait Until Element Is Visible    ${row_locator}
    ${count_rows}=    get element count        ${row_locator}
    FOR    ${i}   IN RANGE   ${count_rows}
        ${pos}=    evaluate        ${i}+1
        ${text_locator}=    Catenate    SEPARATOR=    ${row_locator}     [
        ${text_locator}=    Catenate    SEPARATOR=    ${text_locator}    ${pos}
        ${text_locator}=    Catenate    SEPARATOR=    ${text_locator}    ]//descendant::strong
        # Log To Console    ${text_locator}
        ${text}=    get text       ${text_locator}
        ${result}     compare_Two_Strings    ${text}    ${Titles_txt}
        IF  ${result} == True
            ${delbtn_locator}=    Catenate    SEPARATOR=     ${row_locator}     [
            ${delbtn_locator}=    Catenate    SEPARATOR=     ${delbtn_locator}      ${pos}
            ${delbtn_locator}=    Catenate    SEPARATOR=     ${delbtn_locator}      ]//descendant::i
            Click Element    ${delbtn_locator}
            Click Element    ${Remove_btn}
        END
    END
#    Wait Until Element Is Visible   ${ICON_DELETE}
#    click element  ${ICON_DELETE}
#    Click Element    ${Remove_btn}
edit title
    [Arguments]    ${Titles_txt}    ${title_new}
    Wait Until Element Is Visible    ${row_locator}
    ${count_rows}=    get element count        ${row_locator}
    FOR    ${i}   IN RANGE   ${count_rows}
        ${pos}=    evaluate        ${i}+1
        ${text_locator}=    Catenate    SEPARATOR=    ${row_locator}     [
        ${text_locator}=    Catenate    SEPARATOR=    ${text_locator}    ${pos}
        ${text_locator}=    Catenate    SEPARATOR=    ${text_locator}    ]//descendant::strong
        ${text}=    get text       ${text_locator}
        ${result}     compare_Two_Strings    ${text}    ${Titles_txt}
        IF  ${result} == True
            Click Element    ${text_locator}
            clear element text   ${input_title}
            input text    ${input_title}    ${title_new}
            Click Element    ${update_btn}
        END
    END

Verify search successfully
    [Arguments]  ${name}
    ${out_name}=   Evaluate     "${name}".lower()
    @{lists}=  get webelements  ${row_locator}
    ${output_list}=  Create List
    FOR    ${i}    IN   @{lists}
        ${a}=  get text  ${i}
        ${b}=   Evaluate     "${a}".lower()
        Should Be True      """${out_name}""" in """${b}"""
    END
Verify message displays below fields required
    [Arguments]    ${error}
    wait until element is visible    ${ERROR_BELOW_FIELDS}
    element text should be    ${ERROR_BELOW_FIELDS}    ${error}
