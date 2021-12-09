package com.demo.services;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.demo.entities.Account;
import com.demo.models.ArtistInfo;

public interface ArtistService {
	public List<ArtistInfo> searchByKeyword(String keyword, Pageable pageable);
	
	public List<ArtistInfo> searchByKeyword(String keyword);
	
	public List<ArtistInfo> getPopularArtists(Pageable pageable);
	
	public List<ArtistInfo> getArtistWithoutId(int id);	
	
	public List<Account> getAllArtist() ;
	
	public List<Account> getArtistByStatus(boolean status) ;
	
	public List<Account> getRequestArtist() ;	
	
	public Account addNewArtist(Account account , String image) ;


}
