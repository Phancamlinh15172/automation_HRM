*** Settings ***
Library  SeleniumLibrary
Library  Utils.Combine_Strings
Resource    ../CommonResource.robot
Variables    Search_data.py
*** Keywords ***
Search by Name
    Input Text                       ${name_search}      bi
Search by Birthday
#    select from list by label    ${Birthday}        01
    Click Element                    ${Birthday}
#    Scroll Element Into View         ${Birthday Box}
    Mouse Over                       ${Birthday Box}
    Click Element                    ${Birthday Box}
    Sleep   1
    element should contain         ${Search_table}    bin
Search by JoinDay
    Click Element                    ${JoinDay}
    wait until element is visible    ${JoinDay_box}
    Click Element                    ${JoinDay_box}
    element should contain         ${Search_table}    bin
Search by Gender
    click element                    ${Gender}
    wait until element is visible    ${Gender_NAM}
    click element                    ${Gender_NAM}
    element should contain         ${Search_table}    bin
Search by Position
    click element                    ${Position}
    wait until element is visible    ${Position_DEV}
    click element                    ${Position_DEV}
    Page Should Contain              Bình
Search by Team
    click element                    ${Team}
    wait until element is visible    ${Team_Melon}
    click element                    ${Team_Melon}
    Page Should Contain              Bình
Active Account
    click element                    ${Active_Account}
Welcome Page
    Title Should Be    Paradox
Checking Existance
    [Arguments]    ${person_info}
    Wait Until Element Is Visible    ${Search_row}
    ${count_rows}=    get element count        ${Search_row}
    FOR    ${i}   IN RANGE   ${count_rows}
        ${pos}=    evaluate        ${i}+1
        ${target_locator}=     Combine    ${Search_row}    [    ${pos}    ]//descendant::strong
        ${text}=    get text       ${target_locator}
        ${result}     compare string    ${text}    ${person_info}
        IF  ${result} == True
            wait until element is visible    ${target_locator}
            Click Element    ${target_locator}
            log to console   Open Profile Successfully
            BREAK
        END
    END