*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Browser Test
    Open Browser    https://www.google.com    chrome
    Close Browser
