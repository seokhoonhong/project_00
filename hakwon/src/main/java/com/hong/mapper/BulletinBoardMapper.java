package com.hong.mapper;

import java.util.ArrayList;

import com.hong.vo.BulletinBoardVO;
import com.hong.vo.FileVO;

public interface BulletinBoardMapper 
{
	public int insertBullentinBoard(BulletinBoardVO vo);
	public int seletcBulletinBoardNum();
	public int insertFileBoard(FileVO vo);
	public ArrayList<BulletinBoardVO> getBulletinBoard();
}
