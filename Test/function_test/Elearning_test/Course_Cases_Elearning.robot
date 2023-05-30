*** Settings ***
Library     SeleniumLibrary
Resource  ../../../Resource/CommonResource.robot
Resource  ../../../Resource/Login_resource.robot
Resource   ../../../Resource/E-learning/Course/Course_function.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          Open Browser Login
*** Test Cases ***
#Check to create a successful course - 3591
#    Given Admin Login
#        when Go to Course
#        Go to Add Course
#        Input New Title in Add Course    ABC
#Check when pressing the add new button continuously - 3813
#    Given Admin Login
#        when Go to Course
#        Go to Add Course
Check the confirmation display when editing - 3816 - 3617
    Given Admin Login
        when Go to Course
        Check Exist In List And Click Somewhere    The Python Tutorial   ${CourseName_Suffix}   ${CourseEdit_Suffix}
        Wait Until Element Is Visible    ${TitleName_EditCourse}
        page should contain element     ${TitleName_EditCourse}
        capture page screenshot
        clear element text  ${Title_Input_Course}
        input text  ${Title_Input_Course}    The Python Tutorial 102
        click element   ${SaveButton_EditCourse}
        capture page screenshot
Check to cancel editing operation - 3818
    Given Admin Login
        when Go to Course
        Check Exist In List And Click Somewhere    Python Tutorial  ${CourseName_Suffix}   ${CourseEdit_Suffix}
        Wait Until Element Is Visible    ${Title_Input_Course}
        input text  ${Title_Input_Course}    The Python Tutorial
        Click Cancel Button with 2 option   1
        capture page screenshot
Check the confirmation display when editing - 3819
    Given Admin Login
        when Go to Course
        Check Exist In List And Click Somewhere   Python Tutorial   ${CourseName_Suffix}   ${CourseEdit_Suffix}
        Wait Until Element Is Visible    ${Title_Input_Course}
        element should be disabled       ${SaveButton_EditCourse}
        capture page screenshot
Check delete a successful course - 3820
    Given Admin Login
        when Go to Course
        Check Exist In List And Click Somewhere   Python Tutorial 1   ${CourseName_Suffix}   ${CourseEdit_Suffix}
        Wait Until Element Is Visible    ${Title_Input_Course}
        Click Delete Button with 2 option   1
        capture page screenshot

