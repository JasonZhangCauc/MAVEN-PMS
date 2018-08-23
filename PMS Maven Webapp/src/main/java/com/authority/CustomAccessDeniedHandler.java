package com.authority;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;


public class CustomAccessDeniedHandler implements AccessDeniedHandler{
	
	private String errorPage="403";
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException ex) throws IOException, ServletException {
		boolean isAjax=isAjaxRequest(request);
		if(!isAjax){
			request.setAttribute("isAjaxRequest", isAjax);
			request.setAttribute("message", ex.getMessage());
			RequestDispatcher dispatcher=request.getRequestDispatcher("/403.jsp");
			dispatcher.forward(request, response);
		}else{
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("<script>showError('对不起，你没有权限访问此链接.');</script>");
		}
		
	}
	private boolean isAjaxRequest(HttpServletRequest request){
		String header =request.getHeader("X-Requested-With");
		if(header!=null && "XMLHttpRequest".equals(header)){
			return true;
		}else {
			return false;
		}
	}
	public String getErrorPage() {
		return errorPage;
	}
	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}

}
