*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Name Card
    [Arguments]    ${NameCard}
    Wait Until Element Is Visible    name=name_on_card
    Input Text    name=name_on_card    ${NameCard}
Card Number
    [Arguments]    ${NUMBER}
    Wait Until Element Is Visible    name=card_number
    Input Text    name=card_number    ${NUMBER}
CVC
    [Arguments]    ${CVC}
    Wait Until Element Is Visible    name=cvc
    Input Text    name=cvc    ${CVC}
Expiry Month Year
    [Arguments]    ${MONTH}    ${YEAR}
    Wait Until Element Is Visible    name=expiry_month
    Input Text    name=expiry_month    ${MONTH}
    Input Text    name=expiry_year    ${YEAR}
Pay and Confirm Order
    Wait Until Element Is Visible    css=button[data-qa="pay-button"]:nth-child(1)
    Click Element    css=button[data-qa="pay-button"]:nth-child(1)
Download Invoice
    Wait Until Element Is Visible    xpath=//*[@id="form"]/div/div/div/h2
    Click Element    css=a[class="btn btn-default check_out"]:nth-child(3)