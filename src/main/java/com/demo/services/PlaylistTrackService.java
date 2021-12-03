package com.demo.services;

import java.util.*;
import com.demo.entities.*;

import java.util.List;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;
import com.demo.entities.Track;

public interface PlaylistTrackService {
	
	public PlaylistTrack save(PlaylistTrack playlistTrack);
	
	public PlaylistTrack findById(PlaylistTrackId playlistTrackId);
	
	public void delete(PlaylistTrackId playlistTrackId);	
	
	public Iterable<PlaylistTrack> findAll();
	
	public List<Integer> getAlbumOwnIdsByTrackId(int trackId);
	
	public void removeAllTrackFromAlbum(Playlist album);
	
	public void removeTrackFromAllAlbum(Track track);
	
	public void addTrackToAlbum(int albumId, int trackId);
}
