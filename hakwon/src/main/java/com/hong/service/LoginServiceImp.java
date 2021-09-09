package com.hong.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.hong.mapper.JoinMapper;
import com.hong.mapper.LoginMapper;
import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

@Repository
@Service("loginService")
public class LoginServiceImp implements LoginService 
{

	@Autowired
	private LoginMapper loginMapper;

	@Override
	public UserVO loginTry(UserVO vo) {
		return loginMapper.loginTry(vo);
	}

	@Override
	public void loginLogInsert(UserVO vo) {
		loginMapper.loginLogInsert(vo);
		return;
	}
	

}
