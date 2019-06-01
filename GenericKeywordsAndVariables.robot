*** Variables ***
${BROWSER}          Chrome
${LOGIN URL}        https://login.stage.transloc.com/login/?next=https://architect.stage.transloc.com/
${USERNAME}         qa_user_2
${PASSWORD}         v$bani94Wax6FSre
${LOGINPAGE}        Log in
${WELCOMEPAGE}      Architect

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Title Should Be     ${LOGINPAGE}

Input Username
    [Arguments]     ${username}
    Input Text      username      ${username}

Input Password
    [Arguments]     ${password}
    Input Text      password      ${password}

Submit Credentials
    
    

Custom Select Link
    [Arguments]         ${locator}




Click Element With data-id
    [Arguments]     ${dataIDValue}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Click Element   ${element}