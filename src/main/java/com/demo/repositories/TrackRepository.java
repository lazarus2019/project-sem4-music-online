package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.ServicePackage;
import com.demo.entities.Track;

@Repository("trackRepository")
public interface TrackRepository extends CrudRepository<Track, Integer> {

	@Query(value = "select * from Track order by id desc limit 12", nativeQuery = true) 
	  public List<Track> getAllNewRelease();
	
}
