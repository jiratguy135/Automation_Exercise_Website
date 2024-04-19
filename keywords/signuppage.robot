*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
*** Keywords ***
Verify New User Signup
    common.Validate txt    //*[@id="form"]/div/div/div[3]/div/h2    New User Signup!
Input Name
    [Arguments]    ${NAME}
    Wait Until Element Is Visible    name=name
    Input Text    name=name    ${NAME}
Input Email
    [Arguments]    ${EMAIL}
    Wait Until Element Is Visible    css=input[name="email"]:nth-child(3)
    Input Text    css=input[name="email"]:nth-child(3)    ${EMAIL}
Signup Button
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div[3]/div/h2
    Click Element    xpath=//*[@id="form"]/div/div/div[3]/div/form/button
Verify Email Address already exist!
    common.Validate txt    //*[@id="form"]/div/div/div[3]/div/form/p    Email Address already exist!