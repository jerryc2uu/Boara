package com.githrd.boa.vo.c;
/**
 *	게시글 관련 데이터를 담을 VO 클래스입니다.
 *	@author 최이지
 *	@since 2022.06.22
 *	@version v.1.0
 *		작업 이력
 *			2022.06.22	-	클래스 제작
 *								담당자 : 최이지
 *
 */

import java.util.ArrayList;

public class BoardVO {
	private int bno, price, click;
	private String savename, title, body, isshow, sgenre, forwho;
	ArrayList<Integer> gnos;
	ArrayList<String> genre;
	
	// GetterSetter
	public String getSgenre() {
		return sgenre;
	}
	public void setSgenre(String sgenre) {
		this.sgenre = sgenre;
		if(!sgenre.equals("empty")) {
			gnos = new ArrayList<Integer>();
			genre = new ArrayList<String>();
			String[] gs = sgenre.split("/");
			for(String g : gs) {
				gnos.add(Integer.parseInt(g));
			}
		}
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public ArrayList<Integer> getGnos() {
		return gnos;
	}
	public void setGnos(ArrayList<Integer> gnos) {
		this.gnos = gnos;
	}
	public ArrayList<String> getGenre() {
		return genre;
	}
	public void setGenre(ArrayList<String> genre) {
		this.genre = genre;
	}
	public String getForwho() {
		return forwho;
	}
	public void setForwho(String forwho) {
		this.forwho = forwho;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
}
