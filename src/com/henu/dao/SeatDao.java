package com.henu.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.henu.bean.Seat;
import com.henu.bean.Student;
@Repository(value="seatDao")
public class SeatDao extends HibernateDaoSupport{
	/**
	 * 保存新座位
	 * @param student
	 */
	public void creat(Seat seat){
		getHibernateTemplate().save(seat);
	}
	/**
	 * 查找所有座位
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Seat> readAll(){
		String hql="from Seat";
		List<Seat> list = (List<Seat>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * 通过特定条件，查找座位
	 * @param key
	 * @param value
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Seat> readByXxx(String key, String value){
		String hql="from Seat where "+key+" = '"+value+"'";
		List<Seat> list = (List<Seat>) getHibernateTemplate().find(hql);
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Seat> readByXxx(String key, String value,String seat_condiction){
		String hql="from Seat where "+key+" = '"+value+"' and seat_condiction = '"+seat_condiction+"'";
		List<Seat> list = (List<Seat>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * 更新座位
	 * @param student
	 */
	public void update(Seat seat){
		getHibernateTemplate().update(seat);
	}
	/**
	 * 更新座位为可预约状态
	 * @param seat
	 */
	public void updateToBooked(Seat seat){
		seat.setStu_id(null);
		seat.setSeat_status("booked");
		seat.setSeat_condiction("good");
		getHibernateTemplate().update(seat);
	}
	/**
	 * 更新座位为不可预约状态
	 * @param seat
	 */
	public void updateToUnbooked(Seat seat, Student student){
		seat.setSeat_status("unbooked");
		seat.setSeat_condiction("good");
		seat.setStu_id(student.getStu_id());
		getHibernateTemplate().update(seat);
	}
	public void updateToUsed(Seat seat, Student student){
		seat.setSeat_status("unbooked");
		seat.setSeat_condiction("good");
		seat.setStu_id(student.getStu_id());
		getHibernateTemplate().update(seat);
	}
	/**
	 * 删除座位
	 */
	public void delete(Seat seat){
		getHibernateTemplate().delete(seat);
	}
}
