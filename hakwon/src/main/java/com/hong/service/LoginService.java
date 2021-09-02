package com.hong.service;

import java.util.ArrayList;

import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

public interface LoginService {
	public UserVO loginTry(UserVO vo);
	public void loginLogInsert(UserVO vo);
}
