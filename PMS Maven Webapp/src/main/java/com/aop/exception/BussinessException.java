package com.aop.exception;

import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
 
/**
 * @Description:    异常处理
 * @author:         011770
 * @date:           2018年2月5日
 */
public class BussinessException extends RuntimeException {
	 
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(BussinessException.class);
	private List<BussinessExceptionBean> bexbeanList;
	private String errorMessages;
	private Exception e;

	public BussinessException(String message,Exception m) {
		this.errorMessages=message;
		this.e=m;
		logger.error(errorMessages,e);
	}
	
	public BussinessException(BussinessExceptionBean bexbean) {
		if (bexbeanList == null) {
			bexbeanList = new LinkedList<BussinessExceptionBean>();
		}
		bexbeanList.add(bexbean);
		logger.error(bexbean.getErrorMessage());
	}
	
	public BussinessException(BussinessExceptionBean bexbean,Throwable cause) {
		if (bexbeanList == null) {
			bexbeanList = new LinkedList<BussinessExceptionBean>();
		}
		bexbeanList.add(bexbean);
		logger.error(bexbean.getErrorMessage(),cause);
	}

	public BussinessException(List<BussinessExceptionBean> bexbeanList) {
		this.bexbeanList = bexbeanList;
		for (BussinessExceptionBean bex : bexbeanList) {
			logger.error(bex.getErrorMessage());
		}
	}

	public BussinessException() {
		if (bexbeanList == null) {
			bexbeanList = new LinkedList<BussinessExceptionBean>();
		}
	}

	public void addBussinessException(BussinessExceptionBean bex) {
		if (bexbeanList == null) {
			bexbeanList = new LinkedList<BussinessExceptionBean>();
		}
		bexbeanList.add(bex);
		logger.error(bex.getErrorMessage());
	}

	public String getExceptionMessage() {
		StringBuffer sb = new StringBuffer();
		if (bexbeanList == null || bexbeanList.size() == 0) {

			sb.append("");
			return sb.toString();
		}
		if (bexbeanList.size() == 1) {
			sb.append(bexbeanList.get(0).getErrorMessage());
			return sb.toString();
		}
		for (BussinessExceptionBean bex : bexbeanList) {
			sb.append(bex.getErrorMessage());
			sb.append("\n");
		}
		return sb.toString();
	}
}
