package com.hong.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.hong.mapper.BulletinBoardMapper;
import com.hong.vo.BulletinBoardVO;
import com.hong.vo.FileVO;

@Repository
@Service("bulletinBoardService")
public class BulletinBoardServiceImp implements BulletinBoardService 
{
	@Autowired
	private BulletinBoardMapper bulletinBoardMapper;
	
	@Override
	public int insertBullentinBoard(BulletinBoardVO vo) {
		return bulletinBoardMapper.insertBullentinBoard(vo);
	}

	@Override
	public int seletcBulletinBoardNum() {
		return bulletinBoardMapper.seletcBulletinBoardNum();
	}

	@Override
	public int insertFileBoard(FileVO vo) {
		return bulletinBoardMapper.insertFileBoard(vo);
	}

	@Override
	public ArrayList<BulletinBoardVO> getBulletinBoard() {
		return bulletinBoardMapper.getBulletinBoard();
	}

	
	
}
