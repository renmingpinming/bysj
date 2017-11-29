package zhou.yi.dao;

import java.util.List;
import java.util.Set;

import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public interface CourseDao {
	public Course findById(Integer cid);
	
	public int findCount(Integer cid);
	
	public List<Student> findByPage(Integer cid,Integer begin,Integer end);
	
	public Set<Student> getStudent(Integer cid);
	
	public List<Course> findAll();

	public int findCount();

	public List<Course> findByPage(int begin, int pageSize);

	public void saveCourse(Course course);
}
