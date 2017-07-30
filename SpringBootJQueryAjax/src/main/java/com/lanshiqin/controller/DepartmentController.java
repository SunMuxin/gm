package com.lanshiqin.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.lanshiqin.entity.Department;
import com.lanshiqin.entity.Team;
import com.lanshiqin.filter.ResultMsg;
import com.lanshiqin.service.DepartmentService;
import com.lanshiqin.util.LoginUtil;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@EnableAutoConfiguration
@RestController
@RequestMapping("department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "addDepartment", method = RequestMethod.GET)
    public String addDepartment(HttpServletRequest request){
        try {
    		String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null || !team.getType().equals("admin")) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
        	String name = request.getParameter("name");
            if (name!=null && !name.equals("")){
                departmentService.insert(name);
                return new Gson().toJson(new ResultMsg("200", "ok"));
            }
            return new Gson().toJson(new ResultMsg("201", "error"));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
    
    @RequestMapping(value = "delDepartment", method = RequestMethod.GET)
    public String delDepartment(HttpServletRequest request){
    	
    	try {
    		String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null || !team.getType().equals("admin")) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
        	String id = request.getParameter("id");
        	departmentService.delete(Integer.valueOf(id.trim()));
            return new Gson().toJson(new ResultMsg("200", "ok"));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }

    @RequestMapping(value = "allDepartment", method = RequestMethod.GET)
    public String allDepartment(HttpServletRequest request){
    	try {
    		String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null || !team.getType().equals("admin")) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
            return new Gson().toJson(new ResultMsg("200", 
            		new Gson().toJson(departmentService.queryAll(),  new TypeToken<List<Department>>(){}.getType())));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
}
