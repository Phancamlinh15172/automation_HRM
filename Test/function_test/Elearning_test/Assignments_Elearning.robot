*** Settings ***
Library     SeleniumLibrary
Resource  ../../../Resource/CommonResource.robot
Resource  ../../../Resource/Login_resource.robot
Resource   ../../../Resource/E-learning/Assignments/Assignments_function.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          Open Browser Login
*** Test Cases ***
Check UI of Find assignment box - 3611 - 3618
    Given Admin Login
        when Go to Assignments
        wait until element is visible    ${Title_FindAssignments}
            then page should contain element    ${Title_FindAssignments}    ${Searchbox_Assignments}    ${Status_Title_FindAssignments}
            page should contain element     ${New_assignments_Button}
Verify that user can create New assignments when select data for all field - 3632
    Given Admin Login
        when Go to Assignments
        Wait With Medium Time
        Go to New Assignments
        Input information to new assignments    25/09/2022      07/10/2022
        click element    ${Ok_NewAssignments}
            then wait until element is visible     ${Popup_Notification}
                capture page screenshot
Verify that user can create New assignments when select data for all field - 3640
    Given Admin Login
        when Go to Assignments
        Wait With Medium Time
        Go to New Assignments
        click element    ${Ok_NewAssignments}
            then wait until element is visible     ${Course_Warning_NewAssignments}
                wait until element is visible  ${Trainee_Warning_Assignments}
                capture page screenshot
Check UI of New assignments form - 3666
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
        when Go to New Assignments
        wait until element is visible    ${Title_NewAssignments}
            then page should contain element    ${Title_NewAssignments}    ${Course_NewAssignments}    ${Trainee}
                page should contain button    ${Endtime_NewAssignments}    ${Ok_NewAssignments}    ${Starttime_NewAssignments}
Check the operation of Search text-box - 3684
    Given Admin Login
    And Go to Assignments
        when input data to search in assignments   Testing   ${Notvalue}   ${Notvalue}
            capture page screenshot
#            then element should contain    ${Table_Assignments}    testing
Check the operation of From date date picker - 3685
    Given Admin Login
    And Go to Assignments
    click element    ${From_Date}
        then wait until element is visible    ${Data_picker_Assignments}
Check the operation of To date date picker - 3686
    Given Admin Login
    And Go to Assignments
    click element    ${To_Date}
        then wait until element is visible    ${Data_picker_Assignments}
Check the operation of Status check-box All - 3692
    Given Admin Login
    And Go to Assignments
        when click element    ${Checkbox_All}
            then checkbox should be selected     ${Checked_All_checkbutton}
Check the operation of "Status" check-box "IN-PROGRESS" - 3696
    Given Admin Login
    And Go to Assignments
        when click element    ${Checkbox_INPROGRESS}
            then checkbox should be selected     ${Checked_INPROGRESS_checkbutton}

Check the operation of "Status" check-box "COMPLETED" - 3698
    Given Admin Login
    And Go to Assignments
       when click element    ${Checkbox_COMPLETE}
            then checkbox should be selected     ${Checked_COMPLETE_checkbutton}

Check the operation of "Status" check-box "OVERDUE" - 3699
    Given Admin Login
    And Go to Assignments
       when click element    ${Checkbox_OVERDUE}
            then checkbox should be selected     ${Checked_OVERDUE_checkbutton}
Check the operation of "Status" check-box "OPEN" - 3701
    Given Admin Login
    And Go to Assignments
       when click element    ${Checkbox_OPEN}
            then checkbox should be selected     ${Checked_OPEN_checkbutton}
Check the operation of "Status" check-box "LOCK" - 4470
    Given Admin Login
    And Go to Assignments
       when click element    ${Checkbox_LOCK}
            then checkbox should be selected     ${Checked_LOCK_checkbutton}
Verify that user can not create "New Assignments" if "Course" field is left blank - 3737
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
        when Go to New Assignments
        click element    ${Trainee}
        wait until element is enabled    ${Trainee_NoDATA}
            element text should be    ${Trainee_NoDATA}    ${notvalue}
Check the operation of "Info" icon - 3809
    Given Admin Login
    And Go to Assignments
        When Check Exist in List and Click Somewhere    salmon    ${Info_suffix_button}
            then page should contain element    ${DetailProgress_Title_Assignments}    ${Infor_bar}    ${CloseButton_DetailProgress}
                 capture page screenshot
Check the operation of close "X" button - 3812
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    When Check Exist in List and Click Somewhere    salmon  ${Info_suffix_button}
    click element    ${CloseButton_DetailProgress}
        then wait until element is not visible    ${DetailProgress_Title_Assignments}
            capture page screenshot
Check operation of "No" button of popup confirm delete assignment - 3858
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    When Check Exist in List and Click Somewhere then confirm with 2 option    sangbui    ${Delete_suffix_Button}   0
# 0 to cancel del    1 to Delete
        then element should not be visible    ${Delete_popup_DeleteAssignments}
        capture page screenshot
Verify that user can search assignment by "course", "Start Date" and "Due Date" - 4384
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    when input data to search in assignments    SQL  12/09/2022   07/10/2022
    sleep    1
        then Check Exist in List    SQL     /td[2]
        capture element screenshot    ${table_assignments}
Verify that user can search assignment by "Employee", "Start Date" and "Due Date" - 4383
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    when input data to search in assignments    nam  12/09/2022   07/10/2022
    sleep    1
        then check exist in list    nam    /td[1]
        capture element screenshot    ${table_assignments}
Check the operation of previous "<" button on the first page - 3799
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
        when wait until element is visible    //li[@class='number']
            then element should be disabled    ${Prev_button}
            capture page screenshot
Check the operation of next ">" button on the last page - 3801
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
        when Check Exist in List    SQL     /td[2]
        ${page_number} =    get element count    ${page_pagination}
        ${last_page}=  Combine    ${page_pagination}    [     ${page_number}    ]
        click element    ${last_page}
            then element should be disabled    ${Next_button}
            capture page screenshot
Verify that user can delete the course has been assigned - 3711
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    When Check Exist in List and Click Somewhere then confirm with 2 option    Super Administrator    ${Delete_suffix_Button}   1
# 0 to cancel del    1 to Delete
        then element should not be visible    ${Delete_popup_DeleteAssignments}
        capture page screenshot
Verify that user can update "Start Date" and "Due Date" the course has been assigned - 3715
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    When Check Exist in List and Click Somewhere    Van Truong   ${Edit_suffix_Button}
    wait until element is enabled    ${Starttime_EditAssignments}
    Input information to Edit Assignments    12/09/2022    30/09/2022
      then click element    ${Ok_EditAssignments}
        wait until element is not visible    ${Title_EditAssignments}
            capture page screenshot
Verify that user can search assignment by "Start Date" and "Due Date" - 3920
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    When Input data to search in Assignments   ${notvalue}    07/09/2022    30/09/2022
        then capture page screenshot
Verify that user can not update 'Course - Trainee' field - 3979 - 3980
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    When Check Exist in List and Click Somewhere    Van Truong   ${Edit_suffix_Button}
      then element should be disabled    ${Course_EditAssignments}
            element should be disabled    ${Trainee_EditAssignments}
            capture page screenshot
Check to cancel updating operation - 4172
   Given Admin Login
   And Go to Assignments
   Wait With Medium Time
   When Check Exist in List and Click Somewhere    Van Truong   ${Edit_suffix_Button}
   click element    ${CloseButton_EditAssignments}
       then wait until element is not visible    ${Title_EditAssignments}
            capture page screenshot
Verify that user can search assignment by Employee - 4379
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    when input data to search in assignments    Nguyên  ${Notvalue}  ${Notvalue}
    Wait With Short Time
        then check exist in list    Nguyên    /td[1]
        capture page screenshot    ${table_assignments}
Verify that user can search assignment by Course - 4380
    Given Admin Login
    And Go to Assignments
    Wait With Medium Time
    when input data to search in assignments    java  ${Notvalue}  ${Notvalue}
    Wait With Short Time
        then check exist in list    java    /td[2]
        capture page screenshot
