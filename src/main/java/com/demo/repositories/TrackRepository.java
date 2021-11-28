package com.demo.repositories;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Track;
import com.demo.models.TrackInfo;

@Repository("trackRepository")
public interface TrackRepository extends PagingAndSortingRepository<Track, Integer> {

	@Query(value = "select * from Track where status_id = 1 order by id desc limit 12", nativeQuery = true) 
	  public List<Track> getAllNewRelease();
	
	
	@Query("SELECT new com.demo.models.TrackInfo(id, genres.id, title, thumbnail) FROM Track WHERE status.id = 1 AND title LIKE %:keyword%")
	public List<TrackInfo> searchByTitle(@Param("keyword")String keyword, Pageable pageable);
	
	@Query("SELECT new com.demo.models.TrackInfo(id, genres.id, status.id, fileName, title, lyrics, thumbnail, duration, isPremium) FROM Track WHERE status.id = 1 AND id = :id")
	public TrackInfo findById(@Param("id")int id);
	
	@Query("SELECT new com.demo.models.TrackInfo(id, genres.id, status.id, fileName, title, lyrics, thumbnail, duration, isPremium) FROM Track WHERE status.id = 1 AND id != :id AND genres.id = :genresId ORDER BY RAND()")
	public List<TrackInfo> getWaitingTrackByGenres(@Param("id")int id, @Param("genresId")int genresId, Pageable pageable);
}
