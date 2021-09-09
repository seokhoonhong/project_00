package com.hong.service;

import java.util.ArrayList;

import com.hong.vo.BulletinBoardVO;
import com.hong.vo.FileVO;

public interface BulletinBoardService 
{
		public int insertBullentinBoard(BulletinBoardVO vo);
		public int seletcBulletinBoardNum();
		public int insertFileBoard(FileVO vo);
		public ArrayList<BulletinBoardVO> getBulletinBoard();
}
