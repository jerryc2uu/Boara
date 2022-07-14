package com.githrd.boa.vo.k;



/**
 * 	쪽지 관련 데이터를 담을 VO클래스
 * 
 * 	@author 김소연
 * 	@since 2022.07.13
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.07.13	-	담당자 : 김소연
 * 								클래스 제작
 *
 */

public class MessageVO {
	private String sendid, recvid, title, body, ck, isshow, id, read, mdate;
	private int mgno, cnt;
	public String getSendid() {
		return sendid;
	}
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	public String getRecvid() {
		return recvid;
	}
	public void setRecvid(String recvid) {
		this.recvid = recvid;
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
	public String getCk() {
		return ck;
	}
	public void setCk(String ck) {
		this.ck = ck;
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
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getMgno() {
		return mgno;
	}
	public void setMgno(int mgno) {
		this.mgno = mgno;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
		@Override
		public String toString() {
			return "MessageVO [sendid=" + sendid + ", recvid=" + recvid + ", title=" + title + ", body=" + body + ", ck="
					+ ck + ", isshow=" + isshow + ", id=" + id + ", read=" + read + ", mdate=" + mdate + ", mgno=" + mgno
					+ ", cnt=" + cnt + "]";
		}

}
