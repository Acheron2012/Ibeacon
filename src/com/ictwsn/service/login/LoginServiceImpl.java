package com.ictwsn.service.login;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ictwsn.bean.RoleBean;
import com.ictwsn.dao.login.LoginDao;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Resource LoginDao dao;

	@Override
	public RoleBean Login(String userName, String password, String roleName) {
		return dao.Login(userName,password,roleName);
	}   

	


}
