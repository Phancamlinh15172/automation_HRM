*** Settings ***
Library  SeleniumLibrary
Resource  ../../../Resource/CommonResource.robot
Resource  ../../../Resource/Login_resource.robot
Resource  ../../../Resource/AccountManagement/SearchResource.robot
Resource  ../../../Resource/AccountManagement/Profile/Profile_resource.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          Open Browser Login
*** Test Cases ***
#Search User by 6 condition and go to profile page - 2425
#    Given Admin Login
#    And Access Account
#    WHEN Search by Name
#         Search by Birthday
#         Search by JoinDay
#         Search by Gender
#         Search by Position
#         Search by Team
#Search User by 5 condition and go to profile page - 2424
#    Given Admin Login
#    And Access Account
#    WHEN Search by Name
#         Search by Birthday
#         Search by JoinDay
#         Search by Gender
#         Search by Position
#            then Checking Existance    ${Search_value}
#Search User by 4 condition and go to profile page - 2423
#    Given Admin Login
#    And Access Account
#    WHEN Search by Name
#         Search by Birthday
#         Search by JoinDay
#         Search by Gender
#         Search by Position
#            then Checking Existance    ${Search_value}
#Search User by 3 condition and go to profile page - 2422
#    Given Admin Login
#    And Access Account
#    WHEN Search by Name
#         Search by Birthday
#         Search by Position
#            then Checking Existance    ${Search_value}
#Search User by 2 condition and go to profile page - 2422
#    Given Admin Login
#    And Access Account
#    WHEN Search by Birthday
#         Search by Position
#            then Checking Existance    ${Search_value}
#Open Profile in Search screen and edit joinday successfully by Admin - 2230
#    Given Admin Login
#    And Access Account
#    WHEN Search by Birthday
#         Search by Position
#         Checking Existance    ${Search_value}
#         Edit Profile
#         Picking Joinday Profile
#            then Success Changes Edit Profile    #success
#Open Profile in Search screen and edit joinday unsuccessfully - 3921
#    Given Admin Login
#    And Access Account
#    WHEN Search by Birthday
#         Search by Position
#         Checking Existance    ${Search_value}
#         Edit Profile
#         Input Joinday Profile in Future
#            then Failed Changes Edit Profile     #failed
Open Profile in Search screen and edit joinday successfully by User have Admin role - 2779
    Given User Login
#    And Access Account
#    WHEN Search by Birthday
#         Search by Position
#         Checking Existance    ${Search_value}
#         Edit Profile
#         Picking Joinday Profile
#            then Success Changes Edit Profile    #success
