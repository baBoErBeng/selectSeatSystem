package com.henu.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.henu.bean.*;
import com.henu.dao.AdminDao;
import com.henu.dao.NoticeDao;
import com.henu.dao.SeatDao;
import com.henu.dao.StudentDao;
@Transactional
@Service("adminService")
public class AdminService {
	@Resource(name = "studentDao")
	private StudentDao studentDao;
	@Resource(name = "seatDao")
	private SeatDao seatDao;
	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;
	@Resource(name = "adminDao")
	private AdminDao adminDao;
	
	public Admin getAdmin(String adm_id){
		List<Admin> list = adminDao.readByXxx("adm_id", adm_id);
		return list.get(0);
	}
	public Admin getAdminByNumber(String adm_num){
		List<Admin> list = adminDao.readByXxx("adm_num", adm_num);
		return list.get(0);
	}
	public Student getStudent(String stu_id){
		List<Student> list = studentDao.readByXxx("stu_id", stu_id);
		return list.get(0);
	}
	public Seat getSeat(String seat_id){
		List<Seat> list = seatDao.readByXxx("seat_id", seat_id);
		return list.get(0);
	}
	public Notice getNotice(int notice_id){
		List<Notice> list = noticeDao.readById(notice_id);
		return list.get(0);
	}
	/**
	 * ����Ա��¼
	 * @param adm_num
	 * @param adm_password
	 * @return
	 */
	public boolean login(String adm_num, String adm_password){
		if(adm_num==null||"".equals(adm_num))
			return false;
		List<Admin> list = adminDao.readByXxx("adm_num", adm_num);
		if(!list.isEmpty()){
			if(list.get(0).getAdm_password().equals(adm_password))
				return true;
			else
				return false;
		}
		return false;
	}
	/**
	 * ��ȡ����ѧ��
	 * @return
	 */
	public List<Student> readStudents(){
		return studentDao.readAll();
	}
	/**
	 * ��ȡĳ�����͵�ѧ��
	 * @param key
	 * @param value
	 * @return
	 */
	public List<Student> readStudents(String key, String value){
		return studentDao.readByXxx(key, value);
	}
	/**
	 * ���ѧ��
	 * @param student
	 */
	public void saveStudent(Student student){
		studentDao.creat(student);
	}
	/**
	 * ����ѧ����Ϣ
	 * @param student
	 */
	public void updateStudent(Student student){
		studentDao.update(student);
	}
	/**
	 * ɾ��ѧ����Ϣ
	 * @param student
	 */
	public void deleteStudent(Student student){
		//���ж��Ƿ�����λ,
			//������λ,ֱ��ɾ��ѧ����Ϣ
			//������λ,ֱ��ɾ��ѧ����Ϣ������λ��Ϊ��ԤԼ״̬
		if(student.getSeat_id()!=null&&!"".equals(student.getSeat_id())){
			Seat seat = seatDao.readByXxx("stu_id", student.getStu_id()).get(0);
			seatDao.updateToBooked(seat);
		}
		studentDao.delete(student);
	}
	/**
	 * ��ȡ������λ
	 * @return
	 */
	public List<Seat> readSeats(){
		return seatDao.readAll();
	}
	/**
	 * ��ȡĳ�����͵���λ
	 * @return
	 */
	public List<Seat> readSeats(String key, String value){
		return seatDao.readByXxx(key, value);
	}
	/**
	 * �����λ
	 * @param student
	 */
	public void saveSeat(Seat seat){
		seatDao.creat(seat);
	}
	/**
	 * ɾ����λ
	 * @param seat
	 */
	public void deleteSeat(Seat seat){
		if(seat.getStu_id()!=null&&!"".equals(seat.getStu_id())){
			Student student = studentDao.readByXxx("stu_id", seat.getStu_id()).get(0);
			student.setSeat_id(null);
			studentDao.update(student);
		}
		seatDao.delete(seat);
	}
	/**
	 * ������λ
	 * @param seat
	 */
	public void updateSeat(Seat seat){
		seatDao.update(seat);
	}
	/**
	 * ��ȡ���������Ϣ
	 * @return
	 */
	public List<Seat> readCheckMessage(){
		return seatDao.readByXxx("seat_condiction", "unknown");
	}
	public List<Seat> readCheckMessage(String key,String value){
		return seatDao.readByXxx(key, value, "unknown");
	}
	public List<Seat> readGoodMessage(String key,String value){
		return seatDao.readByXxx(key, value, "good");
	}
	/**
	 * ��Ӵ������Ϣ
	 * @param seat
	 */
	public void saveCheckMessage(Seat seat){
		if(seat.getStu_id()!=null&&!"".equals(seat.getStu_id())){
			Student student = studentDao.readByXxx("seat_id", seat.getSeat_id()).get(0);
			student.setSeat_id(null);
			studentDao.update(student);
			seat.setStu_id(null);
		}
		seat.setSeat_status("stop");
		seat.setSeat_condiction("unknown");
		seatDao.update(seat);
	}
	/**
	 * ��ȡ����ά����Ϣ
	 * @return
	 */
	public List<Seat> readRepairMessage(){
		return seatDao.readByXxx("seat_condiction", "bad");
	}
	public List<Seat> readRepairMessage(String key,String value){
		return seatDao.readByXxx(key, value, "bad");
	}
	/**
	 * ��Ӵ��޸���Ϣ
	 * @param seat
	 */
	public void saveRepairMessage(Seat seat){
		seat.setSeat_status("stop");
		seat.setSeat_condiction("bad");
		seatDao.update(seat);
	}
	/**
	 * �޸���λ
	 * @param seat
	 */
	public void repairSeat(Seat seat){
		seatDao.updateToBooked(seat);
	}
	/**
	 * ��ȡ���й���
	 * @return
	 */
	public List<Notice> readNotices(){
		return noticeDao.readAll();
	}
	public List<Notice> readNotices(String key,String value){
		return noticeDao.readByXxx(key, value);
	}
	/**
	 * ��ӹ���
	 * @param notice
	 */
	public void saveNotice(Notice notice){
		noticeDao.creat(notice);
	}
	/**
	 * ���¹���
	 * @param notice
	 */
	public void updateNotice(Notice notice){
		noticeDao.update(notice);
	}
	/**
	 * ɾ������
	 * @param notice
	 */
	public void deleteNotice(Notice notice){
		noticeDao.delete(notice);
	}
}
