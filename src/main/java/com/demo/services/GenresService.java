package com.demo.services;

import com.demo.entities.Genres;
import com.demo.models.GenresName;

public interface GenresService {

	public Iterable<Genres> findAll();
	
	public GenresName getNameById(int id);
	
}
