package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Genres;
import com.demo.models.GenresName;
@Repository("genresRepository")
public interface GenresRepository extends CrudRepository<Genres, Integer>{
	
	@Query("select new com.demo.models.GenresName(id, name) from Genres where id = :id ")
	public GenresName getNameById(@Param("id") int id);
	
}
