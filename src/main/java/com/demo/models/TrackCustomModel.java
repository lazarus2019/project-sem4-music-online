package com.demo.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.demo.entities.Account;
import com.demo.entities.ArtistTrack;
import com.demo.entities.Genres;
import com.demo.entities.Status;
import com.demo.entities.Track;

import javassist.expr.NewArray;

public class TrackCustomModel {

	private Integer id;
	private String fileName;
	private String title;
	private String thumbnail;
	private int duration;
	private List<String> artists = new ArrayList<String>();
	private int artistLength;
	
	
	
	
	public TrackCustomModel() {
		super();
	}
	public TrackCustomModel(Track track) {
		super();
		this.id = track.getId();
		this.fileName = track.getFileName();
		this.title = track.getTitle();
		this.thumbnail = track.getThumbnail();
		this.duration = track.getDuration();
		List<String> artists = new ArrayList<String>() ;
		for(ArtistTrack artistTrack : track.getArtistTracks()) {
			if(artistTrack.isIsOwn()) {
				artists.add(artistTrack.getAccount().getNickname()) ; 
			}
		}
		for(ArtistTrack artistTrack : track.getArtistTracks()) {
			if(!artistTrack.isIsOwn()) {
				artists.add(artistTrack.getAccount().getNickname()) ; 
			}
		}
		//System.out.println(artists.size());
		this.artists = artists;
		this.artistLength = artists.size() ;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public List<String> getArtists() {
		return artists;
	}
	public void setArtists(List<String> artists) {
		this.artists = artists;
	}
	public int getArtistLength() {
		return artistLength;
	}
	public void setArtistLength(int artistLength) {
		this.artistLength = artistLength;
	}
	
	
}