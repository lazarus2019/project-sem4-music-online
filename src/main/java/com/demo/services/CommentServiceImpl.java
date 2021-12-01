package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Comment;
import com.demo.entities.CommentId;
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
	
	
}
