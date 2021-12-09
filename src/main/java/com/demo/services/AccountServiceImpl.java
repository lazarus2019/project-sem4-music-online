package com.demo.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;

import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.Playlist;
import com.demo.entities.Role;
import com.demo.entities.Track;
import com.demo.helpers.SendMailHelper;
import com.demo.models.ArtistChartModel;
import com.demo.models.ArtistDetail;
import com.demo.models.ArtistInfo;
import com.demo.models.ArtistsInfor;
import com.demo.repositories.AccountRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	
	@Autowired
    public JavaMailSender emailSender;

	@Override
	public List<Account> getAllPopularArtists(int n) {
		return accountRepository.getAllPopularArtists(n);
	}

	@Override
	public List<ArtistInfo> getPopularArtists(Pageable pageable) {
		return accountRepository.getPopularArtists(pageable);
	}

	@Override
	public List<ArtistInfo> getArtistWithoutId(int id) {
		return accountRepository.getArtistsWithoutId(id);
	}

	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Account findById(int id) {
		return accountRepository.findById(id).get();
	}

	@Override
	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username);
	}

	@Override
	public Account findByEmail(String email) {
		return accountRepository.findByEmail(email);
	}

	@Override
	public void registerNewSignInAfterFacebookLoginSuccess(String email, String name,
			AuthenticationProvider authProvider) {
		Account account = new Account();
		// account.setNickname(name);

		int space = name.indexOf("\s");
		String lastname = name.substring(0, space);
		String firstname = name.substring(space);
		System.out.println("Last : " + lastname);
		System.out.println("First : " + firstname);
		account.setNickname(name);
		account.setLastname(lastname);
		account.setFirstname(firstname);

		account.setEmail(email);
		account.setJoinDate(new Date());
		account.setIsActive(true);
		account.setIsArtist(false);
		// account.setBirthday(new Date());
		// account.setPassword(new BCryptPasswordEncoder().encode("123"));

		Role role = new Role();
		role.setId(1);
		account.getRoles().add(role);

		account.setFollower(0);
		account.setAuthProvider(authProvider);
		accountRepository.save(account);

	}

	@Override
	public void updateNewSignInAfterFacebookLoginSuccess(Account account, String name,
			AuthenticationProvider authProvider) {

		int space = name.indexOf("\s");
		String lastname = name.substring(0, space);
		String firstname = name.substring(space);
		account.setNickname(name);
		account.setLastname(lastname);
		account.setFirstname(firstname);

		account.setAuthProvider(authProvider);

		accountRepository.save(account);

	}

	@Override
	public void registerNewSignUp(Account account, AuthenticationProvider authProvider) {
		account.setUsername(account.getEmail());
		account.setJoinDate(new Date());
		account.setIsActive(true);
		account.setIsArtist(false);
		account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));

		Role role = new Role();
		role.setId(1);
		account.getRoles().add(role);
		int i = ThreadLocalRandom.current().nextInt(100000, 1000000) ; 
		System.out.println(i);
		account.setEmailCode(String.valueOf(i));
		account.setFollower(0);
		account.setIsActive(false);
		
		account.setAuthProvider(authProvider);
		SendMailHelper mailHelper = new SendMailHelper() ;
		String emailContent = "<h3>Confirm your email address</h3> <br> Dear "  ;
		emailContent += "To finish signing up for your Muzik account, we are send you a code to confirm your email address. </br>";
		emailContent += "Your code here : <b><i>" + account.getEmailCode() + "</b></i>"; 
		
		String subject = " Activate your Muzik account" ; 
		
		try {
			mailHelper.sendSimpleEmail(account.getEmail(), subject, emailContent , emailSender);
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
		}
		accountRepository.save(account);

	}

	@Override
	public void updateAccountFromSetting(Account account) {
		accountRepository.save(account);

	}
	
	@Override
	public List<ArtistsInfor> getallArtists() {
		return accountRepository.getallArtists();
	}

	@Override
	public List<ArtistInfo> searchByKeyword(String keyword, Pageable pageable) {
		return accountRepository.searchByKeyword(keyword, pageable);
	}

	@Override
	public boolean sendRequestArtist(Account account) {
		account.setIsRequest(true);
		return accountRepository.save(account) != null; 
	}

	@Override
	public boolean updateImageAccount(Account account) {
		return accountRepository.save(account) != null;
	}

	@Override
	public boolean acceptOrRejectArtist(Account account) {
		return accountRepository.save(account) != null;
	}

	@Override
	public void forgotPassword(Account account) {		

		int i = ThreadLocalRandom.current().nextInt(100000, 1000000) ; 
		account.setPassword(new BCryptPasswordEncoder().encode(String.valueOf(i)));
		SendMailHelper mailHelper = new SendMailHelper() ;
		String emailContent = "<h3>Confirm your email address</h3> <br> "  ;
		emailContent += "Dear " + account.getNickname() + " <br> We are send you a new your password. <br>";
		emailContent += "Your password here : <b><i>" + i + "</b></i>"; 
		
		String subject = " Reset your Muzik account" ; 
		
		try {
			mailHelper.sendSimpleEmail(account.getEmail(), subject, emailContent , emailSender);
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
		}
		
		accountRepository.save(account);
		
	}

	public List<ArtistsInfor> getSearchArtis(String keyword) {
		return accountRepository.getSearchArtis(keyword);
	}

	@Override
	public long countArtist() {
		return accountRepository.countArtist();
	}

	@Override
	public long countUser() {
		return accountRepository.count();
	}

	@Override
	public List<ArtistChartModel> getAccountChart() {
		List<ArtistChartModel> artistChartModels = new ArrayList<ArtistChartModel>();
		//get 10 best artist
		for (Account account : getAllPopularArtists(10)) {
			ArtistChartModel artistChartModel = new ArtistChartModel();
			artistChartModel.setAccountId(account.getId());
			artistChartModel.setNickname(account.getNickname());
			int trackLike = 0;
			for (Track track: account.findTrackThroughAtristTrack()) {
				trackLike += track.getLikes();
			}
			artistChartModel.setTrackLike(trackLike);
			int albumLike = 0;
			for (Playlist playlist: account.findPlaylistThroughAccountPlaylist()) {
				albumLike += playlist.getLikes();
			}
			artistChartModel.setAlbumLike(albumLike);
		}
		return null;
	}
	
	@Override
	public ArtistDetail getArtistByIdAccount(int id) {
		return accountRepository.getArtistByIdAccount(id);
		
	}
	
	@Override
	public Account addNewAdmin(Account account , String image) {
		account.setUsername(account.getEmail()); 
		account.setJoinDate(new Date());
		account.setIsActive(true);
		account.setIsArtist(true);

		Role role = new Role();
		role.setId(2);
		account.getRoles().add(role);
		account.setImage(image);
		account.setFollower(0);
		account.setAuthProvider(AuthenticationProvider.LOCAL);
		SendMailHelper mailHelper = new SendMailHelper() ;
		String emailContent = "<h3>Congratulaion, you are an admin from now</h3> <br> Dear " + account.getNickname()  ;
		emailContent += ".  We send you your account password. Use your email and password to login <br>";
		emailContent += "Your password here : <b><i>" + account.getPassword() + "</b></i>"; 
		
		account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
		String subject = " Announcement about becoming the admin of the website Muzik" ; 
		
		try {
			mailHelper.sendSimpleEmail(account.getEmail(), subject, emailContent , emailSender);
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
		}
		
		
		return accountRepository.save(account);
	}

	@Override
	public Account save(Account account) {
		return accountRepository.save(account);
	}
}

