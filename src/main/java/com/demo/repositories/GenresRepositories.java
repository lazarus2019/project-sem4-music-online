package com.demo.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Genres;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.models.GenresName;


@Repository("genresRepositories")
public interface GenresRepositories extends CrudRepository<Genres, Integer> {

	@Query("select new com.demo.models.GenresName(id, name) from Genres where id = :id ")
	public GenresName getNameById(@Param("id") int id);
	
}
