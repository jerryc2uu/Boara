package com.githrd.boa.vo.c;
/**
 * 	컬렉션 관련 데이터를 담을 VO 클래스입니다.
 * 
 * 	@author 최이지
 * 	@since 2022.06.16
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.16	-	클래스 제작
 * 								담당자 : 최이지
 * 
 * 			2022.06.21	-	page 변수, genre 변수, Getter Setter 추가
 * 								담당자 : 최이지
 * 
 *			2022.06.22	-	setDescr() 함수 수정
 *							gnos, genre 타입을 ArrayList로 수정
 *							dir 변수, getter setter 삭제
 *								담당자 : 최이지
 *
 *			2022.06.26	-	모든 변수 private 속성 추가
 *							변수, getter setter 추가 (thumb, fno)
 *								담당자 : 최이지
 *
 *			2022.06.29	-	변수, getter setter 추가(result)
 *								담당자 : 최이지
 *
 */
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.githrd.boa.util.c.PageUtil;

public class CollecVO {
	private int cno, mno, startCont, endCont, fno;
	private String id, savename, cname, descr, sgenre, cid, result;
	private ArrayList<Integer> gnos;
	private ArrayList<String> genre;
	private PageUtil page;
	private MultipartFile thumb;
	
	// GetterSetter
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
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		if(descr.equals("empty")) {
			descr = "";
		}
		this.descr = descr;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
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
	public String getSgenre() {
		return sgenre;
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
	public PageUtil getPage() {
		return page;
	}
	public void setPage(PageUtil page) {
		this.page = page;
		this.startCont = page.getStartCont();
		this.endCont = page.getEndCont();
	}
	public MultipartFile getThumb() {
		return thumb;
	}
	public void setThumb(MultipartFile thumb) {
		this.thumb = thumb;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
