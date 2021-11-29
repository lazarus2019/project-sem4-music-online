package com.demo.entities;
// Generated Nov 21, 2021, 7:14:54 AM by Hibernate Tools 5.1.10.Final

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
 * Setting generated by hbm2java
 */
@Entity
@Table(name = "setting", catalog = "music_app")
public class Setting implements java.io.Serializable {

	private Integer id;
	private int showTopChart;
	private Set<Banner> banners = new HashSet<Banner>(0);

	public Setting() {
	}

	public Setting(int showTopChart) {
		this.showTopChart = showTopChart;
	}

	public Setting(int showTopChart, Set<Banner> banners) {
		this.showTopChart = showTopChart;
		this.banners = banners;
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

	@Column(name = "show_top_chart", nullable = false)
	public int getShowTopChart() {
		return this.showTopChart;
	}

	public void setShowTopChart(int showTopChart) {
		this.showTopChart = showTopChart;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "setting")
	public Set<Banner> getBanners() {
		return this.banners;
	}

	public void setBanners(Set<Banner> banners) {
		this.banners = banners;
	}

}
