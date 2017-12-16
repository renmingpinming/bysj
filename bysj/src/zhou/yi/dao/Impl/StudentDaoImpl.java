package zhou.yi.dao.Impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.StudentDao;
import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao {

	@Override
	public Student login(Student student) {
		String hql = "from Student where sid = ? and password = ?";
		Object[] params = {student.getSid(),student.getPassword()};
		List<Student> list = getHibernateTemplate().find(hql,params);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public void saveStu(Student student) {
		getHibernateTemplate().save(student);
	}

	@Override
	public void update(Student student) {
		getHibernateTemplate().update(student);
	}

	@Override
	public void delete(Student student) {
		getHibernateTemplate().delete(student);
	}

	@Override
	public Student findById(Integer sid) {
		return getHibernateTemplate().get(Student.class,sid);
	}

	@Override
	public List<Course> getCourse(Integer sid) {
		Student student = findById(sid);
		List<Course> courses = (List<Course>) student.getCourses();
		return courses;
	}

	@Override
	public int findCount() {
		String hql = "select count(*) from Student";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Student> findByPage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Student.class);
		List<Student> list = getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}




}
