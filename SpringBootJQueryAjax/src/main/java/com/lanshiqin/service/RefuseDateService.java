package com.lanshiqin.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.lanshiqin.entity.RefuseDate;
import com.lanshiqin.dao.RefuseDateDao;

@Service
public class RefuseDateService{

    @Resource
    private RefuseDateDao refuseDateDao;

    public int insert(String t_name, String date_s){
        return refuseDateDao.insert(new RefuseDate(-1, date_s, t_name));
    }
    
    public void delete(Integer id){
    	refuseDateDao.delete(id);
    }
    
    public List<RefuseDate> queryAll(){
        return refuseDateDao.queryAll();
    }
    
    public List<RefuseDate> query(String t_name, String date_s){
        return refuseDateDao.query(t_name, date_s);
    }
    
    public List<RefuseDate> query(String t_name){
        return refuseDateDao.queryTeamName(t_name);
    }
}
