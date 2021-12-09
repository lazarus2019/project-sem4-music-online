package com.demo.models;

import java.util.List;

import com.demo.entities.Account;

public class TrackChartModel {

	private int id;
	private String thumbnail;
	private String title;
	private int duration;
	private int likes;
	private boolean premium;
	private List<Account> accounts;

	public TrackChartModel() {
		super();
	}

	public TrackChartModel(int id, String thumbnail, String title, int duration, int likes, boolean premium,
			List<Account> accounts) {
		super();
		this.id = id;
		this.thumbnail = thumbnail;
		this.title = title;
		this.duration = duration;
		this.likes = likes;
		this.premium = premium;
		this.accounts = accounts;
	}

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

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public boolean isPremium() {
		return premium;
	}

	public void setPremium(boolean premium) {
		this.premium = premium;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
}
