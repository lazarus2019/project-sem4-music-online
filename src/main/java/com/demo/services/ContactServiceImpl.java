package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Contact;
import com.demo.repositories.ContactRepository;

@Service("contactService")
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository contactRepository;
	
	@Override
	public Contact save(Contact contact) {
		return contactRepository.save(contact);
	}

	
}
