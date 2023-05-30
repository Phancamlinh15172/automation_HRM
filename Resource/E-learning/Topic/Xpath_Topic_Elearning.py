#TOPICS
Add_Topic="xpath://button[contains(@type,'button')]//span[contains(text(),'Add Topic')]"
NOTIFICATION_POPUP="xpath://div[contains(@role,'alert')]"
SearchTopic_AddTopic="//input[@placeholder='Search by Title']"
Tablelist_Topic="//div[@class='el-table__body-wrapper is-scrolling-none']//table[@class='el-table__body']"
Topic_row="//tr[@class='el-table__row']"
    ##ADD TOPIC
Title_AddTopic="xpath://div[contains(@class,'el-form-item__content')]//input[contains(@type,'text')]"
Title_warning_AddTopic="xpath://div[@class='el-form-item__error']"
Description_AddTopic="xpath://textarea[contains(@class,'el-textarea__inner')]"

Dialog_Title_ADDTOPIC="//span[@class='el-dialog__title']"
Create_button="xpath://span[normalize-space()='Create']"
Cancel_button="xpath://div[contains(@class,'el-form-item__content')]//span[contains(text(),'Cancel')]"
Messagebox_CancelButton="xpath://div[@class='el-message-box__content']"
Ok_button_CancelAddingTopic="xpath://span[normalize-space()='OK']"
Cancelbutton_CancelAddingTopic="xpath://button[@class='el-button el-button--default el-button--small']//span[contains(text(),'Cancel')]"

    #EDIT TOPIC
Title_EditTopic="//span[normalize-space()='Edit Topic']"
Update_EditTopic="//span[normalize-space()='Update']"
Cancel_EditTopic="//span[normalize-space()='Cancel']"
Revoke_Cancel_EditTopic="//button[contains(@class,'el-button el-button--default el-button--small')]//span[contains(text(),'Cancel')]"
Ok_Cancel_EditTopic="//span[normalize-space()='OK']"