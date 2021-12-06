package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.ContactType;
import com.demo.repositories.ContactTypeRepository;

@Service("contactTypeService")
public class ContactTypeServiceImpl implements ContactTypeService{

	@Autowired
	private ContactTypeRepository contactTypeRepository;
	
	@Override
	public Iterable<ContactType> findAll() {
		return contactTypeRepository.findAll();
	}

}
