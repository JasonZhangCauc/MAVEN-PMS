/**
 * 
 */
package com.util.tool;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 时间工具类
 * @author xiaoleilu
 */
public class DateUtil {
	private static Logger log = LoggerFactory.getLogger(DateUtil.class);
	
	/** 毫秒 */
	public final static long MS = 1;
	/** 每秒钟的毫秒数 */
	public final static long SECOND_MS = MS * 1000;
	/** 每分钟的毫秒数 */
	public final static long MINUTE_MS = SECOND_MS * 60;
	/** 每小时的毫秒数 */
	public final static long HOUR_MS = MINUTE_MS * 60;
	/** 每天的毫秒数 */
	public final static long DAY_MS = HOUR_MS * 24;
	
	/** 标准日期格式 */
	public final static String NORM_DATE_PATTERN = "yyyy-MM-dd";
	/** 标准时间格式 */
	public final static String NORM_TIME_PATTERN = "HH:mm:ss";
	/** 标准日期时间格式 */
	public final static String NORM_DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
	/** HTTP头中日期时间格式 */
	public final static String HTTP_DATETIME_PATTERN = "EEE, dd MMM yyyy HH:mm:ss z";
	
	/** 标准日期（不含时间）格式化器 */
	private final static SimpleDateFormat NORM_DATE_FORMAT = new SimpleDateFormat(NORM_DATE_PATTERN);
	/** 标准时间格式化器 */
	private final static SimpleDateFormat NORM_TIME_FORMAT = new SimpleDateFormat(NORM_TIME_PATTERN);
	/** 标准日期时间格式化器 */
	private final static SimpleDateFormat NORM_DATETIME_FORMAT = new SimpleDateFormat(NORM_DATETIME_PATTERN);
	/** HTTP日期时间格式化器 */
	private final static SimpleDateFormat HTTP_DATETIME_FORMAT = new SimpleDateFormat(HTTP_DATETIME_PATTERN, Locale.US);
	
	/**
	 * 当前时间，格式 yyyy-MM-dd HH:mm:ss
	 * @return 当前时间的标准形式字符串
	 */
	public static String now() {
		return formatDateTime(new Date());
	}
	
	/**
	 * 当前日期，格式 yyyy-MM-dd
	 * @return 当前日期的标准形式字符串
	 */
	public static String today() {
		return formatDate(new Date());
	}
	
	// ------------------------------------ Format start ----------------------------------------------
	/**
	 * 根据特定格式格式化日期
	 * @param date 被格式化的日期
	 * @param format 格式
	 * @return 格式化后的字符串
	 */
	public static String format(Date date, String format){
		return new SimpleDateFormat(format).format(date);
	}
	
	/**
	 * 格式 yyyy-MM-dd HH:mm:ss
	 * @param date 被格式化的日期
	 * @return 格式化后的日期
	 */
	public static String formatDateTime(Date date) {
//		return format(d, "yyyy-MM-dd HH:mm:ss");
		return NORM_DATETIME_FORMAT.format(date);
	}
	
	/**
	 * 格式化为Http的标准日期格式
	 * @param date 被格式化的日期
	 * @return HTTP标准形式日期字符串
	 */
	public static String formatHttpDate(Date date) {
//		return new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US).format(date);
		return HTTP_DATETIME_FORMAT.format(date);
	}
	
	/**
	 * 格式 yyyy-MM-dd
	 * @param date 被格式化的日期
	 * @return 格式化后的字符串
	 */
	public static String formatDate(Date date) {
//		return format(d, "yyyy-MM-dd");
		return NORM_DATE_FORMAT.format(date);
	}
	// ------------------------------------ Format end ----------------------------------------------
	
	// ------------------------------------ Parse start ----------------------------------------------
	/**
	 * 将特定格式的日期转换为Date对象
	 * @param dateString 特定格式的日期
	 * @param format 格式，例如yyyy-MM-dd
	 * @return 日期对象
	 */
	public static Date parse(String dateString, String format){
		try {
			return (new SimpleDateFormat(format)).parse(dateString);
		} catch (ParseException e) {
			log.error("Parse " + dateString + " with format " + format + " error!", e);
		}
		return null;
	}
	
	/**
	 * 格式yyyy-MM-dd HH:mm:ss
	 * @param dateString 标准形式的时间字符串
	 * @return 日期对象
	 */
	public static Date parseDateTime(String dateString){
//		return parse(s, "yyyy-MM-dd HH:mm:ss");
		try {
			return NORM_DATETIME_FORMAT.parse(dateString);
		} catch (ParseException e) {
			log.error("Parse " + dateString + " with format " + NORM_DATETIME_FORMAT.toPattern() + " error!", e);
		}
		return null;
	}
	
	/**
	 * 格式yyyy-MM-dd
	 * @param dateString 标准形式的日期字符串
	 * @return 日期对象
	 */
	public static Date parseDate(String dateString){
		try {
			return NORM_DATE_FORMAT.parse(dateString);
		} catch (ParseException e) {
			log.error("Parse " + dateString + " with format " + NORM_DATE_PATTERN + " error!", e);
		}
		return null;
	}
	
	/**
	 * 格式HH:mm:ss
	 * @param dateString 标准形式的日期字符串
	 * @return 日期对象
	 */
	public static Date parseTime(String timeString){
		try {
			return NORM_TIME_FORMAT.parse(timeString);
		} catch (ParseException e) {
			log.error("Parse " + timeString + " with format " + NORM_TIME_PATTERN + " error!", e);
		}
		return null;
	}
	
	/**
	 * 格式：<br>
	 * 1、yyyy-MM-dd HH:mm:ss<br>
	 * 2、yyyy-MM-dd<br>
	 * 3、HH:mm:ss>
	 * @param dateStr 日期字符串
	 * @return 日期
	 */
	public static Date parse(String dateStr) {
		int length = dateStr.length();
		try {
			if(length == DateUtil.NORM_DATETIME_PATTERN.length()) {
				return parseDateTime(dateStr);
			}else if(length == DateUtil.NORM_DATE_PATTERN.length()) {
				return parseDate(dateStr);
			}else if(length == DateUtil.NORM_TIME_PATTERN.length()){
				return parseTime(dateStr);
			}
		}catch(Exception e) {
			log.error("Parse " + dateStr + " with format normal error!", e);
		}
		return null;
	}
	// ------------------------------------ Parse end ----------------------------------------------
	
	// ------------------------------------ Offset start ----------------------------------------------
	
	/**
	 * 昨天
	 * @return 昨天
	 */
	public static Date yesterday() {
		return offsiteDate(new Date(), Calendar.DAY_OF_YEAR, -1);
	}
	
	/**
	 * 上周
	 * @return 上周
	 */
	public static Date lastWeek() {
		return offsiteDate(new Date(), Calendar.WEEK_OF_YEAR, -1);
	}
	
	/**
	 * 上个月
	 * @return 上个月
	 */
	public static Date lastMouth() {
		return offsiteDate(new Date(), Calendar.MONTH, -1);
	}
	
	/**
	 * 获取指定日期偏移指定时间后的时间
	 * @param date 基准日期
	 * @param calendarField 偏移的粒度大小（小时、天、月等）使用Calendar中的常数
	 * @param offsite 偏移量，正数为向后偏移，负数为向前偏移
	 * @return 偏移后的日期
	 */
	public static Date offsiteDate(Date date, int calendarField, int offsite){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(calendarField, offsite);
		return cal.getTime();
	}
	// ------------------------------------ Offset end ----------------------------------------------
	
	/**
	 * 判断两个日期相差的时长<br/>
	 * 返回 minuend - subtrahend 的差
	 * @param subtrahend 减数日期
	 * @param minuend 被减数日期
	 * @param diffField 相差的选项：相差的天、小时
	 * @return 日期差
	 */
	public static long diff(Date subtrahend, Date minuend, long diffField){ 
	  long diff = minuend.getTime() - subtrahend.getTime();
	  return diff/diffField; 
	}
	
	/**
	 * 计时，常用于记录某段代码的执行时间，单位：纳秒
	 * @param preTime 之前记录的时间
	 * @return 时间差，纳秒
	 */
	public static long spendNt(long preTime) {
		return System.nanoTime() - preTime;
	}
	
	/**
	 * 计时，常用于记录某段代码的执行时间，单位：毫秒
	 * @param preTime 之前记录的时间
	 * @return 时间差，毫秒
	 */
	public static long spendMs(long preTime) {
		return System.currentTimeMillis() - preTime;
	}
	
	/**
	 * 获取当前月份最后一天
	 * @return
	 */
	public static String getlastDay(){
		SimpleDateFormat df =new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar=Calendar.getInstance();
		Date theDate=calendar.getTime();
		String s=df.format(theDate);
		StringBuffer str=new StringBuffer().append(s);
		return str.toString();
	}
	
	/**
	 * 计算两个时间相差天数
	 * @param date1 开始日期
	 * @param date2 结束日期
	 * @return
	 */
	public static int daysBetween(Date date1,Date date2){
		Calendar cal=Calendar.getInstance();
		cal.setTime(date1);
		long time1=cal.getTimeInMillis();
		cal.setTime(date2);
		long time2=cal.getTimeInMillis();
		long between_days=(time2-time1)/(1000*3600*24);
		return Integer.parseInt(String.valueOf(between_days));
	}
	
	/**
	 * 指定日期加上天数后的日期
	 * @param num 为增加的天数
	 * @param newDate 创建时间
	 * @return
	 * @throws ParseException 
	 */
	public static String plusDay(int num,String dates) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 日期格式
		Date date = null;
		Date newDate = null;
		try {
			date = dateFormat.parse(dates); // 指定日期
			newDate = addDate(date, Integer.valueOf(num)); // 指定日期天数
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return dateFormat.format(newDate);
	}
	
	public static Date addDate(Date date, long day) throws ParseException {
		long time = date.getTime(); // 得到指定日期的毫秒数
		day = day * 24 * 60 * 60 * 1000; // 要加上的天数转换成毫秒数
		time += day; // 相加得到新的毫秒数
		return new Date(time); // 将毫秒数转换成日期
	}
}