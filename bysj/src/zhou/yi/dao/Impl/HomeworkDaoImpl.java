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

}
