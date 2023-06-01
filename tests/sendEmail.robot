*** Settings ***

Documentation         Test cases to Send emails
Library               QWeb
Suite Setup           Open Browser                about:blank            chrome
Suite Teardown        Close All Browsers
Library               Collections
Library               ../libraries/sendEmail.py

*** Variables ***
${APPPASSGMAIL}       #Stored in suite or robot varibale as hidden
${SENDER}             emailAddressSender
${RECIPIENT}          emailAddressReceiver

*** Test Cases ***
Example send an email with subject and body
    ${SUBJECT}=       Convert To String           emailSubject
    ${textInBody}=    Convert To String           emailBody
    Send New Mail     email=${SENDER}             pwd=${APPPASSGMAIL}    subject=${SUBJECT}    inbody=${textInBody}    recipient=${RECIPIENT}
