*** Variables ***
${BROWSER}          Chrome
${LOGIN URL}        https://login.stage.transloc.com/login/?next=https://architect.stage.transloc.com/
${USERNAME}         qa_user_2
${PASSWORD}         v$bani94Wax6FSre
${LOGINPAGE}        Log in
${WELCOMEPAGE}      Architect


${LONGSTRING}       THIS STRING IS 256 CHARACTERS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
${TOOLONGSTRING}    THIS STRING IS 257 CHARACTERS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



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

Click Element With data-id
    [Arguments]     ${dataIDValue}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Click Element   ${element}

Type in data-id
    [Arguments]     ${dataIDValue}      ${stringToInput}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Press Keys      ${element}          ${stringToInput}
    sleep           3s
    Element Attribute Value Should Be   ${element}      value   ${stringToInput}

Clear Field Of Characters with data-id
    [Arguments]     ${dataIDValue}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    :FOR    ${index}    IN RANGE    260
    \   Press Key       ${element}  \\8
    Check if data-id is empty       ${dataIDValue}

Check if data-id is empty
    [Arguments]     ${dataIDValue}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Press Key       ${element}  x
    Element Attribute Value Should Be   ${element}      value   x
    Press Key       ${element}  \\8

Input to data-id
    [Arguments]     ${dataIDValue}      ${stringToInput}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Input Text      ${element}          ${stringToInput}
    sleep           3s
    Element Attribute Value Should Be   ${element}      value   ${stringToInput}

Data-id should be visible
    [Arguments]     ${dataIDValue}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Element Should Be Visible           ${element}

Data-id should be value
    [Arguments]     ${dataIDValue}      ${stringToCheck}
    ${element}=	Execute Javascript	return window.document.querySelector('[data-id="${dataIDValue}"]');
    Element Attribute Value Should Be   ${element}      value   ${stringToCheck}
