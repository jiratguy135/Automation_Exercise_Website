*** Settings ***
Library    SeleniumLibrary
Library    String
*** Keywords ***
Launch Browser
    Open Browser    http://automationexercise.com    chrome
    Maximize Browser Window
    
Validate txt
    [Arguments]    ${locatortxt}    ${expected}
    Wait Until Element Is Visible    ${locatortxt}
    ${actual}    Get Text    ${locatortxt}
    Should Be Equal    ${actual}    ${expected}
    
Validate Element
    [Arguments]    ${locatorhomepage}
    Page Should Contain Element    ${locatorhomepage}
Scroll Down
    [Arguments]    ${index}
    Execute Javascript    window.scrollTo(0, ${index})
Scroll to Bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
Scroll to Top
    Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
Continue Button
    Click Element    xpath=//*[@id="form"]/div/div/div/div/a
Verify Test Cases Page
    common.Validate Element    //*[@id="form"]/div/div[2]/h5/span

View Products
    [Arguments]    ${PRODUCTID}
    Wait Until Element Is Visible    css=a[href="/product_details/${PRODUCTID}"]:nth-child(1)
    Click Element    css=a[href="/product_details/${PRODUCTID}"]:nth-child(1)
Continue Shopping
    Wait Until Element Is Visible    xpath=//*[@id="cartModal"]/div/div/div[1]/h4
    Click Element    css=button[class="btn btn-success close-modal btn-block"]:nth-child(1)
View Cart
    Wait Until Element Is Visible    xpath=//*[@id="cartModal"]/div/div/div[1]/h4
    Click Element    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a
