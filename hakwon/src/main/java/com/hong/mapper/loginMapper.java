package com.hong.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

public interface loginMapper {
	public UserVO loginTry(UserVO vo);
	public void loginLogInsert(UserVO vo);
}
