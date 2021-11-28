package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Playlist;
import com.demo.entities.ServicePackage;
import com.demo.models.AlbumInfo;

@Repository("playlistRepository")
public interface PlaylistRepository extends CrudRepository<Playlist, Integer> {

	@Query(value = "select * from Playlist where category_id = 3 order by publish_date asc limit 6", nativeQuery = true) 
	  public List<Playlist> getAllUpcommingAlbum();
	
//	@Query("SELECT new com.demo.entities.AlbumInfo(id,title) FROM playlist AS pl WHERE pl.id = :id")
//	public AlbumInfo findAlbumById(@Param("id")int id);
//	
//	@Query("SELECT new com.demo.entities.AlbumInfo(id,) FROM playlist AS pl JOIN account_playlist AS ac_pl ON pl.id = ac_pl.playlist_id WHERE pl.category_id = 3 AND ac_pl.account_id = :id")
//	public List<AlbumInfo> findAllAlbumByArtist(@Param("id")int artist_id);
}
