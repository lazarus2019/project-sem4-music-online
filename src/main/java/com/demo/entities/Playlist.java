package com.demo.entities;
// Generated Dec 6, 2021, 9:25:23 AM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Playlist generated by hbm2java
 */
@Entity
@Table(name = "playlist", catalog = "music_app")
public class Playlist implements java.io.Serializable {

	private Integer id;
	private PlaylistCategory playlistCategory;
	private Status status;
	private String title;
	private String thumbnail;
	private Date publishDate;
	private Date lastUpdated;
	private String description;
	private int likes;
	private Set<Track> tracks = new HashSet<Track>(0);
	private Set<AccountPlaylist> accountPlaylists = new HashSet<AccountPlaylist>(0);

	public Playlist() {
	}

	public Playlist(PlaylistCategory playlistCategory, Status status, String title, String thumbnail, Date publishDate,
			Date lastUpdated, String description, int likes) {
		this.playlistCategory = playlistCategory;
		this.status = status;
		this.title = title;
		this.thumbnail = thumbnail;
		this.publishDate = publishDate;
		this.lastUpdated = lastUpdated;
		this.description = description;
		this.likes = likes;
	}

	public Playlist(PlaylistCategory playlistCategory, Status status, String title, String thumbnail, Date publishDate,
			Date lastUpdated, String description, int likes, Set<Track> tracks, Set<AccountPlaylist> accountPlaylists) {
		this.playlistCategory = playlistCategory;
		this.status = status;
		this.title = title;
		this.thumbnail = thumbnail;
		this.publishDate = publishDate;
		this.lastUpdated = lastUpdated;
		this.description = description;
		this.likes = likes;
		this.tracks = tracks;
		this.accountPlaylists = accountPlaylists;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public PlaylistCategory getPlaylistCategory() {
		return this.playlistCategory;
	}

	public void setPlaylistCategory(PlaylistCategory playlistCategory) {
		this.playlistCategory = playlistCategory;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id", nullable = false)
	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Column(name = "title", nullable = false, length = 250)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "thumbnail", nullable = false, length = 250)
	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "publish_date", nullable = false, length = 10)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "last_updated", nullable = false, length = 10)
	public Date getLastUpdated() {
		return this.lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	@Column(name = "description", nullable = false, length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "likes", nullable = false)
	public int getLikes() {
		return this.likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "playlist_track", catalog = "music_app", joinColumns = {
			@JoinColumn(name = "playlist_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "track_id", nullable = false, updatable = false) })
	public Set<Track> getTracks() {
		return this.tracks;
	}

	public void setTracks(Set<Track> tracks) {
		this.tracks = tracks;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "playlist")
	public Set<AccountPlaylist> getAccountPlaylists() {
		return this.accountPlaylists;
	}

	public void setAccountPlaylists(Set<AccountPlaylist> accountPlaylists) {
		this.accountPlaylists = accountPlaylists;
	}

}
