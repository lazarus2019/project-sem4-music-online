package com.demo.services;

import java.util.*;
import com.demo.entities.*;

public interface PlaylistService {

	public List<Playlist> getAllUpcommingAlbum();
	
	public Playlist save(Playlist playlist);

	public Playlist find(int id);
	
	public List<Playlist> getAllPlaylist();

	public List<Playlist> getAllAlbum();
}
