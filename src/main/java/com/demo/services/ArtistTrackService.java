package com.demo.services;

import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.ArtistTrack;
import com.demo.entities.ArtistTrackId;
import com.demo.models.ArtistInfo;

public interface ArtistTrackService {
	public List<ArtistInfo> getAccountByTrackId(int id);
	
	public ArtistTrack save(ArtistTrack artistTrack);
	
	public void delete(ArtistTrackId artistTrackId);
	
	public ArtistTrack findById(ArtistTrackId artistTrackId);
	
	public Iterable<ArtistTrack> findAll();
	
	public List<Integer> getFeatAccountIdByTrackId(int trackId);
}
