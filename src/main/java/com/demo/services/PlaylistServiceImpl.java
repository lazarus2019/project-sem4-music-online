package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Playlist;
import com.demo.repositories.PlaylistRepository;

@Service("playlistService")
public class PlaylistServiceImpl implements PlaylistService {

	@Autowired
	private PlaylistRepository playlistRepository;

	@Override
	public List<Playlist> getAllUpcommingAlbum() {
		return playlistRepository.getAllUpcommingAlbum();
	}
	
	
	
}
