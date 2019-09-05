*** Settings ***
Documentation     A test suite with a single test : Template
Library  SeleniumLibrary  
Test Template    Log into facebook

*** variables ***
${browser}    chrome

*** keywords ***

Log into Facebook
    [Arguments]    ${user}  ${pwd}
    # Open chrome browser at facebook website
    Open Browser  https://www.facebook.com/    ${browser}    
    # implicit wait
    Set Selenium Implicit Wait  2 seconds
   
    # Test the page title
    Title Should Be   Facebook - Connexion ou inscription
    

    Input Text  id=email  ${user}
    Input Text  id=pass  ${pwd}
    
    # Click search button
    Click Button  id=u_0_a
    
    #Vérifier l'appartition d'un message d'alerte
    Page Should contain element  xpath=//div[@role='alert']
    
    Close Browser

*** Test Cases ***
Cas de test 1    hello1@haha.com    pwd1
Cas de test 2    hello2@gougou.com    pwd2
Cas de test 3    hello3@hoho.com    pwd3
Cas de test 4    ${EMPTY}    ${EMPTY}
    
 