*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Library    OperatingSystem
Library    CSVLibrary

Resource    ../keywords/common.robot
Resource    ../keywords/homepage.robot
Resource    ../keywords/signuppage.robot
Resource    ../keywords/loginpage.robot
Resource    ../keywords/registerpage.robot
Resource    ../keywords/deletepage.robot
Resource    ../keywords/contactpage.robot
Resource    ../keywords/productpage.robot
Resource    ../keywords/cartpage.robot
Resource    ../keywords/checkoutpage.robot
Resource    ../keywords/paymentpage.robot

Task Setup    common.Launch Browser
Task Teardown    Close Browser
*** Variables ***
*** Variables ***
${PATHFILE}    ${CURDIR}/Window.png
${CONFIGQUANTITY}    4
${SEARCHPRODUCT}    Polo
${PATHDOWLOAD}    D:/Users/Guyji/Downloads/invoice.txt
*** Test Cases ***
Test Case 1: Register User
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${0}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${0}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${0}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${0}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${0}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${0}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${0}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${0}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${0}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${0}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${0}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${0}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${0}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${0}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${0}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${0}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${0}}]}[Mobile]
    
    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    signuppage.Verify New User Signup
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    registerpage.Verify Enter Account Information
    registerpage.Gender Radio Button    ${Mr/Mrs}
    registerpage.Input Password    ${PASSWORD}
    registerpage.Dropdown Date    ${DAY}    ${MONTH}    ${YEAR}
    registerpage.Check Box Newsletter
    registerpage.Check Box Patner
    registerpage.Input Personal Information1    ${FNAME}     ${LNAME}    ${COMPANY}    ${ADDRESS1}
    registerpage.Input Personal Information2    ${ADDRESS2}    ${COUNTRY}    ${STATE}    ${CITY}    ${ZIPCODE}    ${MOBILE}
    registerpage.Create Account Button
    registerpage.Verify Account Created
    common.Continue Button
    Execute Manual Step    ClickAds    # Handle Advertising
    homepage.Verify Username    ${USERNAME}
    homepage.Click Delete
    deletepage.Verify Account Delete
    common.Continue Button
Test Case 2: Login User with correct email and password
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${1}}]}[Password]

    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    loginpage.Verify Login to your account
    loginpage.Input Email    ${MAIL}
    loginpage.Input Password    ${PASSWORD}
    loginpage.Login Button
    homepage.Verify Username    ${USERNAME}
    homepage.Click Delete
    deletepage.Verify Account Delete
Test Case 3: Login User with incorrect email and password
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${MAILINCORRECT}    Set Variable    ${customerdict[${${2}}]}[Mail]
    ${PASSWORDINCORREC}    Set Variable    ${customerdict[${${2}}]}[Password]

    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    loginpage.Verify Login to your account
    loginpage.Input Email    ${MAILINCORRECT}
    loginpage.Input Password    ${PASSWORDINCORREC}
    loginpage.Login Button
    loginpage.Verify Your email or password is incorrect!
Test Case 4: Logout User
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${1}}]}[Password]

    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    loginpage.Verify Login to your account
    loginpage.Input Email    ${MAIL}
    loginpage.Input Password    ${PASSWORD}
    loginpage.Login Button
    homepage.Verify Username    ${USERNAME}
    homepage.Logout
    loginpage.Verify Login to your account
Test Case 5: Register User with existing email
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${1}}]}[Password]

    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    signuppage.Verify New User Signup
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    signuppage.Verify Email Address already exist!
Test Case6: Contact Us Form
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${1}}]}[Password]
    ${NAME}    Set Variable    ${customerdict[${${1}}]}[FullName]
    ${SUBJECT}    Set Variable    ${customerdict[${${1}}]}[Subject]
    ${MESSAGE}    Set Variable    ${customerdict[${${1}}]}[Message]

    homepage.Verify Hompage Display Success
    homepage.Contact us
    contactpage.Verify Get In Touch
    contactpage.Input Contact Name    ${NAME}
    contactpage.Input Contact Email    ${MAIL}
    contactpage.Input Contact Subject    ${SUBJECT}
    contactpage.Input Contact Message    ${MESSAGE}
    contactpage.Upload File    ${PATHFILE}
    contactpage.Submit Button
    contactpage.Alert Button    OK
    contactpage.Verify Success! Your details have been submitted successfully
    contactpage.Home Button
    homepage.Verify Hompage Display Success
Test Case 7: Verify Test Cases Page
    homepage.Verify Hompage Display Success
    homepage.TestCases Button
    Execute Manual Step    ClickAds    # Handle Advertising
    common.Verify Test Cases Page
Test Case 8: Verify All Products and product detail page
    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${productdict[${${0}}]}[ProductId]
    ${PRODUCTNAME}    Set Variable    ${productdict[${${0}}]}[ProductName]
    ${CATEGORY}    Set Variable    ${productdict[${${0}}]}[Category]
    ${AVAILABILITY}    Set Variable    ${productdict[${${0}}]}[Availability]
    ${CONDITION}    Set Variable    ${productdict[${${0}}]}[Condition]
    ${BRAND}    Set Variable    ${productdict[${${0}}]}[Brand]


    homepage.Verify Hompage Display Success
    homepage.Products Button
    productpage.Verify All Product Text
    productpage.Verify have Products List
    common.Scroll Down    500
    common.View Products    ${PRODUCTID}
    Execute Manual Step    ClickAds    # Handle Advertising
    productpage.Verify landed to product detail page
    productpage.Verify Product    ${PRODUCTNAME}    ${CATEGORY}    ${AVAILABILITY}    ${CONDITION}    ${BRAND}
Test Case 9: Search Product
    homepage.Verify Hompage Display Success
    homepage.Products Button
    productpage.Verify All Product Text
    productpage.Search Product    ${SEARCHPRODUCT}
    productpage.Verify Search Product
    common.Scroll Down    500
Test Case 10: Verify Subscription in home page
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    homepage.Verify Hompage Display Success
    common.Scroll to Bottom
    homepage.Verify Subscription Text
    homepage.Subscription Button    ${MAIL}
    homepage.Verify You have been successfully subscribed!
Test Case 11: Verify Subscription in Cart page
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    
    homepage.Verify Hompage Display Success
    homepage.Cart Button
    common.Scroll to Bottom
    cartpage.Verify Subscription Text
    cartpage.Subscription Button    ${MAIL}
    cartpage.Verify You have been successfully subscribed!
Test Case 12: Add Products in Cart
    homepage.Verify Hompage Display Success
    homepage.Products Button
    Scroll Down    500
    productpage.Add Product to Cart Overlay    1
    common.Continue Shopping
    productpage.Add Product to Cart Overlay    2
    common.View Cart
    cartpage.Verify Product in Cart    2    ## แก้
Test Case 13: Verify Product quantity in Cart
    homepage.Verify Hompage Display Success
    homepage.View Products    1
    productpage.Verify landed to product detail page
    cartpage.Input Quantity    ${CONFIGQUANTITY}
    productpage.ADD to Cart Button
    common.View Cart
    cartpage.Verify Quantity    ${CONFIGQUANTITY}
Test Case 14: Place Order: Register while Checkout
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${0}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${0}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${0}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${0}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${0}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${0}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${0}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${0}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${0}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${0}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${0}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${0}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${0}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${0}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${0}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${0}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${0}}]}[Mobile]
    ${NAMECARD}    Set Variable    ${customerdict[${${0}}]}[NameCard]
    ${CARDNO}    Set Variable    ${customerdict[${${0}}]}[CardNumber]
    ${CVC}    Set Variable    ${customerdict[${${0}}]}[CVC]
    ${MONTHCARD}    Set Variable    ${customerdict[${${0}}]}[MonthCard]
    ${YEARCARD}    Set Variable     ${customerdict[${${0}}]}[YearCard]
    ${FULLNAME}    Set Variable    ${customerdict[${${0}}]}[FullName]
    ${PROVICE}    Set Variable    ${customerdict[${${0}}]}[Provice]

    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${productdict[${${1}}]}[ProductId]
    ${PRODUCTNAME}    Set Variable    ${productdict[${${1}}]}[ProductName]
    ${COMMENT}    Set Variable    ${productdict[${${1}}]}[Comment]

    homepage.Verify Hompage Display Success
    common.Scroll Down    500
    homepage.Add Product to Cart Button    ${PRODUCTID}
    common.Continue Shopping
    homepage.Cart Button
    cartpage.Verify Shopping Cart
    cartpage.Proceed To Checkout
    homepage.Click Register / Login
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    registerpage.Verify Enter Account Information
    registerpage.Gender Radio Button    ${Mr/Mrs}
    registerpage.Input Password    ${PASSWORD}
    registerpage.Dropdown Date    ${DAY}    ${MONTH}    ${YEAR}
    registerpage.Check Box Newsletter
    registerpage.Check Box Patner
    registerpage.Input Personal Information1    ${FNAME}    ${LNAME}    ${COMPANY}    ${ADDRESS1}
    registerpage.Input Personal Information2    ${ADDRESS2}    ${COUNTRY}    ${STATE}    ${CITY}    ${ZIPCODE}    ${MOBILE}
    registerpage.Create Account Button
    Execute Manual Step    ClickAds    # Handle Advertising
    registerpage.Verify Account Created
    common.Continue Button
    homepage.Verify Username    ${USERNAME}
    homepage.Cart Button
    cartpage.Proceed To Checkout
    checkoutpage.Verify Delivery Address    ${FULLNAME}   ${COMPANY}   ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    common.Scroll Down    500
    checkoutpage.Review Order    ${PRODUCTNAME}
    checkoutpage.Comment Text Box    ${COMMENT}
    Execute Manual Step    ClickAds    # Handle Advertising
    checkoutpage.Place Order Button
    paymentpage.Name Card    ${NAMECARD}
    paymentpage.Card Number    ${CARDNO}
    paymentpage.CVC    ${CVC}
    paymentpage.Expiry Month Year    ${MONTHCARD}    ${YEARCARD}
    paymentpage.Pay and Confirm Order
    #common.Validate txt    //*[@id="success_message"]/div    Your order has been placed successfully!
    homepage.Click Delete
    deletepage.Verify Account Delete
    common.Continue Button
Test Case 15: Place Order: Register before Checkout
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${0}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${0}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${0}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${0}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${0}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${0}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${0}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${0}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${0}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${0}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${0}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${0}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${0}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${0}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${0}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${0}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${0}}]}[Mobile]
    ${NAMECARD}    Set Variable    ${customerdict[${${0}}]}[NameCard]
    ${CARDNO}    Set Variable    ${customerdict[${${0}}]}[CardNumber]
    ${CVC}    Set Variable    ${customerdict[${${0}}]}[CVC]
    ${MONTHCARD}    Set Variable    ${customerdict[${${0}}]}[MonthCard]
    ${YEARCARD}    Set Variable     ${customerdict[${${0}}]}[YearCard]
    ${FULLNAME}    Set Variable    ${customerdict[${${0}}]}[FullName]
    ${PROVICE}    Set Variable    ${customerdict[${${0}}]}[Provice]

    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${productdict[${${1}}]}[ProductId]
    ${PRODUCTNAME}    Set Variable    ${productdict[${${1}}]}[ProductName]
    ${COMMENT}    Set Variable    ${productdict[${${1}}]}[Comment]

    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    registerpage.Gender Radio Button    ${Mr/Mrs}
    registerpage.Input Password    ${PASSWORD}
    registerpage.Dropdown Date    ${DAY}    ${MONTH}    ${YEAR}
    registerpage.Check Box Newsletter
    registerpage.Check Box Patner
    registerpage.Input Personal Information1    ${FNAME}    ${LNAME}    ${COMPANY}    ${ADDRESS1}
    registerpage.Input Personal Information2    ${ADDRESS2}    ${COUNTRY}    ${STATE}    ${CITY}    ${ZIPCODE}    ${MOBILE}
    registerpage.Create Account Button
    Execute Manual Step    ClickAds    # Handle Advertising
    registerpage.Verify Account Created
    common.Continue Button
    homepage.Verify Username    ${USERNAME}
    common.Scroll Down    500
    homepage.Add Product to Cart Button    ${PRODUCTID}
    homepage.Cart Button
    cartpage.Verify Shopping Cart
    cartpage.Proceed To Checkout
    checkoutpage.Verify Delivery Address    ${FULLNAME}   ${COMPANY}   ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE} 
    common.Scroll Down    500
    checkoutpage.Review Order    ${PRODUCTNAME}
    checkoutpage.Comment Text Box    ${COMMENT}
    Execute Manual Step    ClickAds    # Handle Advertising
    checkoutpage.Place Order Button
    paymentpage.Name Card    ${NAMECARD}
    paymentpage.Card Number    ${CARDNO}
    paymentpage.CVC    ${CVC}
    paymentpage.Expiry Month Year    ${MONTHCARD}    ${YEARCARD}
    paymentpage.Pay and Confirm Order
    #common.Validate txt    //*[@id="success_message"]/div    Your order has been placed successfully!
    homepage.Click Delete
    deletepage.Verify Account Delete
    common.Continue Button
Test Case 16: Place Order: Login before Checkout
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${1}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${1}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${1}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${1}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${1}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${1}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${1}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${1}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${1}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${1}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${1}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${1}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${1}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${1}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${1}}]}[Mobile]
    ${NAMECARD}    Set Variable    ${customerdict[${${1}}]}[NameCard]
    ${CARDNO}    Set Variable    ${customerdict[${${1}}]}[CardNumber]
    ${CVC}    Set Variable    ${customerdict[${${1}}]}[CVC]
    ${MONTHCARD}    Set Variable    ${customerdict[${${1}}]}[MonthCard]
    ${YEARCARD}    Set Variable     ${customerdict[${${1}}]}[YearCard]
    ${FULLNAME}    Set Variable    ${customerdict[${${1}}]}[FullName]
    ${PROVICE}    Set Variable    ${customerdict[${${1}}]}[Provice]

    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${productdict[${${1}}]}[ProductId]
    ${PRODUCTNAME}    Set Variable    ${productdict[${${1}}]}[ProductName]
    ${COMMENT}    Set Variable    ${productdict[${${1}}]}[Comment]


    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    loginpage.Input Email    ${MAIL}
    loginpage.Input Password    ${PASSWORD}
    loginpage.Login Button
    homepage.Verify Username    ${USERNAME}
    common.Scroll Down    500
    homepage.Add Product to Cart Button    ${PRODUCTID}
    common.Continue Shopping
    homepage.Cart Button
    cartpage.Verify Shopping Cart
    cartpage.Proceed To Checkout
    checkoutpage.Verify Delivery Address    ${FULLNAME}   ${COMPANY}   ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    common.Scroll Down    500
    checkoutpage.Review Order    ${PRODUCTNAME}
    checkoutpage.Comment Text Box    ${COMMENT}
    Execute Manual Step    ClickAds    # Handle Advertising
    checkoutpage.Place Order Button
    paymentpage.Name Card    ${NAMECARD}
    paymentpage.Card Number    ${CARDNO}
    paymentpage.CVC    ${CVC}
    paymentpage.Expiry Month Year    ${MONTHCARD}    ${YEARCARD}
    paymentpage.Pay and Confirm Order
    #common.Validate txt    //*[@id="success_message"]/div    Your order has been placed successfully!
    homepage.Click Delete
    deletepage.Verify Account Delete
    common.Continue Button
Test Case 17: Remove Products From Cart
    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCTID}    Set Variable    ${productdict[${${1}}]}[ProductId]

    homepage.Verify Hompage Display Success
    common.Scroll Down    500
    homepage.Add Product to Cart Button    ${PRODUCTID}
    common.Continue Shopping
    homepage.Cart Button
    cartpage.Verify Shopping Cart
    cartpage.X Cancel Product    1
    cartpage.Verify Cart is empty!
Test Case 18: View Category Products
    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${SUBCATEGORYNO}    Set Variable    ${productdict[${${1}}]}[SubCategoryNo]
    ${GENDERCATEGORY}    Set Variable    ${productdict[${${1}}]}[GenderCategory]
    ${SUBCATEGORY}    Set Variable    ${productdict[${${1}}]}[SubCategory]
    ${PRODUCTNAME}    Set Variable    ${productdict[${${1}}]}[ProductName]

    ${SUBCATEGORYNO2}    Set Variable    ${productdict[${${2}}]}[SubCategoryNo]
    ${GENDERCATEGORY2}    Set Variable    ${productdict[${${2}}]}[GenderCategory]
    ${SUBCATEGORY2}    Set Variable    ${productdict[${${2}}]}[SubCategory]

    homepage.Verify Category Bar
    homepage.Category on Left Side Bar    ${GENDERCATEGORY}
    homepage.SubCategory    ${SUBCATEGORYNO}
    productpage.Verify Product Bar    ${GENDERCATEGORY}    ${SUBCATEGORY}
    homepage.Category on Left Side Bar    ${GENDERCATEGORY2}
    homepage.SubCategory    ${SUBCATEGORYNO2}
    Execute Manual Step    ClickAds    # Handle Advertising
    productpage.Verify Product Bar    ${GENDERCATEGORY2}    ${SUBCATEGORY2}
Test Case 19: View & Cart Brand Products
    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${BRAND1}    Set Variable    ${productdict[${${1}}]}[Brand]
    ${BRAND2}    Set Variable    ${productdict[${${2}}]}[Brand]

    homepage.Products Button
    common.Scroll Down    500
    homepage.Verify Brands
    homepage.Brands    ${BRAND1}
    Execute Manual Step    ClickAds    # Handle Advertising
    productpage.Verify Brand Product Bar    ${BRAND1}
    homepage.Brands    ${BRAND2}
    productpage.Verify Brand Product Bar    ${BRAND2}
Test Case 20: Search Products and Verify Cart After Login
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${1}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${1}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${1}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${1}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${1}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${1}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${1}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${1}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${1}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${1}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${1}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${1}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${1}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${1}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${1}}]}[Mobile]


    homepage.Products Button
    productpage.Verify ALL PRODUCTS Text
    productpage.Search Product    ${SEARCHPRODUCT}
    productpage.Verify SEARCHED PRODUCTS Text
    common.Scroll Down    300
    productpage.Verify All The Products Related To Search
    productpage.Add All Product from Search to Cart
    homepage.Cart Button
    Sleep    5s
    cartpage.Verify Shopping Cart
    homepage.Click Signup / Login
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    registerpage.Gender Radio Button    ${Mr/Mrs}
    registerpage.Input Password    ${PASSWORD}
    registerpage.Dropdown Date    ${DAY}    ${MONTH}    ${YEAR}
    registerpage.Check Box Newsletter
    registerpage.Check Box Patner
    registerpage.Input Personal Information1    ${FNAME}    ${LNAME}    ${COMPANY}    ${ADDRESS1}
    registerpage.Input Personal Information2    ${ADDRESS2}    ${COUNTRY}    ${STATE}    ${CITY}    ${ZIPCODE}    ${MOBILE}
    registerpage.Create Account Button
    Execute Manual Step    ClickAds    # Handle Advertising
    registerpage.Verify Account Created
    common.Continue Button
    homepage.Cart Button
Test Case 21: Add review on product
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${1}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${1}}]}[Mail]
    ${REVIEW}    Set Variable    ${customerdict[${${1}}]}[Review]

    homepage.Products Button
    productpage.Verify ALL PRODUCTS Text
    common.Scroll Down    500
    productpage.View Products    1
    Execute Manual Step    ClickAds    # Handle Advertising
    productpage.Verify WRITE YOUR REVIEW Text
    common.Scroll Down    500
    productpage.Write Your Review Name    ${USERNAME}
    productpage.Write Your Review Email    ${MAIL}
    productpage.Write Your Review Review    ${REVIEW}
    productpage.Submit Review Button
    productpage.Verify Thank you for your review
Test Case 22: Add to cart from Recommended items
    homepage.Verify Recommend Text and Recommend Bar
    homepage.Recommend Products    2    2
    common.View Cart
    cartpage.Verify Shopping Cart
Test Case 23: Verify address details in checkout page
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${0}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${0}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${0}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${0}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${0}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${0}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${0}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${0}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${0}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${0}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${0}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${0}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${0}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${0}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${0}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${0}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${0}}]}[Mobile]
    ${NAMECARD}    Set Variable    ${customerdict[${${0}}]}[NameCard]
    ${CARDNO}    Set Variable    ${customerdict[${${0}}]}[CardNumber]
    ${CVC}    Set Variable    ${customerdict[${${0}}]}[CVC]
    ${MONTHCARD}    Set Variable    ${customerdict[${${0}}]}[MonthCard]
    ${YEARCARD}    Set Variable     ${customerdict[${${0}}]}[YearCard]
    ${FULLNAME}    Set Variable    ${customerdict[${${0}}]}[FullName]
    ${PROVICE}    Set Variable    ${customerdict[${${0}}]}[Provice]
    homepage.Verify Hompage Display Success
    homepage.Click Signup / Login
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    registerpage.Gender Radio Button    ${Mr/Mrs}
    registerpage.Input Password    ${PASSWORD}
    registerpage.Dropdown Date    ${DAY}    ${MONTH}    ${YEAR}
    registerpage.Check Box Newsletter
    registerpage.Check Box Patner
    registerpage.Input Personal Information1    ${FNAME}    ${LNAME}    ${COMPANY}    ${ADDRESS1}
    registerpage.Input Personal Information2    ${ADDRESS2}    ${COUNTRY}    ${STATE}    ${CITY}    ${ZIPCODE}    ${MOBILE}
    registerpage.Create Account Button
    Execute Manual Step    ClickAds    # Handle Advertising
    registerpage.Verify Account Created
    common.Continue Button
    homepage.Verify Username    ${USERNAME}
    common.Scroll Down    500
    homepage.Add Product to Cart Button    1
    common.Continue Shopping
    homepage.Cart Button
    cartpage.Verify Shopping Cart
    cartpage.Proceed To Checkout
    checkoutpage.Verify Delivery Address    ${FULLNAME}   ${COMPANY}   ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    checkoutpage.Verify Billing Address    ${FULLNAME}   ${COMPANY}   ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    homepage.Click Delete
    Execute Manual Step    ClickAds    # Handle Advertising
    deletepage.Verify Account Delete
Test Case 24: Download Invoice after purchase order
    @{customerdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/customerdata.csv
    ${USERNAME}    Set Variable    ${customerdict[${${0}}]}[UserName]
    ${MAIL}    Set Variable    ${customerdict[${${0}}]}[Mail]
    ${PASSWORD}    Set Variable    ${customerdict[${${0}}]}[Password]
    ${MR/MRS}    Set Variable    ${customerdict[${${0}}]}[MR/MRS]
    ${DAY}    Set Variable    ${customerdict[${${0}}]}[Day]
    ${MONTH}    Set Variable    ${customerdict[${${0}}]}[Month]
    ${YEAR}    Set Variable    ${customerdict[${${0}}]}[Year]
    ${FNAME}    Set Variable    ${customerdict[${${0}}]}[FirstName]
    ${LNAME}    Set Variable    ${customerdict[${${0}}]}[LastName]
    ${COMPANY}    Set Variable    ${customerdict[${${0}}]}[Company]
    ${ADDRESS1}    Set Variable    ${customerdict[${${0}}]}[Address1]
    ${ADDRESS2}    Set Variable    ${customerdict[${${0}}]}[Address2]
    ${COUNTRY}    Set Variable    ${customerdict[${${0}}]}[Country]
    ${STATE}    Set Variable    ${customerdict[${${0}}]}[State]
    ${CITY}    Set Variable    ${customerdict[${${0}}]}[City]
    ${ZIPCODE}    Set Variable    ${customerdict[${${0}}]}[Zipcode]
    ${MOBILE}    Set Variable    ${customerdict[${${0}}]}[Mobile]
    ${NAMECARD}    Set Variable    ${customerdict[${${0}}]}[NameCard]
    ${CARDNO}    Set Variable    ${customerdict[${${0}}]}[CardNumber]
    ${CVC}    Set Variable    ${customerdict[${${0}}]}[CVC]
    ${MONTHCARD}    Set Variable    ${customerdict[${${0}}]}[MonthCard]
    ${YEARCARD}    Set Variable     ${customerdict[${${0}}]}[YearCard]
    ${FULLNAME}    Set Variable    ${customerdict[${${0}}]}[FullName]
    ${PROVICE}    Set Variable    ${customerdict[${${0}}]}[Provice]

    @{productdict}    Read Csv File To Associative    E:/Project/Robot_Framework/Automation_Exercise/testdata/productdata.csv
    ${PRODUCID}    Set Variable    ${productdict[${${1}}]}[ProductId]
    ${PRODUCTNAME}    Set Variable    ${productdict[${${1}}]}[ProductName]
    ${COMMENT}    Set Variable    ${productdict[${${1}}]}[Comment]
    homepage.Verify Hompage Display Success
    common.Scroll Down    500
    homepage.Add Product to Cart Button    ${PRODUCID}
    common.Continue Shopping
    homepage.Cart Button
    cartpage.Verify Shopping Cart
    cartpage.Proceed To Checkout
    homepage.Click Register / Login
    signuppage.Input Name    ${USERNAME}
    signuppage.Input Email    ${MAIL}
    signuppage.Signup Button
    registerpage.Gender Radio Button    ${Mr/Mrs}
    registerpage.Input Password    ${PASSWORD}
    registerpage.Dropdown Date    ${DAY}    ${MONTH}    ${YEAR}
    registerpage.Check Box Newsletter
    registerpage.Check Box Patner
    registerpage.Input Personal Information1    ${FNAME}    ${LNAME}    ${COMPANY}    ${ADDRESS1}
    registerpage.Input Personal Information2    ${ADDRESS2}    ${COUNTRY}    ${STATE}    ${CITY}    ${ZIPCODE}    ${MOBILE}
    registerpage.Create Account Button
    Execute Manual Step    ClickAds    # Handle Advertising
    registerpage.Verify Account Created
    common.Continue Button
    homepage.Verify Username    ${USERNAME}
    homepage.Cart Button
    cartpage.Proceed To Checkout
    checkoutpage.Verify Delivery Address    ${FULLNAME}   ${COMPANY}   ${ADDRESS1}    ${ADDRESS2}    ${PROVICE}    ${COUNTRY}    ${MOBILE}
    common.Scroll Down    500
    checkoutpage.Review Order    ${PRODUCTNAME}
    checkoutpage.Comment Text Box    ${COMMENT}
    checkoutpage.Place Order Button
    Execute Manual Step    ClickAds    # Handle Advertising
    paymentpage.Name Card    ${NAMECARD}
    paymentpage.Card Number    ${CARDNO}
    paymentpage.CVC    ${CVC}
    paymentpage.Expiry Month Year    ${MONTHCARD}    ${YEARCARD}
    paymentpage.Pay and Confirm Order
    #common.Validate txt    //*[@id="success_message"]/div    Your order has been placed successfully!
    paymentpage.Download Invoice
    Sleep    5s
    File Should Exist    D:/Users/Guyji/Downloads/invoice.txt
    common.Continue Button
    Execute Manual Step    ClickAds    # Handle Advertising
    homepage.Click Delete
    deletepage.Verify Account Delete
Test Case 25: Verify Scroll Up using 'Arrow' button and Scroll Down functionality
    homepage.Verify Hompage Display Success
    common.Scroll to Bottom
    homepage.Verify Subscription Text
    homepage.Scroll Up Button
    homepage.Verify Full-Fledged practice website for Automation Engineers
Test Case 26: Verify Scroll Up without 'Arrow' button and Scroll Down functionality
    homepage.Verify Hompage Display Success
    common.Scroll to Bottom
    homepage.Verify Subscription Text
    common.Scroll to Top
    homepage.Verify Full-Fledged practice website for Automation Engineers