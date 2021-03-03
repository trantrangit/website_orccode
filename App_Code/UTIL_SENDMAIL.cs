using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UTIL_SENDMAIL
/// </summary>
public class UTIL_SENDMAIL
{
    public UTIL_SENDMAIL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private static void SendMailFast(string EmailFrom, string EmailTo, string Subject, string Body, string FromName, string email_id, string email_pass, string email_host)
    {
        // Gmail Address from where you send the mail
        // default test@ferya.info | pass Capsole1@ | Host mail.iris.arvixe.com | port 25

        // from source email to send
        string FromAddress = email_id;

        string FromPassword = email_pass;


        System.Net.Mail.MailMessage eMail = new System.Net.Mail.MailMessage();
        eMail.IsBodyHtml = true;
        eMail.Body = Body;
        eMail.From = new System.Net.Mail.MailAddress(EmailFrom, FromName);
        eMail.To.Add(EmailTo);
        eMail.Subject = Subject;


        //Attachment a = new Attachment("c:/DISCOVER_YOURSELF.pdf");
        // eMail.Attachments.Add(a);

        System.Net.Mail.SmtpClient SMTP = new System.Net.Mail.SmtpClient();

        SMTP.Credentials = new System.Net.NetworkCredential(FromAddress, FromPassword);
        SMTP.Host = email_host;
        SMTP.Send(eMail);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="email"></param>
    /// <param name="mailSubject"></param>
    /// <param name="mailBody"></param>
    /// <returns></returns>
    public static string SendMail(string email, List<string> clientEmails, bool testMail, string mailSubject, string mailBody, string emailFrom, string fromName)
    {
        try
        {
            // Check exception
            if (email == "") // send email to list
            {
                if(clientEmails != null || clientEmails.Count > 0)
                {
                    // send email to client list
                    foreach (var item in clientEmails)
                    {
                        SendMailFast(emailFrom, item, mailSubject, mailBody, fromName, "info@capsole.net", "Kid3101@", "relay-hosting.secureserver.net");
                    }
                }

                if(testMail)
                {
                    // Send test email
                    TestEmailAddress emailAddress = new TestEmailAddress();

                    foreach (var item in emailAddress.ListEmail)
                    {
                        SendMailFast(emailFrom, item, mailSubject, mailBody, fromName, "info@capsole.net", "Kid3101@", "relay-hosting.secureserver.net");
                    }
                }
            }
            else // send email to user signed up
            {
                SendMailFast(emailFrom, email, mailSubject, mailBody, fromName, "info@capsole.net", "Kid3101@", "relay-hosting.secureserver.net");
            }

            return "1";
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
}

public class TestEmailAddress
{
    public List<string> ListEmail;

    public TestEmailAddress()
    {
        ListEmail = new List<string>()
        {
            "trungle88@gmail.com",
            "nguyentu.md@thumbsup.vn",
            "nguyentu.am@ferya.org",
            "testmailkuro@gmail.com",
        };
    }
}