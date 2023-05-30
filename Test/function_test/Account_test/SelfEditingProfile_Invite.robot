*** Settings ***
Library  SeleniumLibrary
Resource  ../../../Resource/CommonResource.robot
Resource  ../../../Resource/Login_resource.robot
Resource  ../../../Resource/AccountManagement/Profile/Profile_resource.robot
Resource  ../../../Resource/AccountManagement/Invite/Invite_resource.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          Open Browser Login
*** Test Cases ***
#Multi Login Testing
#    Login with empty password
#    Delete login value         #del
#    Login with invalid Email
#    Delete login value         #del
#    Login with invalid password
#    Delete login value         #del
#    Login with empty Email
#    Delete login value         #del
#    Login with unformatted Email
#    Delete login value         #del
#Self Editing Profile Successfully - 2263
#    Given User Login
#    WHEN Access Profile in User Menu
#    Edit Profile
#    Change Email Profile
#    then Success Changes Edit Profile
#Invite Users by duplicate email - 2484
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite successfully    nothingto0@gmail.com
#        User Invite successfully    nothingto0@gmail.com
#        Send Invitations
#        Check Invitation results
#Verify when adding a user with a space character name - 2281
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite by just one whitespace name
#Invite User with blank informations - 2480
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite by blank fields
#Invite User with empty Name - 2479
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite by empty Name
#Invite User with empty Email - 2478
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite by empty Email
#Invite Users with 1 new account and 1 existing account - 2477
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite successfully    nothingtotest1@gmail.com
#        User Invite by invalid Email
#        Send Invitations
#        Check Invitation results
#Invite User Successfully - 2476
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite successfully    nothingtotest@gmail.com
#        Send Invitations
#        Check Invitation results
#Verify when sending invites with 1 new account and 1 existing account - 2475
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite successfully    nothingtotest2@gmail.com
#        User Invite by registed email
#Verify the X button is working correctly - 2474
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite successfully    nothingtotest1@gmail.com
#        Remove invited information
#Verify the clear button is working correctly - 2473
#    Given Admin Login
#    And Access Account
#        when Access Invite
#        User Invite successfully    nothingtotest1@gmail.com
#        Clear Invite Databox