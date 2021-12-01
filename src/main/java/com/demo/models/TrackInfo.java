package com.demo.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import java.util.Set;

import com.demo.entities.Account;
import com.demo.entities.Genres;
import com.demo.entities.Status;

import javassist.expr.NewArray;

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
	private List<Account> account = new ArrayList<Account>();
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
		return isPremium;
	}
	public void setPremium(boolean isPremium) {
		this.isPremium = isPremium;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public List<Account> getAccount() {
		return account;
	}
	public void setAccount(List<Account> account) {
		this.account = account;
	}
	public List<ArtistInfo> getArtists() {
		return artists;
	}
	public void setArtists(List<ArtistInfo> artists) {
		this.artists = artists;
	}

}
