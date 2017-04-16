package model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class sendEmail
{
   public static void sendEmailTo(String to[],String subject, String content) throws MessagingException
   { 
	   
      // Recipient's email ID needs to be mentioned.

      // Sender's email ID needs to be mentioned
      String from = "singla.iiitv@gmail.com";

      // Assuming you are sending email from localhost
      String host = "smtp.gmail.com";
      final String password = "bumpy123";
      // Get system properties
      Properties properties = System.getProperties();
      properties.put("mail.smtps.starttls.enable", "true");
      // Setup mail server
      properties.put("mail.smtps.host", host);
      properties.put("mail.smtps.user", from);
      properties.put("mail.smtps.password", password);
      properties.put("mail.smtps.port", 25);     
      properties.put("mail.smtps.auth", "true");
      properties.put("mail.smtps.debug", "true");
      properties.put("mail.smtps.socketFactory.port", 25);
      properties.put("mail.smtps.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      properties.put("mail.smtps.socketFactory.fallback", "false");
      Transport transport ;
      
      // Get the default Session object.
      

      
      Authenticator authenticator = new Authenticator () {
          public PasswordAuthentication getPasswordAuthentication(){
              return new PasswordAuthentication("bumpy.team",password);//userid and password for "from" email address 
          }
      };
      
      Session session = Session.getInstance(properties,authenticator);
      
      transport = session.getTransport("smtps");
      
      try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);
         //System.out.println("1");
         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));
         //System.out.println("2");
         // Set To: header field of the header.
         
         InternetAddress toAddress[] = new InternetAddress[to.length];
         
         for (int i = 0; i < to.length; i++) {
			toAddress[i] = new InternetAddress(to[i]);
		}
         
         for (int i = 0; i < toAddress.length; i++) {

             message.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
 		}
         
         //System.out.println("3");
         // Set Subject: header field
         message.setSubject(subject);
         System.out.println("4");
         // Send the actual HTML message, as big as you like
         message.setContent(content, "text/html" );
         System.out.println("5");
         // Send message
         
         transport =session.getTransport("smtp");
         System.out.println("6");
         transport.connect(host,from,password);
         System.out.println("7");
    
         transport.sendMessage(message, toAddress);
         
         System.out.println("8");
        
   	      transport.close();
      
         //System.out.println("Sent message successfully....");
      	}catch (MessagingException mex) {
         System.out.println("Error sending mail : " + mex.getMessage() + "error cause : " + mex.getCause());
      }
    
   }
}