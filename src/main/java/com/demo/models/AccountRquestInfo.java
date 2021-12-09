package com.demo.models;

import com.demo.entities.Account;

public class AccountRquestInfo {
	
	private Integer id;
	private String nickname;
	private String image ; 
	private String country;
	private String email;
	private String description;
	public AccountRquestInfo() {
		super();
	}
	public AccountRquestInfo(Account account) {
		super();
		this.id = account.getId();
		this.nickname = account.getNickname();
		this.image = account.getImage() ;
		this.country = account.getCountry().getCountryName();
		this.email = account.getEmail();
		this.description = account.getDescription();
	}
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
