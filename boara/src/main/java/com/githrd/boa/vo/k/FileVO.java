package com.githrd.boa.vo.k;
/**
 * 	파일 관련 데이터를 담을 VO클래스
 * 
 * 	@author 김소연
 * 	@since 2022.06.26
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.26	-	담당자 : 김소연
 * 								클래스 제작
 *
 */
import java.util.*;

public class FileVO {
	private int bno, fno, mno, rno, cno, cnt, click, pcode;
	private long len;
	private String id, oriname, savename, title;
	private Date sysdate, hend, hstart, fdate, wdate;	// 파일 저장 시간
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getSysdate() {
		return sysdate;
	}
	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}
	public Date getHend() {
		return hend;
	}
	public void setHend(Date hend) {
		this.hend = hend;
	}
	public Date getHstart() {
		return hstart;
	}
	public void setHstart(Date hstart) {
		this.hstart = hstart;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "FileVO [bno=" + bno + ", fno=" + fno + ", mno=" + mno + ", rno=" + rno + ", cno=" + cno + ", cnt=" + cnt
				+ ", click=" + click + ", pcode=" + pcode + ", len=" + len + ", id=" + id + ", oriname=" + oriname
				+ ", savename=" + savename + ", title=" + title + ", sysdate=" + sysdate + ", hend=" + hend
				+ ", hstart=" + hstart + ", fdate=" + fdate + ", wdate=" + wdate + "]";
	}
	
	
	
}

