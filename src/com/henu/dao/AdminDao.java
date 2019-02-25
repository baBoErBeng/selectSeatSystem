package com.henu.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.henu.bean.Admin;
@Repository(value="adminDao")
public class AdminDao extends HibernateDaoSupport{
	/**
	 * 通过特定条件，查找管理员
	 * @param key
	 * @param value
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Admin> readByXxx(String key, String value){
		String hql="from Admin where "+key+"= "+value;
		List<Admin> list = (List<Admin>) getHibernateTemplate().find(hql);
		return list;
	}
}
