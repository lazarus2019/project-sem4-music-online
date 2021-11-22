package com.demo.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AccountRole;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.Role;
import com.demo.repositories.AccountRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository ; 
	
	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll() ; 
	}
	@Override
	public Account find(String username) {
		return accountRepository.find(username);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.find(username);
		if (account == null) {
			throw new UsernameNotFoundException("Username Not Found");
		} else {
			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
			for (AccountRole role : account.getAccountRoles()) {
				roles.add(new SimpleGrantedAuthority(role.getRole().getName()));
			}
			return new User(account.getUsername(), account.getPassword(), roles);
		}
	}
	@Override
	public Account findByEmail(String email) {
		return accountRepository.findByEmail(email);
	}
	
	@Override
	public void registerNewSignInAfterFacebookLoginSuccess(String email, String name, AuthenticationProvider authProvider) {
			Account account = new Account(); 
			account.setNickname(name); 
			account.setEmail(email);
			account.setUsername(email);
			account.setJoinDate(new Date());
			account.setStatus(true);
			account.setIsArtist(false);
			account.setBirthday(new Date());
			account.setPassword(new BCryptPasswordEncoder().encode("123"));
			
			Set<AccountRole> roles = new HashSet<AccountRole>() ;
			AccountRole accountRole = new AccountRole() ; 			
			Role role = new Role() ; 
			role.setId(2);
			accountRole.setRole(role) ; 
			roles.add(accountRole) ;
			account.getAccountRoles().add(accountRole) ;
			
			account.setAccountRoles( roles);
			account.setFollower(0);
			account.setAuthProvider(authProvider);
			accountRepository.save(account) ;
			
	}
	
	
	@Override
	public void updateNewSignInAfterFacebookLoginSuccess(Account account, String name,
			AuthenticationProvider authProvider) {
			account.setFirstname(name);
			account.setAuthProvider(authProvider);
			
			accountRepository.save(account) ;
		
	}
	@Override
	public void registerNewSignUp(Account account, AuthenticationProvider authProvider) {
		// TODO Auto-generated method stub
		account.setUsername(account.getEmail());
		account.setJoinDate(new Date());
		account.setStatus(true);
		account.setIsArtist(false);
		account.setBirthday(new Date());
		account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
		
		Set<AccountRole> roles = new HashSet<AccountRole>() ;
		AccountRole accountRole = new AccountRole() ; 			
		Role role = new Role() ; 
		role.setId(2);
		accountRole.setRole(role) ; 
		roles.add(accountRole) ;
		account.getAccountRoles().add(accountRole) ;
		
		account.setAccountRoles( roles);
		account.setFollower(0);
		account.setAuthProvider(authProvider);
		accountRepository.save(account) ;
		
	}


}
