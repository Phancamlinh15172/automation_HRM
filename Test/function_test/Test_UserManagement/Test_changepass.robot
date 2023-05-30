*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/LoginPage.robot
Resource    ../../../Resource/page/changepass.robot
Resource    ../../../Resource/page/action.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          open HRM login page
*** Test Cases ***
Verify that User can change password when enter current password correct - 2803
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${new_passwd}
    enter Confirm Password    ${new_passwd}
    click button Save
    Then User navigated to login page after change password successfully
    change again old password
Verify that User can not change password when enter current password incorrect - 2804
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    12123456
    enter New Password    ${new_passwd}
    enter Confirm Password    ${new_passwd}
    click button Save
    Then check display error message   Your current password is incorrect
    capture page screenshot
Verify that User can not change password when current password correct, new password not enough 6 characters - 2806
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    123
    enter Confirm Password    123
    click button Save
    Then check display error message    New password need more than 6 characters
    capture page screenshot
Verify that User can not change password if leave all fields blank - 2807
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${empty}
    enter New Password    ${empty}
    enter Confirm Password    ${empty}
    click button Save
    Then check display error message    ${error3}
    capture page screenshot
Verify that User can not change password if new password and confirm password have difference - 2808
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${new_passwd}
    enter Confirm Password    123456678
    click button Save
    Then check display error message    Confirm password is incorrect
    capture page screenshot
Verify that User can not change password if leave [Confirm password] field blank - 2810
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${new_passwd}
    enter Confirm Password    ${empty}
    click button Save
    Then check display error message    Please enter confirm password
    capture page screenshot
Verify that User can not change password when leave new password - 2813
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${empty}
    enter Confirm Password    ${empty}
    click button Save
    Then check display error message    Please enter new password
    capture page screenshot
Verify that User can change password with [New password] have 6 characters - 2814
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${new_passwd}
    enter Confirm Password    ${new_passwd}
    click button Save
    Then User navigated to login page after change password successfully
    change again old password
Verify that User can change password with new password have 7 characters - 2816
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${new_passwd}
    enter Confirm Password    ${new_passwd}
    click button Save
    Then User navigated to login page after change password successfully
    change again old password
Verify that User can not change password if leave [Current password] field - 2817
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${empty}
    enter New Password    ${new_passwd}
    enter Confirm Password    ${new_passwd}
    click button Save
    Then check display error message    Please enter current password
    capture page screenshot
Verify that User navigated to login page after change password successfully - 2826
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    ${new_passwd}
    enter Confirm Password    ${new_passwd}
    click button Save
    Then User navigated to login page after change password successfully
    change again old password
Verify that User can not be change password with [New password] have 5 characters - 4350
    Given Login to Hrm Paradox with User account
    When open page change password
    enter Current Password    ${current_passwd}
    enter New Password    12345
    enter Confirm Password    12345
    click button Save
    Then check display error message    New password need more than 6 characters
    capture page screenshot