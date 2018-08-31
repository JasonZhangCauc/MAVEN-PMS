package com.ps.result.common;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.GlobalConstants;
import com.github.pagehelper.PageHelper;
import com.ps.dao.common.UserDao;
import com.ps.dao.systemmanage.DeptManagerDao;
import com.ps.result.commentmanage.CommentUser;
import com.ps.result.systemmanage.DeptVo;
import com.ps.result.systemmanage.UserVo;
import com.util.coder.EncryptPkUtil;
import com.util.tool.AppUtil;

/**
 * @Description: 前端dataTable分页情况下初始化分页必要参数实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class PageParaVo<T>{
	
	private BigDecimal sequence;    //数据库主键对应的序列，保存时将该序列（即主键）返回
	private long draw;              //Datatable插件参数（固定），前后台交互次数
	private Integer page = 0;       //开始页码
	private Integer rows = 0;       //数据行号
	private Integer firstPage;      //第几条记录起始
	private String orderField;      //排序字段
	private String orderDirection;  //排序方式
	private String orderByClause;   //数据库中排序条件（数据库字段对应的实体属性需驼峰标示）
    
	//公共信息
	private Integer row_id;				//行号
	private String id;					//主键
	private String startTime;           //开始时间
	private String endTime;             //结束时间 	
	//创建人信息
	private String createBy;			//创建人
	private String createDate;			//创建时间
	private String createDept;			//创建部门
	private String createByName;		//创建人姓名
	private String createDeptName;		//创建部门名称
	//权限参数
	private String userId; //用户ID
	private String deptId; //部门ID
	private String authority=GlobalConstants.ZERO; //权限 1：查看本人  2：查看本单位 3：查看所有
	
	private String authUserId; 	//用户ID
	private String authDeptId;	//部门ID
	
	private String changeDetails; //变更细节
	
	private List<ChangeRecordVo> changeList; //变更内容
	
	private String loginUserName; //当前登陆用户
	
	private String currentTime;//当前时间
	
	private String loginUserId;//当前用户ID
	
	private String functionCode;//功能编码
	
	private String loginUserPic;//当前用户头像
	
	private List<CommentUser> commentUserList;//注释信息
	
	public String getLoginUserPic() {
		return loginUserPic;
	}
	public void setLoginUserPic(String loginUserPic) {
		this.loginUserPic = loginUserPic;
	}
	public List<CommentUser> getCommentUserList() {
		return commentUserList;
	}
	public void setCommentUserList(List<CommentUser> commentUserList) {
		this.commentUserList = commentUserList;
	}
	public String getFunctionCode() {
		return functionCode;
	}
	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}
	public String getLoginUserId() {
		return loginUserId;
	}
	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}
	public String getLoginUserName() {
		return loginUserName;
	}
	public void setLoginUserName(String loginUserName) {
		this.loginUserName = loginUserName;
	}
	public String getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(String currentTime) {
		this.currentTime = currentTime;
	}
	public List<ChangeRecordVo> getChangeList() {
		return changeList;
	}
	public void setChangeList(List<ChangeRecordVo> changeList) {
		this.changeList = changeList;
	}

	public String getChangeDetails() {
		return changeDetails;
	}

	public void setChangeDetails(String changeDetails) {
		this.changeDetails = changeDetails;
	}

	public Integer getRow_id() {
		return row_id;
	}

	public void setRow_id(Integer row_id) {
		this.row_id = row_id;
	}

	public BigDecimal getSequence() {
		return sequence;
	}

	public void setSequence(BigDecimal sequence) {
		this.sequence = sequence;
	}

	public long getDraw() {
		return draw;
	}

	public void setDraw(long draw) {
		this.draw = draw;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public Integer getFirstPage() {
		firstPage = (page - 1) * rows;
		return firstPage;
	}

	public void setFirstPage(Integer firstPage) {
		this.firstPage = firstPage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateDept() {
		return createDept;
	}

	public void setCreateDept(String createDept) {
		this.createDept = createDept;
	}

	public String getCreateByName() {
		return createByName;
	}

	public void setCreateByName(String createByName) {
		this.createByName = createByName;
	}

	public String getCreateDeptName() {
		return createDeptName;
	}

	public void setCreateDeptName(String createDeptName) {
		this.createDeptName = createDeptName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getAuthUserId() {
		return authUserId;
	}

	public void setAuthUserId(String authUserId) {
		this.authUserId = authUserId;
	}

	public String getAuthDeptId() {
		return authDeptId;
	}

	public void setAuthDeptId(String authDeptId) {
		this.authDeptId = authDeptId;
	}

	/**
	 * @Description: 前端datagrid分页情况下初始化分页必要参数
	 * @param request 
	 * @return void
	 * @author: HuangPeng
	 * @date 2017年4月15日
	 */
	public void initDataTableParam(HttpServletRequest request) {
		//开始数据索引
		String pageNum = request.getParameter("start").toString(); 
		
		//数据行号
		String rowsNum = request.getParameter("length").toString(); 
		
		//排序方式 ASC/desc
		String dir = request.getParameter("order[0][dir]").toString();
		
		//按照第几个字段排序
		String orderNum = request.getParameter("order[0][column]").toString();
				
		//排序字段
		String order = request.getParameter("columns["+ orderNum +"][data]"); 		
		
		if(StringUtils.isNotEmpty(rowsNum)){
			this.rows =  Integer.parseInt(rowsNum);
		}
		if(StringUtils.isNotEmpty(pageNum)){
			this.page =  Integer.parseInt(pageNum)/this.rows + 1;
		}
		if(StringUtils.isNotEmpty(order)){
			orderField = order.replaceAll("[ ][;]*","");
		}
		//Datatable与后台交互次数
		draw = Long.parseLong(request.getParameter("draw").toString()); 
		//如果分页，传递分页参数
		if(this.rows>0){
			PageHelper.startPage(page,rows);
		}else{
			PageHelper.startPage(page, GlobalConstants.PAGE_MAX);
		}
		if(!StringUtils.equalsIgnoreCase(dir, "asc") && !StringUtils.equalsIgnoreCase(dir, "desc")){
			if(!StringUtils.equalsIgnoreCase(orderDirection, "asc") && !StringUtils.equalsIgnoreCase(orderDirection, "desc")){
				orderDirection = "desc";
			}
		}else{
			orderDirection = dir;
		}
		if(StringUtils.isNotBlank(orderField)){
			this.orderByClause = setOrderByClause(orderField,orderDirection);
		}
	}

	/**
	 * @Description: 将对象排序字段、排序方式封装成数据库字段排序样式
	 * @param orderField	排序字段
	 * @param orderDirection	排序方式
	 * @return String	封装后的数据库字段排序样式
	 * @author: HuangPeng
	 * @date 2017年4月15日
	 */
	private String setOrderByClause(String orderField, String orderDirection) {
		String orderByClause = "";
		for (int i = 0; i < orderField.length(); i++) {
			char c = orderField.charAt(i);
			if(Character.isUpperCase(c)){
				orderByClause+="_";
			}
			orderByClause+=String.valueOf(c);
		}
		return (orderByClause+" "+orderDirection).toUpperCase();
	}
	
	/**
	 * 根据数据代码获取该功能的所有数据权限
	 * resourceCode 数据代码
	 */
	public void initDataAuthByCode(HttpServletRequest request,String resourceCode){
		UserVo logerUser = (UserVo)request.getSession().getAttribute("user");
		UserDao userDao=(UserDao)AppUtil.getBean("userDao");
		//数据检索权限-查看个人、查看部门、查看所有
		String retViewValue = userDao.getMaxViewAuthorityByMenuCode(EncryptPkUtil.decodeId(logerUser.getId()),resourceCode);
		int authorViewValue = 0;//默认查看个人权限
		//如果查询结果为空，则无权限
		if(StringUtils.isNotEmpty(retViewValue)){
			//获取查看权限值
			authorViewValue = Integer.parseInt(retViewValue.substring(retViewValue.length()-1));//查看权限
		}else{
			this.authority=GlobalConstants.ZERO;//无权限
		} 
		//查看权限
		switch(authorViewValue){
			case 1: {
				//查看个人
				this.authUserId=EncryptPkUtil.decodeId(logerUser.getId());
				this.authority=GlobalConstants.ONE;
				break;
			}
			case 2:{
				//查看项目
				this.authDeptId=logerUser.getDeptId();
				this.authority=GlobalConstants.TWO;
				break;
			}
			case 3:{
				//查看部门
				this.authDeptId=this.getDeptStrByDeptId(logerUser.getDeptId());
				this.authority=GlobalConstants.THREE;
				break;
			}
			case 4:	{
				//查看所有
				this.authority=GlobalConstants.FOUR;
				break;
			}
			default:{
				this.authority=GlobalConstants.ZERO;//无权限
				break;
			}
		}
	}
	
	/**
	 * 根据部门ID获取该下所有部门并拼接ID
	 * @param deptId 部门ID
	 * @return
	 */
	public String getDeptStrByDeptId(String deptStr){
		DeptManagerDao deptManagerDao=(DeptManagerDao)AppUtil.getBean("deptManagerDao");
		List<DeptVo> deptList=deptManagerDao.queryDeptInfoByParam(null);
		StringBuffer str=new StringBuffer();
		str.append(deptStr);
		String deptIds=this.getDeptStr(deptList, str, deptStr);
		return deptIds;
	}
	
	public String getDeptStr(List<DeptVo> deptList,StringBuffer str,String deptStr){
		String[] deptStrs= deptStr.split(",");
		for (DeptVo deptVo : deptList) {
			for (String deptId : deptStrs) {
				if(StringUtils.equals(deptVo.getDeptPid(), deptId)){
					str.append(","+deptVo.getId());
					this.getDeptStr(deptList, str, deptVo.getId());
				}
			}
		}
		return str.toString();
	}
}
