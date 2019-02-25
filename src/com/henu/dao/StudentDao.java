package com.henu.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.henu.bean.Student;
@Repository(value="studentDao")
public class StudentDao extends HibernateDaoSupport{
	
	/**
	 * ��¼����
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
	 * ������ѧ��
	 * @param student
	 */
	public void creat(Student student){
		getHibernateTemplate().save(student);
	}
	/**
	 * ��������ѧ��
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Student> readAll(){
		String hql="from Student";
		List<Student> list = (List<Student>) getHibernateTemplate().find(hql);
		return list;
	}
	/**
	 * ͨ���ض�����������ѧ��
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
	 * ����ѧ����Ϣ
	 * @param student
	 */
	public void update(Student student){
		getHibernateTemplate().update(student);
	}
	/**
	 * ɾ��ѧ����Ϣ
	 */
	public void delete(Student student){
		getHibernateTemplate().delete(student);
	}
	
}
