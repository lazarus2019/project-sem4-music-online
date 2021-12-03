package com.demo.services;

import java.util.List;

import com.demo.entities.AccountPlaylist;

import com.demo.models.AlbumInfo;

public interface AccountPlaylistService {

	public List<AlbumInfo> checkAndGetAlbum(List<AlbumInfo> album);

	public List<AlbumInfo> getAlbumsByArtistId(int id);

	public AccountPlaylist getOwnerPlaylist(int playlistId);

}
