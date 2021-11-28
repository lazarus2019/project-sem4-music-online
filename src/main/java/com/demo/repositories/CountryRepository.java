package com.demo.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Country;


@Repository("countryRepository")
public interface CountryRepository extends CrudRepository<Country, Integer>  {

}
