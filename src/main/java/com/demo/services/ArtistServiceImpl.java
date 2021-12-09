package com.demo.services;

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
import com.demo.entities.Role;
import com.demo.helpers.SendMailHelper;
import com.demo.models.ArtistInfo;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.ArtistRepository;

@Service("artistService")
public class ArtistServiceImpl implements ArtistService{

	@Autowired
	private ArtistRepository artistRepository;
	
	@Autowired
    public JavaMailSender emailSender;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Override
	public List<ArtistInfo> searchByKeyword(String keyword, Pageable pageable) {
		return artistRepository.searchByKeyword(keyword, pageable);
	}

	@Override
	public List<ArtistInfo> getPopularArtists(Pageable pageable) {
		return artistRepository.getPopularArtists(pageable);
	}

	@Override
	public List<ArtistInfo> getArtistWithoutId(int id) {
		return artistRepository.getArtistsWithoutId(id);
	}

	@Override
	public List<Account> getArtistByStatus(boolean status) {
		return artistRepository.getArtistByStatus(status);
	}

	@Override
	public List<Account> getRequestArtist() {
		return artistRepository.getRequestArtist();
	}

	@Override
	public Account addNewArtist(Account account , String image) {
		account.setUsername(account.getEmail()); 
		account.setJoinDate(new Date());
		account.setIsActive(true);
		account.setIsArtist(true);

		Role role = new Role();
		role.setId(1);
		account.getRoles().add(role);
		account.setImage(image);
		account.setFollower(0);
		account.setAuthProvider(AuthenticationProvider.LOCAL);
		SendMailHelper mailHelper = new SendMailHelper() ;
		String emailContent = "<h3>Congratulaion, you are an artist from now</h3> <br> Dear " + account.getNickname()  ;
		emailContent += ".  We send you your account password. Use your email and password to login <br>";
		emailContent += "Your password here : <b><i>" + account.getPassword() + "</b></i>"; 
		
		account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
		String subject = " Announcement about becoming the artist of the website Muzik" ; 
		
		try {
			mailHelper.sendSimpleEmail(account.getEmail(), subject, emailContent , emailSender);
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
		}
		
		
		return accountRepository.save(account);
	}
	@Override
	public List<Account> getAllArtist() {
		return artistRepository.getAllArtist();
	}

}
