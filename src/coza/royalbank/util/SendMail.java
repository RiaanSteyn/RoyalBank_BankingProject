package coza.royalbank.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {
	
	public static void send(String  to, String sub, String msg, final String user, final String pswrd) {
		
		Properties props = new Properties(); //java.util
		
		props.put("mail.smtp.host", "no-reply@royalbank.co.za");
//		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pswrd);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			
			Transport.send(message);
			System.out.println("Successfully Sent..!");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
