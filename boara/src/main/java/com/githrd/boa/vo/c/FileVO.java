package com.githrd.boa.vo.c;
/**
 * 	파일 관련 데이터를 담을 VO클래스입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.26
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.26	-	클래스 제작
 * 								담당자 : 최이지
 *
 */
public class FileVO {
	int fno, mno, bno, cno;
	long len;
	String oriname, savename, isshow, id;
	
	// GetterSetter
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
