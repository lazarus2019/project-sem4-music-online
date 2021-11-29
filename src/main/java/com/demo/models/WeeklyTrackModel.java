package com.demo.models;

public class WeeklyTrackModel {

	private int trackId;
	private double countTop;

	public WeeklyTrackModel() {
		super();
	}

	public WeeklyTrackModel(int trackId, int countTop) {
		super();
		this.trackId = trackId;
		this.countTop = countTop;
	}

	public int getTrackId() {
		return trackId;
	}

	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}

	public double getCountTop() {
		return countTop;
	}

	public void setCountTop(double countTop) {
		this.countTop = countTop;
	}

}
