package com.demo.models;

public class PackageModel {
	private Integer id;
	private String name;
	private double price;
	private int duration;
	private boolean status;
	private String description;
	private boolean isDelete;
	private int amountAccount;

	public PackageModel() {
		super();
	}

	public PackageModel(Integer id, String name, double price, int duration, boolean status, String description,
			boolean isDelete, int amountAccount) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.duration = duration;
		this.status = status;
		this.description = description;
		this.isDelete = isDelete;
		this.amountAccount = amountAccount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public int getAmountAccount() {
		return amountAccount;
	}

	public void setAmountAccount(int amountAccount) {
		this.amountAccount = amountAccount;
	}

}
