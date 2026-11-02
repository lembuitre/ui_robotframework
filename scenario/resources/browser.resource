*** Settings ***
Documentation       Browser lifecycle. Imported by every test suite.
Variables           ../config/env.yaml
Library             SeleniumLibrary    timeout=${DEFAULT_TIMEOUT}    implicit_wait=0


*** Keywords ***
Open Test Browser
    [Documentation]    Starts the browser defined in env.yaml. Headless when HEADLESS is true.
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    IF    ${HEADLESS}    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Create WebDriver    ${BROWSER}    options=${options}
    Go To    ${URL}

Close Test Browser
    Run Keyword And Ignore Error    Capture Page Screenshot
    Close All Browsers
