package com.lxit.crmsystem.util;


import java.text.SimpleDateFormat;
import java.util.Date;

public class Serialnumber {
	    /** 
	     * 获取现在时间 
	     * @return返回字符串格式yyyyMMddHHmmss 
	     */  
	      public static String getStringDate() {  
	             Date currentTime = new Date();  
	             SimpleDateFormat formatter = new SimpleDateFormat("yyyyHHmmss");  
	             String dateString = formatter.format(currentTime);  
	             return dateString;  
	          }  
	      /** 
	       * 由年月日时分秒+3位随机数 
	       * 生成流水号 
	       * @return 
	       */  
	      public static String Getnum(String par){  
	          String t = getStringDate();  
	          int x=(int)(Math.random()*900)+100;  
	          String serial = t + x;  
	          return par+serial.substring(7);  
	      }  
	    
	  
}