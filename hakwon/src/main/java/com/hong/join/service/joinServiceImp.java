package com.hong.join.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.hong.join.mapper.JoinMapper;
import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

@Repository
@Service("joinService")
public class joinServiceImp implements JoinService 
{

	@Autowired
	private JoinMapper joinMapper;
	
	@Override
	public ArrayList<AdressVO> getAdress(AdressVO vo) {
		// TODO Auto-generated method stub
		return joinMapper.getAdress(vo);
	}

	@Override
	public ArrayList<UserVO> idCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return joinMapper.idCheck(vo);
	}


}
