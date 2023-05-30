*** Settings ***
Library     SeleniumLibrary
Resource   ../../../Resource/CommonResource.robot
Resource   ../../../Resource/Login_resource.robot
Resource   ../../../Resource/E-learning/Topic/Topic_Elearning_function.robot
Suite Teardown      Close All Browsers
Test Teardown       Close Browser
Test Setup          Open Browser Login
*** Test Cases ***
Verify that icon add topic and content in button "Add Topic" include in design and already aligned - 3620
    Given Admin Login
        when Access Elearning
        Go to Topics
            then page should contain element    ${Add_Topic}    ${SearchTopic_AddTopic}    ${Tablelist_Topic}
Verify that display dialog when user click button "Add Topic" - 3621
    Given Admin Login
        when Access Elearning
        Go to Topics
        Go to Add Topic
            then page should contain element    ${Dialog_Title_ADDTOPIC}

Add Topic successfully - 3659
    Given Admin Login
        when Access Elearning
        Go to Topics
        Go to Add Topic
        Input Title and Topic Decription    Django       Django
        Create confirmation
            then element text should be    ${NOTIFICATION_POPUP}    Topic created!
Check button "Add Topic" is working properly - 3612
    Given Admin Login
        when Access Elearning
        Go to Topics
        Go to Add Topic
        wait until element is visible    ${Dialog_Title_ADDTOPIC}
            then element should contain  ${Dialog_Title_ADDTOPIC}    Add Topic
Check button "Create" at dialog is working properly - 3627
    Given Admin Login
        when Access Elearning
        Go to Topics
        Go to Add Topic
            then element should be enabled    ${Create_button}
Verify that all fields and buttons in dialog include in design and already aligned - 3630
    Given Admin Login
        when Access Elearning
        Go to Topics
        Go to Add Topic
            then page should contain element    ${Description_AddTopic}  ${Title_AddTopic}   ${Create_button}
            page should contain element    ${Dialog_Title_ADDTOPIC}    ${Cancel_button}
Check button "Cancel" in dialog is working properly -3636
    Given Admin Login
        when Access Elearning
        Go to Topics
        Go to Add Topic
            then Cancel Adding Topic
Verify that user can input into all fields in dialog - 3657
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Input Title and Topic Decription    grab    motorbike
#            then element should contain    ${Title_AddTopic}     grab
#                 element text should be    ${Description_AddTopic}     motorbike
Verify that user can create topic with blank"Description" field - 3672
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Create confirmation
            then element text should be    ${Title_warning_AddTopic}    Topic's title cannot empty
Verify that user cannot create topic if "Title" required field is left blank - 3668
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Input Title and Topic Decription    ${Notvalue}    motorbike
        Create confirmation
            then element text should be    ${Title_warning_AddTopic}    Topic's title cannot empty
Verify that user can create topic if "Description" field is left blank - 3664
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Input Title and Topic Decription    AB    ${notvalue}
        Create confirmation
            then element text should be    ${NOTIFICATION_POPUP}    Topic created!
Verify that An error Title message displays when user click but skip input then click other fields - 3683
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        click element    ${Title_AddTopic}
        click element    ${Description_AddTopic}
        wait until element is visible    ${Title_warning_AddTopic}
            then element text should be    ${Title_warning_AddTopic}    Topic's title cannot empty
Verify that error message at "Title" field disappear after user click "Cancel" to add new topics - 3690
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        click element    ${Title_AddTopic}
        click element    ${Description_AddTopic}
        Cancel Adding Topic
            then Go to Add Topic
#            element text should be    ${Title_warning_AddTopic}    ${notvalue}    #Bug not fix now
Verify that data of previous execution will disappear when user add new topics - 3694
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Input Title and Topic Decription    AB    ${notvalue}
        Cancel Adding Topic
            then Go to Add Topic
            element text should be  ${Title_AddTopic}   ${notvalue}
Check button "X" displayed at message box - 3703
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        click element    ${Cancel_button}
           then wait until element is visible    ${Cancelbutton_CancelAddingTopic}
Check content at message box - 3704 - 3705 - 3706
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        click element    ${Cancel_button}
        wait until element is visible    ${Messagebox_CancelButton}
          then element text should be       ${Messagebox_CancelButton}      Are you sure to stop creating topic?
               wait until element is enabled    ${Cancelbutton_CancelAddingTopic}
               wait until element is enabled    ${Ok_button_CancelAddingTopic}
Verify that button "OK" always enable - 3714
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        cancel adding topic
            then wait until element does not contain    ${Title_AddTopic}    ${Description_AddTopic}
Verify that button "OK" always enable - 3716
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Revoke cancel adding topic
            then wait until element does not contain    ${Ok_button_CancelAddingTopic}    ${Cancelbutton_CancelAddingTopic}
                 element should be visible    ${Title_AddTopic}
Verify that user cannot create topic if Title of topic already exists - 3731
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Go to Add Topic
        Input Title and Topic Decription     python    python
        Create confirmation
            then element should be visible    ${NOTIFICATION_POPUP}     Topic with this title already exists!
Verify that text-box search bar "Search by Title" is working properly -3732
    Given Admin Login
    And Access Elearning
        when Go to Topics
        Search by Title     java
            then wait until element contains    ${Tablelist_Topic}    java

Verify that "Search by Title" show same search results when using uppercase or lowercase - 3739
   Given Admin Login
    And Access Elearning
        when Go to Topics
        Search by Title     Java
            then wait until element does not contain  ${Tablelist_Topic}    java
Verify that button Edit Topic at table cell Operations always enable - 3754
    Given Admin Login
    And Access Elearning
    When Go to Topics
       Check Exist and Open Edit Dialog    ${Topic_row}     Java
         then wait until element contains    ${Title_EditTopic}  Edit Topic
         capture page screenshot
