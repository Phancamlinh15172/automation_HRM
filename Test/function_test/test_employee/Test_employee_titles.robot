*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/employee.robot
Resource    ../../../Resource/page/action.robot
Test Teardown       Close Browser
Test Setup          open HRM login page
*** Test Cases ***
#Verify create title successfully with valid Title name - 3907
#    Given Login to account with admin role
#    When click on Menu Employee Management
#    click on Titles
#    click on the Create New Title button
#    input Title Name    LinhTest
#    click on the Create button
#    Then check display error message    ${error_pass}
#    capture page screenshot
#Verify create title failed with invalid Title name -3908
#    Given Login to account with admin role
#    When click on Menu Employee Management
#    click on Titles
#    click on the Create New Title button
#    input Title Name    ${name1}
#    click on the Create button
#    Then check display error message    ${error_fail}
#    capture page screenshot
#Verify the Remove button is working correctly - 3910
#    Given Login to account with admin role
#    When click on Menu Employee Management
#    click on Titles
#    delete    LinhTest
#    Then check display error message    ${error_removed}
#    capture page screenshot
#
#Verify the search title is working correctly - 3911
#    Given Login to account with admin role
#    When click on Menu Employee Management
#    click on Titles
#    wait until element is visible    ${search}
#    input text    ${search}    auto
#    Then verify search successfully    test
#    capture page screenshot
#Verify update title successfully with valid Title name - 3912
#    Given Login to account with admin role
#    When click on Menu Employee Management
#    click on Titles
#    edit title    123    123
#    Then check display error message    ${error_update}
#    capture page screenshot
#Verify update title successfully with valid Title name - 3912
#    Given Login to account with admin role
#    When click on Menu Employee Management
#    click on Titles
#    edit title    linh    123
#    Then check display error message    ${error_fail}
#    capture page screenshot
Verify update title successfully with valid Title name - 3912
    Given Login to account with admin role
    When click on Menu Employee Management
    click on Titles
    delete
