package com.its.members.service;

import com.its.members.dto.MembersDTO;
import com.its.members.repository.MembersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MembersService {
    @Autowired
    private MembersRepository membersRepository;


    public boolean save(MembersDTO membersDTO) {
        int saveResult = membersRepository.save(membersDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean login(MembersDTO membersDTO) {
        MembersDTO members = membersRepository.login(membersDTO);
        if (members != null) {
            return true;
        } else {
            return false;
        }
    }


    public List<MembersDTO> findAll() {
        return membersRepository.findAll();
    }

    public MembersDTO findId(Long id) {
        return membersRepository.findId(id);
    }

    public void delete(Long id) {
        membersRepository.delete(id);
    }


    public MembersDTO findByEmail(String memberEmail) {
        return membersRepository.findByEmail(memberEmail);
    }


    public boolean update(MembersDTO membersDTO) {
        int result = membersRepository.update(membersDTO);
        if (result > 0){
            return true;
        } else {
            return false;
        }
    }
}
