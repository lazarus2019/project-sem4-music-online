package com.demo.models;

public class PackageChartModel {

	private int packageId;
	private String name;
	private double price;
	private long average;
	private int amount;
	private String month;

	public PackageChartModel() {
		super();
	}

	public PackageChartModel(int packageId, String name, double price, long average, int amount, String month) {
		super();
		this.packageId = packageId;
		this.name = name;
		this.price = price;
		this.average = average;
		this.amount = amount;
		this.month = month;
	}

	public int getPackageId() {
		return packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
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

	public long getAverage() {
		return average;
	}

	public void setAverage(long average) {
		this.average = average;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}