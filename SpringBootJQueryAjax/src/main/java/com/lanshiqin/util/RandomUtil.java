package com.lanshiqin.util;

import java.util.Random;
import java.util.UUID;

public class RandomUtil {
	public static Random rng = new Random();
	
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}
}
