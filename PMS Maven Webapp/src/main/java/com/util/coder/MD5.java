package com.util.coder;

import java.security.MessageDigest;

import org.apache.log4j.Logger;

/**
 * @Description:    MD5工具类
 * @author          HuangPeng
 * @date:           2017年4月15日
 */
public class MD5
{
	private MD5(){
		
	}
  private static Logger LOGGER=Logger.getLogger(MD5.class);
  private static final String[] hexDigits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

  public static String byteArrayToHexString(byte[] b) {
    StringBuilder resultSb = new StringBuilder();
    for (int i = 0; i < b.length; i++) {
      resultSb.append(byteToHexString(b[i]));
    }
    return resultSb.toString();
  }

  private static String byteToHexString(byte b) {
    int n = b;
    if (n < 0) {
      n = 256 + n;
    }
    int d1 = n / 16;
    int d2 = n % 16;
    return hexDigits[d1] + hexDigits[d2];
  }

  public static String getMD5Encode(String origin)
  {
    String resultString = null;
    try {
      resultString = new String(origin);
      MessageDigest md = MessageDigest.getInstance("MD5");
      resultString = byteArrayToHexString(md.digest(resultString.getBytes()));
    } catch (Exception e) {
    	LOGGER.error("getMD5Encode异常,加密串:"+origin+";Exception:"+e.getMessage());
    }
    resultString=resultString==null?"":resultString;
    return resultString.toUpperCase();
  }
}
