
package com.demo.services;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.ArtistTrack;
import com.demo.entities.ArtistTrackId;
import com.demo.entities.Track;
import com.demo.models.ArtistInfo;
import com.demo.repositories.ArtistRepository;
import com.demo.repositories.ArtistTrackRepository;
import com.demo.repositories.TrackRepository;

@Service("artistTrackService")
public class ArtistTrackServiceImpl implements ArtistTrackService{
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private ArtistTrackRepository artistTrackRepository;
	
	@Autowired 
	private ArtistRepository artistRepository;
	
	@Autowired
	private AccountService accountService;
	
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

	@Override
	public List<Track> getTracksOfArtist(int artistId) {
		List<Track> result = new ArrayList<Track>();
		List<Integer> trackIds = artistTrackRepository.getTracksOfArtist(artistId);
		for(int trackId : trackIds) {
			result.add(trackService.findById(trackId));
		}
		return result;
	}

	@Override
	public void removeAllArtistFromTrack(Track track) {
		try {
			Set<Account> accounts = track.findAccountThroughAtristTrack();
			if(accounts != null) {
				for(Account account : accounts) {
					for(ArtistTrack artistTrack : account.getArtistTracks()) {
						if(artistTrack.getTrack().getId() == track.getId()) {
							delete(artistTrack.getId());					
						}					
					}
				}				
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void removeFeatArtistFromTrack(Track track, int artistId) {
		try {
			for(Account accountTmp : track.findAccountThroughAtristTrack()) {
				for(ArtistTrack artistTrack : accountTmp.getArtistTracks()) {
					if(!artistTrack.isIsOwn()) {
						artistTrack.setAccount(accountService.findById(artistTrack.getId().getAccountId()));
							delete(artistTrack.getId());
					}
				}
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void addFeatArtistToTrack(Track track, int featArtistId) {
		try {
			ArtistTrack featArtistTrack = new ArtistTrack();
			featArtistTrack.setId(new ArtistTrackId(featArtistId, track.getId()));
			featArtistTrack.setAccount(accountService.findById(featArtistId));
			featArtistTrack.setTrack(track);
			featArtistTrack.setIsOwn(false);
			save(featArtistTrack);	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void setOwnerTrack(int artistId, int trackId) {
		try {
			ArtistTrack artistTrack = new ArtistTrack();
			artistTrack.setId(new ArtistTrackId(artistId, trackId));
			artistTrack.setAccount(accountService.findById(artistId));
			artistTrack.setTrack(trackService.findById(trackId));
			artistTrack.setIsOwn(true);
			save(artistTrack);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}

	@Override
	public boolean checkTrackOwner(int artistId, int trackId) {
		boolean result = false;
		List<Integer> trackIds = artistTrackRepository.getTracksOfArtist(artistId);
		for(int trackIdTmp : trackIds) {
			if(trackIdTmp == trackId) {
				result = true;
				break;
			}
		}
		return result;
	}


	public List<Account> findAccountThroughAtristTrack(List<Integer> accountIds){
		List<Account> accounts = new ArrayList<Account>();
		if(accountIds != null) {
			for(int accountId : accountIds) {
				accounts.add(accountService.findById(accountId));
			}
		}
		return accounts;
	}
}
