package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Aboutus;
import com.demo.entities.Banner;

@Repository("bannerRepositories")
public interface BannerRepository extends CrudRepository<Banner, Integer> {
	
	@Query("from Banner where status = true")
	public List<Banner> getByStatus();
	
}
