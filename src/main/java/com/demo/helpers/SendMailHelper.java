package com.demo.helpers;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class SendMailHelper {

    public void sendSimpleEmail(String emailTo, String subject ,String messageContent , JavaMailSender emailSender)  throws MessagingException{
    	
    	MimeMessage message = emailSender.createMimeMessage();

        boolean multipart = true;
        
        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
        
        
        message.setContent(messageContent, "text/html");
        
        helper.setTo(emailTo);
        
        helper.setSubject(subject);
        
    
        emailSender.send(message);
    	
    	
        // Create a Simple MailMessage.
        //SimpleMailMessage message = new SimpleMailMessage();
        
        //message.setTo(emailTo);      	
        //message.setSubject(subject);
        //message.setText(messageContent);

        //this.emailSender.send(message);
        // Send Message!
    }
}