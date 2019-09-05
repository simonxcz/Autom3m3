*** Settings ***
Documentation     A test suite with a single test : imbd
Library  SeleniumLibrary  
Test Template  Film staring research

*** variables ***
${BROWSER}  chrome
${url}    https://www.imdb.com/

*** Keywords ***

Navigate to Site
    # implicit wait
    Set Selenium Implicit Wait  2 seconds
   
    # Open chrome browser at GoDaddy website
    Open Browser  ${url}  ${BROWSER}
   
    # Wait for the search input to appear on page
    Wait Until Element Is Visible  name=q

    # Test the page title
    Title Should Be   Ratings and Reviews for New Movies and TV Shows - IMDb
    
Search with keywords
    [Arguments]  ${FILM}  ${STAR}

    # Search a particular film
    Input Text  name=q  ${FILM}
    Click Button  id=navbar-submit-button

    # Select the first link
    Click Link  xpath=//table[@class='findList']/tbody/tr[1]/td/a
   
    # Verify that the film is starring the expected actor. 
    Wait Until Page Contains Element  xpath=//h1[contains(.,"${FILM}")]
    ${star_name}  Get WebElement  //div[@class='credit_summary_item']/h4[.='Stars:']/following-sibling::a[.='${STAR}']
    Element Should be visible  ${star_name}  message=" Erreur :: l'acteur ne fait pas partie des stars de ce film"
    
    # implicit wait
    Set Selenium Implicit Wait  1 seconds
    
Film staring research  
    [Arguments]  ${argu1}  ${argu2}
    Navigate to Site    
    Search with keywords  ${argu1}  ${argu2}
    Close Browser

*** Test Cases ***
Film staring research case
Test 1  Burn after reading  Brad Pitt
Test 2  Jackie Brown    Pam Grier
Test 3  The Hours    Julianne Moore
Test 4  Edward aux mains d'argent    Johnny Depp
