package com.demo.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.Role;
import com.demo.entities.ServicePackage;
import com.demo.models.ArtistInfo;
import com.demo.models.ArtistsInfor;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.PackageRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public List<Account> getAllPopularArtists() {
		return accountRepository.getAllPopularArtists();
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

		account.setFollower(0);
		account.setAuthProvider(authProvider);
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


}
