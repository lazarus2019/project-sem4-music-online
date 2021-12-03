package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistTrack;
import com.demo.entities.PlaylistTrackId;
import com.demo.entities.Track;
import com.demo.repositories.PlaylistTrackRepository;

@Service("playlistTrackService")
public class PlaylistTrackServiceImpl implements PlaylistTrackService{
	
	@Autowired
	private PlaylistTrackRepository pLaylistTrackRepository;
	
	@Autowired
	private TrackService trackService;
	
	@Autowired
	private PlaylistService playlistService;

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
			System.out.println("Error:" + e.getMessage());
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

	@Override
	public void removeAllTrackFromAlbum(Playlist album) {
		try {
			for(PlaylistTrack playlistTrack : album.getPlaylistTracks()) {
				delete(playlistTrack.getId());
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void removeTrackFromAllAlbum(Track track) {
		try {
			for(Playlist playlist : track.findPlaylistThroughPlaylistTrack()) {
				for(PlaylistTrack playlistTrack : playlist.getPlaylistTracks()) {
					if(playlistTrack.getTrack().getId() == track.getId()) {
						delete(playlistTrack.getId());
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void addTrackToAlbum(int albumId, int trackId) {
		try {
			PlaylistTrack albumTrack = new PlaylistTrack();
			albumTrack.setId(new PlaylistTrackId(albumId, trackId));
			albumTrack.setPlaylist(playlistService.find(albumId));
			albumTrack.setTrack(trackService.findById(trackId));
			save(albumTrack);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
