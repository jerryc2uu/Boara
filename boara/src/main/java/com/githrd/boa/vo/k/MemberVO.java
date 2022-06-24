package com.githrd.boa.vo.k;


import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int mno, cnt;
	private String id, name, pw, mail, tel, sdate;
	private Date jdate;
	private Time jtime;
	private List<FileVO> list;	// 파일 관련 정보 기억
	private MultipartFile file;	// 업로드된 파일 기억
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy년 MM월 dd일 ");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm:ss");
		sdate = form1.format(jdate) + form2.format(jtime);
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public Time getJtime() {
		return jtime;
	}
	public void setJtime(Time jtime) {
		this.jtime = jtime;
	}

	public List<FileVO> getList() {
		return list;
	}
	public void setList(List<FileVO> list) {
		this.list = list;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ",  cnt=" + cnt + ", id=" + id + ", name=" + name + ", pw=" + pw
				+ ", mail=" + mail + ", tel=" + tel + ", sdate=" + sdate + ", jdate=" + jdate + ", jtime=" + jtime + "]";
	}

		
	}
