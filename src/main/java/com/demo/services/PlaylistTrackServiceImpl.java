package com.demo.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;
import com.demo.repositories.PlaylistCategoryRepository;
import com.demo.repositories.PlaylistRepository;
import com.demo.repositories.PlaylistTrackRepository;
import com.demo.repositories.TrackRepository;

@Service("playlistTrackService")
public class PlaylistTrackServiceImpl implements PlaylistTrackService {

	@Autowired
	private PlaylistTrackRepository playlistTrackRepository;

	@Override
	public PlaylistTrack save(PlaylistTrack playlistTrack) {
		return playlistTrackRepository.save(playlistTrack);
	}

	@Override
	public PlaylistTrack findById(PlaylistTrackId id) {
		return playlistTrackRepository.findById(id).get();
	}

	
	
}
