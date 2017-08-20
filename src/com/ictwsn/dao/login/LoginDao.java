package com.ictwsn.dao.login;

import com.ictwsn.bean.RoleBean;


public interface LoginDao {
	
	public RoleBean Login(String userName,String password,String role);  //登陆
	

}
