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
 * AccountPlaylist generated by hbm2java
 */
@Entity
@Table(name = "account_playlist", catalog = "music_app")
public class AccountPlaylist implements java.io.Serializable {

	private AccountPlaylistId id;
	private Account account;
	private Playlist playlist;
	private boolean isOwn;

	public AccountPlaylist() {
	}

	public AccountPlaylist(AccountPlaylistId id, Account account, Playlist playlist, boolean isOwn) {
		this.id = id;
		this.account = account;
		this.playlist = playlist;
		this.isOwn = isOwn;
	}

	@EmbeddedId

	@AttributeOverrides({
			@AttributeOverride(name = "playlistId", column = @Column(name = "playlist_id", nullable = false)),
			@AttributeOverride(name = "accountId", column = @Column(name = "account_id", nullable = false)) })
	public AccountPlaylistId getId() {
		return this.id;
	}

	public void setId(AccountPlaylistId id) {
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
	@JoinColumn(name = "playlist_id", nullable = false, insertable = false, updatable = false)
	public Playlist getPlaylist() {
		return this.playlist;
	}

	public void setPlaylist(Playlist playlist) {
		this.playlist = playlist;
	}

	@Column(name = "is_own", nullable = false)
	public boolean isIsOwn() {
		return this.isOwn;
	}

	public void setIsOwn(boolean isOwn) {
		this.isOwn = isOwn;
	}

}
