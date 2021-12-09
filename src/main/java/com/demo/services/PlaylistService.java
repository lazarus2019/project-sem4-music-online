package com.demo.services;

import java.util.*;
import org.springframework.data.repository.query.Param;

import com.demo.entities.*;
import com.demo.models.AlbumInfo;
import com.demo.models.PlaylistInfor;
import com.demo.models.PlaylistModel;

public interface PlaylistService {

	public List<Playlist> getAllUpcommingAlbum();
	
	public Playlist save(Playlist playlist);

	public Playlist find(int id);

	public void delete(int id);
	
	public List<Playlist> getAllPlaylist();

	public List<Playlist> getAllAlbum();
	
	public List<PlaylistModel> getPlaylistModel(List<Playlist> playlists);
	
	public List<Playlist> searchByTitle(String keyword);
	
	//A
	public PlaylistInfor getLikedPlaylistByAccountId(int id);

	public PlaylistInfor getRecentPlaylistByAccountId(int id);
	
	public List<AlbumInfo> searchAlbumInManage(String option, String keyword, int artistId);
	
	public boolean publishAlbum();
}
