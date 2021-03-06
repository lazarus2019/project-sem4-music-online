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
 * Status generated by hbm2java
 */
@Entity
@Table(name = "status", catalog = "music_app")
public class Status implements java.io.Serializable {

	private Integer id;
	private String name;
	private Set<Playlist> playlists = new HashSet<Playlist>(0);
	private Set<Track> tracks = new HashSet<Track>(0);

	public Status() {
	}

	public Status(String name) {
		this.name = name;
	}

	public Status(String name, Set<Playlist> playlists, Set<Track> tracks) {
		this.name = name;
		this.playlists = playlists;
		this.tracks = tracks;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "status")
	public Set<Playlist> getPlaylists() {
		return this.playlists;
	}

	public void setPlaylists(Set<Playlist> playlists) {
		this.playlists = playlists;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "status")
	public Set<Track> getTracks() {
		return this.tracks;
	}

	public void setTracks(Set<Track> tracks) {
		this.tracks = tracks;
	}

}
