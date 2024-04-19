*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
*** Keywords ***
Verify Enter Account Information
    common.Validate txt    //*[@id="form"]/div/div/div/div[1]/h2    ENTER ACCOUNT INFORMATION
Gender Radio Button
    [Arguments]    ${GENDER Mr/Mrs }
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/h2
    Page Should Contain Radio Button    title
    Radio Button Should Not Be Selected    title
    Select Radio Button    title    ${GENDER Mr/Mrs }
    Radio Button Should Be Set To    title    ${GENDER Mr/Mrs }
Input Password
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    css=input[id="password"]:nth-child(2)
    Input Text    css=input[id="password"]:nth-child(2)    ${PASSWORD}
Dropdown Date
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/form/div[5]/label
    Select From List By Value    id=days    ${day}
    Select From List By Value    id=months    ${month}
    Select From List By Value    id=years    ${year}
Check Box Newsletter
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/form/div[5]/label
    Select Checkbox    css=input[id="newsletter"]:nth-child(1)
    Checkbox Should Be Selected    css=input[id="newsletter"]:nth-child(1)
Check Box Patner
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/form/div[5]/label
    Select Checkbox    css=input[id="optin"]:nth-child(1)
    Checkbox Should Be Selected    css=input[id="optin"]:nth-child(1)
Input Personal Information1
    [Arguments]    ${firstname}    ${lastname}    ${company}    ${address1}
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/form/h2/b
    common.Scroll Down    750
    Input Text    id=first_name    ${firstname}
    Input Text    id=last_name    ${lastname}
    Input Text    id=company    ${company}
    Input Text    id=address1    ${address1}
Input Personal Information2
    [Arguments]    ${address2}    ${country}    ${state}    ${city}    ${zipcode}    ${mobile_number}
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/form/p[5]/label
    Input Text    id=address2    ${address2} 
    Select From List By Value    id=country    ${country}
    Input Text    id=state    ${state}
    Input Text    id=city    ${city}
    Input Text    id=zipcode    ${zipcode}
    common.Scroll Down    500
    Input Text    id=mobile_number    ${mobile_number}
Create Account Button
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/div[1]/form/button
    Click Element    xpath=//*[@id="form"]/div/div/div/div/form/button

Verify Account Created
    common.Validate txt    xpath=//*[@id="form"]/div/div/div/h2/b    ACCOUNT CREATED!
