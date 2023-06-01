from RPA.Email.ImapSmtp import ImapSmtp

def send_new_mail(
    email,
    pwd,
    subject,
    inbody,
    recipient,
    ):
    mail = ImapSmtp(smtp_server='smtp.gmail.com', smtp_port=587)
    mail.authorize(account=email, password=pwd)
    mail.send_message(sender=email, recipients=recipient,
                      subject=subject,
                      body=inbody)