package com.henu.bean;

public class Admin {
	private String adm_id, adm_num, adm_password;

	public Admin() {
	}

	public Admin(String adm_id, String adm_num, String adm_password) {
		super();
		this.adm_id = adm_id;
		this.adm_num = adm_num;
		this.adm_password = adm_password;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getAdm_num() {
		return adm_num;
	}

	public void setAdm_num(String adm_num) {
		this.adm_num = adm_num;
	}

	public String getAdm_password() {
		return adm_password;
	}

	public void setAdm_password(String adm_password) {
		this.adm_password = adm_password;
	}

}
