package com.its.members.controller;

import com.its.members.dto.MembersDTO;
import com.its.members.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MembersController {
    @Autowired
    private MembersService membersService;

    @GetMapping("/member/save")
    public String saveForm(){
        return "memberSave";
    }

    @PostMapping("/member/save")
    public String save(@ModelAttribute MembersDTO membersDTO){
        boolean saveResult = membersService.save(membersDTO);
        if (saveResult) {
            return "memberLogin";
        } else {
            return "index";
        }
    }

    @GetMapping("/login")
    public String loginForm(){
        return "memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MembersDTO membersDTO, HttpSession session,
                         Model model){
        boolean loginResult = membersService.login(membersDTO);
        if (loginResult){
            session.setAttribute("loginEmail", membersDTO.getMemberEmail());
            model.addAttribute("modelEmail", membersDTO.getMemberEmail());
            return "redirect:/paging";
        } else {
            return "memberLogin";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/findAll/")
    public String findAll(Model model){
        List<MembersDTO> memberList = membersService.findAll();
        model.addAttribute("memberList", memberList);
        return "memberList";
    }

    @GetMapping("/findId")
    public String findById(@RequestParam("id") Long id, Model model){
        MembersDTO membersDTO = membersService.findId(id);
        model.addAttribute("members", membersDTO);
        return "memberDetail";
    }

    @GetMapping("/memberDeleteCheck")
    public String delete(@RequestParam("id") Long id, Model model){
        MembersDTO membersDTO = membersService.findId(id);
        model.addAttribute("members", membersDTO);
        return "/memberDeleteCheck";
    }

    @PostMapping("/memberDelete")
    public String delete(@RequestParam("id") Long id){
        membersService.delete(id);
        return "/memberList";
    }

    @GetMapping("/member-update")
    public String updateForm(HttpSession session, Model model){
        String memberEmail = (String) session.getAttribute("loginEmail");
        MembersDTO membersDTO = membersService.findByEmail(memberEmail);
        model.addAttribute("members", membersDTO);
        return "memberUpdate";
    }

    @PostMapping("/member-update")
    public String update(@ModelAttribute MembersDTO membersDTO){
        boolean result = membersService.update(membersDTO);
        if (result){
            return "redirect:/members?id=" + membersDTO.getId();
        } else {
            return "index";
        }
    }

}
