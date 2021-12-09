package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.ArtistTrack;
import com.demo.entities.ArtistTrackId;
import com.demo.entities.Track;
@Repository("artistTrackRepository")
public interface ArtistTrackRepository extends CrudRepository<ArtistTrack, ArtistTrackId>{
	
	@Query(value = "SELECT account_id FROM artist_track WHERE track_id = :id", nativeQuery = true)
	public List<Integer> getAccountByTrackId(@Param("id") int id);
	
	@Query(value = "SELECT account_id FROM artist_track WHERE track_id = :id AND is_own = false", nativeQuery = true)
	public List<Integer> getFeatAccountIdByTrackId(@Param("id") int id);
	
	@Query(value = "SELECT track_id FROM artist_track WHERE account_id = :id AND is_own = true", nativeQuery = true)
	public List<Integer> getTracksOfArtist(@Param("id") int artistId);
}
