*** Settings ***
Documentation       Example feature page: a list of items with create / delete / upload.
...                 Copy this file and rename it for each real feature.


*** Variables ***
${ITEMS_TAB_NAME}       Items
${ITEMS_TABLE}          //table[@data-testid='items-table']
${ITEM_ROW}             //tr[td[text()='<name>']]
${ITEM_CHECKBOX}        //tr[td[text()='<name>']]//input[@type='checkbox']
${NEW_ITEM_BUTTON}      //button[@data-testid='item-new']
${ITEM_NAME_INPUT}      //input[@data-testid='item-name']
${SAVE_BUTTON}          //button[@data-testid='item-save']
${DELETE_BUTTON}        //button[@data-testid='item-delete']
${CONFIRM_BUTTON}       //button[@data-testid='confirm']
${FILE_INPUT}           //input[@type='file']
