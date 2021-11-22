package com.demo.entities;
// Generated Nov 21, 2021, 7:14:54 AM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PackageInfo generated by hbm2java
 */
@Entity
@Table(name = "package_info", catalog = "music_app")
public class PackageInfo implements java.io.Serializable {

	private Integer id;
	private Account account;
	private ServicePackage servicePackage;
	private Date expirationDate;

	public PackageInfo() {
	}

	public PackageInfo(Account account, ServicePackage servicePackage, Date expirationDate) {
		this.account = account;
		this.servicePackage = servicePackage;
		this.expirationDate = expirationDate;
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
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "package_id", nullable = false)
	public ServicePackage getServicePackage() {
		return this.servicePackage;
	}

	public void setServicePackage(ServicePackage servicePackage) {
		this.servicePackage = servicePackage;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "expiration_date", nullable = false, length = 10)
	public Date getExpirationDate() {
		return this.expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

}
