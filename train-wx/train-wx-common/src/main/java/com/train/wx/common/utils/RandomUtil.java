package com.train.wx.common.utils;

import java.util.Random;

public class RandomUtil {
	public static final String base = "abcdefghijklmnopqrstuvwxyz0123456789";
	/**
	 * 产生随机数
	 * @param length
	 * @return
	 */
	public static String getRandomString(int length) {
	    Random random = new Random();
	    StringBuffer sb = new StringBuffer();
	    for (int i = 0; i < length; i++) {
	        int number = random.nextInt(base.length());
	        sb.append(base.charAt(number));
	    }
	    return sb.toString();
	 }
}
