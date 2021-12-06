package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.ContactType;
@Repository("contactTypeRepository")
public interface ContactTypeRepository extends CrudRepository<ContactType, Integer>{

}
