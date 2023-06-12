import smtplib
from email.mime.text import MIMEText
from robot.libraries.BuiltIn import BuiltIn

def send_email(subject, body, sender, recipients, user, password):
    msg = MIMEText(body)
    BuiltIn().pass(f"{msg}")
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = ', '.join(recipients)
    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    smtp_server.login(user, password)
    smtp_server.sendmail(sender, recipients, msg.as_string())
    smtp_server.quit()