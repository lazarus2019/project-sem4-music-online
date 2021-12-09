package com.demo.services;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.Contact;
import com.demo.repositories.ContactRepository;
import com.demo.helpers.SendMailHelper;
import com.demo.models.ContactInfo;
@Service("contactService")
public class ContactServiceImpl implements ContactService {
	
	@Autowired
    public JavaMailSender emailSender;

	@Autowired
	private ContactRepository contactRepository;
	
	@Override
	public Contact save(Contact contact) {
		return contactRepository.save(contact);
	}

	@Override
	public Iterable<Contact> findAll() {
		return contactRepository.findAll();
	}

	@Override
	public Contact findById(int id) {
		return contactRepository.findById(id).get();
	}

	@Override
	public void delete(int contactId) {
		try {
			Contact contact = findById(contactId);
			contactRepository.delete(contact);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public ContactInfo findContactInfoById(int contactId) {
		return contactRepository.findContactInfoById(contactId);
	}

	@Override
	public int getAmountUnreadMailbox() {
		return contactRepository.getAmountUnreadContact();
	}

	@Override
	public void replyContactEmail(String email, String content) {
		SendMailHelper mailHelper = new SendMailHelper() ;
		String emailContent = "<h3>After receiving your feedback about the website as well as the question you sent.\r\n"
				+ "\r\n"
				+ "Our team has discussed and found the most suitable solution / answer for your problem.</h3> <br> "  ;
		emailContent += content + "</br>";
		
		String subject = "[Muzik] Reply Contact"; 
		
		try {
			mailHelper.sendSimpleEmail(email, subject, emailContent , emailSender);
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
		}
		
	}
	
	@Override
	public void replyContactAccount(Account account, String content) {
		SendMailHelper mailHelper = new SendMailHelper() ;
		String emailContent = "<h3>After receiving your feedback about the website as well as the question you sent.\r\n"
				+ "\r\n"
				+ "Our team has discussed and found the most suitable solution / answer for your problem.</h3> <br> Dear " + account.getFirstname()  ;
		emailContent += content + "</br>";
		
		String subject = "[Muzik] Reply Contact"; 
		
		try {
			mailHelper.sendSimpleEmail(account.getEmail(), subject, emailContent , emailSender);
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
		}
	}

	@Override
	public List<Contact> getTopUnreadContact() {
		return contactRepository.getTopUnreadContact();
	}

	
}
