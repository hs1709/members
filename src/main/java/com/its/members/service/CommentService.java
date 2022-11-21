package com.its.members.service;

import com.its.members.dto.CommentDTO;
import com.its.members.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }


    public List<CommentDTO> findAll(int boardId) {
        return commentRepository.findAll(boardId);
    }
}
