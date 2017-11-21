package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Student;

public interface ClassnameDao {
	public Classname findById(Integer id);
	
	public int findCount(Integer id);
	
	public List<Student> findByPage(Integer id,Integer begin,Integer end);
}
