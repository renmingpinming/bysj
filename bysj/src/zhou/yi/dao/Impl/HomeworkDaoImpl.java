package zhou.yi.dao.Impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.HomeworkDao;
import zhou.yi.domain.Homework;

public class HomeworkDaoImpl extends HibernateDaoSupport implements HomeworkDao {

	@Override
	public List<Homework> getByCourseId(Integer course_id) {
		String hql = "from Homework where course_id = ? order by create_time desc";
		Object[] params = {course_id};
		List<Homework> list = getHibernateTemplate().find(hql, params);
		return list;
	}

	@Override
	public void saveHomework(Homework homework) {
		getHibernateTemplate().save(homework);
	}

	@Override
	public Homework getByCourseIdAndHid(Integer course_id, Integer hid) {
		String hql = "from Homework where course_id = ? and hid = ?";
		Object[] params = {course_id,hid};
		List<Homework> list = getHibernateTemplate().find(hql,params);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

}
