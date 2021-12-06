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
 * Track generated by hbm2java
 */
@Entity
@Table(name = "track", catalog = "music_app")
public class Track implements java.io.Serializable {

	private Integer id;
	private Genres genres;
	private Status status;
	private String fileName;
	private String title;
	private String lyrics;
	private String thumbnail;
	private int likes;
	private int duration;
	private int listens;
	private int baseListens;
	private int weeklyListens;
	private boolean isPremium;
	private Date publishDate;
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<Playlist> playlists = new HashSet<Playlist>(0);
	private Set<ArtistTrack> artistTracks = new HashSet<ArtistTrack>(0);

	public Track() {
	}

	public Track(Genres genres, Status status, String fileName, String title, String lyrics, String thumbnail,
			int likes, int duration, int listens, int baseListens, int weeklyListens, boolean isPremium,
			Date publishDate) {
		this.genres = genres;
		this.status = status;
		this.fileName = fileName;
		this.title = title;
		this.lyrics = lyrics;
		this.thumbnail = thumbnail;
		this.likes = likes;
		this.duration = duration;
		this.listens = listens;
		this.baseListens = baseListens;
		this.weeklyListens = weeklyListens;
		this.isPremium = isPremium;
		this.publishDate = publishDate;
	}

	public Track(Genres genres, Status status, String fileName, String title, String lyrics, String thumbnail,
			int likes, int duration, int listens, int baseListens, int weeklyListens, boolean isPremium,
			Date publishDate, Set<Comment> comments, Set<Playlist> playlists, Set<ArtistTrack> artistTracks) {
		this.genres = genres;
		this.status = status;
		this.fileName = fileName;
		this.title = title;
		this.lyrics = lyrics;
		this.thumbnail = thumbnail;
		this.likes = likes;
		this.duration = duration;
		this.listens = listens;
		this.baseListens = baseListens;
		this.weeklyListens = weeklyListens;
		this.isPremium = isPremium;
		this.publishDate = publishDate;
		this.comments = comments;
		this.playlists = playlists;
		this.artistTracks = artistTracks;
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
	@JoinColumn(name = "genres_id", nullable = false)
	public Genres getGenres() {
		return this.genres;
	}

	public void setGenres(Genres genres) {
		this.genres = genres;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id", nullable = false)
	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Column(name = "file_name", nullable = false, length = 250)
	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "title", nullable = false, length = 250)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "lyrics", nullable = false, length = 65535)
	public String getLyrics() {
		return this.lyrics;
	}

	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}

	@Column(name = "thumbnail", nullable = false, length = 250)
	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Column(name = "likes", nullable = false)
	public int getLikes() {
		return this.likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	@Column(name = "duration", nullable = false)
	public int getDuration() {
		return this.duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Column(name = "listens", nullable = false)
	public int getListens() {
		return this.listens;
	}

	public void setListens(int listens) {
		this.listens = listens;
	}

	@Column(name = "base_listens", nullable = false)
	public int getBaseListens() {
		return this.baseListens;
	}

	public void setBaseListens(int baseListens) {
		this.baseListens = baseListens;
	}

	@Column(name = "weekly_listens", nullable = false)
	public int getWeeklyListens() {
		return this.weeklyListens;
	}

	public void setWeeklyListens(int weeklyListens) {
		this.weeklyListens = weeklyListens;
	}

	@Column(name = "is_premium", nullable = false)
	public boolean isIsPremium() {
		return this.isPremium;
	}

	public void setIsPremium(boolean isPremium) {
		this.isPremium = isPremium;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "publish_date", nullable = false, length = 10)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "track")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "playlist_track", catalog = "music_app", joinColumns = {
			@JoinColumn(name = "track_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "playlist_id", nullable = false, updatable = false) })
	public Set<Playlist> getPlaylists() {
		return this.playlists;
	}

	public void setPlaylists(Set<Playlist> playlists) {
		this.playlists = playlists;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "track")
	public Set<ArtistTrack> getArtistTracks() {
		return this.artistTracks;
	}

	public void setArtistTracks(Set<ArtistTrack> artistTracks) {
		this.artistTracks = artistTracks;
	}

}
