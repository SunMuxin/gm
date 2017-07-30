package com.lanshiqin.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.lanshiqin.entity.Department;
import com.lanshiqin.dao.DepartmentDao;

@Service
public class DepartmentService{

    @Resource
    private DepartmentDao departmentDao;

    public int insert(String name){
        return departmentDao.insert(name);
    }
    
    public void delete(Integer id){
    	departmentDao.delete(id);
    }
    
    public List<Department> queryAll(){
        return departmentDao.queryAll();
    }
}
