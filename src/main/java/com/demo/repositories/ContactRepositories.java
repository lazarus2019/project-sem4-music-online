package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Contact;

@Repository("contactRepositories")
public interface ContactRepositories extends CrudRepository<Contact, Integer> {

}
