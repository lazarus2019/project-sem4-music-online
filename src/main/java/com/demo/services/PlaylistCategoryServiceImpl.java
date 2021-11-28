package com.demo.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Playlist;
import com.demo.entities.PlaylistCategory;
import com.demo.repositories.PlaylistCategoryRepository;
import com.demo.repositories.PlaylistRepository;
import com.demo.repositories.TrackRepository;

@Service("playlistCategoryService")
public class PlaylistCategoryServiceImpl implements PlaylistCategoryService {

	@Autowired
	private PlaylistCategoryRepository playlistCategoryRepository;

	@Override
	public List<PlaylistCategory> getAllPlaylist() {
		List<PlaylistCategory> allList = (List<PlaylistCategory>) playlistCategoryRepository.findAll();
		List<PlaylistCategory> playlistCategories = new ArrayList<PlaylistCategory>();

		for (int i = 0; i < allList.size(); i++) {
			if(allList.get(i).getId() != 1 && allList.get(i).getId() != 2 && allList.get(i).getId() != 3) {
				playlistCategories.add(allList.get(i));
			}
		}
		return playlistCategories;
	}
	
	
	
}
