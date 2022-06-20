package com.githrd.boa.vo.p;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MyInfoVO {
	
	private int mno, cno, bno, rno, rcnt, bcnt, sumpoint, click, 
				startCont, endCont, nowPage, pno, gnp, pcode, price;
	private String id, name, body, pw, mail, tel, sdate, savename, title, cname, detail;
	private Date jdate, wdate;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getBcnt() {
		return bcnt;
	}
	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
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
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
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
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(jdate);
	}
	public Date getJdate() {
		return jdate;
	}
	public void setJdate(Date jdate) {
		this.jdate = jdate;
		setSdate();
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public int getSumpoint() {
		return sumpoint;
	}
	public void setSumpoint(int sumpoint) {
		this.sumpoint = sumpoint;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
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
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "MyInfoVO [mno=" + mno + ", cno=" + cno + ", bno=" + bno + ", rno=" + rno + ", rcnt=" + rcnt + ", bcnt="
				+ bcnt + ", sumpoint=" + sumpoint + ", click=" + click + ", startCont=" + startCont + ", endCont="
				+ endCont + ", nowPage=" + nowPage + ", pno=" + pno + ", gnp=" + gnp + ", pcode=" + pcode + ", price="
				+ price + ", id=" + id + ", name=" + name + ", body=" + body + ", pw=" + pw + ", mail=" + mail
				+ ", tel=" + tel + ", sdate=" + sdate + ", savename=" + savename + ", title=" + title + ", cname="
				+ cname + ", detail=" + detail + ", jdate=" + jdate + ", wdate=" + wdate + "]";
	}

}
