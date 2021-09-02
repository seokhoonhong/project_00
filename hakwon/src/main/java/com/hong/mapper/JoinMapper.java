package com.hong.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

public interface JoinMapper {
	public ArrayList<AdressVO> getAdress(AdressVO vo);
	public ArrayList<UserVO> idCheck(UserVO vo);
	public void idInsert(UserVO vo);
}
