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
	
	
}
