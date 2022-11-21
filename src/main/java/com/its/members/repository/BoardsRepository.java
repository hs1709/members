package com.its.members.repository;

import com.its.members.dto.BoardsDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardsRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public int save(BoardsDTO boardsDTO) {
        return sql.insert("Boards.save", boardsDTO);
    }

    public List<BoardsDTO> findAll() {
        return sql.selectList("Boards.findAll");
    }

    public BoardsDTO findById(Long id) {
        return sql.selectOne("Boards.findById", id);
    }

    public void updateHits(Long id) {
        sql.update("Boards.updateHits", id);
    }

    public List<BoardsDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Boards.pagingList", pagingParams);
    }

    public int boardsCount() {
        return sql.selectOne("Boards.boardCount");
    }

    public void update(BoardsDTO boardsDTO) {
        sql.update("Boards.update", boardsDTO);
    }

    public void delete(Long id) {
        sql.delete("Boards.delete", id);
    }

    public List<BoardsDTO> search(Map<String, String> searchParams) {
        return sql.selectList("Boards.search", searchParams);
    }
}
