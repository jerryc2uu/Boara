package com.githrd.boa.vo.k;


/**
 * 	검색 관련 데이터를 담을 VO클래스
 * 
 * 	@author 김소연
 * 	@since 2022.07.03
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.07.03	-	담당자 : 김소연
 * 								클래스 제작
 * 			2022.07.05	-		page 변수 추가
 *
 */ 

public class SearchVO {
	private String title, isshow, savename, forwho, cname, id, sel,  descr, gname, search, body;
	private int bno, cno, gno, mno, price, click, cnt, gnr, startCont, endCont;
	public String getTitle() {
		return title;
	} 
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getForwho() {
		return forwho;
	}
	public void setForwho(String forwho) {
		this.forwho = forwho;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
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
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGnr() {
		return gnr;
	}
	public void setGnr(int gnr) {
		this.gnr = gnr;
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
	@Override
	public String toString() {
		return "SearchVO [title=" + title + ", isshow=" + isshow + ", savename=" + savename + ", forwho=" + forwho
				+ ", cname=" + cname + ", id=" + id + ", sel=" + sel + ", descr=" + descr + ", gname=" + gname
				+ ", search=" + search + ", body=" + body + ", bno=" + bno + ", cno=" + cno + ", gno=" + gno + ", mno="
				+ mno + ", price=" + price + ", click=" + click + ", cnt=" + cnt + ", gnr=" + gnr + ", startCont="
				+ startCont + ", endCont=" + endCont + "]";
	}
	
	
	
}
