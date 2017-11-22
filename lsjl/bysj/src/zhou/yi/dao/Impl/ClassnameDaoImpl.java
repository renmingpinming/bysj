package zhou.yi.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.ClassnameDao;
import zhou.yi.domain.Classname;
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

}
