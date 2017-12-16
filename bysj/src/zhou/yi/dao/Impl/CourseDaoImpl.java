package zhou.yi.dao.Impl;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.CourseDao;
import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public class CourseDaoImpl extends HibernateDaoSupport implements CourseDao {

	@Override
	public Course findById(Integer cid) {
		return getHibernateTemplate().get(Course.class, cid);
	}
	
	@Override
	public int findCount(Integer cid) {
		Course course = findById(cid);
		List<Student> student = (List<Student>) course.getStudents();
		return student.size();
	}

	@Override
	public List<Student> findByPage(Integer cid, Integer begin, Integer end) {
		Course course = findById(cid);
		Set<Student> student = (Set<Student>) course.getStudents();
		List<Student> s = new ArrayList<Student>();
		for (Student student2 : student) {
			s.add(student2);
		}
		List<Student> list = s.subList(begin, end);
		return list;
	}

	@Override
	public Set<Student> getStudent(Integer cid) {
		Course course = findById(cid);
		Set<Student> student = (Set<Student>) course.getStudents();
		return student;
	}

	@Override
	public List<Course> findAll() {
		String hql = "from Course";
		return getHibernateTemplate().find(hql);
	}

	@Override
	public int findCount() {
		String hql = "select count(*) from Course";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Course> findByPage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Course.class);
		List<Course> list = getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@Override
	public void saveCourse(Course course) {
		getHibernateTemplate().save(course);
	}

	@Override
	public void deleteCourse(Course course) {
		getHibernateTemplate().delete(course);
	}


}
