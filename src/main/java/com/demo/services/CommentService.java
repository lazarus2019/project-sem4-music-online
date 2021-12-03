package com.demo.services;

import com.demo.entities.Comment;
import com.demo.entities.CommentId;
import com.demo.entities.Track;

public interface CommentService {
	public Comment findById(CommentId commentId);
	
	public void delete(CommentId commentId);
	
	public Iterable<Comment> findAll();
	
	public Comment save(Comment comment);
	
	public void removeAllCommentInTrack(Track track);
}
