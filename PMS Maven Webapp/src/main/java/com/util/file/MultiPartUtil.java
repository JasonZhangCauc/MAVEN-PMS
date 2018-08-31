package com.util.file;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;

public class MultiPartUtil {
	
	/**
	 * @Description 将多媒体附件上传至应用服务器配置目录下
	 * @param multipartFiles 多媒体附件集合
	 * @param serverPath 服务器绝对路径
	 * @param configPath 配置相对路径 
	 * @return boolean
	 * @author HuangPeng
	 * @throws Exception 
	 * @date 2017年4月15日
	 */
	public static boolean uploadFiles(List<MultipartFile> multipartFiles,String serverPath,String configPath,String flieType) throws Exception{
		try {
			StringBuffer stringBuffer = new StringBuffer(serverPath);
			stringBuffer.append(configPath);
			for (MultipartFile file : multipartFiles) {
				File destFile = new File(stringBuffer.toString().concat(flieType));
				destFile.mkdirs();
				file.transferTo(destFile);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * @Description 删除附件（该方法不对删除文件的集合验证，首先将其迭代如果文件存在则删除，无异常情况下返回：true）
	 * @param delFiles
	 * @return boolean
	 * @author HuangPeng
	 * @date 2017年4月15日
	 */
	public static boolean deleteFiles(List<File> delFiles) {
		try {
			for (File file : delFiles) {
				if(file.exists()){
					file.delete();
				}
			}
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("common.multi.empty"));
		}
		return true;
	}

	/**
	 * @Description 附件下载
	 * @param file
	 * @param response
	 * @return void
	 * @author HuangPeng
	 * @throws IOException 
	 * @date 2017年4月15日
	 */
	public static void downFile(File file,String fileName, HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream;charset=UTF-8");
		response.setHeader("Content-disposition", "attachment;filename="+new String(fileName.getBytes("GBK"), "ISO8859-1"));
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		byte bytes[] = new byte[1024];
		InputStream in = new FileInputStream(file);
		int index = in.read(bytes, 0, 1024);
		while (index != -1) {
			out.write(bytes, 0, index);
			index = in.read(bytes, 0, 1024);
		}
		in.close();
		out.flush();
		out.close();
		in = null;
		out = null;
	}

}
