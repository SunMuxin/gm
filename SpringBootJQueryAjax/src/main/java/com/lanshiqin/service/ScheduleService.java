package com.lanshiqin.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.lanshiqin.entity.Schedule;
import com.lanshiqin.dao.SchedulesDao;

@Service
public class ScheduleService{

    @Resource
    private SchedulesDao schedulesDao;

    public int insert(String date_s, 
    		String team_f, 
    		String team_s, 
    		String department_f, 
    		String department_s, 
    		int group_s){
        return schedulesDao.insert(date_s,
        		team_f,
        		team_s,
        		department_f,
        		department_s,
        		group_s);
    }
    
    public void delete(int group_s){
    	schedulesDao.delete(group_s);
    }
    
    public List<Schedule> queryAll(){
        return schedulesDao.queryAll();
    }
    
    public List<Schedule> query(int gn){
        return schedulesDao.query(gn);
    }
    
    public List<Schedule> queryTeamName(String team_name){
        return schedulesDao.queryTeamName(team_name);
    }
    
}
