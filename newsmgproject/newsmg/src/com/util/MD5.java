package com.util;

import java.security.MessageDigest;

public class MD5 {
	
	public static String MD5Code(String src)
	{
		
		
		String encoding=null;
		
		try
		{
		
			MessageDigest md = MessageDigest.getInstance("MD5");
		 
			byte[] md5 =  md.digest(src.getBytes());
			 
			StringBuilder su = new StringBuilder();  
	         //byte array switch hexadecimal number.  
	         for(int offset = 0,bLen = md5.length; offset < bLen; offset++){  
	             String haxHex = Integer.toHexString(md5[offset] & 0xFF);  
	             if(haxHex.length() < 2){  
	                 su.append("0");  
	             }  
	             su.append(haxHex);  
	         } 
			
		   encoding=su.toString();
		}
		catch(Exception e)
		{
			
			
		}
		return encoding;
	}

}
