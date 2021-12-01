package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Privacy;

@Repository("privacyRepository")
public interface PrivacyRepository extends CrudRepository<Privacy, Integer> {

}
