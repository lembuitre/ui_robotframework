*** Settings ***
Documentation       Generic helpers shared by all pages. Nothing here should know about a specific feature.
Library             String
Library             Collections
Resource            browser.resource


*** Keywords ***
Wait And Click
    [Documentation]    Waits until the element is enabled, then clicks it.
    [Arguments]    ${locator}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    Click Element    ${locator}

Wait And Input
    [Arguments]    ${locator}    ${text}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Click And Verify
    [Documentation]    Clicks ${click_locator} and waits for ${expect_locator} to appear,
    ...    retrying up to ${retries} times. Use this for flaky UI (menus, tabs, dialogs).
    [Arguments]    ${click_locator}    ${expect_locator}    ${retries}=3    ${timeout}=${DEFAULT_TIMEOUT}
    FOR    ${_}    IN RANGE    ${retries}
        ${clicked}=    Run Keyword And Return Status    Wait And Click    ${click_locator}
        ${visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${expect_locator}    ${timeout}
        IF    ${clicked} and ${visible}    RETURN
    END
    Fail    Clicked '${click_locator}' ${retries}x but '${expect_locator}' never appeared

Fill Locator
    [Documentation]    Replaces a <placeholder> inside a locator template.
    ...    Example: Fill Locator    ${ROW_BY_NAME}    name    Alice
    [Arguments]    ${template}    ${placeholder}    ${value}
    ${locator}=    Replace String    ${template}    <${placeholder}>    ${value}
    RETURN    ${locator}

Element Text Should Contain
    [Arguments]    ${locator}    ${expected}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    ${actual}=    Get Text    ${locator}
    Should Contain    ${actual}    ${expected}
