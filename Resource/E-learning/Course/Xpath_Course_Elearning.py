Course_Card="//div[contains(@class,'el-col el-col-24')]"
CourseName_Suffix="]//h3"
CourseInstructor_suffix="]//p"
CourseEdit_Suffix="]//button//child::i[contains(@class,'el-icon-edit')]"
Title_Input_Course="//label[contains(text(),'Title')]//following-sibling::div[contains(@class,'el-form-item__content')]//input"

#Add Course
Add_Course_button="//span[contains(text(),'Add Course')]"
TopicDropdown_Input_AddCourse="//input[@placeholder='Select']"
Topic_Dropdown_rows_AddCourse="//div[contains(@class,'el-select-dropdown el-popper is-multiple')]//li"
Short_Description_Input_AddCourse="//div[contains(@class,'el-form-item__content')]//preceding-sibling::label[contains(text(),'Short')]"

#Edit Course
TitleName_EditCourse="//h2[normalize-space()='Edit course: The Python Tutorial']"
SaveButton_EditCourse="//button[contains(normalize-space(),'Save')]"
CancelButton_EditCourse="//div[contains(@class,'el-card__body')]//button[contains(normalize-space(),'Cancel')]"
Messagebox_CancelButton_EditCourse="//div[contains(@class,'el-message-box__message')]"
CancelButton_CancelConfirm_EditCourse="//div[contains(@class,'el-message-box__btns')]//button[contains(normalize-space(),'Cancel')]"
OkButton_CancelConfirm_EditCourse="//div[contains(@class,'el-message-box__btns')]//button[contains(normalize-space(),'OK')]"
DeleteButton_EditCourse="//div[contains(@class,'el-card__body')]//button[contains(normalize-space(),'Delete')]"