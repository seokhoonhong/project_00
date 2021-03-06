package com.hong.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.hong.mapper.JoinMapper;
import com.hong.vo.AdressVO;
import com.hong.vo.UserVO;

@Repository
@Service("joinService")
public class JoinServiceImp implements JoinService 
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
		System.out.println(vo.getId());
		return joinMapper.idCheck(vo);
	}

	@Override
	public int idInsert(UserVO vo) {
		// TODO Auto-generated method stub
		//joinMapper.idInsert(vo);
		return joinMapper.idInsert(vo); 
	}


}
