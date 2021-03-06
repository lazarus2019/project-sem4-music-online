package com.demo.entities;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * AccountPlaylistId generated by hbm2java
 */
@Embeddable
public class AccountPlaylistId implements java.io.Serializable {

	private int playlistId;
	private int accountId;

	public AccountPlaylistId() {
	}

	public AccountPlaylistId(int playlistId, int accountId) {
		this.playlistId = playlistId;
		this.accountId = accountId;
	}

	@Column(name = "playlist_id", nullable = false)
	public int getPlaylistId() {
		return this.playlistId;
	}

	public void setPlaylistId(int playlistId) {
		this.playlistId = playlistId;
	}

	@Column(name = "account_id", nullable = false)
	public int getAccountId() {
		return this.accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AccountPlaylistId))
			return false;
		AccountPlaylistId castOther = (AccountPlaylistId) other;

		return (this.getPlaylistId() == castOther.getPlaylistId()) && (this.getAccountId() == castOther.getAccountId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getPlaylistId();
		result = 37 * result + this.getAccountId();
		return result;
	}

}
