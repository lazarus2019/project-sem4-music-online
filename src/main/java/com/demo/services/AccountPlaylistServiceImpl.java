package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.AccountPlaylist;
import com.demo.models.AlbumInfo;
import com.demo.repositories.AccountPlaylistRepository;

@Service("accountPlaylistService")
public class AccountPlaylistServiceImpl implements AccountPlaylistService{

	@Autowired
	private AccountPlaylistRepository accountPlaylistRepository;

	@Override
	public List<AlbumInfo> checkAndGetAlbum(List<AlbumInfo> album) {
		List<AlbumInfo> result = new ArrayList<AlbumInfo>();
		for(AlbumInfo albumInfo : album) {
			AccountPlaylist accountPlaylist = accountPlaylistRepository.checkAlbum(albumInfo.getId());
					if(accountPlaylist != null) {
						albumInfo.setArtistId(accountPlaylist.getAccount().getId());
						albumInfo.setArtistNickName(accountPlaylist.getAccount().getNickname());
						result.add(albumInfo);						
					}
					if(result.size() == 6) {
						break;
					}
		}
		return result;
	}

	@Override
	public List<AlbumInfo> getAlbumsByArtistId(int id) {
		List<AlbumInfo> result = new ArrayList<AlbumInfo>();
		List<AccountPlaylist> accountPlaylists = accountPlaylistRepository.getAlbumsOfArtistId(id);
		if(accountPlaylists != null) {
			for(AccountPlaylist accountPlaylist : accountPlaylists) {
				AlbumInfo albumInfo = new AlbumInfo();
				albumInfo.setId(accountPlaylist.getPlaylist().getId());
				albumInfo.setTitle(accountPlaylist.getPlaylist().getTitle());
				albumInfo.setStatusId(accountPlaylist.getPlaylist().getStatus().getId());
				// Check track is on this album or not
				result.add(albumInfo);	
			}			
		}
		return result;
	}
	
	@Override
	public AccountPlaylist getOwnerPlaylist(int playlistId) {
		return accountPlaylistRepository.checkAlbum(playlistId);
	}
}
