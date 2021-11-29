package com.demo.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Playlist;
import com.demo.repositories.PlaylistRepository;
import com.demo.repositories.TrackRepository;

@Service("playlistService")
public class PlaylistServiceImpl implements PlaylistService {

	@Autowired
	private PlaylistRepository playlistRepository;
	
	@Override
	public List<Playlist> getAllUpcommingAlbum() {
		return playlistRepository.getAllUpcommingAlbum(new Date());
	}

	@Override
	public Playlist save(Playlist playlist) {
		playlist.setPlaylistTracks(null);
		playlistRepository.save(playlist);
		return null;
	}

	@Override
	public List<Playlist> getAllPlaylist() {
		return playlistRepository.getAllPlaylist();
	}

	@Override
	public Playlist find(int id) {
		return playlistRepository.findById(id).get();
	}

	@Override
	public List<Playlist> getAllAlbum() {
		return playlistRepository.getAllAlbum();
	}
	
	
	
}
