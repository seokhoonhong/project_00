package com.hong.vo;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class BulletinBoardVO 
{
	private String bulletinBoardNum;
	private String bulletinBoardVO;
	private String contentTitle;
	private String contentText;
	private String imgUploadPath;
	private String id;
	private String uploadDate;
	private String modifyId;
	private String modifyDate;
	private MultipartFile file;
	
	public String getBulletinBoardNum() {
		return bulletinBoardNum;
	}
	public void setBulletinBoardNum(String bulletinBoardNum) {
		this.bulletinBoardNum = bulletinBoardNum;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getBulletinBoardVO() {
		return bulletinBoardVO;
	}
	public void setBulletinBoardVO(String bulletinBoardVO) {
		this.bulletinBoardVO = bulletinBoardVO;
	}
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	public String getContentText() {
		return contentText;
	}
	public void setContentText(String contentText) {
		this.contentText = contentText;
	}
	public String getImgUploadPath() {
		return imgUploadPath;
	}
	public void setImgUploadPath(String imgUploadPath) {
		this.imgUploadPath = imgUploadPath;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getModifyId() {
		return modifyId;
	}
	public void setModifyId(String modifyId) {
		this.modifyId = modifyId;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	
}
