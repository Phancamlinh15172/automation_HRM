*** Settings ***
Library     SeleniumLibrary
Variables   Xpath_Assignment_Elearning.py
Library     Utils.Combine_Strings
Resource    ../../CommonResource.robot
*** Keywords ***
Go to New Assignments
    wait until element is enabled    ${New_assignments_Button}
    click element    ${New_assignments_Button}
Input information to new assignments
    # No data when log to
    [Arguments]   ${Begin_time_NewAssignments}  ${Due_time_NewAssignments}
    wait until element is visible    ${Course_NewAssignments}
    click element    ${Course_NewAssignments}
    wait until element is visible    ${Python_Tutorial_Course}
    click element    ${Python_Tutorial_Course}
    wait until element is visible    ${Trainee}
    click element    ${Trainee}
    wait until element is visible    ${Who_Trainee}
    click element    ${Who_Trainee}
    click element   ${Title_NewAssignments}
    wait until element is enabled    ${Starttime_NewAssignments}
    input text      ${Starttime_NewAssignments}     ${Begin_time_NewAssignments}
    click element   ${Title_NewAssignments}
    wait until element is enabled    ${Endtime_NewAssignments}
    input text      ${Endtime_NewAssignments}       ${Due_time_NewAssignments}
    click element   ${Title_NewAssignments}
    wait until element is not visible   ${Data_picker_Assignments}
Input information to Edit Assignments
    [Arguments]      ${FromDate_Editing}  ${ToDate_Editing}
    wait until element is enabled    ${Starttime_EditAssignments}
    input text    ${Starttime_EditAssignments}      ${FromDate_Editing}
    input text    ${Endtime_EditAssignments}      ${ToDate_Editing}
    click element    ${Title_EditAssignments}
    wait until element is not visible    ${Data_picker_Assignments}
Input data to search in Assignments
    [Arguments]    ${Datasearch_Assignments}  ${FromDate_search}  ${ToDate_search}
    wait until element is enabled    ${Searchbox_Assignments}
    input text    ${Searchbox_Assignments}  ${Datasearch_Assignments}
    input text    ${From_Date}      ${FromDate_search}
    input text    ${To_Date}      ${ToDate_search}
    click element   ${Title_FindAssignments}
    wait until element is not visible    ${Data_picker_Assignments}
Check Exist in List and Click Somewhere
    [Arguments]    ${Data_ExistCheck}   ${element_ischosen}
    Wait With Medium Time
#    Wait Until Element Is Visible    ${Topic_row}
    ${count_rows}=    get element count        ${Topic_row}
    FOR    ${i}   IN RANGE   ${count_rows}
           ${pos}=    evaluate        ${i}+1
           ${checkingtarget_locator}=     Combine    ${Topic_row}    [    ${pos}    ]/td[1]
           ${text}=    get text       ${checkingtarget_locator}
           ${result} =  compare string    ${text}    ${Data_ExistCheck}
           IF  ${result} == True
               ${target_clicker}=    Combine    ${Topic_row}    [    ${pos}    ${element_ischosen}
               wait until element is visible    ${target_clicker}
               click element    ${target_clicker}
               log to console   Click successfully
              BREAK
        END
    END
Check Exist in List and Click Somewhere then confirm with 2 option
    [Arguments]    ${Data_ExistCheck}   ${element_ischosen}    ${option_ischosen}
    Wait Until Element Is Visible    ${Topic_row}
    ${count_rows}=    get element count        ${Topic_row}
    FOR    ${i}   IN RANGE   ${count_rows}
           ${pos}=    evaluate        ${i}+1
           ${checkingtarget_locator}=     Combine    ${Topic_row}    [    ${pos}    ]/td[1]
           ${text}=    get text       ${checkingtarget_locator}
           ${result} =  compare string    ${text}    ${Data_ExistCheck}
           IF  ${result} == True
               ${target_clicker}=    Combine    ${Topic_row}    [    ${pos}    ${element_ischosen}
               wait until element is visible    ${target_clicker}
               click element    ${target_clicker}
               log to console   Click Success
               IF    ${option_ischosen}== 0
                    click element    ${ConfirmNO_Delete_button}
               ELSE
                    click element    ${Confirm_Delete_button}
               END
           log to console   Action success
           BREAK
        END
    END
Check Exist in List
    [Arguments]    ${Data_ExistCheck}    ${Placeto_check}
    Wait Until Element Is Visible    ${Topic_row}
    ${count_rows}=    get element count        ${Topic_row}
    FOR    ${i}   IN RANGE   ${count_rows}
           ${pos}=    evaluate        ${i}+1
           ${checkingtarget_locator}=     Combine    ${Topic_row}    [    ${pos}    ]    ${Placeto_check}
           ${text}=    get text       ${checkingtarget_locator}
           ${result} =  compare string    ${text}    ${Data_ExistCheck}
           IF  ${result} == True
                log to console    Its appear!
                BREAK
           END
    END
