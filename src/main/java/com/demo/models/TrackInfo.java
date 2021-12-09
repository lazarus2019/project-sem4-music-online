package com.demo.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.Genres;

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
	private boolean premium;
	private Date publishDate;
	private Genres genres;
	private int artistLength;
	private List<Account> accounts = new ArrayList<Account>();
	private List<ArtistInfo> artists = new ArrayList<ArtistInfo>();	
	
	
	public TrackInfo(Integer id, String title, String thumbnail, int likes, int listens) {
		super();
		this.id = id;
		this.title = title;
		this.thumbnail = thumbnail;
		this.likes = likes;
		this.listens = listens;
	}

	public TrackInfo(Integer id, int genresId, int statusId, String title, String thumbnail, int likes, int listens, boolean premium) {
		super();
		this.id = id;
		this.genresId = genresId;
		this.statusId = statusId;
		this.title = title;
		this.thumbnail = thumbnail;
		this.likes = likes;
		this.listens = listens;
		this.premium = premium;
	}

	public TrackInfo(Integer id, int genresId, String title, String thumbnail) {
		super();
		this.id = id;
		this.genresId = genresId;
		this.title = title;
		this.thumbnail = thumbnail;
	}

	public TrackInfo(Integer id, int genresId, int statusId, String fileName, String title, String lyrics,
			String thumbnail, int duration, boolean premium) {
		super();
		this.id = id;
		this.genresId = genresId;
		this.statusId = statusId;
		this.fileName = fileName;
		this.title = title;
		this.lyrics = lyrics;
		this.thumbnail = thumbnail;
		this.duration = duration;
		this.premium = premium;
	}

	public Genres getGenres() {
		return genres;
	}

	public void setGenres(Genres genres) {
		this.genres = genres;
	}
	public TrackInfo() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getGenresId() {
		return genresId;
	}

	public void setGenresId(int genresId) {
		this.genresId = genresId;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getListens() {
		return listens;
	}

	public void setListens(int listens) {
		this.listens = listens;
	}

	public int getBaseListens() {
		return baseListens;
	}

	public void setBaseListens(int baseListens) {
		this.baseListens = baseListens;
	}

	public int getWeeklyListens() {
		return weeklyListens;
	}

	public void setWeeklyListens(int weeklyListens) {
		this.weeklyListens = weeklyListens;
	}

	public boolean isPremium() {
		return premium;
	}

	public void setPremium(boolean premium) {
		this.premium = premium;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

	public List<ArtistInfo> getArtists() {
		return artists;
	}

	public void setArtists(List<ArtistInfo> artists) {
		this.artists = artists;
	}

	public int getArtistLength() {
		return artistLength;
	}

	public void setArtistLength(int artistLength) {
		this.artistLength = artistLength;
	}

}
