package model;

import java.util.Date;

public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int viewcnt;
	private int like;
	private int dislike;
	private int blame;
	private int sort;
private String member_id;
	public BoardDTO() {
		
	}
	public BoardDTO(int bno, String title, String content, String writer, String regdate, int viewcnt, int like,
			int dislike, int blame,String member_id,int sort) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.like = like;
		this.dislike = dislike;
		this.blame = blame;
		this.member_id=member_id;
		this.sort=sort;
	}

	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getDislike() {
		return dislike;
	}

	public void setDislike(int dislike) {
		this.dislike = dislike;
	}

	public int getBlame() {
		return blame;
	}

	public void setBlame(int blame) {
		this.blame = blame;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

}
