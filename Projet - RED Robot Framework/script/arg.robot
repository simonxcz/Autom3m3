*** Settings ***
Documentation     A test suite with a single test : navigation
Library    SeleniumLibrary
Library    OperatingSystem
# Resource    ../ressources/list_url.txt
Variables  ../ressources/ressource.py

*** variables ***


*** Keywords ***
Navigate to ${arg1}
    Open Browser  ${arg1}  chrome
    Set Selenium Implicit Wait    6 seconds
    Close Browser

*** Test Cases ***
# boucle url
Cas de test 1 : Navigate to url
    ${URL} =  get file  ressource.txt
    :FOR  ${url}  IN  ${URL}
    \    Navigate to ${url}