package com.lanshiqin.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.lanshiqin.entity.Team;
import com.lanshiqin.dao.TeamDao;

@Service
public class TeamService{

    @Resource
    private TeamDao teamDao;

    public int insert(Team team){
        return teamDao.insert(team);
    }

    public List<Team> queryAll(){
        return teamDao.queryAll();
    }
    
    public List<Team> query(String name, String password){
        return teamDao.query(name, password);
    }
}
