package zhou.yi.dao.Impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.TeacherDao;
import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;

public class TeacherDaoImpl extends HibernateDaoSupport implements TeacherDao {

	@Override
	public Teacher login(Teacher teacher) {
		String hql = "from Teacher where tid = ? and password = ?";
		Object[] params = {teacher.getTid(),teacher.getPassword()};
		List<Teacher> list = getHibernateTemplate().find(hql,params);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public void saveTea(Teacher teacher) {
		getHibernateTemplate().save(teacher);
	}

	@Override
	public void update(Teacher teacher) {
		getHibernateTemplate().update(teacher);
	}

	@Override
	public void delete(Teacher teacher) {
		getHibernateTemplate().delete(teacher);
	}

	@Override
	public Teacher findById(Integer tid) {
		return getHibernateTemplate().get(Teacher.class, tid);
	}

	@Override
	public List<Classname> findClassname(Integer tid) {
		Teacher teacher = findById(tid);
		List<Classname> classnames = (List<Classname>) teacher.getClassnames();
		return classnames;
	}

	@Override
	public List<Course> findCourse(Integer tid) {
		Teacher teacher = findById(tid);
		List<Course> courses = (List<Course>) teacher.getCourses();
		return courses;
	}

	@Override
	public int findCount() {
		String hql = "select count(*) from Teacher";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Teacher> findByPage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Teacher.class);
		List<Teacher> list = getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

}
