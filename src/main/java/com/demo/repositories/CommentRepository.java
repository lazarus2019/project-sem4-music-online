package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Comment;
import com.demo.entities.CommentId;
@Repository("commentRepository")
public interface CommentRepository extends CrudRepository<Comment, CommentId>{

	
	@Query("FROM Comment WHERE track_id = :id ")
	public List<Comment>  findByTrackId(@Param("id")int id);
	
}
