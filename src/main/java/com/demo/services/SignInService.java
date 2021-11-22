package com.demo.services;

import org.springframework.data.repository.CrudRepository;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.SignIn;


public interface SignInService extends UserDetailsService {
	
	public Iterable<SignIn> findAll();
	
	public SignIn find(String username) ; 
	
	public SignIn findByEmail(String email) ; 
	
	public SignIn save(SignIn account) ;

	public void registerNewSignInAfterFacebookLoginSuccess(String email, String name, AuthenticationProvider facebook); 
}
