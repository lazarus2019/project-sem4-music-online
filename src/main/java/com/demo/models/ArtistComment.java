package com.demo.models;

public class ArtistComment {
	private int id;
	private String nickname;
	private String image;

	public ArtistComment() {
		super();
	}

	public ArtistComment(int id, String nickname, String image) {
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



}
