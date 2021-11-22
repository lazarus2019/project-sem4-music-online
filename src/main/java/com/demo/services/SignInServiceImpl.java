package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AccountRole;
import com.demo.entities.AuthenticationProvider;
import com.demo.entities.Role;
import com.demo.entities.SignIn;
import com.demo.repositories.SignInRepository;

@Service("signInService")
public class SignInServiceImpl implements SignInService {

	@Autowired
	private SignInRepository signInRepository ;
	
	@Override
	public Iterable<SignIn> findAll() {
		// TODO Auto-generated method stub
		return signInRepository.findAll();
	}

	@Override
	public SignIn find(String username) {
		// TODO Auto-generated method stub
		return signInRepository.find(username);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		SignIn signIn = signInRepository.find(username) ; 
		
		if (signIn == null) {
			throw new UsernameNotFoundException("Username Not Found");
		} else {
			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();			
			roles.add(new SimpleGrantedAuthority(signIn.getRole().getName()));
			
			return new User(signIn.getUsername(), signIn.getPassword(), roles);
		}
	}

	@Override
	public SignIn save(SignIn account) {
		
		return signInRepository.save(account) ;
	}

	@Override
	public SignIn findByEmail(String email) {
		return signInRepository.findByEmail(email);
	}

	@Override
	public void registerNewSignInAfterFacebookLoginSuccess(String email, String name, AuthenticationProvider authProvider) {
		SignIn account = new SignIn()  ;
		//account.se
		
	}

}
