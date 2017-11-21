package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public interface CourseDao {
	public Course findById(Integer cid);
	
	public int findCount(Integer cid);
	
	public List<Student> findByPage(Integer cid,Integer begin,Integer end);
}
