package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Genres;

@Repository("genresRepositories")
public interface GenresRepositories extends CrudRepository<Genres, Integer> {

}
