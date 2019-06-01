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
    Open Browser To Login Page

Valid Login
    [Tags]  Critical
    Input Username      ${USERNAME}
    Input Password      ${PASSWORD}
    Click Button        Log in
    Title Should Be     ${WELCOMEPAGE}

Navigate To "NEW FEED"
    [Tags]  Critical    New Feed
    #When the browser is on the main screen
    Title Should Be     ${WELCOMEPAGE}
    #And the user clicks "NEW FEED"
    Wait Until Keyword Succeeds     3s      200ms   Click Element With data-id          new-button
    #Then the browser navigates to the "new" page
    Title Should Be     ${WELCOMEPAGE}
    Wait Until Keyword Succeeds     3s      200ms   Click Element With data-id          field-name


"Feed Name" Field Accepts User Input
    [Tags]  New Feed
    #When the browser is on the "new" page
    #And the user clicks on the field named "Feed Name"
    #Then the user can input a field name

"Feed Name" Field Restricts Invalid User Input (Empty)
    [Tags]  New Feed
    #When the browser is on the "new" page
    #And the user clicks on the field named "Feed Name"
    #When the user inputs an empty string
    #And clicks the "Save" button
    #Then a message pops us stating the field is invalid

"Feed Name" Field Restricts Invalid User Input (Large)
    [Tags]  New Feed
    #When the browser is on the "new" page
    #And the user clicks on the field named "Feed Name"
    #When the user inputs a string that is too large
    #And clicks the "Save" button
    #Then a message pops us stating the field is invalid


##################   Switch Tab   ##################
"Feed Info" And "Agency Info" Can Be Toggled Between
    [Tags]  Critical    Switch Tab
    #When the browser is on the "new" page
    #And the broswer is on the "Feed Info" tab
    #And the user clicks on the "Agency Info" tab
    #Then the browser loads the "Agency Info" tab
    #And unloads the "Feed Info" tab

"Agency Info" And "Feed Info" Can Be Toggled Between
    [Tags]  Critical    Switch Tab
    #When the browser is on the "new" page
    #And the broswer is on the "Agency Info" tab
    #And the user clicks on the "Feed Info" tab
    #Then the browser loads the "Feed Info" tab
    #And unloads the "Agency Info" tab


##################   Publisher  ##################
"Publisher" Field Accepts User Input
    [Tags]  Publisher   Input
    When the browser is on the "new" page
    And the broswer is on the "Feed Info" tab
    Then user can input a value into the "Publisher" field

"Publisher" Field Retains Value When Switching Tabs
    [Tags]  Publisher   Switch Tab
    When the browser is on the "new" page
    And the broswer is on the "Feed Info" tab
    And the user has a value into the "Publisher" field
    When the user clicks on the "Agency Info" tab
    And then user clicks on the "Feed Info" tab
    Then the "Publisher" field retained it's value

"Publisher" Field Restricts Invalid User Input (Empty)
    [Tags]  Publisher   Empty
    When the browser is on the "new" page
    And the user clicks on the field named "Publisher"
    When the user inputs an empty string
    And clicks the "Save" button
    Then a message pops us stating the field is invalid

"Publisher" Field Restricts Invalid User Input (Large)
    [Tags]  Publisher   Large
    When the browser is on the "new" page
    And the user clicks on the field named "Publisher"
    When the user inputs a string that is too large
    And clicks the "Save" button
    Then a message pops us stating the field is invalid


##################   URL  ##################
"URL" Field Accepts User Input
    [Tags]  URL         Input
    When the browser is on the "new" page
    And the broswer is on the "Feed Info" tab
    Then user can input a value into the "URL" field

"URL" Field Retains Value When Switching Tabs
    [Tags]  URL         Switch Tab
    When the browser is on the "new" page
    And the broswer is on the "Feed Info" tab
    And the user has a value into the "URL" field
    When the user clicks on the "Agency Info" tab
    And then user clicks on the "Feed Info" tab
    Then the "URL" field retained it's value

"URL" Field Restricts Invalid User Input (Empty)
    [Tags]  URL         Empty
    When the browser is on the "new" page
    And the user clicks on the field named "URL"
    When the user inputs an empty string
    And clicks the "Save" button
    Then a message pops us stating the field is invalid

"URL" Field Restricts Invalid User Input (Large)
    [Tags]  URL         Large
    When the browser is on the "new" page
    And the user clicks on the field named "URL"
    When the user inputs a string that is too large
    And clicks the "Save" button
    Then a message pops us stating the field is invalid

##################   Language  ##################


##################   Start Date  ##################


##################   End Date  ##################


##################   Version  ##################
"Version" Field Accepts User Input
    [Tags]  Version     Input
    When the browser is on the "new" page
    And the broswer is on the "Feed Info" tab
    Then user can input a value into the "Version" field

"Version" Field Retains Value When Switching Tabs
    [Tags]  Version     Switch Tab
    When the browser is on the "new" page
    And the broswer is on the "Feed Info" tab
    And the user has a value into the "Version" field
    When the user clicks on the "Agency Info" tab
    And then user clicks on the "Feed Info" tab
    Then the "Version" field retained it's value

"Version" Field Restricts Invalid User Input (Empty)
    [Tags]  Version     Empty
    When the browser is on the "new" page
    And the user clicks on the field named "Version"
    When the user inputs an empty string
    And clicks the "Save" button
    Then a message pops us stating the field is invalid

"Version" Field Restricts Invalid User Input (Large)
    [Tags]  Version     Large
    When the browser is on the "new" page
    And the user clicks on the field named "Version"
    When the user inputs a string that is too large
    And clicks the "Save" button
    Then a message pops us stating the field is invalid
