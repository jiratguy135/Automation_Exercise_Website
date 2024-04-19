*** Settings ***
Library    SeleniumLibrary
Library    CSVLibrary
Resource    ../keywords/common.robot
*** Keywords ***
Verify Subscription Text
    common.Validate txt    //*[@id="footer"]/div[1]/div/div/div[2]/div/h2    SUBSCRIPTION
Subscription Button
    [Arguments]    ${EMAIL}
    Wait Until Element Is Visible    id=susbscribe_email
    Input Text    id=susbscribe_email    ${EMAIL}
    Click Button    css=button[id="subscribe"]:nth-child(3)
Verify You have been successfully subscribed!
    common.Validate txt    //*[@id="success-subscribe"]/div    You have been successfully subscribed!

Verify Product Detail
    common.Validate txt    //*[@id="product-1"]/td[2]/h4/a    Blue Top
    common.Validate txt    //*[@id="product-2"]/td[2]/h4/a    Men Tshirt
    common.Validate txt    //*[@id="product-1"]/td[3]/p    Rs. 500
    common.Validate txt    //*[@id="product-2"]/td[3]/p    Rs. 400
    common.Validate txt    //*[@id="product-1"]/td[4]/button    1
    common.Validate txt    //*[@id="product-2"]/td[4]/button    1
    common.Validate txt    //*[@id="product-1"]/td[5]/p    Rs. 500
    common.Validate txt    //*[@id="product-2"]/td[5]/p    Rs. 400
Verify Product in Cart    ## แก้
    [Arguments]    ${Count}
    ${Count}    Evaluate    ${Count} + 1
    FOR    ${ID}    IN RANGE    1    ${Count}
        @{dict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
        ${PRODUCTID}    Set Variable    ${dict[${${${ID}}}]}[ProductId]
        ${PRODUCTNAME}    Set Variable    ${dict[${${${ID}}}]}[ProductName]
        ${PRICE}    Set Variable    ${dict[${${${ID}}}]}[Price]
        common.Validate txt    //*[@id="product-${ID}"]/td[2]/h4/a    ${PRODUCTNAME}
        common.Validate txt    //*[@id="product-${ID}"]/td[3]/p    Rs. ${PRICE}

        ${QUANTITY}    Get Text    //*[@id="product-${ID}"]/td[4]/button
        common.Validate txt    //*[@id="product-${ID}"]/td[4]/button    ${QUANTITY}

        ${TOTALPRICE}    Evaluate    ${PRICE} * ${QUANTITY}
        common.Validate txt    //*[@id="product-${ID}"]/td[5]/p    Rs. ${TOTALPRICE}  
    END
    
Input Quantity
    [Arguments]    ${QUANTITY}
    Wait Until Element Is Visible    id=quantity
    Clear Element Text    id=quantity
    Input Text    id=quantity    ${QUANTITY}

Verify Quantity
    [Arguments]    ${QUANTITY}
    common.Validate txt    //*[@id="product-1"]/td[4]/button    ${QUANTITY}
Verify Shopping Cart
    common.Validate Element    //*[@id="cart_items"]/div/div[1]/ol/li[2]
Proceed To Checkout
    Wait Until Element Is Visible    //*[@id="cart_items"]/div/div[1]/ol/li[2]
    Click Element    css=a[class="btn btn-default check_out"]:nth-child(1)
X Cancel Product
    [Arguments]    ${PRODUCT}
    Wait Until Element Is Visible    //*[@id="cart_items"]/div/div[1]/ol/li[2]
    Click Element    css=a[class="cart_quantity_delete"][data-product-id="${PRODUCT}"]:nth-child(1)
Verify Cart is empty!
    common.Validate txt    //*[@id="empty_cart"]/p/b    Cart is empty!