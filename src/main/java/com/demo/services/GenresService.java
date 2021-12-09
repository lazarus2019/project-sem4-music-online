package com.demo.services;

import com.demo.entities.Genres;

import com.demo.models.GenresName;

public interface GenresService {

	public Iterable<Genres> findAll();
	
	public Genres find(int id) ;
	
	public GenresName getNameById(int id);
	
	public Genres save(Genres genres) ; 
	
}
