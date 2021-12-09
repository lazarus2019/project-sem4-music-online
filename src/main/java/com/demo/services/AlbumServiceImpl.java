package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Playlist;
import com.demo.models.AlbumInfo;
import com.demo.repositories.AlbumRepository;
@Service("albumService")
public class AlbumServiceImpl implements AlbumService{

	@Autowired
	private AlbumRepository albumRepository;
	
	
	@Override
	public List<AlbumInfo> searchByKeyword(String keyword) {
		return albumRepository.searchByKeyword(keyword);
	}

	@Override
	public AlbumInfo findAlbumById(int id) {
		return albumRepository.findAlbumById(id);
	}

	@Override
	public List<Playlist> searchAlbumByKeyword(String keyword) {
		return albumRepository.searchAlbumByKeyword(keyword);
	}
}

