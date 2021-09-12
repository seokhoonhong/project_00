
package com.hong.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.runtime.directive.Parse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hong.common.APP_CONSTANT;
import com.hong.common.Sha256;
import com.hong.service.BulletinBoardService;
import com.hong.service.JoinService;
import com.hong.service.LoginService;
import com.hong.vo.AdressVO;
import com.hong.vo.BulletinBoardVO;
import com.hong.vo.FileVO;
import com.hong.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;



@Controller
public class MainController {
	
	
	/*
	 *                 메인 페이지
	 */
	
	@RequestMapping(value="/main")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView	mav	= new ModelAndView();
		mav.setViewName("/main");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	/*
	 *                회원가입 페이지
	 */
	
	@Autowired
	@Qualifier("joinService")
	private JoinService joinService;
	
	//회원가입 페이지 요청
	@RequestMapping(value="/join")
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView	mav	= new ModelAndView("/join");
		return mav;
	}
	
	
	//회원가입 요청 
	@RequestMapping(value="/joinTry")
	public ModelAndView joinTry(HttpServletRequest request, HttpServletResponse response, UserVO vo) throws Exception {

		ModelAndView	mav	= new ModelAndView();
		//비밀번호 암호화
		vo.setPassword( Sha256.encrypt(vo.getPassword()) );
		//회원정보 db insert후 성공/실패 반환값 저장
		int n = joinService.idInsert(vo);
		
		if(n == 1)
		{
			mav.setViewName("/login");
		}else
		{
			mav.addObject("message", "회원가입 실패");
			mav.setViewName("/join");
		}
		return mav;
	}
	
	
	//db에서 주소 값 요청
	@ResponseBody
	@RequestMapping(value="/getAdress", produces="application/json", consumes = "application/json")
	public ArrayList<AdressVO> getAdress(@RequestBody AdressVO vo)
	{
		return joinService.getAdress(vo);
	}
	
	
	//아이디 중복검사 요청
	@ResponseBody
	@RequestMapping(value="/idCheck", produces="application/json", consumes = "application/json")
	public ArrayList<UserVO> idCheck(@RequestBody UserVO vo)
	{
		//vo.getId와 일치하는 id 조회
		ArrayList<UserVO> returnVO = joinService.idCheck(vo);
		return returnVO;
	}
	
	
	
	
	
	
	
	
	/*
	 *                    로그인 페이지
	 */
	
	//로그인 페이지 요청
	@Autowired
	@Qualifier("loginService")
	private LoginService loginService;
	
	
	//로그인 페이지 요청
	@RequestMapping(value="/login")
	public ModelAndView login( HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView	mav	= new ModelAndView("/login");
		return mav;
	}
	
	//로그인 페이지 요청
		@RequestMapping(value="/logout")
		public ModelAndView logout( HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			HttpSession session = request.getSession();
			session.setAttribute("UserVO", null);
			ModelAndView	mav	= new ModelAndView("/main");
			return mav;
		}
		
	
	
	//로그인 시도
	@RequestMapping(value="/loginTry")
	public String loginTry( HttpServletRequest request, HttpServletResponse response, UserVO vo, Model model) throws Exception {
		
		
		HttpSession session = request.getSession();
		
		//접속환경 저장 , 암호화처리된 비밀번호 저장
		vo.setUserAgent( request.getHeader("user-agent") );
		vo.setPassword( Sha256.encrypt(vo.getPassword()) );
		//아이디,비밀번호 검증에 사용되는 값
		UserVO returnVO = loginService.loginTry(vo);
		//아이디 비밀번호 검증
		if(returnVO == null) 
		{
			model.addAttribute("message", "로그인 실패");
			return "/login";
		}else
		{
			//로그인 성공시 로그 기록
			loginService.loginLogInsert(vo);
			//세션에 회원정보 저장
			session.setAttribute("UserVO", vo.getId());
			
			return "/main";
		}

	}
	
	
	
	/*
	 * 
	 *              게시판 페이지
	 * 
	 * 
	 */
	
	@Autowired
	@Qualifier("bulletinBoardService")
	private BulletinBoardService bulletinBoardService;
	
	
	   //게시판 페이지 요청
		@RequestMapping(value="/bulletinBoard")
		public ModelAndView bulletinBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			ModelAndView	mav	= new ModelAndView("/bulletinBoard/bulletinBoard");
			return mav;
		}
		
		
		//게시판 글쓰기 페이지 요청
		@RequestMapping(value="/bulletinBoard/write")
		public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			ModelAndView	mav	= new ModelAndView("/bulletinBoard/write");
			return mav;
		}
		
		
		//글쓰기 버튼 클릭 요청
		@RequestMapping("/bulletinBoard/boardUpload")
		public String boardUpload(BulletinBoardVO vo, HttpServletRequest request, HttpServletResponse response, Model model) {
			
			System.out.println("요청 확인1");
			// fileBoard에 전달할 vo , id를 얻기위해 session생성
			FileVO fileVO = new FileVO();
			HttpSession session = request.getSession();
			
			//세션의 저장한 ID의값 가져오기
			String id = (String)session.getAttribute("UserVO");
			vo.setId( id );
			
			try {
				// 첨부파일 있을경우와 없을경우를 구분하는 if문
				if(vo.getFile().getOriginalFilename() != "")
				{
					System.out.println("요청 확인2");
					// 원본파일, 확장자 , UUID , 저장할 파일명 생성
					String fileRealName = vo.getFile().getOriginalFilename(); 
					String fileExtention = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length()  ); 
					String uuids = UUID.randomUUID().toString().replaceAll("-", ""); 
					String fileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtention;
					
					// 업로드한 파일이 이미지 파일이아니라면 return
					if(fileExtention=="jpg" || fileExtention=="jpeg" || fileExtention=="png" || fileExtention=="bmp")
					{
						model.addAttribute("message", "이미지 파일 형식만 입력 가능합니다.");
						return "/bulletinBoard/boardUpload";
					}
					
					System.out.println("요청 확인3");
					// 이미지 업로드할 폴더 생성 ( 날짜형식 => 하루에 1개 생성 )
					String fileLocation = new SimpleDateFormat("yyyyMMdd").format(new Date());
					File folder = new File(APP_CONSTANT.UPLOAD_PATH + fileLocation);
					
					//중복된 파일 확인후 없다면 생성
					if(!folder.exists()) folder.mkdir();
					
					// form에서 전달된 file 을 지정한 폴더에 지정한 이름으로 저장
					vo.getFile().transferTo( new File(APP_CONSTANT.UPLOAD_PATH + fileLocation + "\\" + fileName) );
					
					// fileBoard에 저장할 이미지경로 vo객체에 저장
					vo.setImgUploadPath(APP_CONSTANT.UPLOAD_PATH+fileLocation);
					
					System.out.println("요청 확인4");
					// 게시판board에 정상적으로 저장됐다면 fileBoard에도 이어서 저장
					int result = bulletinBoardService.insertBullentinBoard(vo);
					if(result == 1 && (vo.getFile() != null))
					{
						result = bulletinBoardService.seletcBulletinBoardNum();
						fileVO.setBulletinBoardNum(String.valueOf(result));
						fileVO.setUUID(uuids+"."+fileExtention);
						fileVO.setOriginalFileName(fileRealName+"."+fileExtention);
						fileVO.setId(id);
						bulletinBoardService.insertFileBoard(fileVO);
					}
				}else
				{
					// file없을경우 게시판Board에만 저장
					bulletinBoardService.insertBullentinBoard(vo);
				}
				
				System.out.println("요청 확인5");
				//TODO실패
				//
				//HashMap resultMap;
				//resultMap.put("result", "fail");
				//resultMap.put("pageNo", "등록하기전에 있던 페이지 번호");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/bulletinBoard";
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/getBulletinBoard", produces = "application/json")
		public ArrayList<BulletinBoardVO> getBulletinBoard()
		{
			System.out.println("요청 확인");
			return bulletinBoardService.getBulletinBoard();
		}
		
		@RequestMapping("/bulletinBoard/getPage")
		public String getPage(@RequestParam("bulletinBoardNum") String bbn)
		{
			return "/bulletinBoard/getPage";
		}

}
