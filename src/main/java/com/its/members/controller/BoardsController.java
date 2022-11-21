package com.its.members.controller;

import com.its.members.dto.BoardsDTO;
import com.its.members.dto.PageDTO;
import com.its.members.service.BoardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

@Controller
public class BoardsController {

    @Autowired
    private BoardsService boardsService;

    @GetMapping("/board/save")
    public String saveForm(){
        return "boardsSave";
    }

    @PostMapping("/board/save")
    public String save(@ModelAttribute BoardsDTO boardsDTO){
        boardsService.save(boardsDTO);
        return "redirect:/paging";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<BoardsDTO> boardsList = boardsService.findAll();
        model.addAttribute("boardsList", boardsList);
        return "redirect:/paging";
    }

    @GetMapping("/paging")
    public String paging(Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page){
        List<BoardsDTO> pagingList = boardsService.pagingList(page);
        PageDTO pageDTO = boardsService.pagingParam(page);
        model.addAttribute("boardsList", pagingList);
        model.addAttribute("paging", pageDTO);
        return "boardPaging";
    }

    @GetMapping("/findById")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page){
        boardsService.updateHits(id);
        BoardsDTO boardsDTO = boardsService.findById(id);
        model.addAttribute("boards", boardsDTO);
        model.addAttribute("page", page);
        System.out.println("조회: boardsDTO = " + boardsDTO);
        return "boardsDetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        BoardsDTO boardsDTO = boardsService.findById(id);
        model.addAttribute("boards", boardsDTO);
        return "boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardsDTO boardsDTO, Model model){
        boardsService.update(boardsDTO);
        BoardsDTO dto = boardsService.findById(boardsDTO.getId());
        model.addAttribute("boards", dto);
        return "boardsDetail";
    }

    @GetMapping("/deleteCheck")
    public String deleteCheck(@RequestParam("id") Long id, Model model){
        BoardsDTO boardsDTO = boardsService.findById(id);
        model.addAttribute("boards", boardsDTO);
        return "deleteCheck";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        boardsService.delete(id);
        return "boardPaging";
    }

    @GetMapping("/admin")
    public String admin(Model model){
        List<BoardsDTO> boardsList = boardsService.findAll();
        model.addAttribute("boardsList", boardsList);
        return "admin";
    }

    @GetMapping("/search")
    public String search(@RequestParam("type") String type,
                         @RequestParam("q") String q, Model model){
        List<BoardsDTO> searchList = boardsService.search(type, q);
        model.addAttribute("boardsList", searchList);
        return "boardPaging";
    }
}

