package com.demo.repositories;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.ServicePackage;
import com.demo.entities.Track;
import com.demo.models.TrackInfo;
import com.demo.models.TrackInfor;

@Repository("trackRepository")
public interface TrackRepository extends PagingAndSortingRepository<Track, Integer> {

	@Query(value = "select * from Track where status_id = :statusId order by id desc limit :n", nativeQuery = true) 
	public List<Track> getNewRelease(@Param("statusId") int statusId, @Param("n") int n);
	
	@Query(value = "select * from Track where status_id = :statusId", nativeQuery = true) 
	public List<Track> getAllByStatus(@Param("statusId") int statusId);
	
	@Query(value = "select * from Track where status_id = :statusId order by weekly_listens desc limit :n", nativeQuery = true) 
	public List<Track> getTopWeekly(@Param("statusId") int statusId, @Param("n") int n);
	
	@Query(value = "select * from Track where status_id = :statusId and genres_id = :genresId order by weekly_listens desc limit :n", nativeQuery = true) 
	public List<Track> getTopWeeklyByGenre(@Param("statusId") int statusId, @Param("n") int n, @Param("genresId") int genresId);

	@Query(" select new com.demo.models.TrackInfor(id, title, fileName, lyrics, thumbnail, likes, listens) from Track where genres.id = :id ")
	public List<TrackInfor> findTrackByGenresId(@Param("id") int id);
	
	@Query("SELECT new com.demo.models.TrackInfo(id, genres.id, title, thumbnail) FROM Track WHERE status.id = 1 AND title LIKE %:keyword%")
	public List<TrackInfo> searchByTitle(@Param("keyword")String keyword, Pageable pageable);
	
	@Query("SELECT new com.demo.models.TrackInfo(id, genres.id, status.id, fileName, title, lyrics, thumbnail, duration, isPremium) FROM Track WHERE status.id = 1 AND id = :trackId")
	public TrackInfo findByTrackId(@Param("trackId")int trackId);
	
	@Query("SELECT new com.demo.models.TrackInfo(id, genres.id, status.id, fileName, title, lyrics, thumbnail, duration, isPremium) FROM Track WHERE status.id = 1 AND id != :id AND genres.id = :genresId ORDER BY RAND()")
	public List<TrackInfo> getWaitingTrackByGenres(@Param("id")int id, @Param("genresId")int genresId, Pageable pageable);
}

