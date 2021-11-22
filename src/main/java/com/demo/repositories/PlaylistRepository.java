package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Playlist;
import com.demo.entities.ServicePackage;

@Repository("playlistRepository")
public interface PlaylistRepository extends CrudRepository<Playlist, Integer> {

	@Query(value = "select * from Playlist where category_id = 3 order by publish_date asc limit 6", nativeQuery = true) 
	  public List<Playlist> getAllUpcommingAlbum();
	
}
