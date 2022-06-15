package com.githrd.boa.vo.p;

import java.text.SimpleDateFormat;
import java.util.Date;



public class ReboardVO {
	private int rno, bno, uprno, mno, cnt, ano, clicks, rowno, step,//reply 테이블 컬럼
				pno, gnp, pcode, sumpoint,//point 테이블 컬럼
				startCont, endCont, nowPage; // 페이징 처리
	private String body, isshow, sdate, savename, id;
	private Date rdate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getUprno() {
		return uprno;
	}
	public void setUprno(int uprno) {
		this.uprno = uprno;
	}
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
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	public int getRowno() {
		return rowno;
	}
	public void setRowno(int rowno) {
		this.rowno = rowno;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
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
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(rdate);
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
		setSdate();
	}
	public int getStartCont() {
		return startCont;
	}
	public void setStartCont(int startCont) {
		this.startCont = startCont;
	}
	public int getEndCont() {
		return endCont;
	}
	public void setEndCont(int endCont) {
		this.endCont = endCont;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	@Override
	public String toString() {
		return "ReboardVO [rno=" + rno + ", bno=" + bno + ", uprno=" + uprno + ", mno=" + mno + ", cnt=" + cnt
				+ ", ano=" + ano + ", clicks=" + clicks + ", rowno=" + rowno + ", step=" + step + ", pno=" + pno
				+ ", gnp=" + gnp + ", pcode=" + pcode + ", sumpoint=" + sumpoint + ", startCont=" + startCont
				+ ", endCont=" + endCont + ", nowPage=" + nowPage + ", body=" + body + ", isshow=" + isshow + ", sdate="
				+ sdate + ", savename=" + savename + ", id=" + id + ", rdate=" + rdate + "]";
	}
	
	
}
