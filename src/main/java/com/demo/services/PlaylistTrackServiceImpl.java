package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;
import com.demo.repositories.PLaylistTrackRepository;

@Service("playlistTrackService")
public class PlaylistTrackServiceImpl implements PlaylistTrackService{
	
	@Autowired
	private PLaylistTrackRepository pLaylistTrackRepository;

	@Override
	public PlaylistTrack findById(PlaylistTrackId playlistTrackId) {
		return pLaylistTrackRepository.findById(playlistTrackId).get();
	}

	@Override
	public void delete(PlaylistTrackId playlistTrackId) {
		try {
			PlaylistTrack playlistTrack = findById(playlistTrackId);
			pLaylistTrackRepository.delete(playlistTrack);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public PlaylistTrack save(PlaylistTrack playlistTrack) {
		return pLaylistTrackRepository.save(playlistTrack);
	}

	@Override
	public Iterable<PlaylistTrack> findAll() {
		return pLaylistTrackRepository.findAll();
	}

	@Override
	public List<Integer> getAlbumOwnIdsByTrackId(int trackId) {
		return pLaylistTrackRepository.getAlbumOwnIdsByTrackId(trackId);
	}

	
}
