package com.work.utils;
import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class EmailUtil {
    public static void send(String send, String code) throws MessagingException, GeneralSecurityException {
        Properties properties = new Properties();

        properties.setProperty("mail.host","smtp.qq.com");

        properties.setProperty("mail.transport.protocol","smtp");

        properties.setProperty("mail.smtp.auth","true");

        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("1343585316@qq.com","fhoorccgcppkigcf");
            }
        });

        session.setDebug(true);

        Transport transport = session.getTransport();

        transport.connect("smtp.qq.com","1343585316@qq.com","fhoorccgcppkigcf");

        MimeMessage mimeMessage = new MimeMessage(session);

        mimeMessage.setFrom(new InternetAddress("1343585316@qq.com"));

        mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(send));

        mimeMessage.setSubject("Verification Code");

        mimeMessage.setContent("Your code is: " + code,"text/html;charset=UTF-8");

        transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());

        transport.close();
    }
}
