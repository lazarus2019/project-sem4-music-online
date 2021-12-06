package com.demo.services;

import java.util.List;

import com.demo.entities.AccountPlaylist;

import com.demo.entities.AccountPlaylistId;
import com.demo.entities.Playlist;
import com.demo.models.AlbumInfo;

public interface AccountPlaylistService {

	public List<AlbumInfo> checkAndGetAlbum(List<AlbumInfo> album);

	public List<AlbumInfo> getAlbumsByArtistId(int id);
	
	public AccountPlaylist getOwnerPlaylist(int playlistId);

	//A-2/12
	public List<AccountPlaylistId> getPlaylistOfAccount(int id);
	
	public AccountPlaylist save(AccountPlaylist accountPlaylist);
	
	public void delete(AccountPlaylistId accountPlaylistId);
	
	public AccountPlaylist findById(AccountPlaylistId accountPlaylistId);
	
	public Iterable<AccountPlaylist> findAll();
	
	public void removeAccountHasAlbum(Playlist album);
	
	public void setOwnerAlbum(Playlist album, int artistId);
}
