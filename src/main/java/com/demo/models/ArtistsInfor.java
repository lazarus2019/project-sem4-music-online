package com.demo.models;


public class ArtistsInfor {

	private Integer id;
	private String nickname;
	private String image;
	private int follower;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	public ArtistsInfor(Integer id, String nickname, String image, int follower) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.image = image;
		this.follower = follower;
	}
	public ArtistsInfor() {
		super();
	}
	
	
	
}
