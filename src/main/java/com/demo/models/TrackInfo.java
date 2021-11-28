package com.demo.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TrackInfo {
	
	private Integer id;
	private int genresId;
	private int statusId;
	private String fileName;
	private String title;
	private String lyrics;
	private String thumbnail;
	private int likes;
	private int duration;
	private int listens;
	private int baseListens;
	private int weeklyListens;
	private boolean isPremium;
	private Date publishDate;
	private List<ArtistInfo> artists = new ArrayList<ArtistInfo>();
	
	
	
	
	
	public TrackInfo(Integer id, int genresId, String title, String thumbnail) {
		super();
		this.id = id;
		this.genresId = genresId;
		this.title = title;
		this.thumbnail = thumbnail;
	}
	public TrackInfo(Integer id, int genresId, int statusId, String fileName, String title, String lyrics,
			String thumbnail, int duration, boolean isPremium) {
		super();
		this.id = id;
		this.genresId = genresId;
		this.statusId = statusId;
		this.fileName = fileName;
		this.title = title;
		this.lyrics = lyrics;
		this.thumbnail = thumbnail;
		this.duration = duration;
		this.isPremium = isPremium;
	}
	public TrackInfo() {
		super();
	}
	public TrackInfo(Integer id, int genresId, int statusId, String fileName, String title, String lyrics,
			String thumbnail, int likes, int duration, int listens, int baseListens, int weeklyListens,
			boolean isPremium, Date publishDate, List<ArtistInfo> artists) {
		super();
		this.id = id;
		this.genresId = genresId;
		this.statusId = statusId;
		this.fileName = fileName;
		this.title = title;
		this.lyrics = lyrics;
		this.thumbnail = thumbnail;
		this.likes = likes;
		this.duration = duration;
		this.listens = listens;
		this.baseListens = baseListens;
		this.weeklyListens = weeklyListens;
		this.isPremium = isPremium;
		this.publishDate = publishDate;
		this.artists = artists;
	}
	public Integer getId() {
		return id;
	}
	public void ListId(Integer id) {
		this.id = id;
	}
	public int getGenresId() {
		return genresId;
	}
	public void ListGenresId(int genresId) {
		this.genresId = genresId;
	}
	public int getStatusId() {
		return statusId;
	}
	public void ListStatusId(int statusId) {
		this.statusId = statusId;
	}
	public String getFileName() {
		return fileName;
	}
	public void ListFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getTitle() {
		return title;
	}
	public void ListTitle(String title) {
		this.title = title;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void ListLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void ListThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getLikes() {
		return likes;
	}
	public void ListLikes(int likes) {
		this.likes = likes;
	}
	public int getDuration() {
		return duration;
	}
	public void ListDuration(int duration) {
		this.duration = duration;
	}
	public int getListens() {
		return listens;
	}
	public void ListListens(int listens) {
		this.listens = listens;
	}
	public int getBaseListens() {
		return baseListens;
	}
	public void ListBaseListens(int baseListens) {
		this.baseListens = baseListens;
	}
	public int getWeeklyListens() {
		return weeklyListens;
	}
	public void ListWeeklyListens(int weeklyListens) {
		this.weeklyListens = weeklyListens;
	}
	public boolean isPremium() {
		return isPremium;
	}
	public void ListPremium(boolean isPremium) {
		this.isPremium = isPremium;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void ListPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public List<ArtistInfo> getArtist() {
		return artists;
	}
	public void setArtist(List<ArtistInfo> artists) {
		this.artists = artists;
	}
	
		
}
