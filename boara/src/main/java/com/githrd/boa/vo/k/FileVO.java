package com.githrd.boa.vo.k;

import java.util.*;
import java.text.*;

public class FileVO {
	private int bno, fno, mno, rno, cno, cnt;
	private long len;
	private String id, oriname, savename, sdate;	// 형식 정해서 문자열로 변환 
	private Date fdate;	// 파일 저장 시간
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일");
		sdate = form.format(fdate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
		setSdate();
	}
	@Override
	public String toString() {
		return "FileVO [bno=" + bno + ", fno=" + fno + ", mno=" + mno + ", rno=" + rno + ", cnt=" + cnt + ", len=" + len
				+ ", id=" + id + ", oriname=" + oriname + ", savename=" + savename + ",  sdate=" + sdate
				+ ", wdate=" + fdate + "]";
	}
}
