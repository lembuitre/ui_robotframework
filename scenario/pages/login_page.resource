*** Settings ***
Documentation       Locators for the login page. No keywords here, only variables.


*** Variables ***
${LOGIN_HEADER}         //*[text()='Log in']
${USERNAME_INPUT}       id=username
${PASSWORD_INPUT}       id=password
${LOGIN_BUTTON}         //button[@type='submit']
${LOGIN_ERROR}          //*[@data-testid='login-error']
