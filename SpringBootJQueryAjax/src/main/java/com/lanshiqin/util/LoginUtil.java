package com.lanshiqin.util;

import java.util.HashMap;
import java.util.Map;

import com.lanshiqin.entity.Team;

public class LoginUtil {
    private static Map<String, Team> UUID2User = new HashMap<String, Team>();
    
    public static Team getUser(String uuid) {
    	return UUID2User.getOrDefault(uuid, null);
    }
    
    public static void putUser(String uuid, Team team) {
    	UUID2User.put(uuid, team);
    }
}
