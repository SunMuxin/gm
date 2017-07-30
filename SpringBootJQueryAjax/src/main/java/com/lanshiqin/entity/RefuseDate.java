package com.lanshiqin.entity;

public class RefuseDate {
    private int id;
    private String date_s;
    private String team_name;
	
    public RefuseDate() {};
    public RefuseDate(int id,
    		String date_s,
    		String team_name) {
    	this.id = id;
    	this.date_s = date_s;
    	this.team_name = team_name;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate_s() {
		return date_s;
	}

	public void setDate_s(String date_s) {
		this.date_s = date_s;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
    
}
