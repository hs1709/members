package com.its.members.service;

import com.its.members.common.PagingConst;
import com.its.members.dto.BoardsDTO;
import com.its.members.dto.PageDTO;
import com.its.members.repository.BoardsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardsService {

    @Autowired
    private BoardsRepository boardsRepository;


    public boolean save(BoardsDTO boardsDTO) {
        int saveResult = boardsRepository.save(boardsDTO);
        if (saveResult > 0){
            return true;
        } else {
            return false;
        }
    }

    public List<BoardsDTO> findAll() {
        List<BoardsDTO> boardsDTOList = boardsRepository.findAll();
        return boardsDTOList;
    }


    public BoardsDTO findById(Long id) {
        return boardsRepository.findById(id);
    }

    public void updateHits(Long id) {
        boardsRepository.updateHits(id);
    }

    public List<BoardsDTO> pagingList(int page) {
        int pagingStart = (page - 1) * PagingConst.PAGE_LIMIT;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", PagingConst.PAGE_LIMIT);
        List<BoardsDTO> pagingList = boardsRepository.pagingList(pagingParams);
        return pagingList;
    }

    public PageDTO pagingParam(int page) {
        int boardCount = boardsRepository.boardsCount();
        int maxPage = (int) (Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        int endPage = startPage + PagingConst.BLOCK_LIMIT - 1;
        if (endPage > maxPage){
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }

    public void update(BoardsDTO boardsDTO) {
        boardsRepository.update(boardsDTO);
    }

    public void delete(Long id) {
        boardsRepository.delete(id);
    }

    public List<BoardsDTO> search(String type, String q) {
        Map<String, String> searchParams = new HashMap<>();
        searchParams.put("type", type);
        searchParams.put("q", q);
        List<BoardsDTO> searchList = boardsRepository.search(searchParams);
        return searchList;
    }
}
