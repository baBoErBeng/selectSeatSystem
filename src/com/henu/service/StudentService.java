package com.henu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.henu.bean.Notice;
import com.henu.bean.Seat;
import com.henu.bean.Student;
import com.henu.dao.NoticeDao;
import com.henu.dao.SeatDao;
import com.henu.dao.StudentDao;
@Transactional
@Service("studentService")
public class StudentService {
	@Resource(name = "studentDao")
	private StudentDao studentDao;
	@Resource(name = "seatDao")
	private SeatDao seatDao;
	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;
	/**
	 * 通过stu_id获取学生详细信息
	 * @param stu_id
	 * @return
	 */
	public Student getStudent(String stu_id){
		List<Student> list = studentDao.readByXxx("stu_id", stu_id);
		return list.get(0);
	}
	/**
	 * 通过stu_num获取学生详细信息
	 * @param stu_num
	 * @return
	 */
	public Student getStudentByNumber(String stu_num){
		List<Student> list = studentDao.readByXxx("stu_num", stu_num);
		return list.get(0);
	}
	public Notice getNotice(int notice_id){
		List<Notice> list = noticeDao.readById(notice_id);
		return list.get(0);
	}
	/**
	 * 通过seat_id获取座位详细信息
	 * @param seat_id
	 * @return
	 */
	public Seat getSeat(String seat_id){
		return seatDao.readByXxx("seat_id", seat_id).get(0);
	}
	/**
	 * 学生登录
	 * @param stu_num
	 * @param stu_password
	 * @return
	 */
	public boolean login(String stu_num, String stu_password){
		if(stu_num==null||"".equals(stu_num))
			return false;
		List<Student> list = studentDao.readByXxx("stu_num", stu_num);
		if(!list.isEmpty()){
			if(list.get(0).getStu_password().equals(stu_password))
				return true;
			else
				return false;
		}
		return false;
	}
	/**
	 * 更新学生信息
	 * @param student
	 */
	public void updateStudent(Student student){
		studentDao.update(student);
	}
	/**
	 * 读取所有可预约座位
	 * @return
	 */
	public List<Seat> readSeats(){
		return seatDao.readByXxx("seat_status", "booked");
	}
	/**
	 * 学生预约座位
	 */
	public void bookedSeat(Student student,Seat seat){
		List<Student> listStudent = studentDao.readByXxx("stu_id", student.getStu_id());
		List<Seat> listSeat = seatDao.readByXxx("seat_id", seat.getSeat_id());
		Student stu = listStudent.get(0);
		Seat se = listSeat.get(0);
		if(stu.getSeat_id()==null||"".equals(stu.getSeat_id())){
			if("booked".equals(se.getSeat_status())){
				se.setStu_id(stu.getStu_id());
				se.setSeat_status("unbooked");
				stu.setSeat_id(se.getSeat_id());
				seatDao.update(se);
				studentDao.update(stu);
			}
		}
	}
	/**
	 * 学生自动预约座位
	 */
	public void autoBookedSeat(Student student){
		List<Student> listStudent = studentDao.readByXxx("stu_id", student.getStu_id());
		Student stu = listStudent.get(0);
		if(stu.getSeat_id()==null||"".equals(stu.getSeat_id())){
			Seat se = this.readSeats().get(0);
			se.setStu_id(stu.getStu_id());
			se.setSeat_status("unbooked");
			stu.setSeat_id(se.getSeat_id());
			seatDao.update(se);
			studentDao.update(stu);
		}
	}
	/**
	 * 学生取消预约座位
	 */
	public void cancelBookedSeat(Student student){
		List<Student> listStudent = studentDao.readByXxx("stu_id", student.getStu_id());
		Student stu = listStudent.get(0);
		if(stu.getSeat_id()!=null && !"".equals(stu.getSeat_id())){
			List<Seat> listSeat = seatDao.readByXxx("seat_id", stu.getSeat_id());
			Seat se = listSeat.get(0);
			if("unbooked".equals(se.getSeat_status())){
				se.setStu_id(null);
				se.setSeat_status("booked");
				stu.setSeat_id(null);
				seatDao.update(se);
				studentDao.update(stu);
			}
		}
	}
	/**
	 * 学生使用座位
	 */
	public void usedSeat(Student student,String validate){
		List<Student> listStudent = studentDao.readByXxx("stu_id", student.getStu_id());
		Student stu = listStudent.get(0);
		if(stu.getSeat_id()!=null && !"".equals(stu.getSeat_id())){
			List<Seat> listSeat = seatDao.readByXxx("seat_id", stu.getSeat_id());
			Seat se = listSeat.get(0);
			if("unbooked".equals(se.getSeat_status())&&validate.equals(se.getValidate())){
				se.setSeat_status("used");
				seatDao.update(se);
			}
		}
	}
	/**
	 * 学生离开座位
	 */
	public void leaveSeat(Student student){
		List<Student> listStudent = studentDao.readByXxx("stu_id", student.getStu_id());
		Student stu = listStudent.get(0);
		if(stu.getSeat_id()!=null && !"".equals(stu.getSeat_id())){
			List<Seat> listSeat = seatDao.readByXxx("seat_id", stu.getSeat_id());
			Seat se = listSeat.get(0);
			if("used".equals(se.getSeat_status())){
				se.setStu_id(null);
				se.setSeat_status("booked");
				stu.setSeat_id(null);
				seatDao.update(se);
				studentDao.update(stu);
			}
		}
	}
	/**
	 * 学生报修座位
	 */
	public void reportSeat(Student student){
		List<Student> listStudent = studentDao.readByXxx("stu_id", student.getStu_id());
		Student stu = listStudent.get(0);
		if(stu.getSeat_id()!=null && !stu.getSeat_id().equals("")){
			List<Seat> listSeat = seatDao.readByXxx("seat_id", stu.getSeat_id());
			Seat se = listSeat.get(0);
			if("good".equals(se.getSeat_condiction())){
				se.setSeat_status("stop");
				se.setSeat_condiction("unknown");
				stu.setSeat_id(null);
				seatDao.update(se);
				studentDao.update(stu);
			}
		}
	}
	/**
	 * 学生读取所有公告
	 * @return
	 */
	public List<Notice> readNotices(){
		return noticeDao.readAll();
	}
}
