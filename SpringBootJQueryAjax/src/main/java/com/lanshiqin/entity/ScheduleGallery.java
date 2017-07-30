package com.lanshiqin.entity;

import java.util.ArrayList;
import java.util.List;

public class ScheduleGallery {
	public static class Node {
		private String name = null;
		public Node(String name) {
			this.name = name;
		}
	}
	public static class Link {
		private String source = null;
		private String target = null;
		private Integer value = null;
		
		public Link(String source, String target, Integer value) {
			this.source = source;
			this.target = target;
			this.value = value;
		}
	}
	
	private List<Node> nodes = new ArrayList<Node>();
	private List<Link> links = new ArrayList<Link>();
	
	public List<Node> getNodes() {
		return this.nodes;
	}
	public List<Link> getLinks() {
		return this.links;
	}
}
