*** Settings ***
Documentation       Testing of the "New Feed" Feature
Resource            GenericKeywordsAndVariables.robot
Library             SeleniumLibrary
Suite Teardown      Close Browser

*** Keywords ***

*** Test Cases ***
Selenium Setup
    [Tags]  Critical
    Set Selenium Implicit Wait  1s
    Set Selenium Speed          50ms
    Open Browser To Login Page

Log In
    [Tags]  Critical
    #When the browser is on the "Log in" screen
    Title Should Be     ${LOGINPAGE}
    #And the user inputs the correct username
    Input Username      ${USERNAME}
    #And the user inputs the correct password
    Input Password      ${PASSWORD}
    #And presses the log in button
    Click Button        Log in
    #Then the user is direct to the Welcome Page "Architect"
    Title Should Be     ${WELCOMEPAGE}
    Wait Until Page Contains        Feeds       10s
    Sleep               3s

Navigate To "NEW FEED"
    [Tags]  Critical    New Feed
    #When the browser is on the main screen
    Title Should Be     ${WELCOMEPAGE}
    #And the user clicks "NEW FEED"
    Click Element With data-id              new-button
    #Then the browser navigates to the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Wait Until Page Contains        Feed Info   10s
    Sleep               3s
    #Data-id should be visible               field-name

"Feed Name" Field Accepts User Input
    [Tags]  New Feed
    [Teardown]          Clear Field Of Characters with data-id  field-name
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the user clicks on the field named "Feed Name"
    Click Element With data-id          field-name
    #Then the user can input a field name
    Type in data-id                     field-name  ${LONGSTRING}
    Click Element With data-id          save-button
    Sleep                               1s

"Feed Name" Field Restricts Invalid User Input (Empty)
    [Tags]  New Feed
    [Teardown]          Clear Field Of Characters with data-id  field-name
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the user clicks on the field named "Feed Name"
    Click Element With data-id          field-name
    #When the user inputs an empty string
    Clear Field Of Characters with data-id  field-name
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
    #Honestly, i there is way to validate if this message pops up, as it is dynamicaly created class name, and no defining attributes to reference

"Feed Name" Field Restricts Invalid User Input (Large)
    [Tags]  New Feed
    [Teardown]          Clear Field Of Characters with data-id  field-name
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the user clicks on the field named "Feed Name"
    Click Element With data-id          field-name
    #When the user inputs a string that is too large
    Type in data-id                     field-name  ${TOOLONGSTRING}
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
    #Honestly, i there is way to validate if this message pops up, as it is dynamicaly created class name, and no defining attributes to reference


##############################   Switch Tab   ##############################
"Feed Info" And "Agency Info" Can Be Toggled Between
    [Tags]  Critical    Switch Tab
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_name
    #And the user clicks on the "Agency Info" tab
    Click Element With data-id          agency-info-tab
    #Then the browser loads the "Agency Info" tab
    Click Element With data-id          field-gtfs_agency_name
    #And unloads the "Feed Info" tab
    Run Keyword And Expect Error    AttributeError: 'NoneType' object has no attribute 'startswith'     Data-id should be visible           field-publisher_name



"Agency Info" And "Feed Info" Can Be Toggled Between
    [Tags]  Critical    Switch Tab
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Agency Info" tab
    Data-id should be visible           agency-info-tab
    #And the user clicks on the "Feed Info" tab
    Click Element With data-id          feed-info-tab
    #Then the browser loads the "Feed Info" tab
    Click Element With data-id          field-publisher_name
    #And unloads the "Agency Info" tab
    Run Keyword And Expect Error    AttributeError: 'NoneType' object has no attribute 'startswith'     Data-id should be visible           field-gtfs_agency_name

##############################   Publisher  ##############################
"Publisher" Field Accepts User Input
    [Tags]  Publisher   Input
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_name
    #Then user can input a value into the "Publisher" field
    Type in data-id                     field-publisher_name    ${LONGSTRING}

"Publisher" Field Retains Value When Switching Tabs
    [Tags]  Publisher   Switch Tab
    [Teardown]          Clear Field Of Characters with data-id  field-publisher_name
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_name
    #And the user has a value in the "Publisher" field
    Data-id should be value             field-publisher_name    ${LONGSTRING}
    #When the user clicks on the "Agency Info" tab
    Click Element With data-id          agency-info-tab
    #And then user clicks on the "Feed Info" tab
    Click Element With data-id          feed-info-tab
    #Then the "Publisher" field retained it's value
    Data-id should be value             field-publisher_name    ${LONGSTRING}

"Publisher" Field Restricts Invalid User Input (Empty)
    [Tags]  Publisher   Empty
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_name
    #And the user clicks on the field named "Publisher"
    Click Element With data-id          field-publisher_name
    #When the user inputs an empty string
    Check if data-id is empty           field-publisher_name
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
    #Honestly, i there is way to validate if this message pops up, as it is dynamicaly created class name, and no defining attributes to reference

"Publisher" Field Restricts Invalid User Input (Large)
    [Tags]  Publisher   Large
    [Teardown]          Clear Field Of Characters with data-id  field-publisher_name
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_name
    #And the user clicks on the field named "Publisher"
    Click Element With data-id          field-publisher_name
    #When the user inputs a string that is too large
    Type in data-id                     field-publisher_name    ${TOOLONGSTRING}
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
    #Honestly, i there is way to validate if this message pops up, as it is dynamicaly created class name, and no defining attributes to reference


##############################   URL  ##############################
"URL" Field Accepts User Input
    [Tags]  URL         Input
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_url
    #Then user can input a value into the "URL" field
    Type in data-id                     field-publisher_url     ${LONGSTRING}

"URL" Field Retains Value When Switching Tabs
    [Tags]  URL         Switch Tab
    [Teardown]          Clear Field Of Characters with data-id  field-publisher_url
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_url
    #and the user has a value in the "URL" field
    Data-id should be value             field-publisher_url    ${LONGSTRING}
    #When the user clicks on the "Agency Info" tab
    Click Element With data-id          agency-info-tab
    #And then user clicks on the "Feed Info" tab
    Click Element With data-id          feed-info-tab
    #Then the "URL" field retained it's value
    Data-id should be value             field-publisher_url    ${LONGSTRING}

"URL" Field Restricts Invalid User Input (Empty)
    [Tags]  URL         Empty
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_url
    #And the user clicks on the field named "URL"
    Click Element With data-id          field-publisher_url
    #When the user inputs an empty string
    Check if data-id is empty           field-publisher_url
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
    #Honestly, i there is way to validate if this message pops up, as it is dynamicaly created class name, and no defining attributes to reference

"URL" Field Restricts Invalid User Input (Large)
    [Tags]  URL         Large
    [Teardown]          Clear Field Of Characters with data-id  field-publisher_name
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-publisher_url
    #And the user clicks on the field named "URL"
    Click Element With data-id          field-publisher_url
    #When the user inputs a string that is too large
    Type in data-id                     field-publisher_url    ${TOOLONGSTRING}
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
    #Honestly, i there is way to validate if this message pops up, as it is dynamicaly created class name, and no defining attributes to reference

##############################   Language  ##############################


##############################   Start Date  ##############################


##############################   End Date  ##############################


##############################   Version  ##############################
"Version" Field Accepts User Input
    [Tags]  Version     Input
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-version       
    #Then user can input a value into the "Version" field
    Type in data-id                     field-version           ${LONGSTRING}

"Version" Field Retains Value When Switching Tabs
    [Tags]  Version     Switch Tab
    [Teardown]          Clear Field Of Characters with data-id  field-version       
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-version       
    #and the user has a value in the "Version" field
    Data-id should be value             field-version           ${LONGSTRING}
    #When the user clicks on the "Agency Info" tab
    Click Element With data-id          agency-info-tab
    #And then user clicks on the "Feed Info" tab
    Click Element With data-id          feed-info-tab
    #Then the "Version" field retained it's value
    Data-id should be value             field-version           ${LONGSTRING}

"Version" Field Restricts Invalid User Input (Empty)
    [Tags]  Version     Empty
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-version       
    #And the user clicks on the field named "Version"
    Click Element With data-id          field-version       
    #When the user inputs an empty string
    Check if data-id is empty           field-version       
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid

"Version" Field Restricts Invalid User Input (Large)
    [Tags]  Version     Large
    [Teardown]          Clear Field Of Characters with data-id  field-version       
    #When the browser is on the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Data-id should be visible           field-name
    #And the broswer is on the "Feed Info" tab
    Data-id should be visible           field-version       
    #And the user clicks on the field named "Version"
    Click Element With data-id          field-version       
    #When the user inputs a string that is too large
    Type in data-id                     field-version           ${TOOLONGSTRING}
    #And clicks the "Save" button
    Click Element With data-id          save-button
    Sleep                               1s
    #Then a message pops us stating the field is invalid
