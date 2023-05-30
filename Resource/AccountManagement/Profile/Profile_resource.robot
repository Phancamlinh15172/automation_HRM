*** Settings ***
Library  SeleniumLibrary
Variables  Profile_xpath.py
*** Keywords ***
Access Profile in Search
    click element                     ${Profile_insearch}
Access Profile in User Menu
    wait until element is enabled     ${UserMenu}
    click element                     ${UserMenu}
    wait until element is visible     ${Profile_inUserMenu}
    click element                     ${Profile_inUserMenu}
Edit Profile
    wait until element is visible     ${Profile_EditButton}
    click element                     ${Profile_EditButton}
Picking Joinday Profile
    wait until element is enabled     ${Profile_Joinday}
    click element                     ${Profile_Joinday}
    wait until element is enabled     ${Profile_Joinday_pick}
    click element                     ${Profile_Joinday_pick}
Input Joinday Profile in Future
    wait until element is enabled     ${Profile_Joinday}
    input text                        ${Profile_Joinday}    ${Future_time}
Change Email Profile
    wait until element is enabled     ${Profile_Email}
    input text  ${Profile_Email}      ${Email_DataTest1}
Success Changes Edit Profile
    wait until element is visible     ${Profile_EditButton}
    click element                     ${Profile_EditButton}
    wait until element is enabled     ${Ok_EditProfile}
    click element                     ${Ok_EditProfile}
#    choose cancel on next confirmation
    wait until element is visible     ${Notify_popup}
#    element text should be            ${Notify_popup}       ${Notify_success}
    Check profile update result        ${Notify_success}
Failed Changes Edit Profile
    wait until element is visible     ${Profile_EditButton}
    click element                     ${Profile_EditButton}
    wait until element is enabled     ${Ok_EditProfile}
    click element                     ${Ok_EditProfile}
    wait until element is visible     ${Notify_popup}
    Check profile update result       ${Notify_failed}
Check profile update result
    [Arguments]    ${ProfileUpdate_Notify}
    sleep   1
#    wait until element is visible  ${Notify_popup}
    element text should be         ${Notify_popup}     ${ProfileUpdate_Notify}