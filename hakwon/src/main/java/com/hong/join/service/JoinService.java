package com.hong.join.service;

import java.util.ArrayList;

import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

public interface JoinService {
	public ArrayList<AdressVO> getAdress(AdressVO vo);
	public ArrayList<UserVO> idCheck(UserVO vo);
}
