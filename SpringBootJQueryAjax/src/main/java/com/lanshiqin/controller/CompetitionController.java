package com.lanshiqin.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.lanshiqin.entity.Group;
import com.lanshiqin.entity.Match;
import com.lanshiqin.entity.RefuseDate;
import com.lanshiqin.entity.Schedule;
import com.lanshiqin.entity.ScheduleGallery;
import com.lanshiqin.entity.ScheduleGallery.Link;
import com.lanshiqin.entity.ScheduleGallery.Node;
import com.lanshiqin.entity.Team;
import com.lanshiqin.filter.ResultMsg;
import com.lanshiqin.service.GroupService;
import com.lanshiqin.service.RefuseDateService;
import com.lanshiqin.service.ScheduleService;
import com.lanshiqin.service.TeamService;
import com.lanshiqin.util.BipartiteMatching;
import com.lanshiqin.util.Entry;
import com.lanshiqin.util.LoginUtil;
import com.lanshiqin.util.Triple;

@EnableAutoConfiguration
@RestController
@RequestMapping("competition")
public class CompetitionController {

    @Autowired
    private RefuseDateService refuseDateService;
    
    @Autowired
    private TeamService teamService; 
    
    @Autowired
    private GroupService groupService; 
    
    @Autowired
    private ScheduleService scheduleService;
    
    private boolean check(String team_name, 
    		String date_s, 
    		List<RefuseDate> refuseDates) {
    	for (RefuseDate r : refuseDates) {
    		if (!r.getTeam_name().equals(team_name)) continue;
    		if (!r.getDate_s().equals(date_s)) continue;
    		return false;
    	}
    	return true;
    }
        
	@RequestMapping(value = "updateSchedule", method = RequestMethod.GET)
    public String updateSchedule(HttpServletRequest request){
		try {
			String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null || !team.getType().equals("admin")) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
			int gn = Integer.parseInt(request.getParameter("gn").trim());
			int cn = Integer.parseInt(request.getParameter("cn").trim());
			List<RefuseDate> refuseDates = refuseDateService.queryAll();
	    	List<Team> teams = teamService.queryAll();
	    	List<Group> groups = groupService.queryAll();
	    	Set<String> avs = new HashSet<String>();
	    	for (Group g : groups) {
	    		if (g.getGroup_s() != gn) continue;
	    		avs.add(g.getName());
	    	}
	    	BipartiteMatching<Match, String> bm = new BipartiteMatching<Match, String>();
	    	for (int f = 0; f < teams.size(); f++) {
	    		Team tf = teams.get(f);
	    		if (!avs.contains(tf.getName())) continue;
	    		for (int s = f+1; s < teams.size(); s++) {
	    			Team ts = teams.get(s);
	    			if (!avs.contains(ts.getName())) continue;
		    		Match match = new Match(-1, tf, ts, null);
		    		for (int cc = 0; cc < cn; cc++) {
			    		for (int i = 1; i <= 30; i++) {
			    			String date_s = "2017-09-" + (i<10?"0":"") + i;
			    			if (!check(tf.getName(), date_s, refuseDates)) continue;
			    			if (!check(ts.getName(), date_s, refuseDates)) continue;
			    			String time = (cc+11<10)?"0":"" + (cc+11) + ":00";
			    			bm.addEdge(match, date_s + " " + time);
			    		}
			    		for (int i = 1; i <= 31; i++) {
			    			String date_s = "2017-10-" + (i<10?"0":"") + i;
			    			if (!check(tf.getName(), date_s, refuseDates)) continue;
			    			if (!check(ts.getName(), date_s, refuseDates)) continue;
			    			String time = (cc+11<10)?"0":"" + (cc+11) + ":00";
			    			bm.addEdge(match, date_s + " " + time);
			    		}
		    		}
		    	}
	    	}
	    	Map<String, Match> bs = bm.solve();
	    	if (bs == null) {
	    		return new Gson().toJson(new ResultMsg("201", "time is not enough"));
	    	}
	    	String msg = new Gson().toJson(new Triple(bs.size(), bm.fsize(), (100*bs.size()/bm.fsize()) + "%"));
			List<Map.Entry<String, Match>> schedules =
			    new ArrayList<Map.Entry<String, Match>>(bs.entrySet());
			Collections.sort(schedules, new Comparator<Map.Entry<String, Match>>() {   
			    public int compare(Map.Entry<String, Match> o1, Map.Entry<String, Match> o2) {      
			        //return (o2.getValue() - o1.getValue()); 
			        return (o1.getKey()).toString().compareTo(o2.getKey());
			    }
			}); 
			scheduleService.delete(gn);
			for (Map.Entry<String, Match> schedule : schedules) {
				scheduleService.insert(schedule.getKey(),
						schedule.getValue().getTeam_f(),
						schedule.getValue().getTeam_s(), 
						schedule.getValue().getDepartment_f(),
						schedule.getValue().getDepartment_s(),
						gn);
			}
    		return new Gson().toJson(new ResultMsg("200", 
    				msg));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
    
	@RequestMapping(value = "allSchedule", method = RequestMethod.GET)
    public String allSchedule(HttpServletRequest request){
    	try {
			List<Schedule> schedules = scheduleService.queryAll();
    		return new Gson().toJson(new ResultMsg("200", 
    				new Gson().toJson(schedules, new TypeToken<List<Schedule>>(){}.getType())));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
	
    @RequestMapping(value = "groupSchedule", method = RequestMethod.GET)
    public String groupSchedule(HttpServletRequest request){
    	try {
    		String uuid = request.getParameter("uuid");
        	Team team = LoginUtil.getUser(uuid);
        	if (team == null || !team.getType().equals("admin")) {
        		return new Gson().toJson(new ResultMsg("201", uuid));
        	}
			int gn = Integer.parseInt(request.getParameter("gn").trim());
			List<Schedule> schedules = scheduleService.query(gn);
    		return new Gson().toJson(new ResultMsg("200", 
    				new Gson().toJson(schedules, new TypeToken<List<Schedule>>(){}.getType())));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
    
    @RequestMapping(value = "groupScheduleGallery", method = RequestMethod.GET)
    public String groupScheduleGallery(HttpServletRequest request){
    	try {
			List<Schedule> schedules = scheduleService.queryAll();
			Set<String> nodes = new HashSet<String>();
			Map<Entry<String, String>, Integer> edges = new HashMap<Entry<String, String>, Integer>();
			for (Schedule schedule : schedules) {
				String a = schedule.getDepartment_f() + "-";
				String b = schedule.getDepartment_s() + "+";
				nodes.add(a);
				nodes.add(b);
				Entry<String, String> edgeA = new Entry<String, String>(a, b);
				Integer valueA = edges.getOrDefault(edgeA, Integer.valueOf(0));
				valueA += 1;
				edges.put(edgeA, valueA);
				String c = schedule.getDepartment_s() + "-";
				String d = schedule.getDepartment_f() + "+";
				nodes.add(c);
				nodes.add(d);
				Entry<String, String> edgeB = new Entry<String, String>(c, d);
				Integer valueB = edges.getOrDefault(edgeB, Integer.valueOf(0));
				valueB += 1;
				edges.put(edgeB, valueB);
			}
			ScheduleGallery gallery = new ScheduleGallery();
			for (String name : nodes) {
				gallery.getNodes().add(new Node(name));
			}
			for (Map.Entry<Entry<String, String>, Integer> entry : edges.entrySet()) {
				gallery.getLinks().add(new Link(entry.getKey().getFirst(), 
						entry.getKey().getSecond(),
						entry.getValue()));
			}
    		return new Gson().toJson(new ResultMsg("200", 
    				new Gson().toJson(gallery, ScheduleGallery.class)));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
    
    @RequestMapping(value = "important", method = RequestMethod.GET)
    public String important(HttpServletRequest request){
		try {
			List<RefuseDate> refuseDates = refuseDateService.queryAll();
	    	Map<String, Integer> data = new HashMap<String, Integer>();
	    	for (int i = 1; i <= 30; i++) {
    			String date_s = "2017-09-" + (i<10?"0":"") + i;
    			data.put(date_s, 0);
    		}
    		for (int i = 1; i <= 31; i++) {
    			String date_s = "2017-10-" + (i<10?"0":"") + i;
    			data.put(date_s, 0);
    		}
    		for (RefuseDate r : refuseDates) {
    			int value = data.get(r.getDate_s()) + 1;
    			data.put(r.getDate_s(), value);
        	}
			List<Map.Entry<String, Integer>> datas =
			    new ArrayList<Map.Entry<String, Integer>>(data.entrySet());
			Collections.sort(datas, new Comparator<Map.Entry<String, Integer>>() {   
			    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
			        //return (o2.getValue() - o1.getValue()); 
			        return (o1.getKey()).toString().compareTo(o2.getKey());
			    }
			});
	    	String msg = new Gson().toJson(datas);
    		return new Gson().toJson(new ResultMsg("200", msg));
		} catch (Exception e){
			e.printStackTrace();
    		return new Gson().toJson(new ResultMsg("201", e.getMessage()));
		}
    }
}
