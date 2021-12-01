package com.demo.services;

import java.util.List;

import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;

public interface PlaylistTrackService {
	public PlaylistTrack findById(PlaylistTrackId playlistTrackId);
	
	public void delete(PlaylistTrackId playlistTrackId);
	
	public PlaylistTrack save(PlaylistTrack playlistTrack);
	
	public Iterable<PlaylistTrack> findAll();
	
	public List<Integer> getAlbumOwnIdsByTrackId(int trackId);
}
