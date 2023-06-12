import smtplib
from email.mime.text import MIMEText

def send_email(subject, body, sender, recipients, user, password):
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = ', '.join(recipients)
    smtp_server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    smtp_server.login(user, password)
    smtp_server.sendmail(sender, recipients, body)
    smtp_server.quit()