package com.demo.models;


public class ArtistDetail {

	private Integer id;
	private String nickname;
	private String image;
	private int follower;
	private String description;
	private String countryname;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCountryname() {
		return countryname;
	}
	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}
	public ArtistDetail(Integer id, String nickname, String image, int follower, String description,
			String countryname) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.image = image;
		this.follower = follower;
		this.description = description;
		this.countryname = countryname;
	}
	public ArtistDetail() {
		super();
	}
	
}
