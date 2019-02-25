package com.henu.bean;

public class Student {
	private String stu_id, stu_num, stu_name, stu_password, stu_gender, stu_phone, seat_id;

	public Student() {
	}

	public Student(String stu_id, String stu_num, String stu_name, String stu_password, String stu_gender,
			String stu_phone, String seat_id) {
		this.stu_id = stu_id;
		this.stu_num = stu_num;
		this.stu_name = stu_name;
		this.stu_password = stu_password;
		this.stu_gender = stu_gender;
		this.stu_phone = stu_phone;
		this.seat_id = seat_id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_num() {
		return stu_num;
	}

	public void setStu_num(String stu_num) {
		this.stu_num = stu_num;
	}

	public String getStu_password() {
		return stu_password;
	}

	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}

	public String getStu_gender() {
		return stu_gender;
	}

	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}

	public String getStu_phone() {
		return stu_phone;
	}

	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}

	public String getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(String seat_id) {
		this.seat_id = seat_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
}
