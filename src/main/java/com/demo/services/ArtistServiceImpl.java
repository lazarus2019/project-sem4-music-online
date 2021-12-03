package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.models.ArtistInfo;
import com.demo.repositories.ArtistRepository;

@Service("artistService")
public class ArtistServiceImpl implements ArtistService{

	@Autowired
	private ArtistRepository artistRepository;
	
	@Override
	public List<ArtistInfo> searchByKeyword(String keyword, Pageable pageable) {
		return artistRepository.searchByKeyword(keyword, pageable);
	}

	@Override
	public List<ArtistInfo> getPopularArtists(Pageable pageable) {
		return artistRepository.getPopularArtists(pageable);
	}

	@Override
	public List<ArtistInfo> getArtistWithoutId(int id) {
		return artistRepository.getArtistsWithoutId(id);
	}

	@Override
	public List<Account> getAllArtist() {
		return artistRepository.getAllArtist();
	}

	@Override
	public List<Account> getRequestArtist() {
		return artistRepository.getRequestArtist();
	}

}
