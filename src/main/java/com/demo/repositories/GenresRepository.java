package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Genres;
@Repository("genresRepository")
public interface GenresRepository extends CrudRepository<Genres, Integer>{
}
