*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/LoginPage.robot
Resource    ../../../Resource/page/Organization_team.robot
Library    String
Test Teardown       Close Browser
Test Setup          open HRM login page
*** Test Cases ***
Verify that Admin can create new team - 3507
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields
    check display error message    Added Successfully
    capture page screenshot
    delete    Test
Verify that unable create new team if leave [Team name] field blank - 3511
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    name=${empty}
    Verify message displays below fields required   Team name is required
    capture page screenshot

Verify that unable create new team if leave [Team leader ] field blank - 3512
    Given Login to account with admin role
    When Go to Team page
    Input add New Team form with missing value team leader
    Verify message displays below fields required   Please input team leader
    capture page screenshot
Verify that unable create new team if leave all field blank - 3589
    Given Login to account with admin role
    When Go to Team page
    click on Create New Team button
    click button    ${ADD_NEW_TEAM_CREATE_BUTTON}
    check displays below fields required    Team name is required    Please input team leader
    capture page screenshot
Verify that unable create new team if team name already exist - 3717
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    name=Melon
    check display error message    Add Failed
    capture page screenshot
Verify that unable create new team with team name 2 characters - 3718
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    name=ee
    Verify message displays below fields required    Team name must be between 3 and 100 characters
    capture page screenshot
Verify that can create new team with team name have 3 characters - 3720
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    name=eee
    check display error message  Added Successfully
    capture page screenshot
    delete    eee
Verify that can create new team with team name have 4 characters - 3721
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    name=eeee
    check display error message  Added Successfully
    capture page screenshot
    delete    eeee
Verify that unable create new team if team name only blank characters - 3728
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    name=
    Verify message displays below fields required    Team name is required
    capture page screenshot
Verify that unable create new team if team email contain blank character - 3757
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    email=minh 123@gmail.com
    Verify message displays below fields required    Team email is Invalid
    capture page screenshot
Verify that unable create new team if team email contain 5 characters - 3758
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    email=mi123@gmail.com
    Verify message displays below fields required    Team email is Invalid
    capture page screenshot
    Given Login to account with admin roleVerify that unable create new team if team email contain 34 characters - 3765

    When Go to Team page
    Fill data for fields    email=ggg12ggg12ggg12ggg12ggg12ggg1ggg12@gmail.com
    Verify message displays below fields required    Team email is Invalid
    capture page screenshot
 - 3772
    Given Login to account with admin roleVerify that can create new team if team email contain 6 characters
    When Go to Team page
    Fill data for fields    email=minhhh@gmail.com
    check display error message    Added Successfully
    capture page screenshot
    delete    Test
Verify that can create new team if team email contain 7 characters - 3774
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    email=minhhhh@gmail.com
    check display error message    Added Successfully
    capture page screenshot
    delete    Test
Verify that can create new team if team email contain 33 characters - 3775
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    email=minhgnoanf123456987we.g.234789256@gmail.com
    check display error message    Added Successfully
    capture page screenshot
    delete    Test
Verify that can create new team if team email contain 32 characters - 3776
    Given Login to account with admin role
    When Go to Team page
    Fill data for fields    email=minhgnoanf123456987we.g.23478925@gmail.com
    check display error message    Added Successfully
    capture page screenshot
    delete    Test
Check the Previous/ Next button is disabled on first/ final pagination - 4122
    Given Login to account with admin role
    When Go to Team page
    Observe the Previous/ Next button is disabled on the first/final pagination
    capture page screenshot





