package zhou.yi.dao;

import java.util.List;
import java.util.Set;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Student;

public interface ClassnameDao {
	public Classname findById(Integer id);
	
	public int findCount(Integer id);
	
	public List<Student> findByPage(Integer id,Integer begin,Integer end);
	
	public Set<Student> getStudent(Integer id);
	
	public List<Classname> findAll();
}
