package com.lanshiqin.service;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;

import com.lanshiqin.entity.Member;
import com.lanshiqin.dao.MemberDao;

@Service
public class MemberService{

    @Resource
    private MemberDao memberDao;

    public int insert(Member member){
        return memberDao.insert(member);
    }
    
    public List<Member> query(String team_name){
        return memberDao.query(team_name);
    }
    
    public List<Member> queryAll(){
        return memberDao.queryAll();
    }
}
