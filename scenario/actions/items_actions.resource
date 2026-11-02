*** Settings ***
Documentation       Keywords for the example Items feature.
Resource            ../resources/common.resource
Resource            ../actions/home_actions.resource
Resource            ../pages/items_page.resource


*** Keywords ***
Go To Items Page
    Go To Tab    ${ITEMS_TAB_NAME}    ${ITEMS_TABLE}

Create Item
    [Arguments]    ${name}
    Wait And Click    ${NEW_ITEM_BUTTON}
    Wait And Input    ${ITEM_NAME_INPUT}    ${name}
    Wait And Click    ${SAVE_BUTTON}
    Item Should Exist    ${name}

Delete Item
    [Arguments]    ${name}
    ${checkbox}=    Fill Locator    ${ITEM_CHECKBOX}    name    ${name}
    Wait And Click    ${checkbox}
    Wait And Click    ${DELETE_BUTTON}
    Click And Verify    ${CONFIRM_BUTTON}    ${ITEMS_TABLE}
    Item Should Not Exist    ${name}

Item Should Exist
    [Arguments]    ${name}
    ${row}=    Fill Locator    ${ITEM_ROW}    name    ${name}
    Wait Until Element Is Visible    ${row}

Item Should Not Exist
    [Arguments]    ${name}
    ${row}=    Fill Locator    ${ITEM_ROW}    name    ${name}
    Wait Until Element Is Not Visible    ${row}

Upload File
    [Documentation]    Uploads a file from scenario/data/ through a hidden <input type=file>.
    [Arguments]    ${filename}
    Choose File    ${FILE_INPUT}    ${EXECDIR}/data/${filename}
    Success Toast Should Appear
    Close Dialog
