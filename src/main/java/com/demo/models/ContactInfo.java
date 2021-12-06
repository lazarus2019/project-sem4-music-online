package com.demo.models;

public class ContactInfo {
	private Integer id;
	private String fullname;
	private String email;
	private String phoneNumber;
	private String content;
	private int contactTypeId;
	private String contactTypeName;

	public ContactInfo() {
		super();
	}

	public ContactInfo(Integer id, String fullname, String email, String phoneNumber, String content, int contactTypeId,
			String contactTypeName) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.content = content;
		this.contactTypeId = contactTypeId;
		this.contactTypeName = contactTypeName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getContactTypeId() {
		return contactTypeId;
	}

	public void setContactTypeId(int contactTypeId) {
		this.contactTypeId = contactTypeId;
	}

	public String getContactTypeName() {
		return contactTypeName;
	}

	public void setContactTypeName(String contactTypeName) {
		this.contactTypeName = contactTypeName;
	}

}
