package com.lanshiqin.entity;

public class Match {
	private int id;
	private String team_f;
	private String department_f;
	private String team_s;
	private String department_s;
    private String date_s;
    
    public Match() {}
    
    public Match(int id, Team teama, Team teamb, String date_s) {
    	this.id = id;
    	this.team_f = teama.getName();
    	this.team_s = teamb.getName();
    	this.department_f = teama.getDepartment();
    	this.department_s = teamb.getDepartment();
    	this.date_s = date_s;
    }
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeam_f() {
		return team_f;
	}
	public void setTeam_f(String team_f) {
		this.team_f = team_f;
	}
	public String getDepartment_f() {
		return department_f;
	}
	public void setDepartment_f(String department_f) {
		this.department_f = department_f;
	}
	public String getTeam_s() {
		return team_s;
	}
	public void setTeam_s(String team_s) {
		this.team_s = team_s;
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
