*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
*** Keywords ***
Verify Login to your account
    common.Validate txt    //*[@id="form"]/div/div/div[1]/div/h2    Login to your account
Input Email
    [Arguments]    ${EMAIL}
    Wait Until Element Is Visible    css=input[name="email"]:nth-child(2)
    Input Text    css=input[name="email"]:nth-child(2)    ${EMAIL}
Input Password
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    name=password
    Input Text    name=password    ${PASSWORD}
Login Button
    Wait Until Element Is Visible    //*[@id="form"]/div/div/div[1]/div/h2
    Click Element    css=button[type="submit"]:nth-child(4)
Verify Your email or password is incorrect!
    common.Validate txt    //*[@id="form"]/div/div/div[1]/div/form/p    Your email or password is incorrect!