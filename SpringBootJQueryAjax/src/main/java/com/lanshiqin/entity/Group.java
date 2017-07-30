package com.lanshiqin.entity;

public class Group {
	private int group_s;
    private String name;
    
    public Group() {}
    
    public Group(int group_s, String name) {
    	this.group_s = group_s;
    	this.name = name;
    }
    
    public int getGroup_s() {
    	return this.group_s;
    }
    public void setGroup_s(int group_s) {
    	this.group_s = group_s;
    }
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
