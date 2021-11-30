package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.ArtistInfo;
import com.demo.repositories.ArtistRepository;
import com.demo.repositories.ArtistTrackRepository;

@Service("artistTrackService")
public class ArtistTrackServiceImpl implements ArtistTrackService{

	@Autowired
	private ArtistTrackRepository artistTrackRepository;
	
	@Autowired 
	private ArtistRepository artistRepository;
	
	@Override
	public List<ArtistInfo> getAccountByTrackId(int id) {		
		List<ArtistInfo> accounts = new ArrayList<ArtistInfo>();
		List<Integer> accountIds = artistTrackRepository.getAccountByTrackId(id);
		for(int accountId : accountIds) {
			accounts.add(artistRepository.getArtistById(accountId));
		}
		
		return accounts;
	}

}
