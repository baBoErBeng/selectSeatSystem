package com.henu.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.henu.bean.Notice;
@Repository(value="noticeDao")
public class NoticeDao extends HibernateDaoSupport{
	/**
	 * �����¹���
	 * @param student
	 */
	public void creat(Notice notice){
		getHibernateTemplate().save(notice);
	}
	/**
	 * �������й���
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Notice> readAll(){
		String hql="from Notice";
		List<Notice> list = (List<Notice>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * ͨ���ض����������ҹ���
	 * @param key
	 * @param value
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Notice> readByXxx(String key, String value){
		String hql="from Notice where "+key+"='"+value+"'";
		List<Notice> list = (List<Notice>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * ͨ��id,���ҹ���
	 * @param key
	 * @param value
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Notice> readById(int value){
		String hql="from Notice where notice_id ="+value;
		List<Notice> list = (List<Notice>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * ���¹���
	 * @param student
	 */
	public void update(Notice notice){
		getHibernateTemplate().update(notice);
	}
	/**
	 * ɾ������
	 */
	public void delete(Notice notice){
		getHibernateTemplate().delete(notice);
	}
}
