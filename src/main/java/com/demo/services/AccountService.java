package com.demo.services;

import org.springframework.data.repository.CrudRepository;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;


public interface AccountService extends UserDetailsService {
	
	public Iterable<Account> findAll();
	
	public Account find(String username) ; 
	
	public Account findByEmail(String email) ;

	public void registerNewSignInAfterFacebookLoginSuccess(String email, String name, AuthenticationProvider authProvider); 
	
	public void updateNewSignInAfterFacebookLoginSuccess(Account account,  String name, AuthenticationProvider authProvider); 
	
	public void registerNewSignUp(Account account, AuthenticationProvider authProvider); 
	
}
