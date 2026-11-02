*** Settings ***
Documentation       Login tests.
Resource            ../resources/browser.resource
Resource            ../actions/login_actions.resource
Suite Setup         Open Test Browser
Suite Teardown      Close Test Browser
Test Setup          Go To    ${URL}
Test Tags           login


*** Test Cases ***
T001-1 Valid Login
    [Tags]    smoke
    Login With Credentials    ${LOGIN_USER}    ${LOGIN_PASSWORD}
    Login Should Succeed
    [Teardown]    Logout

T001-2 Invalid Password
    Login With Credentials    ${LOGIN_USER}    wrong-password
    Login Should Fail
