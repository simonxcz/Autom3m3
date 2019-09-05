*** Settings ***
Documentation    A test suite with ressources
Library    SeleniumLibrary
Resource    ../ressources/keywords.txt
# Resource    ../ressources/list_url.txt
Library    OperatingSystem

*** Variables ***
${BROWSER}  chrome
${url}  https://www.imdb.com

*** test cases ***
Test Cas 1 : 
    Film staring research  Burn after reading  Brad Pitt
Test Cas 2 : 
    Film staring research  Jackie Brown    Pam Grier
Test Cas 3 : 
    Film staring research  The Hours    Julianne Moore
Test Cas 4 : 
    Film staring research  Edward aux mains d'argent    Johnny Depp