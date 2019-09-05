*** Settings ***
Documentation     A test suite with a single test : web domain research
Library  SeleniumLibrary  

*** variables ***
${domain_name}  supercrocodile

*** Test Cases ***

Domain research test case
    
    # implicit wait
    Set Selenium Implicit Wait  2 seconds
   
    # Open chrome browser at GoDaddy website
    Open Browser  https://ca.godaddy.com/
   
    # Wait for the domain input box to appear on page
    Wait Until Element Is Visible  name=domainToCheck

    # Test the page title
    Title Should Be   Domain Names, Websites, Hosting & Online Marketing Tools - GoDaddy CA

    # Write some wild domain name in input box
    Input Text  name=domainToCheck  ${domain_name}
    
    # Click search button
    Click Button  xpath=//button[@value='Search']
   
    # Check exact match found
     Wait Until Page Contains Element  xpath=//div[@class='spin-results-wrap']
     ${result}  Get WebElement  xpath=//div[@class='spin-results-wrap']
     Element Should be visible  ${result}  message="Les résultats ne sont pas affichés"

    Close Browser