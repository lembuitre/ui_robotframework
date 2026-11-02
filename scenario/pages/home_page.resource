*** Settings ***
Documentation       Locators shared across the app shell (navigation, header, dialogs).


*** Variables ***
${PAGE_TITLE}           //h1
${NAV_TAB}              //li[@data-testid='nav-tab-<tab>']
${LOGOUT_BUTTON}        //button[@data-testid='logout']
${DIALOG}               //div[@data-testid='dialog']
${DIALOG_CLOSE}         //button[@data-testid='dialog-close']
${TOAST_SUCCESS}        //*[contains(@class,'toast') and contains(.,'success')]
${NO_DATA}              //span[text()='No Data']
