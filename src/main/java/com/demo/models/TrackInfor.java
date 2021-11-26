package com.demo.models;

import java.util.Date;

public class TrackInfor {
	
	private int id;
	private String title;
	private String fileName;
	private String lyrics;
	private String thumbnail;
	private int likes;
	private int listens;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
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
	public int getListens() {
		return listens;
	}
	public void setListens(int listens) {
		this.listens = listens;
	}
	public TrackInfor(int id, String title, String fileName, String lyrics, String thumbnail, int likes, int listens) {
		super();
		this.id = id;
		this.title = title;
		this.fileName = fileName;
		this.lyrics = lyrics;
		this.thumbnail = thumbnail;
		this.likes = likes;
		this.listens = listens;
	}
	public TrackInfor() {
		super();
	}
	
	
	
}
