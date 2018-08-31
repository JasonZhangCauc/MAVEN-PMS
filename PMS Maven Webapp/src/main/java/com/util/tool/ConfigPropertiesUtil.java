package com.util.tool;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import org.apache.log4j.Logger;
/**
 * 获取config.properties文件配置信息
 * @author WB010
 *
 */
public class ConfigPropertiesUtil {

	private static ConfigPropertiesUtil oInstance = new ConfigPropertiesUtil();
    private static Properties oProperties;
    private static final Logger logger = Logger.getLogger(ConfigPropertiesUtil.class);
    private static String propertiesName="redis.properties";
    	
	private ConfigPropertiesUtil() {
    
	}
	
    protected void loadProperties() {
        try {
            oProperties = new Properties();

            ClassLoader oClassLoader = Thread.currentThread().getContextClassLoader();

            if (oClassLoader == null) {
                oClassLoader = oInstance.getClass().getClassLoader();
            }
            InputStream is = oClassLoader.getResourceAsStream(ConfigPropertiesUtil.propertiesName);
            BufferedReader bf = new BufferedReader(new InputStreamReader(is, "utf-8"));
            oProperties.load(bf);
			is.close();
			bf.close();

        } catch (Exception e) {
            logger.error(e);
            e.printStackTrace();
        }
    }

    /**
     * Get the value of the a property
     *
     * @return the string value of the property
     */
    public static String getProperty(String key) {
        if (oProperties == null) {
            oInstance.loadProperties();
        }
        return oProperties.getProperty(key);
    }

    /**
     * Retrieves the property value as an integer for the specified
     * property name
     *
     * @param sPropertyName property name
     * @param iDefaultValue return this value if property not found
     * @return property value as an integer of property name
     */
    public static int getInt(String sPropertyName, int iDefaultValue) {
        try {
            String sProperty = getProperty(sPropertyName);
            return Integer.parseInt(sProperty);
        } catch (Exception e) {
            return iDefaultValue;
        }
    }

    /**
     * Retrieves the property value as a String for the specified
     * property name
     *
     * @param sPropertyName property name
     * @param sDefaultValue return this value if property not found
     * @return property value as a string of property name
     */
    public static String getString(String sPropertyName,
                                   String sDefaultValue) {
        try {
            return getProperty(sPropertyName);
        } catch (Exception e) {
            return sDefaultValue;
        }
    }

    /**
     * Get the map of properties
     *
     * @return the sub group of entries
     */
    public static HashMap<String, String> getProperties(String keyGroup) {
        HashMap<String, String> hashmap = new HashMap<String, String>();
        if (oProperties == null) {
            oInstance.loadProperties();
        }
        Enumeration<Object> enumeration = oProperties.keys();
        while (enumeration.hasMoreElements()) {
            String tempKey = (String) enumeration.nextElement();
            if (tempKey.startsWith(keyGroup)) {
                hashmap.put(tempKey, (String) oProperties.get(tempKey));
            }
        }
        return hashmap;
    }

    /**
     * Return the boolean value of the property. The value can be
     * true or t (any case) for true state and any other value will be false
     * including null values or no entry
     *
     * @param key the key name
     * @return the boolean value
     */
    public static boolean getBoolean(String key, boolean bDefaultValue) {
        try {
            String s = getProperty(key);
            if (s != null) {
                return s.equalsIgnoreCase("true") || s.equalsIgnoreCase("t");
            } else {
                return bDefaultValue;
            }
        } catch (Exception e) {
            return bDefaultValue;
        }
    }

    public static void main(String[] args) {
    	System.out.println(ConfigPropertiesUtil.propertiesName);
        String property1 = ConfigPropertiesUtil.getProperty("file.save.path");
        System.out.println("property1 = " + property1);
    }
}
