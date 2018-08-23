package com.util.file;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
 
/**
 * @Description:    FreeMarker生成模板
 * @author          HuangPeng
 * @date:           2017年4月15日
 */
public class DocumentHandlerUtil {
	private Logger logger=Logger.getLogger(DocumentHandlerUtil.class);
	private Configuration configuration = null;

	public DocumentHandlerUtil() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
	}
	
	/**
	 * 导出公共方法-excel
	 * @Description 
	 * Company: 小翼科技
	 * @author  002746
	 * @Date    2018-3-21
	 * @param request
	 * @param response
	 * @param dataMap
	 * @param fileName
	 * @throws IOException
	 */
	public void exportCommonExcelFile(HttpServletRequest request,HttpServletResponse response,
			Map<String,Object> dataMap,String fileName) throws IOException {
		//导出excel格式
		createFile(request,response,dataMap,"commonExcelExport.ftl",fileName,"xls");
	}
	
	public void createFile(HttpServletRequest request,HttpServletResponse response,
			Map<String,Object> dataMap,String templateName,String fileName,String type) throws IOException {
		//设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
		//这里我们的模板是放在com/template包下面
		configuration.setClassForTemplateLoading(this.getClass(), "/com/ps/ftl");
		Template t=null;
		try {
			//test.ftl为要装载的模板
			t = configuration.getTemplate(templateName);
		} catch (IOException e) {
			logger.error("装载模板失败!"+e.getMessage());
		}
		Writer out = null;
		response.setContentType("Content-Disposition;charset=UTF-8");
		response.setHeader("Content-Disposition","attachment;"+"filename="+URLEncoder.encode(fileName,"UTF-8")+"."+type);
		try {
			OutputStreamWriter oWriter = new OutputStreamWriter(response.getOutputStream(),"UTF-8");
			out = new BufferedWriter(oWriter);
		} catch (FileNotFoundException e1) {
			logger.error(e1.getMessage());
		}
		 
        try {
        	//导出Word文档
			t.process(dataMap, out);
			out.flush();
			out.close();
		} catch (TemplateException e) {
			logger.error(e.getMessage());
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}
	
	
	@SuppressWarnings("deprecation")
	public void createDoc(HttpServletRequest request,HttpServletResponse response,
			Map<String,Object> dataMap,String templateName,String fileName) throws IOException {
		//设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
		//这里我们的模板是放在com.havenliu.document.template包下面
		configuration.setClassForTemplateLoading(this.getClass(), "/com/kpqes/ftl");
		Template t=null;
		try {
			//test.ftl为要装载的模板
			t = configuration.getTemplate(templateName);
		} catch (IOException e) {
			logger.error("错误信息："+e.getMessage());
		}
		//输出文档路径及名称
		String path = request.getRealPath("/WEB-INF/fileTemp");
		
		File file = new File(path+"/"+fileName+".doc");
		Writer out = null;
		try {
			FileOutputStream fos = new FileOutputStream(file);
			OutputStreamWriter oWriter = new OutputStreamWriter(fos,"UTF-8");
			out = new BufferedWriter(oWriter);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		 
        try {
        	//导出Word文档
			t.process(dataMap, out);
			out.flush();
			out.close();
		} catch (TemplateException e) {
			logger.error("错误信息："+e.getMessage());
		} catch (IOException e) {
			logger.error("错误信息："+e.getMessage());
		}
		
		OutputStream output;
		InputStream input;
		input = new FileInputStream(file);
		
		response.setContentType("Content-Disposition;charset=UTF-8");
		response.setHeader("Content-Disposition","attachment;"+"filename="+new String((fileName+".doc").getBytes(),"UTF-8"));
		output = response.getOutputStream();
		int byteRead = 0;
		byte[] buffer = new byte[512];
		while((byteRead = input.read(buffer)) != -1){
			output.write(buffer,0,byteRead);
		}
		input.close();
		output.close();
	}
}
