*** Settings ***
Library    SeleniumLibrary
Library    CSVLibrary
Resource    ../keywords/common.robot
*** Keywords ***
Verify All Product Text
    common.Validate txt    css=h2[class="title text-center"]:nth-child(1)    ALL PRODUCTS
Verify have Products List
    Wait Until Element Is Visible    css=div[class="features_items"]:nth-child(1)
    Page Should Contain Element    css=div[class="features_items"]:nth-child(1)
Verify landed to product detail page
    common.Validate Element    css=div[class="product-information"]:nth-child(1)
Verify Product
    [Arguments]    ${PRODUCTNAME}    ${CATEGORY}    ${AVAILABILITY}    ${CONDITION}    ${BRAND}
    common.Validate txt    xpath=//h2[contains(text(), '${PRODUCTNAME}')]    ${PRODUCTNAME}
    common.Validate txt    //p[contains(text(), 'Category: ${CATEGORY}')]    Category: ${CATEGORY}
    common.Validate txt    //p[contains(text(), ' ${AVAILABILITY}')]   Availability: ${AVAILABILITY}
    common.Validate txt    //p[contains(text(), ' ${CONDITION}')]    Condition: ${CONDITION}
    common.Validate txt    //p[contains(text(), ' ${BRAND}')]    Brand: ${BRAND}
    
Search Product
    [Arguments]    ${SEARCHPRODUCT}
    Wait Until Element Is Visible    css=input[id="search_product"]:nth-child(3)
    Input Text    css=input[id="search_product"]:nth-child(3)    ${SEARCHPRODUCT}
    Click Button    css=button[id="submit_search"]:nth-child(4)
Verify Search Product
    common.Validate Element    id=search_product
Add Product to Cart Button
    [Arguments]    ${PRODUCTID}
    Wait Until Element Is Visible    xpath=/html/body/section[2]/div[1]/div/div[2]/div/h2
    Click Element    css=a[data-product-id="${PRODUCTID}"]:nth-child(4)
Add Product to Cart Overlay
    [Arguments]    ${PRODUCTID}
    @{dict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${dict[${${${PRODUCTID}}}]}[ProductId]

    Wait Until Element Is Visible    xpath=/html/body/section[2]/div[1]/div/div[2]/div/h2
    Mouse Over    css=img[src="/get_product_picture/${PRODUCTID}"]:nth-child(1)
    Click Element    css=a[data-product-id='${PRODUCTID}']:nth-child(3)
ADD to Cart Button
    Wait Until Element Is Visible    css=button[class="btn btn-default cart"]:nth-child(5)
    Click Element    css=button[class="btn btn-default cart"]:nth-child(5)
Verify Product Bar
    [Arguments]    ${SUBCATEGORY}     ${PRODUCTNAME}
    ${ACTUAL}    Get Text    css=h2[class="title text-center"]:nth-child(1)
    ${SUBCATEGORY}    Convert To Upper Case    ${SUBCATEGORY}
    ${PRODUCTNAME}    Convert To Upper Case    ${PRODUCTNAME}
    ${EXPECTED}    Set Variable    ${SUBCATEGORY} - ${PRODUCTNAME} PRODUCTS  
    Should Be Equal    ${ACTUAL}    ${EXPECTED}
Verify Brand Product Bar
    [Arguments]    ${BRAND}
    ${ACTUAL}    Get Text    css=h2[class="title text-center"]:nth-child(1)
    ${BRAND}    Convert To Upper Case    ${BRAND}
    ${EXPECTED}    Set Variable    BRAND - ${BRAND} PRODUCTS
    Should Be Equal    ${ACTUAL}    ${EXPECTED}
Verify ALL PRODUCTS Text
    common.Validate txt    css=h2[class="title text-center"]:nth-child(1)    ALL PRODUCTS
Verify SEARCHED PRODUCTS Text
    common.Validate txt    css=h2[class="title text-center"]:nth-child(1)    SEARCHED PRODUCTS
Verify All The Products Related To Search
    Wait Until Element Is Visible    css=h2[class="title text-center"]:nth-child(1)
    ${COUNTELEMENT}    Get Element Count    xpath=//div[@class="productinfo text-center"]/p
    ${COUNTELEMENT}    Evaluate    ${COUNTELEMENT} + 2
    FOR    ${counter}    IN RANGE    2    ${COUNTELEMENT}    
        Page Should Contain Element    xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[${counter}]/div/div[1]/div[1]/p
        Log    ${counter}
        END
Add All Product from Search to Cart
    Wait Until Element Is Visible    xpath=/html/body/section[2]/div[1]/div/div[2]/div/h2
    ${COUNTELEMENT}    Get Element Count    xpath=//div[@class="productinfo text-center"]/p
    ${COUNTELEMENT}    Evaluate    ${COUNTELEMENT} + 2
    FOR    ${ID}    IN RANGE    2    ${COUNTELEMENT}
        Scroll Element Into View    xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[${ID}]/div/div[2]/ul/li/a
        Click Element    xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[${ID}]/div/div[1]/div[1]/a
        common.Continue Shopping
        END
Verify WRITE YOUR REVIEW Text
    common.Validate txt    css=a[href="#reviews"]:nth-child(1)    WRITE YOUR REVIEW
Verify Thank you for your review
    common.Validate txt    //*[@id="review-section"]/div/div/span    Thank you for your review.
View Products
    [Arguments]    ${PRODUCTID}
    Wait Until Element Is Visible    css=a[href="/product_details/${PRODUCTID}"]:nth-child(1)
    Click Element    css=a[href="/product_details/${PRODUCTID}"]:nth-child(1)
Write Your Review Name
    [Arguments]    ${NAME}
    Wait Until Element Is Visible    css=a[href="#reviews"]:nth-child(1)
    Input Text    css=input[id="name"]:nth-child(1)    ${NAME}
Write Your Review Email
    [Arguments]    ${EMAIL}
    Wait Until Element Is Visible    css=a[href="#reviews"]:nth-child(1)
    Input Text    css=input[id="email"]:nth-child(2)    ${EMAIL}
Write Your Review Review
    [Arguments]    ${REVIEW}
    Wait Until Element Is Visible    css=a[href="#reviews"]:nth-child(1)
    Input Text    css=textarea[id="review"]:nth-child(2)    ${REVIEW}
Submit Review Button
    Wait Until Element Is Visible    id=button-review
    Click Element    id=button-review