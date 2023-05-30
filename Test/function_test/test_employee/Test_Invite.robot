*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/employee.robot
Resource    ../../../Resource/page/action.robot
Test Teardown       Close Browser
Test Setup          open HRM login page
*** Test Cases ***
erify that Admin can invite User account
    Given Login to account with admin role
    When click on Menu Employee Management
    click on Account
    click button Invite user
    ${random_email}=  Generate Random Email
    ${random_name}=   Generate Random Name
    input valid name and email    ${random_name}    ${random_email}
    click button add
    click button Send invitations
    Then check display error message    Sent Successfully
    Displays status below email column    Success
    search and delete users    ${random_email}
Verify that can not invite if email existed
    Given Login to account with admin role
    When click on Menu Employee Management
    click on Account
    click button Invite user
    input name and email existed
    click button add
    click button Send invitations
    Then check display error message    Failure: 1
    Displays status below email column    Already existed