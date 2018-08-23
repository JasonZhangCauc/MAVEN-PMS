package com.base.redis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ps.result.systemmanage.CodeVo;

/**
 * @Description: 业务字典缓存类 
 * @author       011770
 * @date:        2018年2月5日
 */
public class DictCache {
	private static Map<String,List<CodeVo>> cacheData = new HashMap<String,List<CodeVo>>();
	
	public static void putCache(Map<String,List<CodeVo>> cache){
		cacheData = cache;
	}
	
	public static Map<String,List<CodeVo>> getCache(){
		return cacheData;
	}
	
	public static List<CodeVo> getCacheByKey(String key){
		List<CodeVo> list = cacheData.get(key);
		return list;
	}
}
