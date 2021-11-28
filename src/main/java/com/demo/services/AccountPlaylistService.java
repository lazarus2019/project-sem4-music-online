package com.demo.services;

import java.util.List;

import com.demo.models.AlbumInfo;

public interface AccountPlaylistService {

	public List<AlbumInfo> checkAndGetAlbum(List<AlbumInfo> album);
}
