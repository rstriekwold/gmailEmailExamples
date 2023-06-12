*** Settings ***
Library                     QForce
Library                     String
Library                     Collections
Library                     OperatingSystem
Library                     ../libraries/smtp.py
Suite Setup            OpenBrowser    About:blank    Chrome
Suite Teardown              CloseAllBrowsers

*** Variables ***
${user}            robert.striekwold@gmail.com
${APPPASSGMAIL}    
${sender}          robert.striekwold@gmail.com
${subject}         CRT test
@{recipients}      robert.striekwold@copado.com,robert.striekwold@gmail.com


*** Test Cases ***

Send Email
    [Documentation]    Uses environent variables from CRT cloud container.
    ${body}=    Catenate        Jus a test
    Send Email              ${subject}  ${body}  ${sender}  @{recipients}  ${user}  ${APPPASSGMAIL}
