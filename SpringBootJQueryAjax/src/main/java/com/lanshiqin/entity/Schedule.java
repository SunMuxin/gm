package com.lanshiqin.entity;

public class Schedule {
	private int group_s;
	private String team_f;
	private String team_s;
	private String department_f;
	private String department_s;
	private String date_s;
	
	public Schedule() {}
	public Schedule(String date_s, 
    		String team_f, 
    		String team_s, 
    		String department_f, 
    		String department_s, 
    		int group_s) {
		this.date_s = date_s;
		this.team_f = team_f;
		this.team_s = team_s;
		this.department_f = department_f;
		this.department_s = department_s;
		this.group_s = group_s;
	}
	public int getGroup_s() {
		return group_s;
	}
	public void setGroup_s(int group_s) {
		this.group_s = group_s;
	}
	public String getTeam_f() {
		return team_f;
	}
	public void setTeam_f(String team_f) {
		this.team_f = team_f;
	}
	public String getTeam_s() {
		return team_s;
	}
	public void setTeam_s(String team_s) {
		this.team_s = team_s;
	}
	public String getDepartment_f() {
		return department_f;
	}
	public void setDepartment_f(String department_f) {
		this.department_f = department_f;
	}
	public String getDepartment_s() {
		return department_s;
	}
	public void setDepartment_s(String department_s) {
		this.department_s = department_s;
	}
	public String getDate_s() {
		return date_s;
	}
	public void setDate_s(String date_s) {
		this.date_s = date_s;
	}
}
