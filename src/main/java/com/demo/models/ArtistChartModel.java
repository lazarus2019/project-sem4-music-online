package com.demo.models;

public class ArtistChartModel {

	private int accountId;
	private String nickname;
	private int trackId;
	private int trackLike;
	private int albumId;
	private int albumLike;

	public ArtistChartModel() {
		super();
	}


	public ArtistChartModel(int accountId, String nickname, int trackId, int trackLike, int albumId, int albumLike) {
		super();
		this.accountId = accountId;
		this.nickname = nickname;
		this.trackId = trackId;
		this.trackLike = trackLike;
		this.albumId = albumId;
		this.albumLike = albumLike;
	}


	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getTrackId() {
		return trackId;
	}

	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}

	public int getTrackLike() {
		return trackLike;
	}

	public void setTrackLike(int trackLike) {
		this.trackLike = trackLike;
	}

	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public int getAlbumLike() {
		return albumLike;
	}

	public void setAlbumLike(int albumLike) {
		this.albumLike = albumLike;
	}

}
