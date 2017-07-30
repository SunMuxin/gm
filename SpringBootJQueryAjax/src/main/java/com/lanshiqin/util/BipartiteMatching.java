package com.lanshiqin.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class BipartiteMatching <F, S> {
	private final Set<F> nodef;
	private final Set<S> nodes;
	private final Map<F,Set<S>> edges;
	
	private Map<S, F> matchs = null;
	private Set<S> used = null;
	
	public BipartiteMatching() {
		this.nodef = new HashSet<F>();
		this.nodes = new HashSet<S>();
		this.edges = new HashMap<F,Set<S>>();
	}
	
	public void addEdge(F f, S s) {
		nodef.add(f);
		nodes.add(s);
		Set<S> fs = edges.getOrDefault(f, new HashSet<S>());
		fs.add(s);
		edges.put(f, fs);
	}
	
	private boolean found(F f) {
		List<S> fs = new ArrayList<S>(edges.getOrDefault(f, new HashSet<S>()));
		Collections.shuffle(fs);
		for (S s : fs) {
			if (used.contains(s)) continue;
			used.add(s);
			if (!matchs.containsKey(s) || found(matchs.get(s))) {
				matchs.put(s, f);
				return true;
			}
		}
		return false;
	}
	
	public int fsize() {
		return this.nodef.size();
	}
	
	public int ssize() {
		return this.nodes.size();
	}
	
	public Map<S, F> solve() {
		matchs = new HashMap<S, F>();
		for (F f : nodef) {
			used = new HashSet<S>();
			found(f);
		}
		return matchs;
	}
}
