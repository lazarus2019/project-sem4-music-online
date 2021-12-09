package com.demo.models;

import java.util.Date;

public class PackageInfoModel {
	private int package_id;
	private int account_id;
	private String account_nickname;
	private Date purchase_date;
	private Date expiration_date;
	private double price;

	public PackageInfoModel() {
		super();
	}

	public PackageInfoModel(int package_id, int account_id, String account_nickname, Date purchase_date,
			Date expiration_date, double price) {
		super();
		this.package_id = package_id;
		this.account_id = account_id;
		this.account_nickname = account_nickname;
		this.purchase_date = purchase_date;
		this.expiration_date = expiration_date;
		this.price = price;
	}

	public int getPackage_id() {
		return package_id;
	}

	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public String getAccount_nickname() {
		return account_nickname;
	}

	public void setAccount_nickname(String account_nickname) {
		this.account_nickname = account_nickname;
	}

	public Date getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}

	public Date getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
