*** Settings ***
Documentation     A test suite with a single test : imbd
Library  SeleniumLibrary  

*** variables ***
${BROWSER}  chrome
${url}    https://www.imdb.com/

*** Keywords ***

Navigate to Site
    [Argument]    ${BROWSER}  ${url}
    # implicit wait
    Set Selenium Implicit Wait  2 seconds
   
    # Open chrome browser at GoDaddy website
    Open Browser  ${url}  ${BROWSER}
   
    # Wait for the search input to appear on page
    Wait Until Element Is Visible  name=q

    # Test the page title
    Title Should Be   Ratings and Reviews for New Movies and TV Shows - IMDb
    
Search with keywords
    [Arguments]    ${FILM}  ${STAR}

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
    Set Selenium Implicit Wait  2 seconds

*** Test Cases ***

Film staring research test case 1
    Navigate to Site    
    Search with keywords  Burn after reading    Brad Pitt
    Close Browser
    
Film staring research test case 2
    Navigate to Site
    Search with keywords  Jackie Brown    Pam Grier      
    Close Browser
    
Film staring research test case 3
    Navigate to Site
    Search with keywords  The Hours    Julianne Moore   
    Close Browser
    
Film staring research test case 4
    Navigate to Site
    Search with keywords  Edward aux mains d'argent    Johnny Depp
    Close Browser