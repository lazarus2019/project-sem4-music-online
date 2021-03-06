package com.demo.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;

import com.demo.entities.AuthenticationProvider;

/**
 * Account generated by hbm2java
 */
@Entity
@Table(name = "account", catalog = "music_app", uniqueConstraints = { @UniqueConstraint(columnNames = "email"),
		@UniqueConstraint(columnNames = "username") })
public class Account implements java.io.Serializable {

	private Integer id;
	private Country country;
	private String username;
	private String password;
	private String nickname;
	private String firstname;
	private String lastname;
	private String email;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthday;
	private String gender;
	private String image;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date joinDate;
	private boolean isArtist;
	private int follower;
	private String description;
	private boolean isActive;
	private boolean isRequest;
	private String emailCode;

	@Enumerated(EnumType.STRING)
	private AuthenticationProvider authProvider;

	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<PackageInfo> packageInfos = new HashSet<PackageInfo>(0);
	private Set<Notification> notifications = new HashSet<Notification>(0);
	private Set<AccountPlaylist> accountPlaylists = new HashSet<AccountPlaylist>(0);
	private Set<Role> roles = new HashSet<Role>(0);
	private Set<ArtistTrack> artistTracks = new HashSet<ArtistTrack>(0);

	public Account() {
	}

	public Account(String email, Date joinDate, boolean isArtist, int follower, boolean isActive, boolean isRequest) {
		this.email = email;
		this.joinDate = joinDate;
		this.isArtist = isArtist;
		this.follower = follower;
		this.isActive = isActive;
		this.isRequest = isRequest;
	}

	public Account(Country country, String username, String password, String nickname, String firstname,
			String lastname, String email, Date birthday, String gender, String image, Date joinDate, boolean isArtist,
			int follower, String description, boolean isActive, boolean isRequest, Set<Comment> comments,
			Set<PackageInfo> packageInfos, Set<Notification> notifications, Set<AccountPlaylist> accountPlaylists,
			Set<Role> roles, Set<ArtistTrack> artistTracks) {
		this.country = country;
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.birthday = birthday;
		this.gender = gender;
		this.image = image;
		this.joinDate = joinDate;
		this.isArtist = isArtist;
		this.follower = follower;
		this.description = description;
		this.isActive = isActive;
		this.isRequest = isRequest;
		this.comments = comments;
		this.packageInfos = packageInfos;
		this.notifications = notifications;
		this.accountPlaylists = accountPlaylists;
		this.roles = roles;
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
	@JoinColumn(name = "country_id")
	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	@Column(name = "username", unique = true, length = 250)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 250)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "nickname", length = 250)
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "firstname", length = 250)
	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	@Column(name = "lastname", length = 250)
	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	@Column(name = "email", unique = true, nullable = false, length = 250)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", length = 10)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "gender", length = 250)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "image", length = 250)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "join_date", nullable = false, length = 10)
	public Date getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Column(name = "is_artist", nullable = false)
	public boolean isIsArtist() {
		return this.isArtist;
	}

	public void setIsArtist(boolean isArtist) {
		this.isArtist = isArtist;
	}

	@Column(name = "follower", nullable = false)
	public int getFollower() {
		return this.follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "is_active", nullable = false)
	public boolean isIsActive() {
		return this.isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

	@Column(name = "is_request", nullable = false)
	public boolean isIsRequest() {
		return this.isRequest;
	}

	public void setIsRequest(boolean isRequest) {
		this.isRequest = isRequest;
	}

	@Column(name = "auth_provider", nullable = false, length = 25)
	public AuthenticationProvider getAuthProvider() {
		return authProvider;
	}

	public void setAuthProvider(AuthenticationProvider authProvider) {
		this.authProvider = authProvider;
	}

	@Column(name = "email_code", length = 10)
	public String getEmailCode() {
		return this.emailCode;
	}

	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<PackageInfo> getPackageInfos() {
		return this.packageInfos;
	}

	public void setPackageInfos(Set<PackageInfo> packageInfos) {
		this.packageInfos = packageInfos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Notification> getNotifications() {
		return this.notifications;
	}

	public void setNotifications(Set<Notification> notifications) {
		this.notifications = notifications;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<AccountPlaylist> getAccountPlaylists() {
		return this.accountPlaylists;
	}

	public void setAccountPlaylists(Set<AccountPlaylist> accountPlaylists) {
		this.accountPlaylists = accountPlaylists;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "account_role", catalog = "music_app", joinColumns = {
			@JoinColumn(name = "account_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "role_id", nullable = false, updatable = false) })
	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<ArtistTrack> getArtistTracks() {
		return this.artistTracks;
	}

	public void setArtistTracks(Set<ArtistTrack> artistTracks) {
		this.artistTracks = artistTracks;
	}


	@Override
	public String toString() {
		return "Account [id=" + id + ", country=" + country + ", username=" + username + ", password=" + password
				+ ", nickname=" + nickname + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", birthday=" + birthday + ", gender=" + gender + ", image=" + image + ", joinDate=" + joinDate
				+ ", isArtist=" + isArtist + ", follower=" + follower + ", description=" + description + ", isActive="
				+ isActive + ", isRequest=" + isRequest + ", authProvider=" + authProvider + ", comments=" + comments
				+ ", packageInfos=" + packageInfos + ", notifications=" + notifications + ", accountPlaylists="
				+ accountPlaylists + ", roles=" + roles + ", artistTracks=" + artistTracks + ", accountSettings="
				+ "]";
	}
	
	public Set<Track> findTrackThroughAtristTrack() {
		Set<Track> tracks = new HashSet<Track>(0) ; 
		for(ArtistTrack artistTrack: artistTracks) {
			tracks.add(artistTrack.getTrack()) ; 
		}
		return tracks ;
	}
	
	public Set<Playlist> findPlaylistThroughAccountPlaylist() {
		Set<Playlist> playlists = new HashSet<Playlist>(0) ; 
		for(AccountPlaylist accountPlaylist : accountPlaylists) {
			playlists.add(accountPlaylist.getPlaylist()) ; 
		}
		return playlists ;
	}

}