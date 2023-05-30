*** Settings ***
Library  SeleniumLibrary
Resource  ../../../Resource/Login_resource.robot
Resource  ../../../Resource/CommonResource.robot
Resource  ../../../Resource/AccountManagement/Export_file/Export_file_function.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          Open Browser Login
*** Test Cases ***
Verify export file
    Admin Login
    Access Account
    Export_file to excel
    Export_file to excel