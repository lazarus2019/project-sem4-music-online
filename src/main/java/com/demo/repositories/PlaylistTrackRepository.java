package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;

@Repository("playlistTrackRepository")
public interface PlaylistTrackRepository extends CrudRepository<PlaylistTrack, PlaylistTrackId>{

	@Query(value = "SELECT playlist_id FROM playlist_track WHERE track_id = :id", nativeQuery = true)
	public List<Integer> getAlbumOwnIdsByTrackId(@Param("id") int id);
}
