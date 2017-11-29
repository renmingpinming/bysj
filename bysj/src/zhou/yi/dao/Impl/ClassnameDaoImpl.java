package zhou.yi.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.ClassnameDao;
import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public class ClassnameDaoImpl extends HibernateDaoSupport implements ClassnameDao {

	@Override
	public Classname findById(Integer id) {
		return getHibernateTemplate().get(Classname.class, id);
	}

	@Override
	public int findCount(Integer id) {
		Classname classname = findById(id);
		List<Student> student = (List<Student>) classname.getStudents();
		return student.size();
	}

	@Override
	public List<Student> findByPage(Integer id, Integer begin, Integer end) {
		Classname classname = findById(id);
		Set<Student> student = (Set<Student>) classname.getStudents();
		List<Student> s = new ArrayList<Student>();
		for (Student student2 : student) {
			s.add(student2);
		}
		List<Student> list = s.subList(begin, end);
		return list;
	}

	@Override
	public Set<Student> getStudent(Integer id) {
		Classname classname = findById(id);
		Set<Student> student = (Set<Student>) classname.getStudents();
		return student;
	}

	@Override
	public List<Classname> findAll() {
		String hql = "from Classname";
		return getHibernateTemplate().find(hql);
	}

	@Override
	public int findCount() {
		String hql = "select count(*) from Classname";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Classname> findByPage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Classname.class);
		List<Classname> list = getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@Override
	public void saveClassname(Classname classname) {
		getHibernateTemplate().save(classname);
	}

}
