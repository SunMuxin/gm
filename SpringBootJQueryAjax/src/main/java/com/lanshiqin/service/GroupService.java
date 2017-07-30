package com.lanshiqin.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.lanshiqin.entity.Group;
import com.lanshiqin.dao.GroupDao;

@Service
public class GroupService{

    @Resource
    private GroupDao groupDao;

    public int insert(String name, int group_n){
        return groupDao.insert(name, group_n);
    }
    
    public List<Group> queryAll() {
    	return groupDao.queryAll();
    }
    
    public void delete() {
    	groupDao.delete();
    }

	public List<Group> query(String team_name) {
		// TODO Auto-generated method stub
		return groupDao.query(team_name);
	}
}
