package com.demo.entities;

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
	private String title;
	private String thumbnail;
	private Date publishDate;
	private Date lastUpdated;
	private String description;
	private boolean status;
	private Set<PlaylistTrack> playlistTracks = new HashSet<PlaylistTrack>(0);
	private Set<AccountPlaylist> accountPlaylists = new HashSet<AccountPlaylist>(0);

	public Playlist() {
	}

	public Playlist(PlaylistCategory playlistCategory, String title, String thumbnail, Date publishDate,
			Date lastUpdated, String description, boolean status) {
		this.playlistCategory = playlistCategory;
		this.title = title;
		this.thumbnail = thumbnail;
		this.publishDate = publishDate;
		this.lastUpdated = lastUpdated;
		this.description = description;
		this.status = status;
	}

	public Playlist(PlaylistCategory playlistCategory, String title, String thumbnail, Date publishDate,
			Date lastUpdated, String description, boolean status, Set<PlaylistTrack> playlistTracks,
			Set<AccountPlaylist> accountPlaylists) {
		this.playlistCategory = playlistCategory;
		this.title = title;
		this.thumbnail = thumbnail;
		this.publishDate = publishDate;
		this.lastUpdated = lastUpdated;
		this.description = description;
		this.status = status;
		this.playlistTracks = playlistTracks;
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

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "playlist")
	public Set<PlaylistTrack> getPlaylistTracks() {
		return this.playlistTracks;
	}

	public void setPlaylistTracks(Set<PlaylistTrack> playlistTracks) {
		this.playlistTracks = playlistTracks;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "playlist")
	public Set<AccountPlaylist> getAccountPlaylists() {
		return this.accountPlaylists;
	}

	public void setAccountPlaylists(Set<AccountPlaylist> accountPlaylists) {
		this.accountPlaylists = accountPlaylists;
	}
}
