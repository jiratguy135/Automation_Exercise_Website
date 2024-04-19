*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
*** Keywords ***
Verify Get In Touch
    common.Validate txt    //*[@id="contact-page"]/div[2]/div[1]/div/h2    GET IN TOUCH
Input Contact Name
    [Arguments]    ${NAME}
    Wait Until Element Is Visible    name=name
    Input Text    name=name    ${NAME}
Input Contact Email
    [Arguments]    ${EMAIL}
    Wait Until Element Is Visible    name=email
    Input Text    name=email    ${EMAIL}
Input Contact Subject
    [Arguments]    ${SUBJECT}
    Wait Until Element Is Visible    name=subject
    Input Text    name=subject    ${SUBJECT}
Input Contact Message
    [Arguments]    ${MESSAGE}
    Wait Until Element Is Visible    name=message
    Input Text    name=message  ${MESSAGE}
Upload File
    [Arguments]    ${PATHFILE}
    Wait Until Element Is Visible    name=upload_file
    Choose File    name=upload_file    ${PATHFILE}
Submit Button
    Wait Until Element Is Visible    name=submit
    Click Element    name=submit
Alert Button
    [Arguments]    ${action}
    IF    '${action}' == 'OK'
        Handle Alert    action=ACCEPT
    ELSE
        Handle Alert    action=DISMISS
    END
Verify Success! Your details have been submitted successfully
    common.Validate txt    //*[@id="contact-page"]/div[2]/div[1]/div/div[2]    Success! Your details have been submitted successfully.
Home Button
    Wait Until Element Is Visible    xpath=//*[@id="form-section"]/a
    Click Element    xpath=//*[@id="form-section"]/a