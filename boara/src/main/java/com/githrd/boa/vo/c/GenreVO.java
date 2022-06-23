package com.githrd.boa.vo.c;
/**
 * 	장르 처리를 할 수 있게 할 VO 클래스 입니다.
 * 	
 * 	@author 최이지
 * 	@since 2022.06.21
 * 	@version v.1.0
 *		작업 이력
 *			2022.06.21	-	클래스 제작
 *								담당자 : 최이지
 *	
 */
public class GenreVO {
	private int gno;
	private String gname;
	
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
}
