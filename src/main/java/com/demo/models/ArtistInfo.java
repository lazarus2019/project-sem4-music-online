package com.demo.models;

public class ArtistInfo {
	private int id;
	private String nickname;
	private String image;
	private int follow;

	public ArtistInfo() {
		super();
	}

	public ArtistInfo(int id, String nickname, String image, int follow) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.image = image;
		this.follow = follow;
	}

	public ArtistInfo(int id, String nickname, String image) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getFollow() {
		return follow;
	}

	public void setFollow(int follow) {
		this.follow = follow;
	}

}
