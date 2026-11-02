*** Settings ***
Documentation       Keywords for logging in and out.
Resource            ../resources/common.resource
Resource            ../pages/login_page.resource
Resource            ../pages/home_page.resource


*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_HEADER}
    Wait And Input    ${USERNAME_INPUT}    ${username}
    Input Password    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_BUTTON}

Login Should Succeed
    Wait Until Element Is Visible    ${PAGE_TITLE}

Login Should Fail
    Wait Until Element Is Visible    ${LOGIN_ERROR}

Login To Application
    [Documentation]    Default login used in Suite Setup. Credentials come from env.yaml.
    Login With Credentials    ${LOGIN_USER}    ${LOGIN_PASSWORD}
    Login Should Succeed

Logout
    Wait And Click    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_HEADER}
