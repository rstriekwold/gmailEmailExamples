*** Settings ***
Library                     QForce
Library                     ../libraries/smtp.py
Suite Setup            OpenBrowser    About:blank    Chrome
Suite Teardown              CloseAllBrowsers

*** Variables ***
${user}            robert.striekwold@gmail.com
${APPPASSGMAIL}    
${sender}          robert.striekwold@gmail.com
${subject}         CRT test
${recipients}      rstriekwold@copado.com


*** Test Cases ***

Send Email
    [Documentation]    Uses environent variables from CRT cloud container.
    ${body}=    Set Variable    Test email
    Send Email              ${subject}  ${body}  ${sender}  ${recipients}  ${user}  ${APPPASSGMAIL}
