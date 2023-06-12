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