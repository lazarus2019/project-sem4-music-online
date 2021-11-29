package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;
import com.demo.entities.Advertisement;
import com.demo.models.ArtistInfo;

@Repository("advertisementRepository")
public interface AdvertisementRepository extends CrudRepository<Advertisement, Integer>{
//	@Query("SELECT * FROM Advertisement")
//	public List<Advertisement> findAllAdvertisement();
}
