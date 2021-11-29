package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Genres;
import com.demo.models.GenresName;
import com.demo.repositories.GenresRepositories;

@Service("genresService")
public class GenresServicesImpl implements GenresService {

	@Autowired
	private GenresRepositories genresRepositories;
	
	@Override
	public Iterable<Genres> findAll() {
		return genresRepositories.findAll(); 
	}
	
	@Override
	public GenresName getNameById(int id) {
		return genresRepositories.getNameById(id);		
	}
	
}
