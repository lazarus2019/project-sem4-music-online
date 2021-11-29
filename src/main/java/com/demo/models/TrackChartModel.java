package com.demo.models;

import java.util.List;

public class TrackChartModel {

	private int trackId;
	private String title;
	private int duration;
	private List<String> artistNicknames;

	public TrackChartModel() {
		super();
	}

	public TrackChartModel(int trackId, String title, int duration, List<String> artistNicknames) {
		super();
		this.trackId = trackId;
		this.title = title;
		this.duration = duration;
		this.artistNicknames = artistNicknames;
	}

	public int getTrackId() {
		return trackId;
	}

	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public List<String> getArtistNicknames() {
		return artistNicknames;
	}

	public void setArtistNicknames(List<String> artistNicknames) {
		this.artistNicknames = artistNicknames;
	}

}
