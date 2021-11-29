package com.demo.services;

import java.util.*;

import org.springframework.data.domain.Pageable;

import com.demo.entities.*;
import com.demo.models.ArtistInfo;
import com.demo.models.ArtistsInfor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;

public interface AccountService extends UserDetailsService {
	public List<Account> getAllPopularArtists();

	/* extends UserDetailsService */
	public Iterable<Account> findAll();

	public Account findById(int id);

	public Account findByUsername(String username);

	public Account findByEmail(String email);

	public void registerNewSignInAfterFacebookLoginSuccess(String email, String name,
			AuthenticationProvider authProvider);

	public void updateNewSignInAfterFacebookLoginSuccess(Account account, String name,
			AuthenticationProvider authProvider);

	public void updateAccountFromSetting(Account account);

	public void registerNewSignUp(Account account, AuthenticationProvider authProvider);

	public List<ArtistsInfor> getallArtists();

	public List<ArtistInfo> searchByKeyword(String keyword, Pageable pageable);

}
