package com.demo.services;

import java.util.*;

import org.springframework.data.domain.Pageable;
import com.demo.models.ArtistChartModel;
import com.demo.models.ArtistDetail;
import com.demo.models.ArtistInfo;
import com.demo.models.ArtistsInfor;
import com.demo.entities.Account;
import com.demo.entities.AuthenticationProvider;

public interface AccountService {

	public List<Account> getAllPopularArtists(int n);

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

	public List<ArtistInfo> getPopularArtists(Pageable pageable);

	public List<ArtistInfo> getArtistWithoutId(int id);

	public List<ArtistsInfor> getSearchArtis(String keyword);

	public boolean sendRequestArtist(Account account);

	public boolean updateImageAccount(Account account);

	public boolean acceptOrRejectArtist(Account account);

	public void forgotPassword(Account account);
	
	public long countArtist();
	
	public long countUser();

	public List<ArtistChartModel> getAccountChart();
	
	public ArtistDetail getArtistByIdAccount(int id);
	
	public Account addNewAdmin(Account account , String image) ;

	public Account save(Account account);


}
