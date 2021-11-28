package com.demo.entities;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ArtistTrack generated by hbm2java
 */
@Entity
@Table(name = "artist_track", catalog = "music_app")
public class ArtistTrack implements java.io.Serializable {

	private ArtistTrackId id;
	private Account account;
	private Track track;
	private boolean isOwn;

	public ArtistTrack() {
	}

	public ArtistTrack(ArtistTrackId id, Account account, Track track, boolean isOwn) {
		this.id = id;
		this.account = account;
		this.track = track;
		this.isOwn = isOwn;
	}

	@EmbeddedId

	@AttributeOverrides({
			@AttributeOverride(name = "accountId", column = @Column(name = "account_id", nullable = false)),
			@AttributeOverride(name = "trackId", column = @Column(name = "track_id", nullable = false)) })
	public ArtistTrackId getId() {
		return this.id;
	}

	public void setId(ArtistTrackId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "account_id", nullable = false, insertable = false, updatable = false)
	public Account getAccount() {
		return this.account;
	}
	
	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "track_id", nullable = false, insertable = false, updatable = false)
	public Track getTrack() {
		return this.track;
	}

	public void setTrack(Track track) {
		this.track = track;
	}

	@Column(name = "is_own", nullable = false)
	public boolean isIsOwn() {
		return this.isOwn;
	}

	public void setIsOwn(boolean isOwn) {
		this.isOwn = isOwn;
	}

}
