package com.demo.models;

import java.util.Date;

public class PackageChartModel {

	private int packageId;
	private int accountId;
	private Date purchaseDate;
	private Date expirationDate;
	private int amount;
	private long average;

	public PackageChartModel() {
		super();
	}

	public PackageChartModel(int packageId, int accountId, Date purchaseDate, Date expirationDate, int amount,
			long average) {
		super();
		this.packageId = packageId;
		this.accountId = accountId;
		this.purchaseDate = purchaseDate;
		this.expirationDate = expirationDate;
		this.amount = amount;
		this.average = average;
	}

	public int getPackageId() {
		return packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public long getAverage() {
		return average;
	}

	public void setAverage(long average) {
		this.average = average;
	}

}
