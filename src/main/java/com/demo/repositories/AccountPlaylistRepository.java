package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.AccountPlaylist;

@Repository("accountPlaylistRepository")
public interface AccountPlaylistRepository extends PagingAndSortingRepository<AccountPlaylist,Integer>{

	@Query("FROM AccountPlaylist WHERE is_own = true AND playlist_id = :id")
	public AccountPlaylist checkAlbum(@Param("id")int playlistId);

	@Query("FROM AccountPlaylist WHERE is_own = true AND account_id = :id")
	public List<AccountPlaylist> getAlbumsOfArtistId(@Param("id") int id);

}
