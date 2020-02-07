package com.GHD.util;

import java.util.Random;

public class GenerateCode {
	public static String code = "";
	public static String getCode() {
		String str="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
		code = "";
        Random r=new Random();
        String arr[]=new String [4];
        for(int i=0;i<4;i++)
        {
            int n=r.nextInt(62);
        
            arr[i]=str.substring(n,n+1);
            code+=arr[i];
        }
		return code;
	}
}
