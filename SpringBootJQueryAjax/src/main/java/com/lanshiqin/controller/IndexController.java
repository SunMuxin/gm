package com.lanshiqin.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.lanshiqin.entity.Team;
import com.lanshiqin.filter.ResultMsg;
import com.lanshiqin.service.GroupService;
import com.lanshiqin.service.TeamService;
import com.lanshiqin.util.LoginUtil;
import com.lanshiqin.util.RandomUtil;

/**
 * Created by 蓝士钦 on 29/04/2017.
 * 根控制器
 */
@EnableAutoConfiguration
@RestController
@Controller
public class IndexController {
	
	@Autowired
    private GroupService groupService; 
	
	@Autowired
    private TeamService teamService;  // 注入文章Service
	
	private static Random rng = new Random();

    /**
     * 主页
     * @return 主页模版
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    /**
     * 关于
     * @return 关于模版
     */
    @RequestMapping(value = "about", method = RequestMethod.GET)
    public String about(){
        return "about";
    }

    /**
     * 登录
     * @return 登录模版
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(HttpServletRequest request){
    	String name = request.getParameter("name");
    	String password = request.getParameter("password");
    	Team team = this.authorize(name, password);
        Gson gson = new Gson();
    	if (team != null){
    		String uuid = RandomUtil.getUUID();
    		LoginUtil.putUser(uuid, team);
            return gson.toJson(new ResultMsg("200", uuid));
    	}
        return gson.toJson(new ResultMsg("201", null));
    }
    
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register(HttpServletRequest request){
    	try {
	    	String name = request.getParameter("name");
	    	String password = request.getParameter("password");
	    	String department = request.getParameter("department");
	        Gson gson = new Gson();
	        if (name!=null && password!=null && department!=null){
	        	Team team = new Team(name, password, department, "user");
	            teamService.insert(team);
	            groupService.insert(name, rng.nextInt(4));
	            String uuid = RandomUtil.getUUID();
	            LoginUtil.putUser(uuid, team);
	            return gson.toJson(new ResultMsg("200", uuid));
	        }
	        return gson.toJson(new ResultMsg("201", null));
    	} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
    
    private Team authorize(String name, String password) {
    	List<Team> teams = teamService.query(name, password);
    	if (teams.size() != 1) return null;
    	return teams.get(0);
    }
    
    @RequestMapping(value = "updateTeamGroup", method = RequestMethod.GET)
    public String updateGroup() {
    	List<Team> teams = teamService.queryAll();
    	groupService.delete();
    	int[] count = new int[4];
    	for (Team team : teams) {
    		int r = rng.nextInt(4);
    		count[r] ++;
            groupService.insert(team.getName(), r);
    	}
    	String msg = "{0:"+count[0]+",1:"+count[1]+",2:"+count[2]+",3:"+count[3]+"}";
        return new Gson().toJson(new ResultMsg("200", msg));
    }
}
