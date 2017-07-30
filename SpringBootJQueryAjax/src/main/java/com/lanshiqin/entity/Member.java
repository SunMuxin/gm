package com.lanshiqin.entity;

public class Member {
    private String name;
    private String email;
    private String phone;
    private String department;
    private String team_name;
	
    public Member(String name,
    		String email,
    		String phone,
    		String department,
    		String team_name) {
    	this.name = name;
    	this.email = email;
    	this.phone = phone;
    	this.department = department;
    	this.team_name = team_name;
    }
    
    public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
