import imaplib
import email
from bs4 import BeautifulSoup
import re
from email.header import decode_header


def clean(text):
    # clean text for creating a folder
    return "".join(c if c.isalnum() else "_" for c in text)

def email_body_contains(email_body, content_to_match):
    return content_to_match in email_body

def extract_number_from_html(html_content):
    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(html_content, "html.parser")

    # Find the number within the <strong> tag
    strong_tags = soup.find_all("strong")

    for strong_tag in strong_tags:
        text = strong_tag.get_text().strip()
        # Use regular expression to match numbers
        number_match = re.search(r'\b\d+\b', text)
        if number_match:
            return number_match.group()

    return None

def get_email_bodies_by_subject_and_content(server, username, password, subject_to_match, content_to_match, max_emails=10):
    email_bodies = []
    try:
        # Connect to the IMAP server
        mail = imaplib.IMAP4_SSL(server)
        mail.login(username, password)
        mail.select("inbox")

        # Search for emails with the desired subject
        search_criteria = f'(SUBJECT "{subject_to_match}")'
        result, data = mail.search(None, search_criteria)
        email_ids = data[0].split()

        email_count = 0
        for email_id in reversed(email_ids):
            if email_count >= max_emails:
                break

            result, data = mail.fetch(email_id, "(RFC822)")
            raw_email = data[0][1]
            msg = email.message_from_bytes(raw_email)

            # Decode the email subject
            subject, encoding = decode_header(msg["Subject"])[0]
            if isinstance(subject, bytes):
                subject = subject.decode(encoding or "utf-8")

            # Check if the subject matches
            if subject == subject_to_match:
                # Get the email body
                email_count += 1
                if msg.is_multipart():
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
                        if content_type == "text/html" and "attachment" not in content_disposition:
                            email_bodies.append(body)
                else:
                    content_type = msg.get_content_type()
                    body = msg.get_payload(decode=True).decode()
                    if content_type == "text/plain":
                        email_bodies.append(body)

        return email_bodies

    except Exception as e:
        print("An error occurred:", e)
    finally:
        mail.logout()

    return email_bodies

email_server = "imap.gmail.com"
email_username = "puvanasri.j@spantechnologyservices.com"
email_password = "zsto caag dwkq guma"
target_subject = "Verify your TaxBandits Account"
target_content = "Hello" 
def email_ota():
  email_bodies = get_email_bodies_by_subject_and_content(email_server, email_username, email_password, target_subject, target_content, max_emails=50)
  extracted_number=""
  for idx, email_body in enumerate(email_bodies, start=1):
    email_body=str(email_body)
    if email_body.__contains__(target_content):
        print(email_body)
        print("END")
        extracted_number = extract_number_from_html(email_body)
        print(extracted_number)
    return extracted_number

email_ota()