package com.lanshiqin.entity;

public class Team {
    private String name;
    private String password;
    private String department;
	private String type;
    
    public Team(String name, String password, String department, String type) {
    	this.name = name;
    	this.password = password;
    	this.department = department;
    	this.type = type;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
    
  
}
