*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Export_button}    //div[@title="Click to export excel"]
*** Keywords ***
Export_file to excel
    wait until element is enabled  ${Export_button}
    CLICK ELEMENT  ${Export_button}
