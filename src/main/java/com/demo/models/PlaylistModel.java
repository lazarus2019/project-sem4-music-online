package com.demo.models;

import java.util.Date;
import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.Playlist;

public class PlaylistModel {

	private int id;
	private String thumbnail;
	private String Title;
	private Date publishDate;
	private int likes;
	private String playlistCategory;
	private int status;
	private String description;
	private List<Account> accounts;

	public PlaylistModel() {
		super();
	}

	public PlaylistModel(int id, String thumbnail, String title, Date publishDate, int likes, String playlistCategory,
			int status, String description, List<Account> accounts) {
		super();
		this.id = id;
		this.thumbnail = thumbnail;
		Title = title;
		this.publishDate = publishDate;
		this.likes = likes;
		this.playlistCategory = playlistCategory;
		this.status = status;
		this.description = description;
		this.accounts = accounts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getPlaylistCategory() {
		return playlistCategory;
	}

	public void setPlaylistCategory(String playlistCategory) {
		this.playlistCategory = playlistCategory;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

}
