package com.henu.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.henu.bean.Notice;
@Repository(value="noticeDao")
public class NoticeDao extends HibernateDaoSupport{
	/**
	 * 保存新公告
	 * @param student
	 */
	public void creat(Notice notice){
		getHibernateTemplate().save(notice);
	}
	/**
	 * 查找所有公告
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Notice> readAll(){
		String hql="from Notice";
		List<Notice> list = (List<Notice>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * 通过特定条件，查找公告
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
	 * 通过id,查找公告
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
	 * 更新公告
	 * @param student
	 */
	public void update(Notice notice){
		getHibernateTemplate().update(notice);
	}
	/**
	 * 删除公告
	 */
	public void delete(Notice notice){
		getHibernateTemplate().delete(notice);
	}
}
