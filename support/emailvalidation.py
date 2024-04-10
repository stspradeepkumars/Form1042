import imaplib
import email
from email.header import decode_header
import os
def clean(text):
    # clean text for creating a folder
    return "".join(c if c.isalnum() else "_" for c in text)
def get_email_body_by_subject(server, username, password, subject_to_match,name,FormType):
    result=""
    try:
        # Connect to the IMAP server
        mail = imaplib.IMAP4_SSL(server)
        mail.login(username, password)
        mail.select("inbox")
        # Search for emails with the desired subject
        search_criteria = f'(SUBJECT "{subject_to_match}")'
        result, data = mail.search(None, search_criteria)
        email_ids = data[0].split()
        if not email_ids:
            print("No emails with the specified subject found.")
            return None
        # Get the latest email
        latest_email_id = email_ids[-1]
        result, data = mail.fetch(latest_email_id, "(RFC822)")
        raw_email = data[0][1]
        msg = email.message_from_bytes(raw_email)
        # Decode the email subject
        subject, encoding = decode_header(msg["Subject"])[0]
        if isinstance(subject, bytes):
            subject = subject.decode(encoding or "utf-8")
        # Check if the subject matches
        if subject.__contains__(subject_to_match):
            # Get the email body
            if msg.is_multipart():
                print("first-if")
                # iterate over email parts
                for part in msg.walk():
                    # extract content type of email
                    content_type = part.get_content_type()
                    content_disposition = str(part.get("Content-Disposition"))
                    try:
                        # get the email body
                        body = part.get_payload(decode=True).decode()
                    except:
                        pass
                    if content_type == "text/plain" and "attachment" not in content_disposition:
                        # print text/plain emails and skip attachments
                        if body.__contains__(name):
                            result=result+"Name Matches"
                            print("Name Matches")
                        else:
                            result=result+"Name doesnt Match"
                            print("Name doesnt Match")
                        if body.__contains__(FormType):
                            result=result+"FormType Matches"
                            print("FormType Matches")
                        else:
                            result=result+"FormType doesnt Matches"
                            print("FormType doesnt Matches")
                    elif "attachment" in content_disposition:
                        # download attachment
                        filename = part.get_filename()
                        if filename:
                            folder_name = clean(subject)
                            if not os.path.isdir(folder_name):
                                # make a folder for this email (named after the subject)
                                os.mkdir(folder_name)
                            filename = "index.html"
                            filepath = os.path.join(folder_name, filename)
                            # download attachment and save it
                            open(filepath, "wb").write(part.get_payload(decode=True))
            else:
                print("first-else")
                # extract content type of email
                content_type = msg.get_content_type()
                # get the email body
                body = msg.get_payload(decode=True).decode()
                if content_type == "text/plain":
                    print(body)
                    body=str(body)
                    # print only text email parts
                    if body.__contains__(name):
                        result=result+"Name Matches"
                        print("Name Matches")
                    else:
                        result=result+"Name doesnt Match"
                        print("Name doesnt Match")
                    if body.__contains__(FormType):
                        result=result+"FormType Matches"
                        print("FormType Matches")
                    else:
                        result=result+"FormType doesnt Matches"
                        print("FormType doesnt Matches")         
    except Exception as e:
        print("An error occurred:", e)
    finally:
        mail.logout()
    #return result
    return result
    # Example usage
email_server = "imap.gmail.com"
email_username = "puvanasri.j@spantechnologyservices.com"
email_password = "zsto caag dwkq guma"
target_subject = "Form 8453-WH E-sign Request for Form 1042, 2023 from Bishop Signa"

def finalresult(name,FormType):
    email_body = get_email_body_by_subject(email_server, email_username, email_password, target_subject,name,FormType)
    return  email_body
