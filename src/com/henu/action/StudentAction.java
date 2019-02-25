package com.henu.action;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.henu.bean.Notice;
import com.henu.bean.Seat;
import com.henu.bean.Student;
import com.henu.service.StudentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Component(value="studentAction")
@Scope("prototype")
public class StudentAction extends ActionSupport{
	@Resource
	private StudentService studentService;
	private Student student;
	private String validate;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getValidate() {
		return validate;
	}
	public void setValidate(String validate) {
		this.validate = validate;
	}
	/**
	 * ѧ����¼
	 * @return
	 */
	public String login() {
		if(studentService.login(student.getStu_num(), student.getStu_password())){
			Student stu = studentService.getStudentByNumber(student.getStu_num());
			ActionContext.getContext().getSession().put("student", stu);
			return "login";
		}
		else 
			return "index";
	}
	/**
	 * ��ҳ��
	 * @return
	 */
	public String menu(){
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		Student stu = studentService.getStudent(student.getStu_id());
		List<Seat> seats = studentService.readSeats();
		List<Notice> notices = studentService.readNotices();
		ActionContext.getContext().getSession().put("student", stu);
		ActionContext.getContext().getSession().put("seats", seats);
		ActionContext.getContext().getSession().put("notices", notices);
		return "menu";
	}
	/**
	 * ѧ��ѡ��״̬
	 * @return
	 */
	public String status(){
		Student stu = (Student)ActionContext.getContext().getSession().get("student");
		stu = studentService.getStudent(stu.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		if(stu.getSeat_id()!=null&&!"".equals(stu.getSeat_id())){
			Seat mySeat = studentService.getSeat(stu.getSeat_id());
			ActionContext.getContext().getSession().put("mySeat", mySeat);
		}else{
			ActionContext.getContext().getSession().put("mySeat",null);
		}
		return "status";
	}
	/**
	 * ѧ��ȡ��ԤԼ
	 * @return
	 */
	public String cancelBookedSeat(){
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		Student stu = studentService.getStudent(student.getStu_id());
		studentService.cancelBookedSeat(stu);
		stu = studentService.getStudent(stu.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		ActionContext.getContext().getSession().put("mySeat",null);
		return "cancelBooked";
	}
	/**
	 * ѧ��ԤԼ��λ
	 * @return
	 */
	public String bookedSeat(){
		String[] seat_id = (String[])ActionContext.getContext().getParameters().get("seat_id");
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		Seat seat = studentService.getSeat(seat_id[0]);
		studentService.bookedSeat(student, seat);
		Student stu = studentService.getStudent(student.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		Seat mySeat = studentService.getSeat(stu.getSeat_id());
		ActionContext.getContext().getSession().put("mySeat", mySeat);
		return "bookedSeat";
	}
	/**
	 * ѧ���Զ�ԤԼ��λ
	 * @return
	 */
	public String autoBookedSeat(){
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		studentService.autoBookedSeat(student);
		Student stu = studentService.getStudent(student.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		Seat mySeat = studentService.getSeat(stu.getSeat_id());
		ActionContext.getContext().getSession().put("mySeat", mySeat);
		return "autoBookedSeat";
	}
	/**
	 * ѧ��ʹ����λ
	 * @return
	 */
	public String usedSeat(){
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		
		studentService.usedSeat(student,validate);
		Seat mySeat = studentService.getSeat(student.getSeat_id());
		ActionContext.getContext().getSession().put("mySeat", mySeat);
		return "usedSeat";
	}
	/**
	 * ѧ���뿪��λ
	 * @return
	 */
	public String leaveSeat(){
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		studentService.leaveSeat(student);
		Student stu = studentService.getStudent(student.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		ActionContext.getContext().getSession().put("mySeat", null);
		return "leaveSeat";
	}
	/**
	 * ѧ��������λ
	 * @return
	 */
	public String reportSeat(){
		Student student = (Student)ActionContext.getContext().getSession().get("student");
		studentService.reportSeat(student);
		Student stu = studentService.getStudent(student.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		ActionContext.getContext().getSession().put("mySeat", null);
		return "reportSeat";
	}
	/**
	 * �޸�ѧ����Ϣ
	 * @return
	 */
	public String update(){
		student.setSeat_id(studentService.getStudent(student.getStu_id()).getSeat_id());
		studentService.updateStudent(student);
		Student stu = studentService.getStudent(student.getStu_id());
		ActionContext.getContext().getSession().put("student", stu);
		return "update";
	}
	/**
	 * �鿴���ݹ���
	 * @return
	 */
	public String readNotice(){
		String[] notice_id = (String[])ActionContext.getContext().getParameters().get("notice_id");
		Notice notice = studentService.getNotice(Integer.parseInt(notice_id[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("notice", notice);
		request.setAttribute("refer", "/stu/checkNotice.jsp");
		return "readNotice";
	}
}
