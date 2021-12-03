package com.demo.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AlbumInfo {
	private Integer id;
	private String title;
	private String description;
	private String thumbnail;
	private int statusId;
	private Date publishDate;
	private int artistId;
	private String artistNickName;
	private List<TrackInfo> trackInfos = new ArrayList<TrackInfo>();
	
	public AlbumInfo(Integer id, String title, String description, String thumbnail, int statusId, Date publishDate) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.thumbnail = thumbnail;
		this.statusId = statusId;
		this.publishDate = publishDate;
	}



	public AlbumInfo(Integer id, String title, String thumbnail, int artistId, String artistNickName) {
		super();
		this.id = id;
		this.title = title;
		this.thumbnail = thumbnail;
		this.artistId = artistId;
		this.artistNickName = artistNickName;
	}


	public AlbumInfo(Integer id, String title, String thumbnail) {
		super();
		this.id = id;
		this.title = title;
		this.thumbnail = thumbnail;
	}


	public AlbumInfo(Integer id, String title, String description, String thumbnail, int statusId, Date publishDate,
			int artistId, String artistNickName) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.thumbnail = thumbnail;
		this.statusId = statusId;
		this.publishDate = publishDate;
		this.artistId = artistId;
		this.artistNickName = artistNickName;
	}


	public AlbumInfo() {
		super();
	}





	
		public Integer getId() {
			return id;
		}


		public void setId(Integer id) {
			this.id = id;
		}


		public String getTitle() {
			return title;
		}


		public void setTitle(String title) {
			this.title = title;
		}


		public String getDescription() {
			return description;
		}


		public void setDescription(String description) {
			this.description = description;
		}


		public String getThumbnail() {
			return thumbnail;
		}


		public void setThumbnail(String thumbnail) {
			this.thumbnail = thumbnail;
		}


		public int getStatusId() {
			return statusId;
		}


		public void setStatusId(int statusId) {
			this.statusId = statusId;
		}


		public Date getPublishDate() {
			return publishDate;
		}


		public void setPublishDate(Date publishDate) {
			this.publishDate = publishDate;
		}


		public int getArtistId() {
			return artistId;
		}


		public void setArtistId(int artistId) {
			this.artistId = artistId;
		}


		public String getArtistNickName() {
			return artistNickName;
		}


		public void setArtistNickName(String artistNickName) {
			this.artistNickName = artistNickName;
		}


		public List<TrackInfo> getTrackInfos() {
			return trackInfos;
		}



		public void setTrackInfos(List<TrackInfo> trackInfos) {
			this.trackInfos = trackInfos;
		}

}


	