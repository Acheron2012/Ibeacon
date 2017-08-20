package com.ictwsn.service.adminer;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ictwsn.bean.OperatorBean;
import com.ictwsn.dao.adminer.AdminerDao;


@Service
public class AdminerServiceImpl implements AdminerService{

	@Resource AdminerDao dao;

	@Override
	public int addOperator(OperatorBean ob) {
		// TODO Auto-generated method stub
		return dao.addOperator(ob);
	}

	@Override
	public int deleteOperator(int operatorId) {
		// TODO Auto-generated method stub
		return dao.deleteOperator(operatorId);
	}

	@Override
	public List<OperatorBean> searchOperator(int userId,int number,int size,String roleName){
		// TODO Auto-generated method stub
		return dao.searchOperator(userId,number,size,roleName);
	}

	@Override
	public OperatorBean getOperatorById(int operatorId) {
		// TODO Auto-generated method stub
		return dao.getOperatorById(operatorId);
	}

	@Override
	public int updateOperator(OperatorBean ob) {
		// TODO Auto-generated method stub
		return dao.updateOperator(ob);
	}

	@Override
	public int getOperatorCount() {
		// TODO Auto-generated method stub
		return dao.getOperatorCount();
	}

	@Override
	public List<OperatorBean> searchDeviceByCondition(String type,String keyword, int userId,String roleName,int number,int size) {
		// TODO Auto-generated method stub
		return dao.searchDeviceByCondition(type, keyword, userId, roleName, number, size);
	}

	@Override
	public int getOperatorCountByCondition(String type, String keyword,
			int userId, String roleName) {
		// TODO Auto-generated method stub
		return dao.getOperatorCountByCondition(type, keyword, userId, roleName);
	}
}

