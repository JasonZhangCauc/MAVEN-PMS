package com.util.file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.util.PropertiesUtil;
import com.util.tool.AppUtil;
import com.util.tool.MessageUtil;
 
/**
 * @Description:    多sheet数据导入工具类
 * @author          HuangPeng
 * @date:           2017年4月15日
 */
@SuppressWarnings("all")
public class ImportUtil {

	private static final Logger logger = Logger.getLogger(ImportUtil.class);
	
	/**
	 * 模板的存放路径
	 */
    public static final String FILEPATH = AppUtil.getServletContextPath()+PropertiesUtil.getProperty("file.import.excel.file.path");

    /**
     * 导入excel数据
     * 支持2007及以上版本
     * @param request
     * @return
     */
	public static List<Map<Integer, Collection<?>>> excel2007ImportXlsx(
			HttpServletRequest request,String fileKey,int sheetCount) {
		List<Map<Integer, Collection<?>>> contentList= new ArrayList<Map<Integer, Collection<?>>> ();
		try {
			// 获取请求对象中的文件信息
			MultipartHttpServletRequest  multipartRequest = (MultipartHttpServletRequest)request;
			Map<String, List<MultipartFile>> map = multipartRequest.getMultiFileMap();
			Set<String> key = map.keySet();
			List<MultipartFile> listout = new ArrayList<MultipartFile>();
			//获取上传文件
			for (Iterator<String> it = key.iterator(); it.hasNext();) {
				String s = it.next();
				if(s.equals(fileKey)){
					listout = (List<MultipartFile>) map.get(s);
				}
	        }
			if(listout.size() <= 0){
				return null;
			}
			if(listout.size()>1){
				//验证文件数量只能为1
				logger.error(MessageUtil.getMessage("label.excel.checkamount")+listout.size());
				return null;
			}
			if(!listout.get(0).getOriginalFilename().endsWith("xlsx")){
				//验证文件名称只能以xlsx结尾
				logger.error(MessageUtil.getMessage("label.excel.checkname")+listout.get(0).getName());
				return null;
			}
			// 获取工作簿对象
			XSSFWorkbook wb = new XSSFWorkbook(listout.get(0).getInputStream());
			//获取sheet个数
			int num = wb.getNumberOfSheets();
			if(num > sheetCount){
				num = sheetCount;
			}
			for(int j=0;j<num;j++){
				//模板只允许num个SHEET表
				Map<Integer, Collection<?>> content = new HashMap<Integer, Collection<?>>();
				// 获取第一个sheet页对象
				XSSFSheet sheet = wb.getSheetAt(j);
				// excel总行数
				int rows = sheet.getLastRowNum();
				//得到第一行
				XSSFRow row = sheet.getRow(0);
				//获取一行中存在的单元格数
				int colNum = row.getPhysicalNumberOfCells();
				for (int i = sheet.getFirstRowNum()+1; i <= rows; i++) {
					// 循环获得每一行
					row = sheet.getRow(i);
					int col = 0;
					String colFirstvalue = "";
					if(row != null){
						colFirstvalue = getCell2013FormatValue(row.getCell((short) col)).trim();
					}
					//当获取到主键为空的行，自动终止
					/*if(StringUtils.isBlank(colFirstvalue)){
						break;
					}*/
					List<Object> list = new ArrayList<Object>();
					while (col < colNum) {
						//数据格式化处理
						list.add(getCell2013FormatValue(row.getCell((short) col)).trim()); 
		                col++;
		            }
					content.put(i, list);
				}
				contentList.add(content);
			}
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e);
			}else{
				logger.error("错误信息为：其他错误"+e);
			}
		}
		return contentList;
	}
	
	
	/**
	 * @author tzl
	 * 多sheet数据导入 2007-2013
	 * @param request
	 * @return
	 */
	public static List<Map<Integer, Collection<?>>> excel2013ImportMultiSheet(HttpServletRequest request) {
		List<Map<Integer, Collection<?>>> contentList= new ArrayList<Map<Integer, Collection<?>>> ();
		try {
			// 创建文件上传核心类
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			// 获取请求对象中的文件信息
			List<FileItem> itemList = sfu.parseRequest(request);
			if(itemList.size()>1){
				logger.error("文件数量大于1!文件数量为："+itemList.size());
				return null;
			}
			if(!itemList.get(0).getName().endsWith("xlsx")){
				logger.error("文件格式不正确!文件名称为："+itemList.get(0).getName());
				return null;
			}
			// 获取工作簿对象
			XSSFWorkbook wb = new XSSFWorkbook(itemList.get(0).getInputStream());
			//获取sheet个数
			int num = wb.getNumberOfSheets();
			for(int j=0;j<num;j++){
				Map<Integer, Collection<?>> content = new HashMap<Integer, Collection<?>>();
				// 获取第一个sheet页对象
				XSSFSheet sheet = wb.getSheetAt(j);
				// excel总行数
				int rows = sheet.getLastRowNum();
				//得到第一行
				XSSFRow row = sheet.getRow(0);
				//获取一行中存在的单元格数
				int colNum = row.getPhysicalNumberOfCells();
				for (int i = sheet.getFirstRowNum(); i <= rows; i++) {
					// 循环获得每一行
					row = sheet.getRow(i);
					int col = 0;
					List<Object> list = new ArrayList<Object>();
					while (col < colNum) {
						//数据格式化处理
						list.add(getCell2013FormatValue(row.getCell((short) col)).trim());
		                col++;
		            }
					content.put(i, list);
				}
				contentList.add(content);
			}
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e);
			}else{
				logger.error("错误信息为：其他错误"+e);
			}
		}
		return contentList;
	}
	
	/**
	 * 获取单元格数据内容为字符串类型的数据
	 * 
	 * @param cell
	 *            Excel单元格
	 * @return String 单元格数据内容
	 */
	private String getStringCellValue(HSSFCell cell) {
		String strCell = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			strCell = cell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			strCell = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			strCell = String.valueOf(cell.getBooleanCellValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			strCell = "";
			break;
		default:
			strCell = "";
			break;
		}
		if (strCell.equals("") || strCell == null) {
			return "";
		}
		if (cell == null) {
			return "";
		}
		return strCell;
	}

	/**
	 * 获取单元格数据内容为日期类型的数据
	 * 
	 * @param cell
	 *            Excel单元格
	 * @return String 单元格数据内容
	 */
	private String getDateCellValue(HSSFCell cell) {
		String result = "";
		try {
			int cellType = cell.getCellType();
			if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
				Date date = cell.getDateCellValue();
				result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
						+ "-" + date.getDate();
			} else if (cellType == HSSFCell.CELL_TYPE_STRING) {
				String date = getStringCellValue(cell);
				result = date.replaceAll("[年月]", "-").replace("日", "").trim();
			} else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
				result = "";
			}
		 } catch (Exception e) {
			System.out.println("日期格式不正确!");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * @author tzl
	 * 多sheet数据导入 2003
	 * @param request
	 * @return
	 */
	public static Map<Integer, Collection<?>> excelImport(HttpServletRequest request) {
		Map<Integer, Collection<?>> content = new HashMap<Integer, Collection<?>>();
		try {
			// 创建文件上传核心类
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			// 获取请求对象中的文件信息
			List<FileItem> itemList = sfu.parseRequest(request);
			if(itemList.size()>1){
				logger.error("文件数量大于1!文件数量为："+itemList.size());
				return null;
			}
			if(!itemList.get(0).getName().endsWith("xls")){
				logger.error("文件格式不正确!文件名称为："+itemList.get(0).getName());
				return null;
			}
			// 获取工作簿对象
			HSSFWorkbook wb = new HSSFWorkbook(itemList.get(0).getInputStream());
			// 获取第一个sheet页对象
			HSSFSheet sheet = wb.getSheetAt(0);
			// excel总行数
			int rows = sheet.getLastRowNum();
			//得到第一行
			HSSFRow row = sheet.getRow(0);
			//获取一行中存在的单元格数
			int colNum = row.getPhysicalNumberOfCells();
			for (int i = sheet.getFirstRowNum() + 1; i <= rows; i++) {
				// 循环获得每一行
				row = sheet.getRow(i);
				int col = 0;
				List<Object> list = new ArrayList<Object>();
				while (col < colNum) {
					//数据格式化处理
					list.add(getCellFormatValue(row.getCell((short) col)).trim());
	                //str += getCellFormatValue(row.getCell((short) col)).trim() + "";
	                col++;
	            }
				content.put(i, list);
	            //str = "";
			}
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e);
			}else{
				logger.error("错误信息为：其他错误"+e);
			}
		}
		return content;
	}
	
	
	/**
	 *
	 * @author tzl
	 * @param request
	 *            Excel2007-2013
	 *
	 */
	
	
	public static Map<Integer, Collection<?>> excel2013Import(HttpServletRequest request) {
		Map<Integer, Collection<?>> content = new HashMap<Integer, Collection<?>>();
		try {
			// 创建文件上传核心类
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			// 获取请求对象中的文件信息
			List<FileItem> itemList = sfu.parseRequest(request);
			if(itemList.size()>1){
				logger.error("文件数量大于1!文件数量为："+itemList.size());
				return null;
			}
			if(itemList.get(0).getName().endsWith("xlsx")){
				// 获取工作簿对象
				System.out.println(itemList.get(0).getName());
				XSSFWorkbook wb = new XSSFWorkbook(itemList.get(0).getInputStream());
				// 获取第一个sheet页对象
				XSSFSheet sheet = wb.getSheetAt(0);
				// excel总行数
				int rows = sheet.getLastRowNum();
				//得到第一行
				XSSFRow row = sheet.getRow(0);
				//获取一行中存在的单元格数
				int colNum = row.getPhysicalNumberOfCells();
				for (int i = sheet.getFirstRowNum() + 1; i <= rows; i++) {
					// 循环获得每一行
					row = sheet.getRow(i);
					int col = 0;
					List<Object> list = new ArrayList<Object>();
					while (col < colNum) {
						//数据格式化处理
						list.add(getCell2013FormatValue(row.getCell((short) col)).trim());
		                //str += getCellFormatValue(row.getCell((short) col)).trim() + "";
		                col++;
		            }
					content.put(i, list);
		            //str = "";
					}
			}else{
					logger.error("文件格式不正确!文件名称为："+itemList.get(0).getName());
					return null;
				}
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e);
			}else{
				logger.error("错误信息为：其他错误"+e);
			}
		}
		return content;
	}
	
	
	
	/**
	 * 根据XSSFCell类型设置数据
	 * @author tzl
	 * @param cell
	 * @return
	 */
	private static String getCell2013FormatValue(XSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case XSSFCell.CELL_TYPE_NUMERIC:
			case XSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (DateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式

					// 方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();

					// 方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					cellvalue = sdf.format(date);
				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case XSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = "";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}
	

	/**
	 * 根据HSSFCell类型设置数据
	 * 
	 * @param cell
	 * @return
	 */
	public static String getCellFormatValue(HSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式

					// 方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();

					// 方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					cellvalue = sdf.format(date);
				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case HSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = "";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}
	
	/**
	 * 因业务需要时间要求精确到时分秒
	 * 故copy原处理方法做修改——whb
	 * @param request
	 * @return
	 */
	public static Map<Integer, Collection<?>> excelImport_formatFullTime(HttpServletRequest request) {
		Map<Integer, Collection<?>> content = new HashMap<Integer, Collection<?>>();
		try {
			// 创建文件上传核心类
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			// 获取请求对象中的文件信息
			List<FileItem> itemList = sfu.parseRequest(request);
			if(itemList.size()>1){
				logger.error("文件数量大于1!文件数量为："+itemList.size());
				return null;
			}
			if(!itemList.get(0).getName().endsWith("xls")){
				logger.error("文件格式不正确!文件名称为："+itemList.get(0).getName());
				return null;
			}
			// 获取工作簿对象
			HSSFWorkbook wb = new HSSFWorkbook(itemList.get(0).getInputStream());
			// 获取第一个sheet页对象
			HSSFSheet sheet = wb.getSheetAt(0);
			// excel总行数
			int rows = sheet.getLastRowNum();
			//得到第一行
			HSSFRow row = sheet.getRow(0);
			//获取一行中存在的单元格数
			int colNum = row.getPhysicalNumberOfCells();
			for (int i = sheet.getFirstRowNum() + 1; i <= rows; i++) {
				// 循环获得每一行
				row = sheet.getRow(i);
				int col = 0;
				List<Object> list = new ArrayList<Object>();
				while (col < colNum) {
					//数据格式化处理
					list.add(getCellFormatValue_formatFullTime(row.getCell((short) col)).trim());
	                col++;
	            }
				content.put(i, list);
			}
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e);
			}else{
				logger.error("错误信息为：其他错误"+e);
			}
		}
		return content;
	}
	
	
	/**
	 *
	 * @author tzl
	 * @param request
	 *            Excel2007-2013
	 * 因业务需要时间要求精确到时分秒
	 * 故copy原处理方法做修改——whb
	 */
	
	public static Map<Integer, Collection<?>> excel2013Import_formatFullTime(HttpServletRequest request) {
		Map<Integer, Collection<?>> content = new HashMap<Integer, Collection<?>>();
		try {
			// 创建文件上传核心类
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			// 获取请求对象中的文件信息
			List<FileItem> itemList = sfu.parseRequest(request);
			if(itemList.size()>1){
				logger.error("文件数量大于1!文件数量为："+itemList.size());
				return null;
			}
			if(itemList.get(0).getName().endsWith("xlsx")){
				// 获取工作簿对象
				System.out.println(itemList.get(0).getName());
				XSSFWorkbook wb = new XSSFWorkbook(itemList.get(0).getInputStream());
				// 获取第一个sheet页对象
				XSSFSheet sheet = wb.getSheetAt(0);
				// excel总行数
				int rows = sheet.getLastRowNum();
				//得到第一行
				XSSFRow row = sheet.getRow(0);
				//获取一行中存在的单元格数
				int colNum = row.getPhysicalNumberOfCells();
				for (int i = sheet.getFirstRowNum() + 1; i <= rows; i++) {
					// 循环获得每一行
					row = sheet.getRow(i);
					int col = 0;
					List<Object> list = new ArrayList<Object>();
					while (col < colNum) {
						//数据格式化处理
						list.add(getCell2013FormatValue_formatFullTime(row.getCell((short) col)).trim());
		                col++;
		            }
					content.put(i, list);
					}
			}else{
					logger.error("文件格式不正确!文件名称为："+itemList.get(0).getName());
					return null;
				}
		} catch (Exception e) {
			if(e instanceof FileUploadException){
				logger.error("错误信息为：FileUploadException"+e);
			}else if(e instanceof IOException){
				logger.error("错误信息为：IOException"+e);
			}else{
				logger.error("错误信息为：其他错误"+e);
			}
		}
		return content;
	}
	
	/**
	 * 根据HSSFCell类型设置数据
	 * 因业务需要时间要求精确到时分秒
	 * 故做修改——whb
	 * @param cell
	 * @return
	 */
	private static String getCellFormatValue_formatFullTime(HSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					cellvalue = sdf.format(date);
				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case HSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = "";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}
	
	/**
	 * 根据XSSFCell类型设置数据
	 * 因业务需要时间要求精确到时分秒
	 * 故做修改——whb
	 * @author tzl
	 * @param cell
	 * @return
	 */
	private static String getCell2013FormatValue_formatFullTime(XSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case XSSFCell.CELL_TYPE_NUMERIC:
			case XSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (DateUtil.isCellDateFormatted(cell)) {
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					cellvalue = sdf.format(date);
				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case XSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = "";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}
	
	/**
	 * @author zhoumin
	 * @param request下载模板
	 * @throws IOException     
	 * @date  2016-11-09      
	 */
	public static boolean downloadForFile(HttpServletResponse response, String name, String templateName) throws IOException {
		PropertiesUtil.setPropertiesName("/properties/system.properties");
		File file = new File(getRealFilePath(AppUtil.getServletContextPath()+PropertiesUtil.getProperty("file.import.excel.file.path")+PropertiesUtil.getProperty(name)+".xlsx"));
		logger.info("文件路径"+getRealFilePath(AppUtil.getServletContextPath()+PropertiesUtil.getProperty("file.import.excel.file.path")+PropertiesUtil.getProperty(name)+".xlsx"));
		if(file.exists()) {
			MultiPartUtil.downFile(file,MessageUtil.getMessage(templateName)+".xlsx",response);
		}else{
			logger.info("文件不存在");
		}
		return true;
	}
	
	/**
	 * @author zhoumin
	 * @param 文件下载
	 * @throws IOException     
	 * @date  2016-11-09      
	 */
	public static boolean downloadFile(HttpServletResponse response,String fileName,String filePath)throws IOException {
		File file = new File(getRealFilePath(AppUtil.getServletContextPath()+"/"+filePath));
		if(file.exists()) {
			MultiPartUtil.downFile(file,fileName,response);
		}else{
			logger.info("文件不存在");
		}
		return true;
	}
	
	public static final String FILE_SEPARATOR = System.getProperty("file.separator");
	
	public static String getRealFilePath(String path) {
		return path.replace("/", FILE_SEPARATOR).replace("\\", FILE_SEPARATOR);
	}

}
