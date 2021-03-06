package com.demo.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PlaylistCategory generated by hbm2java
 */
@Entity
@Table(name = "playlist_category")
public class PlaylistCategory implements java.io.Serializable {

	private Integer id;
	private String name;
	private Set<Playlist> playlists = new HashSet<Playlist>(0);

	public PlaylistCategory() {
	}

	public PlaylistCategory(String name) {
		this.name = name;
	}

	public PlaylistCategory(String name, Set<Playlist> playlists) {
		this.name = name;
		this.playlists = playlists;
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

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "playlistCategory")
	public Set<Playlist> getPlaylists() {
		return this.playlists;
	}

	public void setPlaylists(Set<Playlist> playlists) {
		this.playlists = playlists;
	}

}
