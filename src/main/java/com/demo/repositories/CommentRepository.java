package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.entities.Comment;
import com.demo.entities.CommentId;
@Repository("commentRepository")
public interface CommentRepository extends CrudRepository<Comment, CommentId>{

}
