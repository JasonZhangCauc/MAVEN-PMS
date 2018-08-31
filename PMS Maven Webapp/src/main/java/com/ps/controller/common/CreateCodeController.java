package com.ps.controller.common;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ps.result.common.TableVo;
import com.ps.service.common.ICommonService;
import com.util.file.DelAllFile;
import com.util.file.FileDownload;
import com.util.file.FileZip;
import com.util.file.Freemarker;
import com.util.tool.PathUtil;

/**
 * 根据模板生成代码
 * @author WB010
 *
 */
@Controller
@RequestMapping(value="/systemManage")
public class CreateCodeController{
	@Autowired
	private ICommonService commonService;
	
	/**
	 * @Description: 编辑用户窗口
	 * @author:      HuangPeng
	 * @param:       request
	 * @return:      URL safe_exposure
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value="/productCodeMain",method=RequestMethod.GET)
	public String productCodeMain(HttpServletRequest request,HttpServletResponse response){
		return "common/productCodeMain";
	}
	
	/**
	 * 生成代码
	 */
	@RequestMapping(value="/proCode")
	@ResponseBody
	public String proCode(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/* ============================================================================================= */
		String projectName = request.getParameter("projectName");  			//项目名				========1
		String author = request.getParameter("author");  					//作者				========1
		String packageName = request.getParameter("packageName");  			//包名				========1
		String objectName = request.getParameter("objectName");	   			//类名				========2
		String tableName = request.getParameter("tableName");	   			//数据表名			========3
		tableName = null == tableName?"":tableName.toUpperCase();			//数据表名转大写
		List<TableVo> fieldList = this.commonService.getColumnsByTable(tableName);   	//属性集合			========4
		//重命名字段名称
		this.changeColumns(fieldList);
		
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("projectName", projectName);
		root.put("author", author);
		root.put("fieldList", fieldList);
		root.put("packageName", packageName);						//包名
		root.put("objectName", objectName);	
		String objectNameLower = objectName.substring(0,1).toLowerCase()+objectName.substring(1,objectName.length());
		//类名
		root.put("objectNameLower", objectNameLower);//类名(首字母小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("tableName", tableName);							//表前缀	
		root.put("nowDate", new Date());							//当前日期
		
		DelAllFile.delFolder(PathUtil.getClasspath()+"admin/ftl"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		
		String filePath = "admin/ftl/code/";						//存放路径
		String ftlPath = "createCode";								//ftl路径
		
		/*生成vo*/
		Freemarker.printFile("voTemplate.ftl", root, "vo/"+packageName+"/"+objectName+"Vo.java", filePath, ftlPath);
		/*生成查询参数Vo*/
		Freemarker.printFile("queryParamVoTemplate.ftl", root, "param/"+packageName+"/"+objectName+"ParamVo.java", filePath, ftlPath);
		
		/*生成controller*/
		Freemarker.printFile("controllerTemplate.ftl", root, "controller/"+packageName+"/"+objectName+"Controller.java", filePath, ftlPath);

		/*生成Dao*/
		Freemarker.printFile("daoTemplate.ftl", root, "dao/"+packageName+"/"+objectName+"Dao.java", filePath, ftlPath);
		/*生成Mapper*/
		Freemarker.printFile("sqlMapperTemplate.ftl", root, "dao/mapper/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		
		/*生成serviceImpl*/
		Freemarker.printFile("serviceImplTemplate.ftl", root, "service/impl/"+packageName+"/"+objectName+"ServiceImpl.java", filePath, ftlPath);
		/*生成service*/
		Freemarker.printFile("serviceTemplate.ftl", root, "service/"+packageName+"/I"+objectName+"Service.java", filePath, ftlPath);

		/*生成jsp页面*/
		Freemarker.printFile("jsp_list_Template.ftl", root, "jsp/"+packageName+"/"+objectNameLower+"Main.jsp", filePath, ftlPath);
		Freemarker.printFile("jsp_edit_Template.ftl", root, "jsp/"+packageName+"/"+objectNameLower+"Edit.jsp", filePath, ftlPath);
		Freemarker.printFile("jsp_form_Template.ftl", root, "jsp/"+packageName+"/"+objectNameLower+"Form.jsp", filePath, ftlPath);
		
		/*生成js文件*/
		Freemarker.printFile("jsMainTemplate.ftl", root, "js/"+packageName+"/"+objectNameLower+"Main.js", filePath, ftlPath);
		
		/*生成国际化文件*/
		Freemarker.printFile("messageTemplate.ftl", root, "properties/"+packageName+"/"+objectNameLower+".properties", filePath, ftlPath);
		
		/*生成的全部代码压缩成zip文件*/
		FileZip.zip(PathUtil.getClasspath()+"admin/ftl/code", PathUtil.getClasspath()+"admin/ftl/code.zip");
		
		/*下载代码*/
		FileDownload.fileDownload(response, PathUtil.getClasspath()+"admin/ftl/code.zip", "code.zip");
		return "ok";
	}
	
	private void changeColumns(List<TableVo> fieldList){
		for (TableVo data:fieldList) {
			// 获得指定列的列名
			String columnName = data.getColumnName();
			String name = StringUtils.lowerCase(columnName);
			int ind = name.indexOf("_");
			while (ind !=-1) {
				if(ind>0){
					name = name.substring(0, ind) 
							+ StringUtils.upperCase(name.substring(ind+1,ind+2))
							+ name.substring(ind+2, name.length());
				}
				ind = name.indexOf("_");

			}
			name =  StringUtils.lowerCase(name.substring(0,1)) + name.substring(1,name.length());
			data.setReColName(name);
		}
	}
}
