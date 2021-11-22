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
 * Banner generated by hbm2java
 */
@Entity
@Table(name = "banner", catalog = "music_app")
public class Banner implements java.io.Serializable {

	private Integer id;
	private String name;
	private Set<Setting> settings = new HashSet<Setting>(0); 

	public Banner() {
	}

	public Banner(String name) {
		this.name = name;
	}

	public Banner(String name, Set<Setting> settings) {
		this.name = name;
		this.settings = settings;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "banner")
	public Set<Setting> getSettings() {
		return this.settings;
	}

	public void setSettings(Set<Setting> settings) {
		this.settings = settings;
	}

}
