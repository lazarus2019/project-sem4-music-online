package com.demo.services;

import java.util.*;
import com.demo.entities.*;

public interface PlaylistTrackService {

	public PlaylistTrack save(PlaylistTrack playlistTrack);

	public PlaylistTrack findById(PlaylistTrackId id);

}
