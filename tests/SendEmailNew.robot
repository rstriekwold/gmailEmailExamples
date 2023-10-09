*** Settings ***
Library                QForce
Library                DateTime
Library                Collections
Library                ../libraries/smtp.py
Library                ../libraries/verifyEmail.py
Suite Setup            OpenBrowser                 About:blank               Chrome
Suite Teardown         CloseAllBrowsers


*** Variables ***
${user}                robert.striekwold@gmail.com
${APPPASSGMAIL}
${sender}              robert.striekwold@gmail.com
${subject}
${recipients}          robert.striekwold@gmail.com
${replyTo}            robert.striekwold@gmail.com


*** Test Cases ***

Send Email
    [Documentation]    Uses environent variables from CRT cloud container.
    ${timestamp}=      Get Current Date
    ${body}=           Set Variable                Test email${timestamp}
    ${subject}=        Set Variable                Test email${timestamp}
    Send Email         ${subject}                  ${body}                   ${sender}              ${recipients}         ${user}           ${APPPASSGMAIL}
    

Send Reply Email
    ${timestamp}=      Get Current Date
    ${body}=           Set Variable                Test email${timestamp}
    ${subject}=        Set Variable                Test email${timestamp}
    Send Email         ${subject}                  ${body}                   ${sender}              ${recipients}         ${user}           ${APPPASSGMAIL}
    Sleep 10
    ${test1}=          Verify Email Exist    email=${user}             pwd=${APPPASSGMAIL}    subject=${subject}    inbody=${body}
   
    
    Reply Email        ${subject}                  ${body}                   ${sender}              ${replyTo}         ${user}           ${APPPASSGMAIL}