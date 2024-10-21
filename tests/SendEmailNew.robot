*** Settings ***
Library                QForce
Library                DateTime
Library                Collections
Library                ../libraries/smtp.py
Library                ../libraries/verifyEmail.py
Library    OperatingSystem
Suite Setup            OpenBrowser                 About:blank               Chrome
Suite Teardown         CloseAllBrowsers


*** Variables ***
${user}                
${APPPASSGMAIL}
${sender}    robert.striekwold@gmail.com              
${subject}    
${recipients}      rstriekwold@copado.com        
${replyTo}            



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
    
    #for example so email exist in inbox
    Send Email         ${subject}                  ${body}                   ${sender}              ${recipients}         ${user}           ${APPPASSGMAIL}
    Sleep              10s
    #Check if expected email exist in inbox
    ${test1}=          Verify Email Exist    email=${user}             pwd=${APPPASSGMAIL}    subject=${subject}    inbody=${body}
   
    #Fake reply email message with same subject and body and reply to address
    Reply Email        ${subject}                  ${body}                   ${sender}              ${replyTo}         ${user}           ${APPPASSGMAIL}

this is a testcase with attachment
    [Documentation]    dfdfdf
    ${timestamp}=      Get Current Date
    ${body}=           Set Variable                Test email${timestamp}
    ${subject}=        Set Variable                Test email${timestamp}
    
    #Filepath needs to be given as from the .py file
    @{files}=             Create List    ../tests/attachment.txt     
    send email Attachments     
    ...                ${subject}                  
    ...                ${body}                   
    ...                ${sender}              
    ...                ${recipients}         
    ...                ${user}           
    ...                ${APPPASSGMAIL}
    ...                ${files}