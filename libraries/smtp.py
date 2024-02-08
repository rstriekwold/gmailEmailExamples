import smtplib
from email.mime.text import MIMEText
from robot.api import logger

def send_email(subject, body, sender, recipients, user, password):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = recipients
    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    smtp_server.login(user, password)
    smtp_server.sendmail(sender, recipients, msg.as_string())
    logger.warn("mail send")
    smtp_server.quit()

def reply_email(subject, body, sender, replyTo, user, password):
    msg = MIMEText(body)
    msg['Subject'] = "RE: "+subject
    msg['From'] = sender
    msg['Reply-To'] = replyTo
    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    smtp_server.login(user, password)
    smtp_server.sendmail(sender, replyTo, msg.as_string())
    logger.warn("mail send")
    smtp_server.quit()

def send_email_Attachments(subject, body, sender, recipients, user, password, files=None):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = recipients
    #msg.attach(MIMEText(text))
 
    for f in files or []:
        with open(f, "rb") as fil:
            part = MIMEApplication(
                fil.read(),
                Name=basename(f)
            )
        # After the file is closed
        part['Content-Disposition'] = 'attachment; filename="%s"' % basename(f)
        msg.attach(part)
    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    smtp_server.login(user, password)
    smtp_server.sendmail(sender, recipients, msg.as_string())
    logger.warn("mail send")
    smtp_server.quit()