package com.githrd.boa.vo.k;
/**
 * 	회원 관련 데이터를 담을 VO클래스
 * 
 * 	@author 김소연
 * 	@since 2022.06.13
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.13	-	담당자 : 김소연
 * 								클래스 제작
 * 			2022.06.28  -	포인트 추가
 *
 */


import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int mno, cnt,
				bno, pno, gnp, pcode, sumpoint;	 // 포인트 처리
	private String id, name, pw, mail, tel, sdate, result, isshow, certi, birth;
	private Date jdate;
	ArrayList<FileVO> list;	// 파일 관련 정보 기억
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
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getGnp() {
		return gnp;
	}
	public void setGnp(int gnp) {
		this.gnp = gnp;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public int getSumpoint() {
		return sumpoint;
	}
	public void setSumpoint(int sumpoint) {
		this.sumpoint = sumpoint;
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getCerti() {
		return certi;
	}
	public void setCerti(String certi) {
		this.certi = certi;
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public ArrayList<FileVO> getList() {
		return list;
	}
	public void setList(ArrayList<FileVO> list) {
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
		return "MemberVO [mno=" + mno + ", cnt=" + cnt + ", bno=" + bno + ", pno=" + pno + ", gnp=" + gnp + ", pcode="
				+ pcode + ", sumpoint=" + sumpoint + ", id=" + id + ", name=" + name + ", pw=" + pw + ", mail=" + mail
				+ ", tel=" + tel + ", sdate=" + sdate + ", result=" + result + ", isshow=" + isshow + ", certi=" + certi
				+ ", jdate=" + jdate + ", birth=" + birth + ", list=" + list + ", file=" + file + "]";
	}
	
	
	}
