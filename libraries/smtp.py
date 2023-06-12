import smtplib
from email.mime.text import MIMEText
from robot.api import logger

def send_email(subject, body, sender, recipients, user, password):
    msg = MIMEText(body)
    logger.warn(body)
    msg['Subject'] = subject
    logger.warn("subject done")
    msg['From'] = sender
    logger.warn("sender done")
    msg['To'] = ', '.join(recipients)
    logger.warn("recipients done")
    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    logger.warn("port set")
    smtp_server.login(user, password)
    logger.warn("login done")
    smtp_server.sendmail(sender, recipients, msg.as_string())
    logger.warn("mail send")
    smtp_server.quit()