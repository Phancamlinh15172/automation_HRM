Invite_Button="xpath://span//button[2]"
Name_input="xpath://div[@class='el-dialog__body']//descendant::input[@type='text']"
Email_input="xpath://div[@class='el-dialog__body']//descendant::input[@type='email']"
Add_Button="xpath://span[normalize-space()='Add']"
Send_Button="xpath://span[normalize-space()='Send invitations']"
Clear_Button="xpath://span[normalize-space()='Clear']"
x_button="//button[@class='el-button el-button--danger']"
# Inviter_position="xpath://div[@role="dialog"]//tr[@class="el-table__row"]/child::td[1]"

#message
Name_warning="xpath://div[@class='el-dialog__body']//descendant::input[@type='text']//following::div[@class='el-form-item__error'][1]"
Email_warning="xpath://div[@class='el-dialog__body']//descendant::input[@type='email']//following::div[@class='el-form-item__error'][1]"
Invite_Notification="xpath://div[@role='alert']"
failure_NumberPosition="//div[@class='text-danger ml-3']"
success_NumberPosition="//div[@class='text-success ml-3']"
Nofailure_number="Failure: 0"
Success_Notification=" Sent Successfully"

#Data Test.robot
Nothing=""
whitespace=" "
S_name="@"
L_name="chứa các từ khóa chung cần thiết cơ bản trong robot"
valid_name1="Nam"
valid_name2="@ @"
valid_name3="nhung"
valid_name4="mai"
invalid_name1="a  "
invalid_name2="b"
valid_email1="nghienconngai@gmail.com"
valid_email2="emailtest@gmail.com"
valid_email3="testistest1@gmail.com"
valid_email4="testistest@gmail.com"
unformatted_email="nghienha@gmaicom"
invalid_email1=".@gmail.com"
registed_email="kuking@qa.team"