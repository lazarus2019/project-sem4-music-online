package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Genres;
import com.demo.models.GenresName;
import com.demo.repositories.GenresRepository;

@Service("genresService")
public class GenresServiceImpl implements GenresService{
	
	@Autowired
	private GenresRepository genresRepository;
	

	@Override
	public Iterable<Genres> findAll() {
		return genresRepository.findAll();
	}

	@Override
	public GenresName getNameById(int id) {
		return genresRepository.getNameById(id);		
	}

	@Override
	public Genres find(int id) {
		return genresRepository.findById(id).get();
	}

	@Override
	public Genres save(Genres genres) {
		return genresRepository.save(genres);
	}
	
}
