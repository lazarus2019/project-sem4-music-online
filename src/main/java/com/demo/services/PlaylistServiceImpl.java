package com.demo.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.Playlist;
import com.demo.entities.Status;
import com.demo.models.AlbumInfo;
import com.demo.models.PlaylistInfor;
import com.demo.models.PlaylistModel;
import com.demo.repositories.PlaylistRepository;

@Service("playlistService")
public class PlaylistServiceImpl implements PlaylistService {

	@Autowired
	private PlaylistRepository playlistRepository;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Override
	public List<Playlist> getAllUpcommingAlbum() {
		return playlistRepository.getAllUpcommingAlbum(new Date());
	}

	@Override
	public Playlist save(Playlist playlist) {
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

	@Override
	public PlaylistInfor getLikedPlaylistByAccountId(int id) {
		return playlistRepository.getLikedPlaylistByAccountId(id);
	}

	@Override
	public PlaylistInfor getRecentPlaylistByAccountId(int id) {
		return playlistRepository.getRecentPlaylistByAccountId(id);
	}

	@Override
	public List<AlbumInfo> searchAlbumInManage(String option, String keyword, int artistId) {
		List<AlbumInfo> result = new ArrayList<AlbumInfo>();
		List<AlbumInfo> albumInfos = accountPlaylistService.getAlbumsByArtistId(artistId);
		int optionInt = 0;
		if(option != "") {
			optionInt = Integer.parseInt(option);
		}
		
		for(AlbumInfo albumInfo : albumInfos) {
			if(optionInt != 0) {
				if(albumInfo.getTitle().toLowerCase().contains(keyword) && albumInfo.getStatusId() == optionInt) {
					result.add(albumInfo);
				}				
			}else {
				if(albumInfo.getTitle().toLowerCase().contains(keyword)) {
					result.add(albumInfo);
				}			
			}
		}
		
		return result;
	}

	@Override
	public boolean publishAlbum() {
		try {
			Status status = new Status();
			status.setId(1);
			for (Playlist album : playlistRepository.findAll()) {
				Playlist newAlbum = new Playlist();
				newAlbum = album;
				if(newAlbum.getStatus().getId() == 3 && newAlbum.getPublishDate().before(new Date())) {
					newAlbum.setStatus(status);
					playlistRepository.save(newAlbum);
				}
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public List<PlaylistModel> getBestAlbum() {
		List<PlaylistModel> bestAlbums = new ArrayList<PlaylistModel>();
		for (Playlist playlist : playlistRepository.getBestAlbum()) {
			PlaylistModel playlistModel = new PlaylistModel();
			playlistModel.setId(playlist.getId());
			playlistModel.setTitle(playlist.getTitle());
			playlistModel.setThumbnail(playlist.getThumbnail());
			playlistModel.setLikes(playlist.getLikes());
			List<Account> accounts = new ArrayList<Account>();
			for (AccountPlaylist accountPlaylist : playlist.getAccountPlaylists()) {
				if(accountPlaylist.isIsOwn() == true) {
					accounts.add(accountPlaylist.getAccount());
					playlistModel.setAccounts(accounts);
				}
			}
			bestAlbums.add(playlistModel);
		}
		return bestAlbums;
	}
	
}
