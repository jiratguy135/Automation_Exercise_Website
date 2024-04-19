*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/common.robot
*** Keywords ***
Verify Account Delete
    common.Validate txt    xpath=//*[@id="form"]/div/div/div/h2/b    ACCOUNT DELETED!