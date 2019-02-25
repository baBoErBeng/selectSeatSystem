package com.henu.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.henu.bean.Student;
@Repository(value="studentDao")
public class StudentDao extends HibernateDaoSupport{
	
	/**
	 * 记录总数
	 * @return
	 */
	public int findCount() {
        String hql="select count(*) from Student";
        @SuppressWarnings("unchecked")
        List<Student> list = (List<Student>) getHibernateTemplate().find(hql);
        int count = Integer.parseInt(list.get(0).toString());
        return count;
    }
	/**
	 * 保存新学生
	 * @param student
	 */
	public void creat(Student student){
		getHibernateTemplate().save(student);
	}
	/**
	 * 查找所有学生
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Student> readAll(){
		String hql="from Student";
		List<Student> list = (List<Student>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * 通过特定条件，查找学生
	 * @param key
	 * @param value
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Student> readByXxx(String key, String value){
		String hql="from Student where "+key+"= '"+value+"'";
		List<Student> list = (List<Student>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * 更新学生信息
	 * @param student
	 */
	public void update(Student student){
		getHibernateTemplate().update(student);
	}
	/**
	 * 删除学生信息
	 */
	public void delete(Student student){
		getHibernateTemplate().delete(student);
	}
	
}
