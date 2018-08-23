package com.aop.exception;


public class PermissionDeniedException  extends RuntimeException{
	
	private static final long serialVersionUID = 7571134200149102400L;
	
	public PermissionDeniedException(){
		super();
	}

	public PermissionDeniedException(String msg){
		super(msg);
	}
}
