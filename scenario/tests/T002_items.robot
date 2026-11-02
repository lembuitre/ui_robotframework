*** Settings ***
Documentation       Example feature suite. Logs in once, runs all cases, closes the browser.
Resource            ../resources/browser.resource
Resource            ../actions/login_actions.resource
Resource            ../actions/items_actions.resource
Suite Setup         Run Keywords    Open Test Browser    AND    Login To Application
Suite Teardown      Close Test Browser
Test Setup          Go To Items Page
Test Tags           items    robot:continue-on-failure


*** Variables ***
${ITEM_NAME}        auto-item-001


*** Test Cases ***
T002-1 Create Item
    [Tags]    smoke
    Create Item    ${ITEM_NAME}

T002-2 Delete Item
    Delete Item    ${ITEM_NAME}

T002-3 Upload File
    [Documentation]    Put a sample file in scenario/data/ and change the name below.
    Upload File    sample.csv
