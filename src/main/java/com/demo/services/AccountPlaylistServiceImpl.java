package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.demo.entities.Account;
import com.demo.entities.AccountPlaylist;
import com.demo.entities.AccountPlaylistId;
import com.demo.entities.Playlist;
import com.demo.models.AlbumInfo;
import com.demo.repositories.AccountPlaylistRepository;
import com.demo.repositories.AccountRepository;

@Service("accountPlaylistService")
public class AccountPlaylistServiceImpl implements AccountPlaylistService {


	@Autowired
	private AccountPlaylistRepository accountPlaylistRepository;
	
	@Autowired
	private AccountPlaylistService accountPlaylistService;
	
	@Autowired
	private AccountService accountService;

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
				if(accountPlaylist.getPlaylist().getPlaylistCategory().getId() == 3) {
					AlbumInfo albumInfo = new AlbumInfo();
					albumInfo.setId(accountPlaylist.getPlaylist().getId());
					albumInfo.setTitle(accountPlaylist.getPlaylist().getTitle());
					albumInfo.setStatusId(accountPlaylist.getPlaylist().getStatus().getId());
					albumInfo.setThumbnail(accountPlaylist.getPlaylist().getThumbnail());
					albumInfo.setDescription(accountPlaylist.getPlaylist().getDescription());
					albumInfo.setPublishDate(accountPlaylist.getPlaylist().getPublishDate());
					// Check track is on this album or not
					result.add(albumInfo);
				}
			}			
		}
		return result;
	}
	
	@Override
	public AccountPlaylist getOwnerPlaylist(int playlistId) {
		return accountPlaylistRepository.checkAlbum(playlistId);
	}

	//A-2/12
	@Override
	public List<AccountPlaylistId> getPlaylistOfAccount(int id) {
		return accountPlaylistRepository.getPlaylistOfAccount(id);
	}

	@Override
	public AccountPlaylist save(AccountPlaylist accountPlaylist) {
		return accountPlaylistRepository.save(accountPlaylist);
	}

	@Override
	public void delete(AccountPlaylistId accountPlaylistId) {
		try {
			AccountPlaylist accountPlaylist = findById(accountPlaylistId);
			accountPlaylistRepository.delete(accountPlaylist);			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public AccountPlaylist findById(AccountPlaylistId accountPlaylistId) {
		return accountPlaylistRepository.findById(accountPlaylistId).get();
	}

	@Override
	public Iterable<AccountPlaylist> findAll() {
		return accountPlaylistRepository.findAll();
	}

	@Override
	public void removeAccountHasAlbum(Playlist album) {
		try {
			for(AccountPlaylist accountPlaylist : album.getAccountPlaylists()) {
				accountPlaylistService.delete(accountPlaylist.getId());
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}		
	}

	@Override
	public void setOwnerAlbum(Playlist album, int artistId) {
		try {
			AccountPlaylist accountPlaylist = new AccountPlaylist();
			accountPlaylist.setId(new AccountPlaylistId(album.getId(), artistId));
			accountPlaylist.setPlaylist(album);
			accountPlaylist.setAccount(accountService.findById(artistId));
			accountPlaylist.setIsOwn(true);
			accountPlaylistService.save(accountPlaylist);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}		
		
	}

	@Override
	public boolean checkAlbumOwner(int artistId, int albumId) {
		boolean result = false;
		List<AlbumInfo> albumInfos = getAlbumsByArtistId(artistId);
		for(AlbumInfo albumInfo : albumInfos) {
			if(albumInfo.getId() == albumId) {
				result = true;
				break;
			}
		}	
		
		return result;
	}
}
