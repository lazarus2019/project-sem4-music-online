package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.demo.entities.Country;
import com.demo.repositories.CountryRepository;

public class CountryServiceImpl implements CountryService {

	@Autowired
	private CountryRepository countryRepository ;
	
	@Override
	public Iterable<Country> findAll() {
		return countryRepository.findAll(); 
	} 
	

}
