package com.security;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.log4j.Logger;

public class XSSRequestWrapper extends HttpServletRequestWrapper {
	private static final Logger LOGGER = Logger.getLogger(XSSRequestWrapper.class);

	private Map<String, String[]> sanitized;
	private Map<String, String[]> orig;

	public XSSRequestWrapper(HttpServletRequest req) {
		super(req);
		orig = req.getParameterMap();
		sanitized = getParameterMap();
	}

	@Override
	public String getParameter(String name) {
		String[] vals = getParameterMap().get(name);
		if (vals != null && vals.length > 0)
			return vals[0];
		else
			return null;
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		if (sanitized == null)
			sanitized = sanitizeParamMap(orig);
		return sanitized;

	}

	@Override
	public String[] getParameterValues(String name) {
		return getParameterMap().get(name);
	}

	private Map<String, String[]> sanitizeParamMap(Map<String, String[]> raw) {
		Map<String, String[]> res = new HashMap<String, String[]>();
		if (raw == null)
			return res;

		for (Map.Entry<String, String[]> key : raw.entrySet()) {
			String[] rawVals = raw.get(key.getKey());
			String[] snzVals = new String[rawVals.length];
			for (int i = 0; i < rawVals.length; i++) {
				// snzVals[i] = SafeHtmlUtil.sanitize(rawVals[i]);
				snzVals[i] = new XSSHTMLInputFilter(false).filter(rawVals[i]);
			}
			res.put(key.getKey(), snzVals);
		}
		return res;
	}

	@SuppressWarnings("unused")
	private void snzLogger() {
		for (String key : (Set<String>) orig.keySet()) {
			String[] rawVals = orig.get(key);
			String[] snzVals = sanitized.get(key);
			if (rawVals != null && rawVals.length > 0) {
				for (int i = 0; i < rawVals.length; i++) {
					if (rawVals[i].equals(snzVals[i]))
						LOGGER.debug("Sanitization. Param seems safe: " + key + "[" + i + "]=" + snzVals[i]);
					else
						LOGGER.debug("Sanitization. Param modified: " + key + "[" + i + "]=" + snzVals[i]);
				}
			}
		}
	}
}
