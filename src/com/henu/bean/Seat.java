package com.henu.bean;

public class Seat {
	private String seat_id, seat_num, seat_classNum, seat_status, seat_condiction, stu_id,validate;

	public Seat() {
	}

	public Seat(String seat_id, String seat_num, String seat_classNum, String seat_status, String seat_condiction,
			String stu_id,String validate) {
		this.seat_id = seat_id;
		this.seat_num = seat_num;
		this.seat_classNum = seat_classNum;
		this.seat_status = seat_status;
		this.seat_condiction = seat_condiction;
		this.stu_id = stu_id;
		this.validate = validate;
	}

	public String getValidate() {
		return validate;
	}

	public void setValidate(String validate) {
		this.validate = validate;
	}

	public String getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(String seat_id) {
		this.seat_id = seat_id;
	}

	public String getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}

	public String getSeat_classNum() {
		return seat_classNum;
	}

	public void setSeat_classNum(String seat_classNum) {
		this.seat_classNum = seat_classNum;
	}

	public String getSeat_status() {
		return seat_status;
	}

	public void setSeat_status(String seat_status) {
		this.seat_status = seat_status;
	}

	public String getSeat_condiction() {
		return seat_condiction;
	}

	public void setSeat_condiction(String seat_condiction) {
		this.seat_condiction = seat_condiction;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	@Override
	public String toString() {
		return "Seat [seat_id=" + seat_id + ", seat_num=" + seat_num + ", seat_classNum=" + seat_classNum
				+ ", seat_status=" + seat_status + ", seat_condiction=" + seat_condiction + ", stu_id=" + stu_id + "]";
	}
	
}
