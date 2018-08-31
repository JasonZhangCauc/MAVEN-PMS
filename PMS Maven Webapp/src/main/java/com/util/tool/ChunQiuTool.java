package com.util.tool;

/**
 * @Description:    工具类
 * @author          HuangPeng
 * @date:           2017年4月15日
 */
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.TimeZone;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class ChunQiuTool {

	private static final Logger logger = Logger.getLogger(ChunQiuTool.class);
    public ChunQiuTool() {}
    
    public final static String convertNull(String p0) {
        if (p0 == null) {
            return "";
        } else {
            return p0.trim();
        }
    }

    public final static String convertNull(Double p0) {
        if (p0 == null) {
            return "";
        } else {
            return p0.toString().trim();
        }
    }

    public final static String convertNull(Integer p0) {
        if (p0 == null) {
            return "";
        } else {
            return p0.toString().trim();
        }
    }

    public final static String convertNull(Object p0) {
    	 if (p0 == null) {
	           return "";
	     } else {
	           return p0.toString().trim();
	     }
    }

    public final static boolean convertNotNull(Object p0) {
   	     if(p0!=null && StringUtils.isNotBlank(p0.toString())){
	          return true;
	     } else {
	    	  return false;
	     }
    }
    
    public final static Map<Boolean,String> convertStrNull(Object p0,int number,String str,int leng) throws UnsupportedEncodingException {
    	Map<Boolean,String> rst=new HashMap<Boolean, String>();
    	if(leng==0 && (p0==null || StringUtils.isBlank(p0.toString()))){
    		rst.put(false, "第"+ number + str + "不能为空 </br>");
    		return rst;
    	}else if(leng>0 && p0.toString().getBytes("UTF-8").length > leng){
    		rst.put(false, "第"+ number + str + "字节数不能超过  </br>" + leng);
    		return rst;
    	}else{
    		rst.put(true, p0.toString().trim());
    		return rst;
    	}
   }
    
    /**
     * @Description: 校验是否为整数
     * @author Zoudw
     * @param str
     * @return
     */
    public final static boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if(!isNum.matches()) {
			return false;
		}
		return true;
	}
    
    public final static boolean isNumber(String p0) {
        try {
            int temp = Integer.parseInt(p0);
            if (temp > 0) {
                return true;
            } else {
                return false;
            }
        } catch (NumberFormatException nfe) {
        	logger.error(nfe);
            return false;
        }
    }

    public final static int strToInt(String p0) {
        if (p0 == null || p0.equalsIgnoreCase("")) {
            return 0;
        } else {
            try {
                return Integer.parseInt(p0);
            } catch (NumberFormatException nfe) {
            	logger.error(nfe);
                return 0;
            }
        }
    }

    public final static float strToFloat(String p0) {
        if (p0 == null || p0.equalsIgnoreCase("")) {
            return 0;
        } else {
            try {
                return Float.parseFloat(p0);
            } catch (NumberFormatException nfe) {
            	logger.error(nfe);
                return 0;
            }
        }
    }

    public final static double strToDouble(String p0) {
        if (p0 == null || p0.equalsIgnoreCase("")) {
            return 0;
        } else {
            try {
                return Double.parseDouble(p0);
            } catch (NumberFormatException nfe) {
            	logger.error(nfe);
                return 0;
            }
        }
    }

    //解决java中对float不准的毛病
    public static float getFloNum(float num, int n) {
        int dd = 1;
        float tempnum;
        int tnum;
        for (int i = 0; i < n; i++) {
            dd *= 10;
        }
        tempnum = num * dd;
        tnum = Math.round(tempnum);
        return ((float) tnum / dd);
    }

    /**
     * 得到两个日期的天数差值（计算宾馆入住天数）
     * @param date1 日期1（YYYY-MM-DD）
     * @param date2 日期2（YYYY-MM-DD）
     * @return date2-date1-1
     * @throws Exception
     */
    public int getDateDiff(String date1, String date2) throws Exception {
        if (date1 == null || date2 == null) {
            throw new Exception("日期不能为空！");
        }

        int result = 0;

        try {
            StringTokenizer tokens = new StringTokenizer(date1, "-");
            int y1 = 0;
            int y2 = 0;
            int m1 = 0;
            int m2 = 0;
            int d1 = 0;
            int d2 = 0;
            if (tokens.hasMoreTokens()) {
                y1 = Integer.valueOf(tokens.nextToken()).intValue();
            } else {
                throw new Exception("日期1格式错误！");
            }
            if (tokens.hasMoreTokens()) {
                m1 = Integer.valueOf(tokens.nextToken()).intValue();
            } else {
                throw new Exception("日期1格式错误！");
            }
            if (tokens.hasMoreTokens()) {
                d1 = Integer.valueOf(tokens.nextToken()).intValue();
            } else {
                throw new Exception("日期1格式错误！");
            }

            tokens = new StringTokenizer(date2, "-");
            if (tokens.hasMoreTokens()) {
                y2 = Integer.valueOf(tokens.nextToken()).intValue();
            } else {
                throw new Exception("日期2格式错误！");
            }
            if (tokens.hasMoreTokens()) {
                m2 = Integer.valueOf(tokens.nextToken()).intValue();
            } else {
                throw new Exception("日期2格式错误！");
            }
            if (tokens.hasMoreTokens()) {
                d2 = Integer.valueOf(tokens.nextToken()).intValue();
            } else {
                throw new Exception("日期2格式错误！");
            }
            Calendar c1 = Calendar.getInstance();
            c1.set(Calendar.YEAR, y1);
            c1.set(Calendar.MONTH, m1);
            c1.set(Calendar.DATE, d1);

            Calendar c2 = Calendar.getInstance();
            c2.set(Calendar.YEAR, y2);
            c2.set(Calendar.MONTH, m2);
            c2.set(Calendar.DATE, d2);

            long c1_m = c1.getTimeInMillis();
            long c2_m = c2.getTimeInMillis();

            result = (int) ((c2_m - c1_m) / 86400000 - 1);

        } catch (Exception e) {
        	logger.error(e);
            throw new Exception("日期格式错误！（YYYY-MM-DD）");
        }
        return result;
    }

    /**
     * GBK 转 UTF8
     */
    public static String GBKtoUTF8(String str) throws Exception {
        String temp = "";
        if (null == str) {
            return temp;
        }
        if (str.trim() == "") {
            return temp;
        }
        try {
            if (isGBK(str)) {
                temp = new String(str.getBytes("GBK"), "UTF-8");
            }
        } catch (Exception e) {
        	logger.error(e);
            throw new Exception("Encode error");
        }
        return temp;
    }

    /**
     * UTF8 转 GBK
     */
    public static String UTF8toGBK(String str) throws Exception {
        String temp = "";
        if (null == str) {
            return temp;
        }
        if (str.trim() == "") {
            return temp;
        }
        try {
            if (isUTF8(str)) {
                temp = new String(str.getBytes("UTF-8"), "GBK");
            }
        } catch (Exception e) {
        	logger.error(e);
            throw new Exception("Encode error");
        }
        return temp;
    }

    /**
     * 是否 GBK
     */
    public static boolean isGBK(String str) throws Exception {
        boolean temp = false;
        if (null == str) {
            return temp;
        }
        if (str.trim() == "") {
            return temp;
        }
        try {
            if (str.equals(new String(str.getBytes("GBK"), "GBK"))) {
                temp = true;
            }
        } catch (Exception exception) {
        	logger.error(exception);
            temp = false;
        }

        return temp;
    }

    /**
     * 是否 UTF8
     */
    public static boolean isUTF8(String str) throws Exception {
        boolean temp = false;
        if (null == str) {
            return temp;
        }
        if (str.trim() == "") {
            return temp;
        }
        try {
            if (str.equals(new String(str.getBytes("UTF-8"), "UTF-8"))) {
                temp = true;
            }
        } catch (Exception exception) {
        	logger.error(exception);
            temp = false;
        }

        return temp;
    }

    /**
     * 是否在GBK范围
     */
    public static boolean isGBKLocal(String str) throws Exception {
        if (null == str) {
            return false;
        }
        if (str.trim() == "") {
            return false;
        }
        boolean flag = false;
        String temp = str;
        try {
            for (int i = 0; i <= temp.length() - 1; i++) {
                if (i > 0 && !flag) {
                    return false;
                }
                byte[] bytes = temp.substring(i, i + 1).getBytes("GBK");
                if (bytes.length < 2) {
                    if (isACSIILocal(temp.substring(i, i + 1))) {
                        flag = true;
                        continue;
                    }
                    return false;
                }
                int h = bytes[0] & 0xff;
                int l = bytes[1] & 0xff;
                if ((h >= 129 && h <= 254) && (l >= 64 && l <= 254)) {
                    flag = true;
                    continue;
                }
                flag = false;
            }
        } catch (Exception e) {
        	logger.error(e);
            flag = false;
        }
        return flag;
    }

    /**
     * 是否在ACSII范围
     */
    public static boolean isACSIILocal(String str) throws Exception {
        if (null == str) {
            return false;
        }
        if (str.trim() == "") {
            return false;
        }
        boolean flag = false;
        int m = 0;
        try {
            for (int i = 0; i <= str.length() - 1; i++) {
                m = (int) str.charAt(i);
                if (m >= 32 && m <= 126) {
                    flag = true;
                } else {
                    flag = false;
                    break;
                }
            }
        } catch (Exception exception) {
        	logger.error(exception);
            flag = false;
        }
        return flag;
    }
    static FileInputStream fis;
    static Properties prop = new Properties();

    /**
     * 解析数据库中ERR码
     * @param Errcode 错误代码
     * @param lang    当前系统语言(session中language)
     * @return 翻译后的代码含义
     */
    public static String getErrMessage(String Errcode, String lang) {
        if (Errcode == null) {
            return "";
        } else {
            String ErrMessg = Errcode.trim();
            int post = Errcode.indexOf('#');
            String temp = "";
            if (post > 0) {
                temp = Errcode.substring(post + 1);
                Errcode = Errcode.substring(0, post);
            }

            String tmpp = "ErrorMessage_EN.properties";
            if ((lang == null) || (lang.equals("")) || (lang.indexOf("zh_cn") == -1 && lang.indexOf("zh_tw") == -1 && lang.indexOf("en") == -1 && lang.indexOf("ja") == -1)) {
                tmpp = "ErrorMessage_EN.properties";
            } else {
            	String this_lang = lang.toUpperCase();
            	if(this_lang.equals("EN_US")){
            		this_lang = "EN";
            	}
                tmpp = "ErrorMessage_" + this_lang + ".properties";
            }
            InputStream ist = null;
            try {
                ist = new ChunQiuTool().getClass().getResourceAsStream("/com/global/error/properties/" + tmpp);
                if (ist != null) {
                    prop.load(ist);
                    ErrMessg = convertNull(prop.getProperty(Errcode));
                    if (ErrMessg.equals("")) {
                        ErrMessg = Errcode;
                    }
                    if (!temp.equals("") && !ErrMessg.equals(Errcode)) {
                        ErrMessg = ErrMessg + temp;
                    }
                } else {
                    ErrMessg = Errcode;
                }
            } catch (IOException e1) {
            	logger.error(e1);
                ErrMessg = Errcode;
            } finally {
                if (ist != null) {
                    try {
                        ist.close();
                    } catch (IOException e) {
                    	logger.error(e);
                    }
                }
            }
            return ErrMessg;
        }
    }

    /**
     * 换算为指定时区的时间
     * @param block 时区: 1,2,3,4,5,6.... 7.5,8,8.5,9.... -1,-2,-3.......
     * @param dateString 格式:2010-04-21 08:20
     * @return
     */
    public static String[] getLocalTime(String block, String dateString) {
        if (block.indexOf("-") == -1) {
            block = "+" + block;
        }
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HHmm");
        Date date = null;
        try {
            date = sf.parse(dateString);
        } catch (ParseException e) {
        	logger.error(e);
        }
        String id_temp = "";
        int index = block.indexOf(".");
        if (index == -1) {
            id_temp = "GMT" + block;
        } else {
            String pre = block.substring(0, index);
            String last = block.substring(index, block.length());
            int a = (int) (Float.parseFloat(last) * 60);
            id_temp = "GMT".concat(pre).concat(":") + a;
        }
        sf.setTimeZone(TimeZone.getTimeZone(id_temp));
        return sf.format(date).split(" ");
    }

    /**
     * 币种金额转换
     * @param oriMoney 原币种金额
     * @param destRate 汇率
     * @param destDecimal 目标币种保留小数位数( 0--个位，-1--进10， -2-- 进100)
     * @param destSR 目标币种四舍五入规则(1--4舍5入,2--进1,3--截尾)
     * @return (double) 目标币种金额
     */
    public static double convertMoney(double oriMoney, double destRate, int destDecimal, int destSR) {
        //保留小数位数(OPER_DECIMAL)： 0--个位，-1--进10， -2-- 进100;     取舍规则(OPER_SR):1--4舍5入,2--进1,3--截尾 ;
        //先保留小数位数,再取舍规则
        double destMoney = oriMoney / destRate;
        BigDecimal destMoneyB = new BigDecimal(Double.toString(destMoney));
        if (destSR == 1) {
            return destMoneyB.divide(BigDecimal.ONE, destDecimal, BigDecimal.ROUND_HALF_UP).doubleValue();
        }
        if (destSR == 2) {
            return destMoneyB.divide(BigDecimal.ONE, destDecimal, BigDecimal.ROUND_UP).doubleValue();
        }
        if (destSR == 3) {
            return destMoneyB.divide(BigDecimal.ONE, destDecimal, BigDecimal.ROUND_DOWN).doubleValue();
        }
        return 0.0;
    }

    
    public static String doubleToString(double data) {

        java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
        nf.setGroupingUsed(false);
        return nf.format(data);
    }

    /**
     * 获取common.properties 配置中key参数
     * @param key
     * @return value
     */
    public static String readKey(String key) {
		Properties props = new Properties();
		InputStream inputFile;
		String value = "";
		File f2 = new File("WebRoot/WEB-INF/conf/common.properties");
		String fileName = f2.getAbsolutePath();
		try {
			inputFile = new BufferedInputStream(new FileInputStream(fileName));
			props.load(inputFile);
			inputFile.close();
			value = props.getProperty(key);
		} catch (Exception e) {
			logger.error(e);
		}
		return value;
	} 
    /**
     * 获取common.properties 配置中key参数
     * @param key
     * @param path 路径
     * @return
     */
    public static String readKey(String key,String path) {
		Properties props = new Properties();
		InputStream inputFile;
		String value = "";
		try {
			inputFile = new BufferedInputStream(new FileInputStream(path));
			props.load(inputFile);
			inputFile.close();
			value = props.getProperty(key);
		} catch (Exception e) {
			logger.error(e);
		}
		return value;
	} 
    
    /**
     * md5密文中去除戎于码
     * @param Md5pwd MD5密码
     * @param ext  除戎于码
     * @return 去除戎于码后的密文
     */
    public static String Md5_64to32(String Md5pwd,String ext) {
    	String tmp_md5="";
    	if (Md5pwd.length()!=64){
    		return Md5pwd;
    	}
		for(int i=0;i<Md5pwd.length();i++){
			if(i%2==0){
				tmp_md5=tmp_md5+Md5pwd.substring(i,i+1);
			}
		}
		return tmp_md5;
	} 
    
    /**
     * 使用MD5加密
     * @param pwd 加密前字符串
     * @return 加密后的密文
     */
    public static String MD5(String pwd) {
    	String tmp_md5="";
    	if (pwd==null){
    		pwd="";
    	}
		char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D','E', 'F'};
	   try {
	          byte[] strTemp = pwd.getBytes();
	          MessageDigest mdTemp = MessageDigest.getInstance("MD5");
	          mdTemp.update(strTemp);
	          byte[] md = mdTemp.digest();
	          int j = md.length;
	          char str[] = new char[j * 2];
	          int k = 0;
	          for (int i = 0; i < j; i++) {
	              byte byte0 = md[i];
	              str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	              str[k++] = hexDigits[byte0 & 0xf];
	          }
	          tmp_md5=  new String(str);
	      }catch (Exception e){
	    	  logger.error(e);
	      }

		return tmp_md5;
	} 
    
    /**
     * 判定是否是数字
     * @param val 需要校验的值
     * @param format 0,表示val必须是自然数;1,val必须是大于1整数;0.00,val是大于的0的所有数;
     * @return true表示参数合法,false表示参数非法
     */
    public static boolean isNum(String val,String format){
    	String reg="";
    	boolean b=false;
    	if(!val.equals("")){
	    	if(format.equals("0")){
	    		reg="^[1-9]{1}[0-9]*|0$";
	    	}else if(format.equals("1")){
	    		reg="^[1-9]*$";
	    	}else if(format.equals("'0.0")){
	    		reg="^[0-9]*[.][0-9]{0,1}$";
	    	}else if(format.equals("0.00")){
	    		reg="^[0-9]*[.][0-9]{0,2}$";
	    	}else{
	    		reg="^[0-9]*.{0,1}[0-9]*$";
	    	}
	    	Pattern pattern = Pattern.compile(reg);
	    	Matcher matcher = pattern.matcher(val);
	    	b= matcher.matches();
    	}
    	return b;
    }
    
    /**
	 * 根据 Signature.toLongString() 返回的字符串，截取该方法返回参数的类型
	 * @param signatureLongString Signature.toLongString() 返回的字符串
	 * @return 该方法返回参数的类全名
	 */
	public static String getRetParamType(String signatureLongString){
		String retStr = signatureLongString.substring(0, signatureLongString.indexOf(" "));
		if("public".equals(retStr) || "protected".equals(retStr) || "private".equals(retStr)
			|| "abstract".equals(retStr)
		){
			signatureLongString = signatureLongString.substring(signatureLongString.indexOf(" ")+1);
			retStr = getRetParamType(signatureLongString);
		}
		return retStr;
	}	
	public static synchronized String getRandomcode() {
	    String temp = getTimeid() + getthreerandom();
	    return temp;
	  }

	public static int getthreerandom() {
	   return ((int)(Math.random() * 900.0D) + 100);
	}
	  
	public static synchronized String getTimeid() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSS");
	    String tmpDate = formatter.format(new Date());
	    String tmp = tmpDate.toString();
	    return tmp;
	}
	
	public static String erasefileblank(String filename)
	  {
	    File read = null;
	    try {
	      read = new File(filename);
	      File write = new File("./temp001.xml");

	      BufferedReader br = new BufferedReader(new FileReader(read));
	      BufferedWriter bw = new BufferedWriter(new FileWriter(write));
	      String temp = null;
	      temp = br.readLine();
	      while (temp != null)
	      {
	        if (!(temp.trim().equals(""))) {
	          bw.write(temp.trim() + "\n");
	        }

	        temp = br.readLine();
	      }
	      bw.close();
	      br.close();
	      read.delete();
	      write.renameTo(read);
	    } catch (FileNotFoundException e) {
	      e.printStackTrace();
	    	logger.error(e);
	    } catch (IOException e) {
	      e.printStackTrace();
	    	logger.error(e);
	    }
	    return read.getAbsolutePath();
	  }
	
	/**
	 * 获取当前用户名
	 * @param 
	 * @return String
	 * @throws Exception
	 */
	public static String getUserName() {
		String userName = "";
		SecurityContext securityContextHolder = SecurityContextHolder.getContext();
		Authentication authentication = securityContextHolder.getAuthentication();
		Object principal = authentication.getPrincipal();
		if (principal instanceof UserDetails) {
			userName= ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	/** 
     * 将javaBean转换成Map 
     * 
     * @param javaBean javaBean 
     * @return Map对象 
     */ 
    public static Map<String, Object> javabeanToMap(Object javaBean) 
    { 
        Map<String, Object> result = new HashMap<String, Object>(); 
        Class<? extends Object> beanClass = javaBean.getClass();
        Method[] methods = beanClass.getDeclaredMethods(); 

        for (Method method : methods) 
        { 
            try 
            { 
                if (method.getName().startsWith("get")) 
                { 
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("get") + 3); 
                    field = field.toLowerCase().charAt(0) + field.substring(1); 
					Object value = method.invoke(javaBean,(Object[]) null);
                    result.put(field, null == value ? "" : value.toString()); 
                } 
            } 
            catch (Exception e) { 
            	logger.error(e);
            } 
        } 

        return result; 
    } 
    public static String obj2String(Object obj){
		if(obj == null){
			return "";
		}
		return obj.toString();
	}
    
    /**
	 * 获取国际化文字(带参数)
	 * 
	 * @author HP
	 * @param code
	 * @param args
	 * 
	 */
    public static String getMessageWithPara(String code, String[] args) {
		String message = "";
		MessageSource messageSource = (MessageSource) AppUtil
				.getBean("messageSource");
		message = messageSource.getMessage(code, args, Locale.CHINA);
		return message;
	}
	
	/**
	 * 获取国际化文字(不带参数)
	 * 
	 * @author HP
	 * @param code
	 * 
	 */
    public static String getMessage(String code) {
		return getMessageWithPara(code, null);
	}
    
    /**
     * @Description 生成一个随机不重复编号
     * @return String
     * @author shuchang
     * @date 2016年9月7日
     */
    public static String getUUID(){
    	return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }
    
    /** 
     * 随机指定范围内N个不重复的数 
     * 在初始化的无重复待选数组中随机产生一个数放入结果中， 
     * 将待选数组被随机到的数，用待选数组(len-1)下标对应的数替换 
     * 然后从len-2里随机产生下一个随机数，如此类推 
     * @param max  指定范围最大值 
     * @param min  指定范围最小值 
     * @param n  随机数个数 
     * @return int[] 随机数结果集 
     */  
    public static int[] randomArray(int min,int max,int n){  
        int len = max-min+1;  
          
        if(max < min || n > len){  
            return null;  
        }  
          
        //初始化给定范围的待选数组  
        int[] source = new int[len];  
           for (int i = min; i < min+len; i++){  
            source[i-min] = i;  
           }  
             
           int[] result = new int[n];  
           Random rd = new Random();  
           int index = 0;  
           for (int i = 0; i < result.length; i++) {  
            //待选数组0到(len-2)随机一个下标  
               index = Math.abs(rd.nextInt() % len--);  
               //将随机到的数放入结果集  
               result[i] = source[index];  
               //将待选数组中被随机到的数，用待选数组(len-1)下标对应的数替换  
               source[index] = source[len];  
           }  
           return result;  
    }  
    
    /** 
     * 随机指定范围内N个不重复的数 
     * 利用HashSet的特征，只能存放不同的值 
     * @param min 指定范围最小值 
     * @param max 指定范围最大值 
     * @param n 随机数个数 
     * @param HashSet<Integer> set 随机数结果集 
     */  
     public static void randomSet(int min, int max, int n, HashSet<Integer> set) {  
           if (n > (max - min + 1) || max < min) {  
               return;  
           }  
           for (int i = 0; i < n; i++) {  
               // 调用Math.random()方法  
               int num = (int) (Math.random() * (max - min)) + min;  
               set.add(num);// 将不同的数存入HashSet中  
           }  
           int setSize = set.size();  
           // 如果存入的数小于指定生成的个数，则调用递归再生成剩余个数的随机数，如此循环，直到达到指定大小  
           if (setSize < n) {  
            randomSet(min, max, n - setSize, set);// 递归  
           }  
     } 
     
     /** 
      * 随机指定范围内N个不重复的数 
      * 最简单最基本的方法 
      * @param min 指定范围最小值 
      * @param max 指定范围最大值 
      * @param n 随机数个数 
      */  
     public static int[] randomCommon(int min, int max, int n){  
         if (n > (max - min + 1) || max < min) {  
                return null;  
            }  
         int[] result = new int[n];  
         int count = 0;  
         while(count < n) {  
             int num = (int) (Math.random() * (max - min)) + min;  
             boolean flag = true;  
             for (int j = 0; j < n; j++) {  
                 if(num == result[j]){  
                     flag = false;  
                     break;  
                 }  
             }  
             if(flag){  
                 result[count] = num;  
                 count++;  
             }  
         }  
         return result;  
    }  
     
     
     /** 
      * 随机指定范围内N个不重复的数 
      * 限公司题和规章题
     * @param <E>
      * @param list 需要随机的集合
      * @param n 随机数个数
      */  
     public static <E> List<E> randomOtherCommon(List<E> list, int n){  
         if (n > list.size()) {  
                return null;  
         } 
         int[] result = new int[n];  
         int count = 0; 
         List<E> mapList =new ArrayList<E>();
         while(count < n) {  
             int num = (int) (Math.random() * list.size());  
             boolean flag = true;  
             for (int j = 0; j < n; j++) {  
                 if(num == result[j]){  
                     flag = false;  
                     break;  
                 }  
             }  
             if(flag){  
                 result[count] = num;  
                 count++;  
             }  
         }  
         for (int rs : result) {
        	 mapList.add(list.get(rs));
		 }
         return mapList; 
    } 
     
     /** 
      * 随机指定范围内N个不重复的数 
      * 限机型题
     * @param <E>
      * @param list 需要随机的集合
      * @param n 随机数个数
      */  
     public static <E> List<E> randomAcTypeCommon(List<E> list, int n){  
         if (n > list.size()) {  
                return null;  
         } 
         int[] result = new int[n];  
         int count = 0; 
         List<E> mapList =new ArrayList<E>();
         while(count < n) {  
             int num = (int) (Math.random() * list.size());  
             boolean flag = true;  
             for (int j = 0; j < n; j++) {  
                 if(num == result[j]){  
                     flag = false;  
                     break;  
                 }  
             }                  
             if(flag){  
                 result[count] = num;  
                 count++;  
             }  
         }  
         for (int rs : result) {
        	 mapList.add(list.get(rs));
		 }
         return mapList; 
    }  
}
