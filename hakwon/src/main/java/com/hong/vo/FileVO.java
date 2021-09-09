package com.hong.vo;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileVO 
{
	private String fileNum;
	private String bulletinBoardNum;
	private String UUID;
	private String originalFileName;
	private String id;
	private String registDate;
	private String modifyId;
	private String modiftDate;
	
	public String getFileNum() {
		return fileNum;
	}
	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}
	public String getBulletinBoardNum() {
		return bulletinBoardNum;
	}
	public void setBulletinBoardNum(String bulletinBoardNum) {
		this.bulletinBoardNum = bulletinBoardNum;
	}
	public String getUUID() {
		return UUID;
	}
	public void setUUID(String uUID) {
		UUID = uUID;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getModifyId() {
		return modifyId;
	}
	public void setModifyId(String modifyId) {
		this.modifyId = modifyId;
	}
	public String getModiftDate() {
		return modiftDate;
	}
	public void setModiftDate(String modiftDate) {
		this.modiftDate = modiftDate;
	}
	
	
	
}
