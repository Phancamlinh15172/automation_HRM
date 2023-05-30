*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Resource/page/LoginPage.robot
Resource    ../../../Resource/page/Organization_team.robot
Library    String
Test Teardown       Close Browser
Test Setup          open HRM login page
*** Test Cases ***
Verify that can edit team profile with [Team name] have 3 characters - 4201
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input name data    aaa
    click save button
    check display error message    Updated Successfully
    capture page screenshot
Verify that unable update team profile with team name < 3 characters - 4229
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input name data    aa
    verify message displays below fields required    Team name must be between 3 and 100 characters
    check display error message    Input is invalid!
    capture page screenshot
Verify that can update team profile with team name >3 characters - 4230
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input name data    aaam
    click save button
    check display error message     Updated Successfully
    capture page screenshot
Verify that unable update team profile if leave [Name] filed blank - 4259
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input name data    ${empty}
    click save button
#    verify message displays below fields required    Team name must be between 3 and 100 characters
    check display error message    Input is invalid!
    capture page screenshot
Verify that still can update team profile with leave [Email] field blank - 4259
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    ${empty}
    sleep    2
    Click Edit icon
    click save button
    check display error message    Updated Successfully
    capture page screenshot
Verify that unable update team profile with Email < 6 characters - 4260
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minhh@gmail.com
    Click Edit icon
    verify message displays below fields required    Team email is Invalid
    check display error message    Input is invalid!
    capture page screenshot
Verify that can update team profile with Email have 6 characters - 4262
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minnhh@gmail.com
    Click Edit icon
    click save button
    check display error message    Updated Successfully
    capture page screenshot
Verify that can update team profile with Email > 6 characters - 4264
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minnhh1@gmail.com
    Click Edit icon
    click save button
    check display error message    Updated Successfully
    capture page screenshot
Verify that can Update team profile with email have 33 characters - 4265
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com
    Click Edit icon
    click save button
    check display error message    Updated Successfully
    capture page screenshot
Verify that can update team profile with Email < 33 characters - 4266
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com
    Click Edit icon
    click save button
    check display error message    Updated Successfully
    capture page screenshot
Verify that unable update team profile with Email > 33 characters - 4267
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com
    Click Edit icon
    verify message displays below fields required   Team email is Invalid
    check display error message    Input is invalid!
    capture page screenshot
Verify that unable update team profile with email have blank characters - 4269
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minh 123@gmail.com
    Click Edit icon
    verify message displays below fields required   Team email is Invalid
    check display error message    Input is invalid!
    capture page screenshot
Verify that unable update team profile with Email missing @ - 4272
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minh123gmail.com
    Click Edit icon
    verify message displays below fields required   Team email is Invalid
    check display error message    Input is invalid!
    capture page screenshot
Verify that unable update team profile with Email missing "." - 4274
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minh123@gmailcom
    Click Edit icon
    verify message displays below fields required   Team email is Invalid
    check display error message    Input is invalid!
    capture page screenshot
Verify that can be updated team profile if there are 3 characters after the "." - 4287
    Given Login to account with admin role
    When Go to Team page
    click edit Team    aaa
    input email data    minh123aq.commm
    Click Edit icon
    verify message displays below fields required   Team email is Invalid
    check display error message    Input is invalid!
    capture page screenshot
