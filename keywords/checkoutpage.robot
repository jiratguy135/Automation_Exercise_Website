*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/common.robot
*** Keywords ***
Verify Delivery Address
    [Arguments]    ${FULLNAME}    ${COMPANY}    ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    common.Validate txt    //*[@id="address_delivery"]/li[2]    ${FULLNAME}
    common.Validate txt    //*[@id="address_delivery"]/li[3]    ${COMPANY}
    common.Validate txt    //*[@id="address_delivery"]/li[4]    ${ADDRESS1} 
    common.Validate txt    //*[@id="address_delivery"]/li[5]    ${ADDRESS2} 
    common.Validate txt    //*[@id="address_delivery"]/li[6]    ${PROVICE}
    common.Validate txt    //*[@id="address_delivery"]/li[7]    ${COUNTRY}
    common.Validate txt    //*[@id="address_delivery"]/li[8]    ${MOBILE}
Verify Billing Address
    [Arguments]    ${FULLNAME}    ${COMPANY}    ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    common.Validate txt    //*[@id="address_invoice"]/li[2]    ${Fullname}
    common.Validate txt    //*[@id="address_invoice"]/li[3]    ${COMPANY}
    common.Validate txt    //*[@id="address_invoice"]/li[4]    ${ADDRESS1}
    common.Validate txt    //*[@id="address_invoice"]/li[5]    ${ADDRESS2}
    common.Validate txt    //*[@id="address_invoice"]/li[6]    ${PROVICE}
    common.Validate txt    //*[@id="address_invoice"]/li[7]    ${COUNTRY}
    common.Validate txt    //*[@id="address_invoice"]/li[8]    ${MOBILE}
Review Order
    [Arguments]    ${PRODUCTNAME}
    common.Validate txt    //*[@id="product-1"]/td[2]/h4/a    ${PRODUCTNAME}
Comment Text Box
    [Arguments]    ${TXT}
    Wait Until Element Is Visible    name=message
    Input Text    name=message    ${TXT}
Place Order Button
    Wait Until Element Is Visible    css=a[href="/payment"]:nth-child(1)
    Click Element    css=a[href="/payment"]:nth-child(1)
