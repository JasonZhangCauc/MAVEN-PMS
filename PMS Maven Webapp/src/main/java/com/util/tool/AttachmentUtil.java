package com.util.tool;

import com.util.PropertiesUtil;
import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

/**
 * SSM文件上传工具类
 * @author WB083
 *
 */
public class AttachmentUtil {
	public AttachmentUtil()
    {
    }

	 private static final Logger logger = Logger.getLogger(com.util.tool.AttachmentUtil.class);
	
    public static void init(String propertiesName)
    {
        if(propertiesName == "" || propertiesName == null)
            PropertiesUtil.setPropertiesName("system.properties");
        else
            PropertiesUtil.setPropertiesName(propertiesName);
    }

    public static HashMap<String, Object> upload(HttpServletRequest request, HttpServletResponse response,
    		MultipartFile uploadFile)throws Exception
    {
        HashMap<String, Object> returnMap = new HashMap<String, Object>();
        try
        {
            request.setCharacterEncoding("UTF-8");
            String savePath = PropertiesUtil.getProperty("file.save.path");
            File file = new File(savePath);
            if(!file.exists() && !file.isDirectory()){
            	file.mkdirs();
            }
            String uploadPattern = PropertiesUtil.getProperty("file.upload.pattern").toString() != null ? PropertiesUtil.getProperty("file.upload.pattern").toString() : "";
            if(uploadPattern != null && uploadPattern != "")
            {
                boolean pattern = validatePattern(uploadFile);
                boolean max = validateMaxSize(uploadFile);
                boolean min = validateMinSize(uploadFile);
                if(pattern && max && min)
                {
                    String finalFileName = (new StringBuilder(String.valueOf(UUID.randomUUID().toString()))).append(".").append(uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf(".") + 1)).toString();
                    String finalFilePath = (new StringBuilder(String.valueOf(savePath))).append(File.separator).append(finalFileName).toString();
                    returnMap.put("filePath", finalFileName);
                    returnMap.put("fileItem", uploadFile);
                    File savedFile = new File(finalFilePath);
                    uploadFile.transferTo(savedFile);
                    logger.info((new StringBuilder("\u6587\u4EF6\u5DF2\u4E0A\u4F20\u670D\u52A1\u5668\uFF0C\u4F46\u672A\u4FDD\u5B58\u540E\u53F0\u8868\uFF01\u6587\u4EF6\u4E3A\uFF1A")).append(finalFilePath).toString());
                }
            } else
            {
                logger.error("\u6587\u4EF6\u6821\u9A8C\u4E0D\u901A\u8FC7\uFF0C\u4E0D\u5141\u8BB8\u4E0A\u4F20\uFF01");
            }
        }
        catch(Exception e)
        {
            if(e instanceof FileNotFoundException)
                logger.error("\u627E\u4E0D\u5230\u6587\u4EF6\u62A5\u9519\uFF01");
            else
            if(e instanceof IOException)
                logger.error("IO\u6D41\u5F02\u5E38!");
            else
                logger.error("\u5176\u4ED6\u9519\u8BEF!");
            logger.error((new StringBuilder("\u9519\u8BEF\u4FE1\u606F\uFF1A")).append(e.getMessage()).toString());
            throw new Exception(e);
        }
        
        return returnMap;
    }

    public static boolean validatePattern(MultipartFile fileItem)
    {
        if(fileItem.getOriginalFilename().lastIndexOf(".") < 0)
            return false;
        String fileName = fileItem.getOriginalFilename().substring(fileItem.getOriginalFilename().lastIndexOf(".") + 1);
        if(PropertiesUtil.getProperty("file.upload.pattern").toString().indexOf(fileName) >= 0)
        {
            logger.error((new StringBuilder("\u9A8C\u8BC1\u4FE1\u606F:\u4E0D\u5141\u8BB8\u4E0A\u4F20\u7684\u7C7B\u578B\uFF01\u6587\u4EF6\u4E3A\uFF1A")).append(fileItem.getOriginalFilename()).toString());
            return false;
        } else
        {
            return true;
        }
    }

    public static boolean validateMaxSize(MultipartFile fileItem)
    {
        if(PropertiesUtil.getProperty("file.max.size").toString() == null || PropertiesUtil.getProperty("file.max.size").toString() == "")
            return true;
        Long size = Long.valueOf(fileItem.getSize());
        Long maxSize = Long.valueOf(Long.parseLong(PropertiesUtil.getProperty("file.max.size").toString()));
        if(size.longValue() > maxSize.longValue())
        {
            logger.error((new StringBuilder("\u9A8C\u8BC1\u4FE1\u606F:\u8D85\u51FA\u5355\u4E2A\u6587\u4EF6\u6700\u5927\u5B57\u8282\u6570\uFF01\u6587\u4EF6\u5927\u5C0F\u4E3A\uFF1A")).append(fileItem.getSize()).toString());
            return false;
        } else
        {
            return true;
        }
    }

    public static boolean validateMinSize(MultipartFile fileItem)
    {
        if(PropertiesUtil.getProperty("file.min.size").toString() == null || PropertiesUtil.getProperty("file.min.size").toString() == "")
            return true;
        Long size = Long.valueOf(fileItem.getSize());
        Long minSize = Long.valueOf(Long.parseLong(PropertiesUtil.getProperty("file.min.size").toString()));
        if(size.longValue() < minSize.longValue())
        {
            logger.error((new StringBuilder("\u9A8C\u8BC1\u4FE1\u606F:\u4E0D\u6EE1\u8DB3\u5355\u4E2A\u6587\u4EF6\u6700\u5C0F\u5B57\u8282\u6570\uFF01\u6587\u4EF6\u5927\u5C0F\u4E3A\uFF1A")).append(fileItem.getSize()).toString());
            return false;
        } else
        {
            return true;
        }
    }

}
