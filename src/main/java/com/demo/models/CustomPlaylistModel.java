package com.demo.models;

import com.demo.entities.Playlist;

public class CustomPlaylistModel {

	private int id ; 
	private int playlistCategoryId;
	private String title;
	private String thumbnail;
	private int tracksSize;
	

	public CustomPlaylistModel() {
		super();
	}
	
	public CustomPlaylistModel(Playlist playlist) {
		super();
		this.id = playlist.getId() ; 
		this.playlistCategoryId = playlist.getPlaylistCategory().getId() ; 
		this.thumbnail = playlist.getThumbnail() ; 
		this.title = playlist.getTitle() ; 
		this.tracksSize = playlist.getTracks().size() ; 
	}
	
	
	public int getPlaylistCategoryId() {
		return playlistCategoryId;
	}

	public void setPlaylistCategoryId(int playlistCategoryId) {
		this.playlistCategoryId = playlistCategoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	


	public int getTracksSize() {
		return tracksSize;
	}

	public void setTracksSize(int tracksSize) {
		this.tracksSize = tracksSize;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
