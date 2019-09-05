*** Settings ***
Documentation     Example Keyword Test
Library    AdderLibrary

*** Test Cases ***
Addition
    Add input    3    5
    Total    8