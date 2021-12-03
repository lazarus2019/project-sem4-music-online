package com.demo.models;

public class PlaylistInfor {

	private int playlistCategoryId;
	private String title;
	private String thumbnail;
	private int likes;
	
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

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public PlaylistInfor(int playlistCategoryId, String title, String thumbnail, int likes) {
		super();
		this.playlistCategoryId = playlistCategoryId;
		this.title = title;
		this.thumbnail = thumbnail;
		this.likes = likes;
	}

	public PlaylistInfor() {
		super();
	}

}
