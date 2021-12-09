package com.demo.models;

import java.util.Date;

import com.demo.entities.Comment;

public class CommentModel {

	
	private int trackId;
	private int accountId;
	private String accountName;
	private String accountImage;
	private String message;
	private Date date;
	
	
	public String getAccountName() {
		return accountName;
	}


	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}


	public String getAccountImage() {
		return accountImage;
	}


	public void setAccountImage(String accountImage) {
		this.accountImage = accountImage;
	}


	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}



	
	
	
	public int getTrackId() {
		return trackId;
	}


	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}



	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public CommentModel() {
		super();
	}


	public CommentModel(Comment comment) {
		super();
		this.trackId = comment.getTrack().getId();
		this.accountId = comment.getAccount().getId() ; 
		this.accountName = comment.getAccount().getNickname() ; 
		this.accountImage = comment.getAccount().getImage() ; 
		this.message = comment.getMessage();
		this.date = comment.getDate();
	}
	
	
}
