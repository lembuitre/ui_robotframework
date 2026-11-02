*** Settings ***
Documentation       Navigation and app-shell keywords.
Resource            ../resources/common.resource
Resource            ../pages/home_page.resource


*** Keywords ***
Go To Tab
    [Documentation]    Clicks a navigation tab and waits for ${expect_locator} on the target page.
    [Arguments]    ${tab_name}    ${expect_locator}
    ${tab}=    Fill Locator    ${NAV_TAB}    tab    ${tab_name}
    Click And Verify    ${tab}    ${expect_locator}

Close Dialog
    Wait And Click    ${DIALOG_CLOSE}
    Wait Until Element Is Not Visible    ${DIALOG}

Success Toast Should Appear
    Wait Until Element Is Visible    ${TOAST_SUCCESS}
