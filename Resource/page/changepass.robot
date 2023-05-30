*** Settings ***
Library     SeleniumLibrary
Resource    ./LoginPage.robot
*** Variables ***
${icon_admin}    xpath://div[@class="el-submenu__title"]/i[@class="el-submenu__icon-arrow el-icon-arrow-down"]
${changepasswd}    xpath://li[@role="menuitem"]//li[text()="Change password"]
${txt_currentpass}    xpath://label[text()="Current Password *"]/parent::div//input
${txt_newpass}    xpath://label[text()="New Password *"]/parent::div//input
${txt_confirmpass}    xpath://label[text()="Confirm Password *"]/parent::div//input
${button_save}    xpath://button[@type='button']
${current_passwd}    123456
${new_passwd}    1234567
${empty}

*** Keywords ***
click on icon admin
    wait until element is visible    ${icon_admin}
    click element    ${icon_admin}
click on Change password
    wait until element is visible    ${changepasswd}
    click element    ${changepasswd}
enter Current Password
    [Arguments]    ${password}
    input password    ${txt_currentpass}    ${password}
enter New Password
    [Arguments]    ${password}
    input password    ${txt_newpass}    ${password}
enter Confirm Password
    [Arguments]    ${password}
    input password    ${txt_confirmpass}    ${password}
click button Save
    click button    ${button_save}
open page change password
    click on icon admin
    click on Change password
User navigated to login page after change password successfully
    wait until element is visible    //h1[text()=" Welcome Back! "]
    element should be visible    //h1[text()=" Welcome Back! "]
change again old password
    Login to Hrm Paradox with new password
    open page change password
    enter Current Password    ${new_passwd}
    enter New Password    ${current_passwd}
    enter Confirm Password    ${current_passwd}
    click button Save





