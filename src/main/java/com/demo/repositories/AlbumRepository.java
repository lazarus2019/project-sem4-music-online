package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Playlist;
import com.demo.models.AlbumInfo;

@Repository("albumRepository")
public interface AlbumRepository extends PagingAndSortingRepository<Playlist, Integer> {
	
	@Query("SELECT new com.demo.models.AlbumInfo(id,title, thumbnail) FROM Playlist WHERE status.id = 1 AND category_id = 3 AND title LIKE %:keyword%")
	public List<AlbumInfo> searchByKeyword(@Param("keyword")String keyword);	

	
//	@Query("SELECT new com.demo.models.AlbumInfo(pl.id,pl.title,pl.description,pl.thumbnail,pl.status.id,pl.publishDate) FROM Playlist AS pl JOIN AccountPlaylist AS ac_pl ON pl.id = ac_pl.playlist.id WHERE pl.playlistCategory.id = 3 AND ac_pl.account.id = :id")
//	public List<AlbumInfo> findAllAlbumByArtist(@Param("id")int artist_id);
//	
	@Query("SELECT new com.demo.models.AlbumInfo(id,title,description,thumbnail,status.id,publishDate) FROM Playlist WHERE id = :id")
	public AlbumInfo findAlbumById(@Param("id")int id);
}
