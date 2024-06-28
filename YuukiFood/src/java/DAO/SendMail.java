package DAO;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    
    public void send(String to, String sub,
            String msg) {
        String user = "thientm01@gmail.com";
        String pass = "thongminh01";
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.mailtrap.io");
        prop.put("mail.smtp.port", "25");
        prop.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
