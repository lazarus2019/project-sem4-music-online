package com.demo.controllers.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SimpleEmailExampleController {

    @Autowired
    public JavaMailSender emailSender;

    @ResponseBody
    @RequestMapping("/sendSimpleEmail")
    public String sendSimpleEmail() {

        // Create a Simple MailMessage.
        SimpleMailMessage message = new SimpleMailMessage();
        
        message.setTo("thu951252@gmail.com");
        for( int i= 1 ; i< 5 ; i++ ) {        	
        	message.setSubject("Test Simple Email : " + i);
        	message.setText("Hello, Im testing Simple Email : " + i);
        	this.emailSender.send(message);
        }
        // Send Message!

        return "Email Sent!";
    }

}
