package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Advertisement;

@Repository("advertisementRepository")
public interface AdvertisementRepository extends CrudRepository<Advertisement, Integer>{
	
		@Query("FROM Advertisement WHERE status = TRUE")
		public Advertisement findActiveAds();
}
