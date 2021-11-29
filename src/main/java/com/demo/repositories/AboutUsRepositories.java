package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Aboutus;

@Repository("aboutUsRepositories")
public interface AboutUsRepositories extends CrudRepository<Aboutus, Integer> {
	

}
