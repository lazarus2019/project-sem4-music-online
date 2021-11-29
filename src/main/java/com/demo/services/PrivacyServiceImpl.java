package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Privacy;
import com.demo.repositories.PrivacyRepository;

@Service("privacyService")
public class PrivacyServiceImpl implements PrivacyService {

	@Autowired
	private PrivacyRepository privacyRepository;
	
	@Override
	public Iterable<Privacy> getAll() {
		return privacyRepository.findAll();
	}

}
