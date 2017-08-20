package com.ictwsn.service.login;

import com.ictwsn.bean.RoleBean;
/**
 * 登录service层接口
 * @author YangYanan
 * @desc
 * @date 2017-8-18
 */
public interface LoginService {
	public RoleBean Login(String userName,String password,String roleName);  //登录
	
}
