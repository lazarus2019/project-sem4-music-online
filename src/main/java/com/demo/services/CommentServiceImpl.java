package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Comment;
import com.demo.entities.CommentId;
import com.demo.entities.Track;
import com.demo.repositories.CommentRepository;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentRepository commentRepository;
	
	@Override
	public Comment findById(CommentId commentId) {
		return commentRepository.findById(commentId).get();
	}

	@Override
	public void delete(CommentId commentId) {
		try {
			Comment comment = findById(commentId);
			commentRepository.delete(comment);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public Iterable<Comment> findAll() {
		return commentRepository.findAll();
	}

	@Override
	public Comment save(Comment comment) {
		return commentRepository.save(comment);
	}

	@Override
	public void removeAllCommentInTrack(Track track) {
		try {
			for(Comment comment : track.getComments()) {
				delete(comment.getId());
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public List<Comment> findByTrackId(int id) {
		return commentRepository.findByTrackId(id);
	}
	
	
}
