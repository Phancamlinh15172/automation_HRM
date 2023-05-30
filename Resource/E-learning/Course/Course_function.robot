*** Settings ***
Library     SeleniumLibrary
Resource  ../../../Resource/CommonResource.robot
Library     Utils.Combine_Strings
Variables    Xpath_Course_Elearning.py
*** Keywords ***
Go to Add Course
    wait until element is visible    ${Add_Course_button}
    click element                    ${Add_Course_button}
Input New Title in Add Course
    [Arguments]    ${Title_AddCourse}
    wait until element is visible    ${Title_Input_Course}
    input text                       ${Title_Input_Course}     ${Title_AddCourse}
Check Exist in List and Click Somewhere
    [Arguments]    ${Data_toCheck}  ${Locator_toCheck}  ${element_ischosen_toClick}
    Wait Until Element Is Visible    ${Course_Card}
    ${Counts}=    get element count        ${Course_Card}
    FOR    ${i}   IN RANGE   ${Counts}
           ${pos}=    evaluate        ${i}+1
           ${target_tocheck_locator}=     Combine    ${Course_Card}    [    ${pos}    ${Locator_toCheck}
           ${text}=    get text       ${target_tocheck_locator}
           ${result} =  compare string    ${text}    ${Data_toCheck}
           IF  ${result} == True
               ${target_clicker}=    Combine    ${Course_Card}    [    ${pos}    ${element_ischosen_toClick}
               wait until element is visible    ${target_clicker}
               click element    ${target_clicker}
               log to console   Click successfully
           BREAK
        END
    END
Click Cancel Button with 2 option
    [Arguments]    ${Option_ischosen}
    Wait Until Element Is Visible    ${CancelButton_EditCourse}
    click element   ${CancelButton_EditCourse}
    Wait Until Element Is Visible    ${Messagebox_CancelButton_EditCourse}
    IF    ${Option_ischosen} == 1
        click element  ${OkButton_CancelConfirm_EditCourse}
        Wait Until Element Is Not Visible   ${TitleName_EditCourse}
    ELSE
        click element  ${CancelButton_CancelConfirm_EditCourse}
        Wait Until Element Is Not Visible   ${Messagebox_CancelButton_EditCourse}
    END
Click Delete Button with 2 option
    [Arguments]    ${Option_ischosen}
    Wait Until Element Is Visible    ${DeleteButton_EditCourse}
    click element   ${DeleteButton_EditCourse}
    Wait Until Element Is Visible    ${Messagebox_CancelButton_EditCourse}
    IF    ${Option_ischosen} == 1
        click element  ${OkButton_CancelConfirm_EditCourse}
        Wait Until Element Is Not Visible   ${TitleName_EditCourse}
    ELSE
        click element  ${CancelButton_CancelConfirm_EditCourse}
        Wait Until Element Is Not Visible   ${Messagebox_CancelButton_EditCourse}
    END












































Input Topic to "Add Course"
    [Arguments]   ${Topic_AddCourse}   ${Instructor_AddCourse}    ${ShortDescription_AddCourse}

    wait until element is visible    ${TopicDropdown_Input_AddCourse}
    click element                    ${TopicDropdown_Input_AddCourse}
    wait until element is visible    ${TopicDropdown_Input_AddCourse}
    ${Topic_AddCourse_Number}  = get element count   ${Topic_Dropdown_rows_AddCourse}
    FOR    ${i}  IN RANGE  ${Topic_AddCourse_Number}
           ${pos}=    evaluate        ${i}+1
           ${checkingtarget_locator}=     Combine    ${Topic_Dropdown_rows_AddCourse}    [    ${pos}    ]
           ${text}=    get text       ${checkingtarget_locator}
           ${result} =  compare string    ${text}    ${Data_ExistCheck}
       ${Is_Topic_Exist} =  Run Keyword And Return Status    get text
    #select from list by label        ${TopicDropdown_Input_AddCourse}    ${Topic_AddCourse}
    input text          ${Short_Description_Input_AddCourse}  ${ShortDescription_AddCourse}