package com.demo.services;


import java.util.List;
import com.demo.entities.Account;
import com.demo.entities.Contact;
import com.demo.models.ContactInfo;

public interface ContactService {

	public Contact save (Contact contact);
	
	public Iterable<Contact> findAll();
	
	public Contact findById(int contactId);
	
	public void delete(int contactId);
	
	public ContactInfo findContactInfoById(int contactId);
	
	public int getAmountUnreadMailbox();
	
	public void replyContactAccount(Account account, String content);
	
	public void replyContactEmail(String email, String content);
	
	public List<Contact> getTopUnreadContact();
}
