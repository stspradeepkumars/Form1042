import imaplib
import email
import time
from bs4 import BeautifulSoup
from email.header import decode_header

def clean(text):
    # clean text for creating a folder
    return "".join(c if c.isalnum() else "_" for c in text)

def extract_link_from_html(html_content):
    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(html_content, "html.parser")

    # Find all <a> elements within the HTML
    link_elements = soup.find_all('a', href=True)

    # Extract the href attribute (the link) from the <a> elements
    links = []
    for link_element in link_elements:
        link = link_element.get('href')
        if link:
            links.append(link)

    return links

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
        print(len(email_ids))
        email_count = 0
        for email_id in reversed(email_ids):
            # if email_count >= max_emails:
            #     break
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
                            email_bodies.extend(extract_link_from_html(body))
                else:
                    content_type = msg.get_content_type()
                    body = msg.get_payload(decode=True).decode()
                    if content_type == "text/html":
                        email_bodies.extend(extract_link_from_html(body))

        return email_bodies

    except Exception as e:
        print("An error occurred:", e)
    finally:
        mail.logout()

    return email_bodies


email_server = "imap.gmail.com"
email_username = "puvanasri.j@spantechnologyservices.com"
email_password = "zsto caag dwkq guma"
target_subject = "Form 8453-WH E-sign Request for Form 1042, 2023 from Bishop bird"
target_content = "Bishop bird"
def email_link():   
    email_bodies = get_email_bodies_by_subject_and_content(email_server, email_username, email_password, target_subject, target_content, max_emails=50)
    for idx, email_body in enumerate(email_bodies, start=1):
        email_body = str(email_body)
        if email_body.__contains__(target_content):
            print("Email Body:")
            print(email_body)
            link = extract_link_from_html(email_body)
            if link:
                print("Link found in the email:", link)
                link1=str(link)
            return link1
    
        return None  # Return None if no link is found in any email
email_link()  
