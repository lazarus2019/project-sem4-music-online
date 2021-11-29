package com.demo.services;


import com.demo.entities.Country;

public interface CountryService {
	
	public Iterable<Country> findAll();
}
