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
@{recipients}      robert.striekwold@copado.com


*** Test Cases ***

Send Email
    [Documentation]    Uses environent variables from CRT cloud container.
    ${body}=    Catenate    SEPARATOR=\n   Status of the Copado Robotic Testing suite
    ...                        Passed
    ...                        Detailed report: blablabla
    Send Email              ${subject}  ${body}  ${sender}  @{recipients}  ${user}  ${APPPASSGMAIL}
