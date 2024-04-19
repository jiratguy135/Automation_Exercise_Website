*** Settings ***
Library    SeleniumLibrary
Library    CSVLibrary
Resource    ../keywords/common.robot
*** Keywords ***
Verify Hompage Display Success
    common.Validate Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[1]/a
Click Signup / Login
    Wait Until Element Is Visible    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Verify Username
    [Arguments]    ${USERNAME}
    common.Validate txt    //*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a    Logged in as ${USERNAME}
    


Click Delete
    Wait Until Element Is Visible    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a

Logout
    Wait Until Element Is Visible    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    
Contact us
    Wait Until Element Is Visible    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a




TestCases Button
    Wait Until Element Is Visible    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a

Products Button
    Wait Until Element Is Visible    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
Verify Subscription Text
    common.Validate txt    //*[@id="footer"]/div[1]/div/div/div[2]/div/h2    SUBSCRIPTION
Subscription Button
    [Arguments]    ${EMAIL}
    Wait Until Element Is Visible    id=susbscribe_email
    Input Text    id=susbscribe_email    ${EMAIL}
    Click Button    css=button[id="subscribe"]:nth-child(3)
Verify You have been successfully subscribed!
    common.Validate txt    //*[@id="success-subscribe"]/div    You have been successfully subscribed!
Add Product to Cart Button
    [Arguments]    ${PRODUCTID}
    Wait Until Element Is Visible    xpath=/html/body/section[2]/div[1]/div/div[2]/div/h2
    Click Element    css=a[data-product-id="${PRODUCTID}"]:nth-child(4)
Cart Button
    Wait Until Element Is Visible    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a/i
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a/i
View Products
    [Arguments]    ${PRODUCTID}
    @{dict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${dict[${${${PRODUCTID}}}]}[ProductId]
    Wait Until Element Is Visible    css=a[href="/product_details/${PRODUCTID}"]:nth-child(1)
    Click Element    css=a[href="/product_details/${PRODUCTID}"]:nth-child(1)
Click Register / Login
    Wait Until Element Is Visible    //*[@id="checkoutModal"]/div/div/div[2]/p[2]/a/u
    Click Element    //*[@id="checkoutModal"]/div/div/div[2]/p[2]/a/u
Verify Category Bar
    common.Validate Element    id=accordian
Category on Left Side Bar
    [Arguments]    ${CATEGORIES}
    Wait Until Element Is Visible    id=accordian
    Click Element    css=a[href="#${CATEGORIES}"]:nth-child(1)
SubCategory
    [Arguments]    ${PRODUCTID}
    Wait Until Element Is Visible    id=accordian
    Click Element    css=a[href="/category_products/${PRODUCTID}"]:nth-child(1)
Verify Brands
    common.Validate Element    css=div[class="brands_products"]:nth-child(3)
Brands
    [Arguments]    ${BRAND}
    Wait Until Element Is Visible    css=div[class="brands_products"]:nth-child(3)
    Click Element    css=a[href="/brand_products/${BRAND}"]:nth-child(1)
Verify Recommend Text and Recommend Bar
    Scroll Element Into View    css=div[id="recommended-item-carousel"]:nth-child(2)
    common.Validate txt    xpath=/html/body/section[2]/div[1]/div[1]/div[2]/div[2]/h2    RECOMMENDED ITEMS
Recommend Products
    [Arguments]    ${ROW}    ${PRODUCT}
    Wait Until Element Is Visible    //*[@id="recommended-item-carousel"]/div/div[${ROW}]/div[${PRODUCT}]/div/div/div/a
    Click Element    //*[@id="recommended-item-carousel"]/div/div[${ROW}]/div[${PRODUCT}]/div/div/div/a
Verify Full-Fledged practice website for Automation Engineers
    common.Validate txt    //*[@id="slider-carousel"]/div/div[1]/div[1]/h2    Full-Fledged practice website for Automation Engineers
Scroll Up Button
    Wait Until Element Is Visible    //*[@id="footer"]/div[1]/div/div/div[2]/div/h2
    Click Element    id=scrollUp