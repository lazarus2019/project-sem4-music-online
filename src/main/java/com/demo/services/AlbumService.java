package com.demo.services;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.demo.models.AlbumInfo;

public interface AlbumService {
	public List<AlbumInfo> searchByKeyword(String keyword);

	public AlbumInfo findAlbumById(int id);
}
