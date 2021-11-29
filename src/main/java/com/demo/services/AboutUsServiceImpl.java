package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Aboutus;
import com.demo.repositories.AboutUsRepositories;

@Service("aboutUsService")
public class AboutUsServiceImpl implements AboutUsService {

	@Autowired
	private AboutUsRepositories aboutUsRepositories;
	
	@Override
	public Iterable<Aboutus> findAlls() {
		return aboutUsRepositories.findAll();
	}

}
