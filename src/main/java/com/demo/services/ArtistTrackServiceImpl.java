package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.ArtistTrack;
import com.demo.entities.ArtistTrackId;
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

	@Override
	public ArtistTrack save(ArtistTrack artistTrack) {
		return artistTrackRepository.save(artistTrack);
	}

	

	@Override
	public Iterable<ArtistTrack> findAll() {
		return artistTrackRepository.findAll();
	}

	@Override
	public List<Integer> getFeatAccountIdByTrackId(int trackId) {
		return artistTrackRepository.getFeatAccountIdByTrackId(trackId);
	}

	@Override
	public void delete(ArtistTrackId artistTrackId) {
		try {
			ArtistTrack artistTrack = findById(artistTrackId);
			artistTrackRepository.delete(artistTrack);			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public ArtistTrack findById(ArtistTrackId artistTrackId) {
		return artistTrackRepository.findById(artistTrackId).get();
	}

}
