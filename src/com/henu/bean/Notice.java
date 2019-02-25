package com.henu.bean;


public class Notice {
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private String notice_time;
	private String notice_author;
	private String adm_id;
	private String notice_file;
	
	//ÎÄ¼þÃû
    
    

	public Notice() {
	}
	
	public String getNotice_file() {
		return notice_file;
	}

	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_time() {
		return notice_time;
	}

	public void setNotice_time(String notice_time) {
		this.notice_time = notice_time;
	}

	public String getNotice_author() {
		return notice_author;
	}

	public void setNotice_author(String notice_author) {
		this.notice_author = notice_author;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	@Override
	public String toString() {
		return "Notice [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_time=" + notice_time + ", notice_author=" + notice_author + ", adm_id="
				+ adm_id + ", notice_file=" + notice_file + "]";
	}
	
}
