package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Genres;
import com.demo.models.GenresName;
import com.demo.repositories.GenresRepositories;
import com.demo.repositories.GenresRepository;
@Service("genresService")
public class GenresServiceImpl implements GenresService{
	
	@Autowired
	private GenresRepository genresRepository;
	
	@Autowired
	private GenresRepositories GenresRepositories;

	@Override
	public Iterable<Genres> findAll() {
		return genresRepository.findAll();
	}

	@Override
	public GenresName getNameById(int id) {
		return GenresRepositories.getNameById(id);		
	}
	
}
