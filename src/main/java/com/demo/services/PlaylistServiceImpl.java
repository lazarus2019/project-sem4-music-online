package com.demo.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.Playlist;
import com.demo.models.PlaylistModel;
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
		return playlistRepository.save(playlist);
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
	
	@Override
	public void delete(int id) {
		playlistRepository.deleteById(id);
	}

	@Override
	public List<PlaylistModel> getPlaylistModel(List<Playlist> playlists) {
		List<PlaylistModel> playlistModelies = new ArrayList<PlaylistModel>();
		List<Account> accounts = new ArrayList<Account>();
		for (Playlist list : playlists) {
			PlaylistModel playlistModel = new PlaylistModel();
			playlistModel.setId(list.getId());
			playlistModel.setThumbnail(list.getThumbnail());
			playlistModel.setTitle(list.getTitle());
			playlistModel.setPublishDate(list.getPublishDate());
			playlistModel.setLikes(list.getLikes());
			playlistModel.setPlaylistCategory(list.getPlaylistCategory().getName());
			playlistModel.setStatus(list.getStatus().getId());
			playlistModel.setDescription(list.getDescription());
			for (Account account : list.findAccountThroughAccountPlaylist()) {
				accounts.add(account);
			}
			playlistModel.setAccounts(accounts);
			playlistModelies.add(playlistModel);
		}
		return playlistModelies;
	}

	@Override
	public List<Playlist> searchByTitle(String keyword) {
		return playlistRepository.searchByTitle(keyword);
	}
}
