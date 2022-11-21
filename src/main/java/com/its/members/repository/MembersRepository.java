package com.its.members.repository;

import com.its.members.dto.MembersDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MembersRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MembersDTO membersDTO) {
        return sql.insert("Members.save", membersDTO);
    }

    public MembersDTO login(MembersDTO membersDTO) {
        return sql.selectOne("Members.login", membersDTO);
    }

    public List<MembersDTO> findAll() {
        return sql.selectList("Members.findAll");
    }

    public MembersDTO findId(Long id) {
        return sql.selectOne("Members.findId", id);
    }

    public void delete(Long id) {
        sql.selectOne("Members.delete", id);
    }


    public MembersDTO findByEmail(String memberEmail) {
        return sql.selectOne("Members.findByEmail", memberEmail);
    }

    public int update(MembersDTO membersDTO) {
        return sql.update("Members.update", membersDTO);
    }
}
