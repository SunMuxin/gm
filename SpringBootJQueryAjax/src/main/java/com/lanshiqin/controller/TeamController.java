package com.lanshiqin.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.lanshiqin.entity.Department;
import com.lanshiqin.entity.DepartmentNumber;
import com.lanshiqin.entity.Group;
import com.lanshiqin.entity.Member;
import com.lanshiqin.entity.RefuseDate;
import com.lanshiqin.entity.Schedule;
import com.lanshiqin.entity.Team;
import com.lanshiqin.filter.ResultMsg;
import com.lanshiqin.service.GroupService;
import com.lanshiqin.service.MemberService;
import com.lanshiqin.service.RefuseDateService;
import com.lanshiqin.service.ScheduleService;
import com.lanshiqin.service.TeamService;
import com.lanshiqin.util.LoginUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@EnableAutoConfiguration
@RestController
@RequestMapping("team")
public class TeamController {

    @Autowired
    private TeamService teamService; 
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private RefuseDateService refuseDateService;

    @Autowired
    private ScheduleService scheduleService;
    
    @Autowired
    private GroupService groupService; 
    /**
     * 所有文章
     * @param model
     * @return
     */
    @RequestMapping(value = "allTeam", method = RequestMethod.GET)
    public String allTeam(){
    	return new Gson().toJson(teamService.queryAll(),  new TypeToken<List<Team>>(){}.getType());
    }
    
    @RequestMapping(value = "addMember", method = RequestMethod.GET)
    public String addMember(HttpServletRequest request){
    	
        try{
        	Gson gson = new Gson();
        	String uuid = request.getParameter("uuid");
        	String email = request.getParameter("email");
        	String name = request.getParameter("name");
        	String phone = request.getParameter("phone");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null) {
        		return gson.toJson(new ResultMsg("201", uuid));
        	}
        	String team_name = team.getName();
        	String department = team.getDepartment();
        	Member member = new Member(name, email, phone, department, team_name);
        	memberService.insert(member);
            return gson.toJson(new ResultMsg("200", uuid));
        } catch (Exception e) {
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
    	}
    }
    
    @RequestMapping(value = "allMember", method = RequestMethod.GET)
    public String allMember(HttpServletRequest request){
    	try{
    		Gson gson = new Gson();
        	String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null) {
        		return gson.toJson(new ResultMsg("201", uuid));
        	}
        	if (team.getType().equals("user")){
	        	String team_name = team.getName();
	        	String msg = new Gson().toJson(memberService.query(team_name),  new TypeToken<List<Department>>(){}.getType());
	        	return gson.toJson(new ResultMsg("200", msg));
        	} else if (team.getType().equals("admin")) {
	        	String msg = new Gson().toJson(memberService.queryAll(),  new TypeToken<List<Department>>(){}.getType());
	        	return gson.toJson(new ResultMsg("200", msg));
        	}
    		return gson.toJson(new ResultMsg("201", uuid));
        } catch (Exception e) {
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
    	}
    }
    
    @RequestMapping(value = "updateSchedule", method = RequestMethod.GET)
    public String updateSchedule(HttpServletRequest request){
    	try{
    		Gson gson = new Gson();
        	String date_s = request.getParameter("date_s");
        	String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null) {
        		return gson.toJson(new ResultMsg("201", uuid));
        	}
        	String team_name = team.getName();
        	List<RefuseDate> refuseDates = refuseDateService.query(team_name, date_s);
        	if (refuseDates!=null && refuseDates.size() > 0){
    	    	for (RefuseDate refuseDate : refuseDates) {
    	    		refuseDateService.delete(refuseDate.getId());
    	    	}
    	    	return gson.toJson(new ResultMsg("200", "del"));
        	}
    		refuseDateService.insert(team_name, date_s);
        	return gson.toJson(new ResultMsg("200", "add"));
        } catch (Exception e) {
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
    	}
    }
    
    @RequestMapping(value = "allSchedule", method = RequestMethod.GET)
    public String allSchedule(HttpServletRequest request){
    	try{
	    	Gson gson = new Gson();
	    	String uuid = request.getParameter("uuid");
	    	Team team = LoginUtil.getUser(uuid);
	    	if (team == null) {
	    		return gson.toJson(new ResultMsg("201", uuid));
	    	}
	    	String team_name = team.getName();
	    	String msg = new Gson().toJson(refuseDateService.query(team_name),  new TypeToken<List<RefuseDate>>(){}.getType());
	    	return gson.toJson(new ResultMsg("200", msg));
    	} catch (Exception e) {
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
    	}
    }
    
    @RequestMapping(value = "departmentMemberNumber", method = RequestMethod.GET)
    public String departmentNumber(){
    	try{
    		List<Member> members = memberService.queryAll();
        	Map<String, Integer> num = new HashMap<String, Integer>();
        	for (Member member : members) {
        		Integer value = num.getOrDefault(member.getDepartment(), Integer.valueOf(0)) + 1;
        		num.put(member.getDepartment(), value);
        	}
        	List<DepartmentNumber> msg = new ArrayList<DepartmentNumber>();
        	for (Map.Entry<String, Integer> entry : num.entrySet()) {
        		msg.add(new DepartmentNumber(entry.getValue(), entry.getKey()));
        	}
        	return new Gson().toJson(new ResultMsg("200", new Gson().toJson(msg, new TypeToken<List<DepartmentNumber>>(){}.getType())));
        } catch (Exception e) {
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
    	}
    }
    
    @RequestMapping(value = "departmentTeamNumber", method = RequestMethod.GET)
    public String departmentTeamNumber(){
    	try{
    		List<Team> teams = teamService.queryAll();
        	Map<String, Integer> num = new HashMap<String, Integer>();
        	for (Team team : teams) {
        		Integer value = num.getOrDefault(team.getDepartment(), Integer.valueOf(0)) + 1;
        		num.put(team.getDepartment(), value);
        	}
        	List<DepartmentNumber> msg = new ArrayList<DepartmentNumber>();
        	for (Map.Entry<String, Integer> entry : num.entrySet()) {
        		msg.add(new DepartmentNumber(entry.getValue(), entry.getKey()));
        	}
        	return new Gson().toJson(new ResultMsg("200", new Gson().toJson(msg, new TypeToken<List<DepartmentNumber>>(){}.getType())));
        } catch (Exception e) {
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
    	}
    }
    
    @RequestMapping(value = "teamSchedule", method = RequestMethod.GET)
    public String teamSchedule(HttpServletRequest request){
    	try {
    		String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
        	String team_name = team.getName();
			List<Schedule> schedules = scheduleService.queryTeamName(team_name);
    		return new Gson().toJson(new ResultMsg("200", 
    				new Gson().toJson(schedules, new TypeToken<List<Schedule>>(){}.getType())));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
    
    @RequestMapping(value = "last", method = RequestMethod.GET)
    public String last(HttpServletRequest request){
    	try {
    		String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
        	String team_name = team.getName();
			List<Group> groups = groupService.query(team_name);
    		return new Gson().toJson(new ResultMsg("200", 
    				new Gson().toJson(groups, new TypeToken<List<Group>>(){}.getType())));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
}
